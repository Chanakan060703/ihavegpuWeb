package com.springmvc.controller;

import java.io.IOException;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.springmvc.model.*;


import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


@Controller
public class RegIhavegpuController {
	// แสดงหน้าลงทะเบียน
	@RequestMapping(value = "/open_register", method = RequestMethod.GET)
	public ModelAndView openRegisterPage() {
	    return new ModelAndView("register", "register", new User(null, null, null, null, null, null));
	}



    // ลงทะเบียนผู้ใช้
    @RequestMapping(value = "/register", method = RequestMethod.POST)
    public ModelAndView registerUser(HttpServletRequest request) {
        String email = request.getParameter("email");
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String password = request.getParameter("password");
        String dob = request.getParameter("dob");
        String imageUrl = request.getParameter("imageUrl");

        UserManager rm = new UserManager();
        User register = new User(email, firstName, lastName, password, dob, imageUrl);

        boolean isSaved = rm.saveUser(register);
        if (isSaved) {
            return new ModelAndView("login", "message", "ลงทะเบียนสำเร็จ โปรดเข้าสู่ระบบ");
        } else {
            return new ModelAndView("register", "error", "เกิดข้อผิดพลาดในการลงทะเบียน");
        }
    }

    // ประมวลผลการเข้าสู่ระบบ
    @RequestMapping(value = "/loginProcess", method = RequestMethod.POST)
    public ModelAndView loginProcess(HttpServletRequest request, HttpSession session) {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        UserManager rm = new UserManager();
        String validationMessage = UserManager.validateLogin(email, password);

        if (validationMessage.equals("success")) {
            User user = rm.getRegisterByEmail(email);

            if (user != null) {
                session.setAttribute("loggedInUser", user);
                session.setMaxInactiveInterval(15 * 60);
                return new ModelAndView("redirect:/home", "message", "ยินดีต้อนรับ " + user.getFirstName() + " " + user.getLastName());
            } else {
                return new ModelAndView("login", "error", "ไม่พบผู้ใช้ในระบบ");
            }
        } else {
            return new ModelAndView("login", "error", validationMessage);
        }
    }

 // แสดงหน้าแก้ไขโปรไฟล์
    @RequestMapping(value = "/editProfile", method = RequestMethod.GET)
    public ModelAndView showEditProfile(HttpSession session) {
        User loggedInUser = (User) session.getAttribute("loggedInUser");
        if (loggedInUser != null) {
            return new ModelAndView("editProfile", "user", loggedInUser);
        } else {
            return new ModelAndView("login", "error", "กรุณาเข้าสู่ระบบก่อน");
        }
    }

    // ประมวลผลการอัปเดตโปรไฟล์
    @RequestMapping(value = "/updateProfile", method = RequestMethod.POST)
    public ModelAndView updateProfile(HttpServletRequest request, HttpSession session) {
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String dob = request.getParameter("dob");
        String imageUrl = request.getParameter("imageUrl");

        User loggedInUser = (User) session.getAttribute("loggedInUser");
        if (loggedInUser != null) {
            // อัปเดตข้อมูลผู้ใช้
            loggedInUser.setFirstName(firstName);
            loggedInUser.setLastName(lastName);
            loggedInUser.setDob(dob);
            loggedInUser.setImageUrl(imageUrl);

            // บันทึกข้อมูลลงฐานข้อมูล
            UserManager rm = new UserManager();
            rm.updateUser(loggedInUser);

            // อัปเดต session
            session.setAttribute("loggedInUser", loggedInUser);

            return new ModelAndView("index", "message", "ข้อมูลของคุณถูกอัปเดตแล้ว");
        } else {
            return new ModelAndView("login", "error", "กรุณาเข้าสู่ระบบก่อน");
        }
    }

    // แสดงหน้าล็อกอิน
    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public ModelAndView loadLoginPage() {
        return new ModelAndView("login");
    }

    
    // ออกจากระบบ
    @RequestMapping(value = "/logout", method = RequestMethod.GET)
    public void logout(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.getSession().invalidate();
        response.sendRedirect("home");  
    }
    
    
}
