package lotte.com.toy.controller;

import lotte.com.toy.dto.CartDto;
import lotte.com.toy.dto.CartUserProductDto;
import lotte.com.toy.dto.UserDto;
import lotte.com.toy.service.CartService;
import lotte.com.toy.util.Utility;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class CartController {
    private Logger log = LoggerFactory.getLogger(CartController.class);

    @Autowired
    CartService cartService;

    @GetMapping("/cart.do")
    public String cartDetail(Model model, HttpServletRequest req, HttpServletResponse response) throws IOException { //, int userId
        log.info("CartController cartDetail()");

        UserDto userDto = (UserDto) req.getSession().getAttribute("userLogin");
        if (userDto == null) {
//            response.sendRedirect("/userLogin.do");
            return "redirect:/login.do";
        }
        int userId = userDto.getUser_id();

        List<CartUserProductDto> cartUserProductDtoList = cartService.getCartUserProductDtoByUserId(userId);

        model.addAttribute("cartUserProductDtoList", cartUserProductDtoList);
        int totalPrice = Utility.getTotalPrice(cartUserProductDtoList);
        model.addAttribute("totalPrice", totalPrice);
        if(totalPrice != 0){
            totalPrice += 2500;
        }
        model.addAttribute("totalPriceFinal", totalPrice);
        return "cartdetail";
    }

    @ResponseBody
    @PostMapping(value = "/cartinsert.do", produces = "application/text; charset=UTF-8")
    public String cartInsert(CartDto cartDto, HttpServletResponse response) {
        log.info("CartController cartInsert()");

        response.setCharacterEncoding("UTF-8");

        String msg = "이미 장바구니에 존재하는 제품입니다";

        CartDto checkCartDto = cartService.getCartByProductIdAndUserId(cartDto);
        if (checkCartDto != null) {
            return msg;
        }

        log.info(cartDto.toString());

        cartService.insertCart(cartDto);

        msg = "장바구니에 담겼습니다. 장바구니로 이동하시겠습니까?";

        return msg;
    }

    @ResponseBody
    @PostMapping("/cartupdate.do")
    public Map<String, String> cartUpdate(CartDto cartDto) {
        log.info("CartController cartUpdate()");
        String msg = "수정 실패";
        int totalPrice = 0;

        Map<String, String> map = new HashMap<>();
        if (cartService.updateCart(cartDto)) {
            msg = "수정 성공";
            log.info(msg);

            List<CartUserProductDto> cartUserProductDtoList = cartService.getCartUserProductDtoByUserId(cartDto.getUser_id());
            totalPrice = Utility.getTotalPrice(cartUserProductDtoList);

        }
        map.put("msg", msg);
        map.put("totalPrice", totalPrice + "");

        return map;
    }

    @ResponseBody
    @GetMapping("/cartdelete.do")
    public String cartDelete(int cartId) {
        log.info("CartController cartDelete()");
        String msg = "삭제 실패";

        if (cartService.deleteCartByCartId(cartId)) {
            msg = "삭제 성공";
        }

        return msg;
    }
}
