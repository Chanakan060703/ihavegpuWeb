package com.springmvc.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.springmvc.model.Reciept;
import com.springmvc.model.RecieptDetail;
import com.springmvc.model.User;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/receipt")
public class OrderHistoryController {

    @RequestMapping(value = "/Open_orderHistory", method = RequestMethod.GET)
    public ModelAndView orderHistory(HttpSession session) {
        User loggedInUser = (User) session.getAttribute("loggedInUser");

        if (loggedInUser == null) {
            return new ModelAndView("redirect:/login").addObject("error", "กรุณาเข้าสู่ระบบก่อน");
        }

        RecieptManager recieptManager = new RecieptManager();
        List<Reciept> orderHistory = recieptManager.getOrderHistoryByEmail(loggedInUser.getEmail());

        SimpleDateFormat dateFormatInput = new SimpleDateFormat("E MMM dd HH:mm:ss z yyyy");
        SimpleDateFormat dateFormatOutput = new SimpleDateFormat("dd/MM/yyyy HH:mm");

        for (Reciept receipt : orderHistory) {
            try {
                Date date = dateFormatInput.parse(receipt.getDate());
                receipt.setDate(dateFormatOutput.format(date));
            } catch (ParseException e) {
                e.printStackTrace();
            }
        }

        ModelAndView mav = new ModelAndView("orderHistory");
        mav.addObject("orderHistory", orderHistory);
        return mav;
    }

    @RequestMapping(value = "/deleteOrder", method = RequestMethod.GET)
    public ModelAndView deleteOrder(@RequestParam("receiptId") int receiptId, HttpSession session) {
        User loggedInUser = (User) session.getAttribute("loggedInUser");

        if (loggedInUser == null) {
            return new ModelAndView("redirect:/login").addObject("error", "กรุณาเข้าสู่ระบบก่อน");
        }

        RecieptManager recieptManager = new RecieptManager();
        boolean isDeleted = recieptManager.deleteRecieptById(receiptId);

        if (isDeleted) {
            return new ModelAndView("redirect:/receipt/Open_orderHistory").addObject("message", "ลบคำสั่งซื้อสำเร็จ");
        } else {
            return new ModelAndView("redirect:/receipt/Open_orderHistory").addObject("error", "ไม่สามารถลบคำสั่งซื้อได้");
        }
    }

    @RequestMapping(value = "/viewOrderDetail", method = RequestMethod.GET)
    public ModelAndView viewOrderDetail(@RequestParam("receiptId") int receiptId, HttpSession session) {
        User loggedInUser = (User) session.getAttribute("loggedInUser");
        if (loggedInUser == null) {
            return new ModelAndView("redirect:/login").addObject("error", "กรุณาเข้าสู่ระบบก่อน");
        }

        RecieptManager recieptManager = new RecieptManager();
        Reciept receipt = recieptManager.getRecieptById(receiptId);

        if (receipt == null || !receipt.getEmail().equals(loggedInUser.getEmail())) {
            return new ModelAndView("error").addObject("error", "ไม่พบคำสั่งซื้อหรือคุณไม่มีสิทธิ์เข้าถึงคำสั่งซื้อนี้");
        }

        List<RecieptDetail> receiptDetails = recieptManager.getRecieptDetailsByReceiptId(receiptId);

        ModelAndView mav = new ModelAndView("orderDetail");
        mav.addObject("receipt", receipt);
        mav.addObject("receiptDetails", receiptDetails);
        return mav;
    }
}
