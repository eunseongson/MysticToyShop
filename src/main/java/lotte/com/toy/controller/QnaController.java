package lotte.com.toy.controller;

import lotte.com.toy.dao.QnaDao;
import lotte.com.toy.dto.*;
import lotte.com.toy.service.CartService;
import lotte.com.toy.service.ProductService;
import lotte.com.toy.service.QnaService;
import lotte.com.toy.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

@Controller
public class QnaController {

    @Autowired
    QnaService qnaService;

    @Autowired
    UserService userService;

    @Autowired
    ProductService productService;

    @RequestMapping(value = "qna.do")
    public String startQna(Model model, int productId, HttpServletRequest req){
        UserDto userDto = (UserDto) req.getSession().getAttribute("userLogin");
        if (userDto == null) {
//            response.sendRedirect("/userLogin.do");
            return "redirect:/userLogin.do";
        }
        ProductDto product = productService.findByProductId(productId);
        model.addAttribute("productId",productId);
        model.addAttribute("productImg",product.getProduct_img());
        model.addAttribute("productName",product.getProduct_name());
        return "qna";
    }
    @PostMapping(value = "qnaAf.do")
    public String insertQna(HttpServletRequest req,Model model, int productId, String qnaTitle, String qnaContent){
        UserDto userDto = (UserDto) req.getSession().getAttribute("userLogin");
        if (userDto == null) {
            return "redirect:/userLogin.do";
        }        QnaSheetDto qna = new QnaSheetDto(qnaTitle,qnaContent,userDto.getUser_id(),productId);

        model.addAttribute("productId", productId);
        boolean checker = qnaService.insertQna(qna);
        if(checker){
            return "redirect:/productDetail.do";
        }
        return "redirect:/productDetail.do";
    }

    @RequestMapping(value = "findQnaList.do")
    public String findQnaList(Model model,int productId){
        List<QnaListDto> qnas = qnaService.findQnaList(productId);
        List<String> writers = new ArrayList<>();
        for(QnaListDto qna : qnas){
            writers.add(userService.findNameByUserId(qna.getQna_writer()));
        }
        ProductResponseDto productResponseDto = productService.getProductByProductId(productId);
        model.addAttribute("productResponseDto",productResponseDto);
        model.addAttribute("writers",writers);
        model.addAttribute("qnas",qnas);
        return "qnalist";
    }
}
