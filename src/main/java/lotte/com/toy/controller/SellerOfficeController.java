package lotte.com.toy.controller;

import lotte.com.toy.dto.*;
import lotte.com.toy.service.*;
import lotte.com.toy.util.FileUtil;
import org.apache.commons.io.FileUtils;
import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

@Controller
public class SellerOfficeController {

    private Logger log = LoggerFactory.getLogger(SellerOfficeController.class);

    @Autowired
    CategoryService categoryservice;
    @Autowired
    ProductService productService;
    @Autowired
    SellerService sellerservice;
    @Autowired
    OrderStatsService orderStatsService;
    @Autowired
    FileService fileService;

    @GetMapping("/product_write.do")
    public String prodcut_write(Model model, int seller_id) {
        log.info("SellerOfficeController prodcut_write()");
        System.out.println("SellerOfficeController prodcut_write");

        List<CategoryDto> categoryList = categoryservice.categoryList();
        model.addAttribute("categories", categoryList);
        model.addAttribute("seller_id", seller_id);

        return "product_write";
    }

    @ResponseBody
    @RequestMapping(value = "/uploadSummernoteImageFile.do", produces = "application/json", method = {RequestMethod.GET, RequestMethod.POST})
    public String uploadSummernoteImageFile(@RequestParam("file") MultipartFile multipartFile, HttpServletRequest req) {
        log.info("uploadSummernoteImageFile ");
        System.out.println("SellerOfficeController uploadSummernoteImageFile");
        System.out.println("muitipartFile:" + multipartFile);

        JSONObject jsonObject = new JSONObject();

        String fileRoot = "C:\\mystic_image\\";    //저장될 외부 파일 경로
        String originalFileName = multipartFile.getOriginalFilename();    //오리지날 파일명
        String extension = originalFileName.substring(originalFileName.lastIndexOf("."));    //파일 확장자

        String savedFileName = UUID.randomUUID() + extension;    // 파일 이름 중복 방지 저장될 파일 명

        File targetFile = new File(fileRoot + savedFileName);

        try {
            InputStream fileStream = multipartFile.getInputStream();
            /*            FileUtils.copyInputStreamToFile(fileStream, targetFile);	//파일 저장*/
            FileUtils.writeByteArrayToFile(targetFile, multipartFile.getBytes());
            jsonObject.put("url", "/mystic_image/" + savedFileName);
            //jsonObject.put("url", "upload/" + savedFileName);
            jsonObject.put("responseCode", "success");

        } catch (IOException e) {
            System.out.println("오류");
            FileUtils.deleteQuietly(targetFile);    //저장된 파일 삭제
            jsonObject.put("responseCode", "error");
            e.printStackTrace();
        }

        String a = jsonObject.toString();
        return a;
    }

    @PostMapping("/writeAf.do")
    public String write(ProductDto dto, Model model) {
        System.out.println(dto.toString());

        boolean isSuccess = productService.product_write(dto);
        String msg = "N";
        if (isSuccess) {
            msg = "Y";
            model.addAttribute("msg", msg);
            return "redirect:/seller_main.do?seller_id=" + dto.getSeller_id();
        }
        return "redirect:/product_write";
    }

    @GetMapping("/seller_main.do")
    public String seller_main(SellerDto seller, Model model) {

        int onSaleProduct = sellerservice.findTotalCount(seller); // 판매중 상품
        int soldOutProduct = sellerservice.findSoldOut(seller); // 품절 상품 stock = 0
        int endSaleProduct = sellerservice.findEndSale(seller); // 판매 종료 상품 stock = -1
        int readyToShip = sellerservice.findReadyShip(seller); // 배송 준비
        int completedShip = sellerservice.findCompletedShip(seller); // 배송 완료

        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd%"); // like '2022-07-19%';
        Date now = new Date();
        String today = sdf.format(now);

        int newOrder = sellerservice.newOrders(today); // 신규 주문
        int newReview = sellerservice.newReviews(today); // 신규 리뷰
        int newQnA = sellerservice.newQnAs(today); // 신규 QnA

        List<ReviewDto> reviewList = sellerservice.findAllReviews(seller);
        List<QnADto> qnaList = sellerservice.findAllQnAs(seller);

        /* 차트 데이터 받아오는 부분 */
        OrderStatsDto todays = orderStatsService.getOrderStatsByDate(seller.getSeller_id(), today);
        OrderStatsDto week = orderStatsService.getOrderStatsWeek(seller.getSeller_id());
        OrderStatsDto month = orderStatsService.getOrderStatsMonth(seller.getSeller_id());

        List<OrderStatsDto> weeklyList = orderStatsService.getOrderStatsListWeekly(seller.getSeller_id());

        List<OrderStatsDto> catTodayList = orderStatsService.getOrderStatsByCatsDate(seller.getSeller_id(), today);
        List<OrderStatsDto> catWeekList = orderStatsService.getOrderStatsByCatsWeek(seller.getSeller_id());
        List<OrderStatsDto> catMonthList = orderStatsService.getOrderStatsByCatsMonth(seller.getSeller_id());

        model.addAttribute("todays", todays);
        model.addAttribute("week", week);
        model.addAttribute("month", month);

        model.addAttribute("weeklyList", weeklyList);

        //model.addAttribute("catToday", catTodayList.get(0)); null 검사 필요
        model.addAttribute("catWeek", catWeekList);
        model.addAttribute("catMonth", catMonthList);
        /* 차트 데이터 */

        JSONObject seller_data = new JSONObject();
        seller_data.put("onSaleProduct", onSaleProduct);
        seller_data.put("soldOutProduct", soldOutProduct);
        seller_data.put("endSaleProduct", endSaleProduct);
        seller_data.put("readyToShip", readyToShip);
        seller_data.put("completedShip", completedShip);
        seller_data.put("newOrder", newOrder);
        seller_data.put("newReview", newReview);
        seller_data.put("newQnA", newQnA);

        model.addAttribute("seller_data", seller_data);
        model.addAttribute("reviewlist", reviewList);
        model.addAttribute("qnalist", qnaList);

        return "seller_main";
    }

    @GetMapping("sosalelist.do")
    public String sosalelist(Model model, SellerDto seller) {
        System.out.println("SellerOfficeController mysalelist()");

        List<ProductResponseDto> mysalelist = sellerservice.findAllSellerProductList(seller);
        model.addAttribute("mysalelist", mysalelist);

        return "seller_product_list";
    }

    @GetMapping("clientOrderlist.do")
    public String soOrderlist(Model model, SellerDto seller) {
        System.out.println("SellerOfficeController clientOrderlist()");

        List<ClientOrderDto> cod = sellerservice.findClientOrders(seller);
        model.addAttribute("codlist", cod);
        return "clientOrderlist";
    }

    @GetMapping("clientShipstatus.do")
    public String clientShipstatus(Model model, SellerDto seller) {
        System.out.println("SellerOfficeController clientShipstatus()");

        return "clientShipstatus";
    }


    @GetMapping("productUpdate.do")
    public String productUpdate(Model model, ProductDto dto) {

        System.out.println("product_id:" + dto.getProduct_id());
        List<CategoryDto> categoryList = categoryservice.categoryList();
        model.addAttribute("categories", categoryList);
        ProductDto pr = productService.findByProductId(dto.getProduct_id());
        model.addAttribute("dto",pr);

        System.out.println(pr.toString());
        return "product_update";
    }

    @ResponseBody
    @GetMapping("completedShip.do")
    public String shippingAf(int order_id) {

        String msg = "NO";
        boolean isSuccess = sellerservice.shipUpdate(order_id);
        if (isSuccess) {
            msg = "SUCCESS";
            return msg;
        }
        return msg;
    }

    @ResponseBody
    @GetMapping("cancelShip.do")
    public String cancelShipAf(int order_id) {

        String msg = "NO";
        boolean isSuccess = sellerservice.shipUpdateCancel(order_id);
        if (isSuccess) {
            msg = "SUCCESS";
            return msg;
        }
        return msg;
    }

    @ResponseBody
    @GetMapping("stockUpdate.do")
    public String stockUpdate(ProductDto dto) {
        System.out.println(dto.toString());

        String msg = "NO";
        boolean isSuccess = sellerservice.stockUpdate(dto);
        if (isSuccess) {
            msg = "SUCCESS";
            return msg;
        }
        return msg;
    }

    @ResponseBody
    @RequestMapping(value = "/titleImageUpload.do", produces = "application/json", method = {RequestMethod.GET, RequestMethod.POST})
    public String titleImageUpload(@RequestParam("file") MultipartFile fileload, HttpServletRequest req) {
        System.out.println("SellerOfficeController titleImageUpload");
        System.out.println("muitipartFile:" + fileload);

        FileDto fileDto = new FileDto();
        String fupload = "C:\\mystic_image\\pr_img\\";    //저장될 외부 파일 경로
        String originalFileName = fileload.getOriginalFilename();
        String extension = originalFileName.substring(originalFileName.lastIndexOf("."));    //파일 확장자
        String newfilename = UUID.randomUUID() + extension;

        fileDto.setFile_original_name(originalFileName);
        fileDto.setFile_name(newfilename);
        fileDto.setFile_where_use('0');
        fileDto.setFile_use_id(0); // 프로덕트 id 후처리 필요

        File file = new File(fupload + "/" + newfilename);
        JSONObject jsonObject = new JSONObject();

        try {
            // 실제로 업로드
            FileUtils.writeByteArrayToFile(file, fileload.getBytes());
            // DB에 저장
            fileService.insertFile(fileDto);

            jsonObject.put("url", "/mystic_image/pr_img/" + newfilename);
            jsonObject.put("responseCode", "success");

        } catch (IOException e) {
            e.printStackTrace();
        }
        String title = jsonObject.toString();
        return title;
    }

    @PostMapping("/updateAf.do")
    public String update(ProductDto dto, Model model) {
        System.out.println(dto.toString());

        boolean isSuccess = productService.productUpdate(dto);
        String msg = "N";
        if (isSuccess) {
            msg = "Y";
            model.addAttribute("msg", msg);
            return "redirect:/seller_main.do?seller_id=" + dto.getSeller_id();
        }
        return "redirect:/product_write";
    }
}
