package com.springmvc.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.springmvc.model.*;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/receipt")
public class RecieptController {

    @RequestMapping(value = "/checkout", method = RequestMethod.GET)
    public ModelAndView checkout(HttpSession session) {
    
        List<CartItem> cartItems = (List<CartItem>) session.getAttribute("cartItems");
        User loggedInUser = (User) session.getAttribute("loggedInUser");

        if (cartItems == null || cartItems.isEmpty() || loggedInUser == null) {
            return new ModelAndView("cart", "error", "ไม่พบรายการในตะกร้าหรือยังไม่ได้เข้าสู่ระบบ");
        }

        double total = cartItems.stream()
                                .mapToDouble(item -> item.getProduct().getPrice() * item.getQuantity())
                                .sum();

        Reciept receipt = new Reciept();
        receipt.setDate(new SimpleDateFormat("dd/MM/yyyy").format(new Date()));
        receipt.setTotal(total);
        receipt.setEmail(loggedInUser.getEmail());

        ModelAndView mav = new ModelAndView("orderSummary");
        mav.addObject("receipt", receipt);
        mav.addObject("cartItems", cartItems);
        mav.addObject("total", total);

        
        return mav;
    }
    
    @RequestMapping(value = "/checkouts", method = RequestMethod.POST)
    public ModelAndView checkout(
            @RequestParam("productId") int productId,
            @RequestParam("quantity") int quantity,
            HttpSession session) {

        User loggedInUser = (User) session.getAttribute("loggedInUser");

        if (loggedInUser == null) {
            return new ModelAndView("redirect:/login").addObject("error", "กรุณาเข้าสู่ระบบก่อน");
        }

        // ดึงข้อมูลสินค้า
        ProductManager productManager = new ProductManager();
        Product product = productManager.getProductById(productId);

        if (product == null || quantity <= 0) {
            return new ModelAndView("detailProduct", "error", "ไม่พบสินค้าหรือจำนวนไม่ถูกต้อง");
        }

        double total = product.getPrice() * quantity;

        // สร้างรายการใบเสร็จ
        Reciept receipt = new Reciept();
        receipt.setDate(new SimpleDateFormat("dd/MM/yyyy").format(new Date()));
        receipt.setTotal(total);
        receipt.setEmail(loggedInUser.getEmail());

        // สร้างรายการสั่งซื้อชั่วคราวและส่งไปที่หน้าสรุปการสั่งซื้อ
        ModelAndView mav = new ModelAndView("orderSummary");
        mav.addObject("receipt", receipt);
        mav.addObject("product", product);
        mav.addObject("quantity", quantity);
        mav.addObject("total", total);

        return mav;
    }

 // ยืนยันคำสั่งซื้อและลดจำนวนสินค้า
    @RequestMapping(value = "/confirmOrder", method = RequestMethod.POST)
    public ModelAndView confirmOrder(
            @RequestParam("house_number") String houseNumber,
            @RequestParam("building") String building,
            @RequestParam("sub_district") String subDistrict,
            @RequestParam("district") String district,
            @RequestParam("province") String province,
            @RequestParam("paymentMethod") String paymentMethod,
            HttpSession session) {

        List<CartItem> cartItems = (List<CartItem>) session.getAttribute("cartItems");
        User loggedInUser = (User) session.getAttribute("loggedInUser");

        if (cartItems == null || cartItems.isEmpty() || loggedInUser == null) {
            return new ModelAndView("cart", "error", "ไม่พบรายการในตะกร้าหรือยังไม่ได้เข้าสู่ระบบ");
        }

        double total = cartItems.stream()
                                .mapToDouble(item -> item.getProduct().getPrice() * item.getQuantity())
                                .sum();

        // สร้างที่อยู่ใหม่
        Address address = new Address();
        address.setHouse_number(houseNumber);
        address.setBuilding(building);
        address.setSub_district(subDistrict);
        address.setDistrict(district);
        address.setProvince(province);
        address.setEmailA(loggedInUser.getEmail());

        AddressManager addressManager = new AddressManager();
        addressManager.saveAddress(address); // บันทึกที่อยู่ลงในฐานข้อมูล

        // สร้างใบเสร็จ
        Reciept receipt = new Reciept();
        receipt.setDate(new SimpleDateFormat("dd/MM/yyyy").format(new Date()));
        receipt.setTotal(total);
        receipt.setEmail(loggedInUser.getEmail());
        receipt.setAddress(address); // เชื่อมโยงที่อยู่กับใบเสร็จ

        RecieptManager recieptManager = new RecieptManager();
        recieptManager.createReciept(receipt); 

        // ลดจำนวนสินค้าหลังจากยืนยันคำสั่งซื้อแล้วเท่านั้น
        for (CartItem item : cartItems) {
            Product product = item.getProduct();
            int updatedQty = product.getProduct_qty() - item.getQuantity();
            product.setProduct_qty(updatedQty);
            recieptManager.updateProduct(product); 

            RecieptDetail detail = new RecieptDetail(new RecieptDetailId(product, receipt), item.getQuantity(), item.getTotalPrice());
            recieptManager.addRecieptDetail(detail);
        }

        session.removeAttribute("cartItems");

        ModelAndView mav = new ModelAndView("paymentSuccess");
        mav.addObject("receipt", receipt);
        mav.addObject("total", total);
        mav.addObject("address", address); // ส่งข้อมูลที่อยู่ไปแสดงในหน้าการชำระเงินสำเร็จ
        mav.addObject("paymentMethod", paymentMethod);

        return mav;
    }

    
}
