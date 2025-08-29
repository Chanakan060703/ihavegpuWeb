package com.springmvc.controller;


import com.springmvc.model.*;
import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Controller
public class CartController {

    private ProductManager productManager = new ProductManager();

    // แสดงหน้าตะกร้าสินค้า
    @RequestMapping(value = "/cart", method = RequestMethod.GET)
    public ModelAndView viewCart(HttpSession session) {
        List<CartItem> cartItems = (List<CartItem>) session.getAttribute("cartItems");

        double totalPrice = calculateTotalPrice(cartItems);
        ModelAndView mav = new ModelAndView("cart");
        mav.addObject("cartItems", cartItems);
        mav.addObject("totalPrice", totalPrice);
        return mav;
    }

    // เพิ่มสินค้าไปยังตะกร้า
    @RequestMapping(value = "/addToCart", method = RequestMethod.POST)
    public ModelAndView addToCart(@RequestParam("productId") int productId,
                                  @RequestParam("quantity") int quantity,
                                  @RequestParam("redirectUrl") String redirectUrl,
                                  HttpSession session) {
        Product product = productManager.getProductById(productId);
        ModelAndView mav = new ModelAndView("redirect:/" + redirectUrl);

        if (product == null || quantity <= 0) {
            mav.addObject("error", "ไม่พบสินค้าหรือจำนวนไม่ถูกต้อง");
            return mav;
        }

        // ตรวจสอบว่าจำนวนที่สั่งไม่เกินจำนวนที่มีอยู่
        if (quantity > product.getProduct_qty()) {
            mav.addObject("error", "สั่งซื้อไม่สำเร็จ: จำนวนสินค้าที่เหลืออยู่ไม่เพียงพอ");
            return mav;
        }

        List<CartItem> cartItems = (List<CartItem>) session.getAttribute("cartItems");
        if (cartItems == null) {
            cartItems = new ArrayList<>();
        }

        boolean itemExists = false;
        for (CartItem item : cartItems) {
            if (item.getProduct().getProduct_id() == productId) {
                int newQuantity = item.getQuantity() + quantity;
                if (newQuantity > product.getProduct_qty()) {
                    mav.addObject("error", "สั่งซื้อไม่สำเร็จ: จำนวนสินค้าที่เหลืออยู่ไม่เพียงพอ");
                    return mav;
                }
                item.setQuantity(newQuantity);
                itemExists = true;
                break;
            }
        }

        if (!itemExists) {
            CartItem cartItem = new CartItem(product, quantity);
            cartItems.add(cartItem);
        }

        session.setAttribute("cartItems", cartItems);
        mav.addObject("success", "เพิ่มสินค้าในตะกร้าเรียบร้อย");
        return mav;
    }

    // อัปเดตจำนวนสินค้าในตะกร้า
    @RequestMapping(value = "/updateCart", method = RequestMethod.POST)
    public ModelAndView updateCart(@RequestParam("productIds") List<Integer> productIds,
                                   @RequestParam("quantities") List<Integer> quantities,
                                   HttpSession session) {

        List<CartItem> cartItems = (List<CartItem>) session.getAttribute("cartItems");
        List<String> errorMessages = new ArrayList<>();

        if (cartItems != null) {
            for (int i = 0; i < productIds.size(); i++) {
                int productId = productIds.get(i);
                int quantity = quantities.get(i);

                for (CartItem item : cartItems) {
                    if (item.getProduct().getProduct_id() == productId) {
                        if (quantity > item.getProduct().getProduct_qty()) {
                            errorMessages.add("สินค้าชื่อ " + item.getProduct().getProduct_name() +
                                              " มีจำนวนไม่เพียงพอ");
                        } else {
                            item.setQuantity(quantity);
                        }
                        break;
                    }
                }
            }
        }

        double totalPrice = calculateTotalPrice(cartItems);

        session.setAttribute("cartItems", cartItems);
        ModelAndView mav = new ModelAndView("cart");
        mav.addObject("errorMessages", errorMessages);
        mav.addObject("totalPrice", totalPrice);
        return mav;
    }

    // ลบสินค้าออกจากตะกร้า
    @RequestMapping(value = "/removeFromCart", method = RequestMethod.POST)
    public ModelAndView removeFromCart(@RequestParam("productId") int productId,
                                       @RequestParam("redirectUrl") String redirectUrl,
                                       HttpSession session) {
        List<CartItem> cartItems = (List<CartItem>) session.getAttribute("cartItems");

        if (cartItems != null) {
            cartItems.removeIf(item -> item.getProduct().getProduct_id() == productId);
            session.setAttribute("cartItems", cartItems);
        }

        return new ModelAndView("redirect:/" + redirectUrl);
    }

    // คำนวณยอดรวมทั้งหมดของสินค้าในตะกร้า
    private double calculateTotalPrice(List<CartItem> cartItems) {
        if (cartItems == null) return 0;
        return cartItems.stream()
                        .mapToDouble(item -> item.getProduct().getPrice() * item.getQuantity())
                        .sum();
    }

    // โหลดหน้า จัดสเปกคอม
    @RequestMapping(value = "/specProduct", method = RequestMethod.GET)
    public ModelAndView loadSpecProductPage(@RequestParam(value = "typeId", required = false) Integer typeId,
                                            @RequestParam(value = "sortOrder", required = false) String sortOrder) {

        ProductManager pm = new ProductManager();
        List<Product> list = (typeId != null) ? pm.getProductsByCategory(typeId) : pm.getAllProduct();
        List<Type> productTypes = pm.getAllProductTypes();

        if ("low-to-high".equals(sortOrder)) {
            list.sort(Comparator.comparingDouble(Product::getPrice));
        } else if ("high-to-low".equals(sortOrder)) {
            list.sort(Comparator.comparingDouble(Product::getPrice).reversed());
        }

        ModelAndView mav = new ModelAndView("specProduct");
        mav.addObject("listProduct", list);
        mav.addObject("productTypes", productTypes);
        mav.addObject("selectedTypeId", typeId);
        mav.addObject("sortOrder", sortOrder);
        return mav;
    }

 // บันทึกสเปคที่ไม่ต้องกรอกชื่อ
    @RequestMapping(value = "/saveSpec", method = RequestMethod.POST)
    public ModelAndView saveSpec(HttpSession session) {
        List<CartItem> cartItems = (List<CartItem>) session.getAttribute("cartItems");

        if (cartItems == null || cartItems.isEmpty()) {
            return new ModelAndView("specProduct", "error", "ไม่มีสินค้าในตะกร้าเพื่อบันทึกสเปค");
        }

        User loggedInUser = (User) session.getAttribute("loggedInUser");
        if (loggedInUser == null) {
            return new ModelAndView("login", "error", "กรุณาเข้าสู่ระบบก่อนบันทึกสเปค");
        }
        
        SavedSpecGroupManager savedSpecGroupManager = new SavedSpecGroupManager();
        int nextGroupId = savedSpecGroupManager.getNextGroupId();
        String generatedSpecName = "Spec-" + nextGroupId;

        SavedSpecGroup newSpecGroup = new SavedSpecGroup();
        newSpecGroup.setGroupName(generatedSpecName); 
        newSpecGroup.setUser(loggedInUser);

        
        List<CartItem> cartItemsList = new ArrayList<>();
        for (CartItem cartItem : cartItems) {
            cartItem.setSavedSpecGroup(newSpecGroup); 
            cartItemsList.add(cartItem);
        }
        newSpecGroup.setCartItems(cartItemsList); 

        
        boolean isSaved = savedSpecGroupManager.saveSavedSpecGroup(newSpecGroup);

        if (isSaved) {
            session.removeAttribute("cartItems"); // ล้าง session หลังบันทึกสำเร็จ
            return new ModelAndView("redirect:/savedSpec", "message", "บันทึกสเปคสำเร็จ");
        } else {
            return new ModelAndView("specProduct", "error", "ไม่สามารถบันทึกสเปคได้");
        }
    }



    @RequestMapping(value = "/savedSpec", method = RequestMethod.GET)
    public ModelAndView showSavedSpec(HttpSession session) {
        User loggedInUser = (User) session.getAttribute("loggedInUser");
        if (loggedInUser == null) {
            return new ModelAndView("login", "error", "กรุณาเข้าสู่ระบบก่อนดูสเปคที่บันทึก");
        }

        SavedSpecGroupManager savedSpecGroupManager = new SavedSpecGroupManager();
        List<SavedSpecGroup> savedSpecGroups = savedSpecGroupManager.getSavedSpecGroupsByUser(loggedInUser.getEmail());
        
        if (savedSpecGroups == null) {
            savedSpecGroups = new ArrayList<>(); // หากไม่มีข้อมูล กำหนดให้เป็น List ว่าง
        }
        
        ModelAndView mav = new ModelAndView("savedSpec");
        mav.addObject("savedSpecGroups", savedSpecGroups); // ส่ง savedSpecGroups ไปยัง JSP
        return mav;
    }
    
    @RequestMapping(value = "/deleteSpec", method = RequestMethod.GET)
    public ModelAndView deleteSpec(@RequestParam("groupId") int groupId, HttpSession session) {
        User loggedInUser = (User) session.getAttribute("loggedInUser");
        if (loggedInUser == null) {
            return new ModelAndView("redirect:/login").addObject("error", "กรุณาเข้าสู่ระบบก่อนลบสเปค");
        }

        SavedSpecGroupManager savedSpecGroupManager = new SavedSpecGroupManager();
        boolean isDeleted = savedSpecGroupManager.deleteSavedSpecGroup(groupId);

        ModelAndView mav = new ModelAndView("redirect:/savedSpec");
        if (!isDeleted) {
            mav.addObject("error", "ไม่สามารถลบสเปคได้");
        } else {
            mav.addObject("message", "ลบสเปคสำเร็จ");
        }

        return mav;
    }
    
    @RequestMapping(value = "/detailSaveSpec", method = RequestMethod.GET)
    public ModelAndView viewDetailSaveSpec(@RequestParam("groupId") int groupId) {
        SavedSpecGroupManager savedSpecGroupManager = new SavedSpecGroupManager();
        SavedSpecGroup savedSpecGroup = savedSpecGroupManager.getSavedSpecGroupById(groupId);

        if (savedSpecGroup == null) {
            return new ModelAndView("error", "message", "ไม่พบสเปคที่บันทึกไว้");
        }

        List<CartItem> cartItems = savedSpecGroup.getCartItems();
        double totalPrice = cartItems.stream()
                                     .mapToDouble(item -> item.getProduct().getPrice() * item.getQuantity())
                                     .sum();

        ModelAndView mav = new ModelAndView("detailSaveSpec");
        mav.addObject("specGroup", savedSpecGroup);
        mav.addObject("cartItems", cartItems);
        mav.addObject("totalPrice", totalPrice);
        return mav;
    }
    
    //เพิ่มสเปคที่จัดลงตะกร้า
    @RequestMapping(value = "/addSavedSpecToCart", method = RequestMethod.POST)
    public ModelAndView addSavedSpecToCart(@RequestParam("groupId") int groupId, HttpSession session) {
        // ดึงสเปคที่บันทึกไว้จาก SavedSpecGroupManager
        SavedSpecGroupManager savedSpecGroupManager = new SavedSpecGroupManager();
        SavedSpecGroup savedSpecGroup = savedSpecGroupManager.getSavedSpecGroupById(groupId);

        if (savedSpecGroup == null) {
            return new ModelAndView("savedSpec", "error", "ไม่พบสเปคที่บันทึกไว้");
        }

        // ดึงรายการสินค้าในสเปคที่บันทึกไว้และเพิ่มไปในตะกร้า
        List<CartItem> savedSpecItems = savedSpecGroup.getCartItems();
        List<CartItem> cartItems = (List<CartItem>) session.getAttribute("cartItems");

        if (cartItems == null) {
            cartItems = new ArrayList<>();
        }

        // รวมสินค้าที่เพิ่มใหม่เข้าไปในตะกร้า
        for (CartItem savedItem : savedSpecItems) {
            boolean itemExists = false;
            for (CartItem cartItem : cartItems) {
                if (cartItem.getProduct().getProduct_id() == savedItem.getProduct().getProduct_id()) {
                    // หากสินค้านั้นมีอยู่แล้ว ให้เพิ่มจำนวนสินค้า
                    cartItem.setQuantity(cartItem.getQuantity() + savedItem.getQuantity());
                    itemExists = true;
                    break;
                }
            }
            if (!itemExists) {
                cartItems.add(new CartItem(savedItem.getProduct(), savedItem.getQuantity()));
            }
        }

        // อัปเดต session ของ cartItems
        session.setAttribute("cartItems", cartItems);

        // เปลี่ยนเส้นทางไปที่หน้า cart.jsp
        return new ModelAndView("redirect:/cart");
    }
}
