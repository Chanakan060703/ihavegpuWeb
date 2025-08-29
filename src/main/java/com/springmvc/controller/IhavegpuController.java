package com.springmvc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.springmvc.model.*;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
public class IhavegpuController {


	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView loadHomePage(HttpServletRequest request) {
	    HttpSession session = request.getSession(false);
	    User loggedInUser = (session != null) ? (User) session.getAttribute("loggedInUser") : null;

	    ProductManager pm = new ProductManager();
	    List<Product> list = pm.getAllProduct();
	    List<Type> productTypes = pm.getAllProductTypes();
	    
	    ModelAndView mav = new ModelAndView("index");
	    mav.addObject("listProduct", list);
	    mav.addObject("productTypes", productTypes); 
	    mav.addObject("loggedInUser", loggedInUser); 
	    return mav;
	}
     //home
    @RequestMapping(value = "/home", method = RequestMethod.GET)
    public ModelAndView home(HttpSession session) {
        User loggedInUser = (User) session.getAttribute("loggedInUser");
       
        ProductManager pm = new ProductManager();
	    List<Product> list = pm.getAllProduct();
	    List<Type> productTypes = pm.getAllProductTypes();
	    ModelAndView mav = new ModelAndView("index");
            mav.addObject("loggedInUser", loggedInUser);  
            mav.addObject("listProduct", list);
    	    mav.addObject("productTypes", productTypes); 
    	    mav.addObject("loggedInUser", loggedInUser);
        return mav;
    }

////////////////////////////////////// Product ///////////////////////////////////////////////////////////
       
    
    //allProduct
    @RequestMapping(value = "/allProducts", method = RequestMethod.GET)
    public ModelAndView loadAllProductPage(HttpSession session) {
    	 User loggedInUser = (User) session.getAttribute("loggedInUser");
         boolean isAdmin = loggedInUser != null && "Chanakan@gmail.com".equals(loggedInUser.getEmail());

        ProductManager pm = new ProductManager();
        List<Product> list = pm.getAllProduct();
        List<Type> productTypes = pm.getAllProductTypes();

        ModelAndView mav = new ModelAndView("allProduct");
        mav.addObject("listProduct", list);
        mav.addObject("productTypes", productTypes); 
        mav.addObject("isAdmin", isAdmin);
        return mav;
    }


    // ค้นหาสินค้า
    @RequestMapping(value = "/searchProduct", method = RequestMethod.POST)
    public ModelAndView searchProduct(HttpServletRequest request) {
        String keyword = request.getParameter("keyword");
        ProductManager pm = new ProductManager();
        
        List<Product> searchResult = pm.searchProduct(keyword);
        List<Type> productTypes = pm.getAllProductTypes();
        
        ModelAndView mav = new ModelAndView("allProduct");
        mav.addObject("listProduct", searchResult);
        mav.addObject("productTypes", productTypes);
        mav.addObject("keyword", keyword);

        if (searchResult.isEmpty()) {
            mav.addObject("error_msg", "ไม่พบข้อมูลสินค้าสำหรับคำค้นหา: " + keyword);
        }

        return mav;
    }
    @RequestMapping(value = "/searchProductSpec", method = RequestMethod.POST)
    public ModelAndView searchProductSpec(HttpServletRequest request) {
    	String keyword = request.getParameter("keyword");
    	ProductManager pm = new ProductManager();
    	
    	List<Product> searchResult = pm.searchProduct(keyword);
    	List<Type> productTypes = pm.getAllProductTypes();
    	
    	ModelAndView mav = new ModelAndView("specProduct");
    	mav.addObject("listProduct", searchResult);
    	mav.addObject("productTypes", productTypes);
    	mav.addObject("keyword", keyword);
    	
    	if (searchResult.isEmpty()) {
    		mav.addObject("error_msgs", "ไม่พบข้อมูลสินค้าสำหรับคำค้นหา: " + keyword);
    	}
    	
    	return mav;
    }
    
    //แสดงหน้าเพิ่มสิรค้า
    @RequestMapping(value = "/OpenAddProduct", method = RequestMethod.GET)
    public ModelAndView showAddProductPage(HttpSession session) {
        ProductManager pm = new ProductManager();
        List<Type> productTypes = pm.getAllProductTypes();
        User loggedInUser = (User) session.getAttribute("loggedInUser");
        boolean isAdmin = loggedInUser != null && "Chanakan@gmail.com".equals(loggedInUser.getEmail());

        ModelAndView mav;

        if (loggedInUser != null && isAdmin) {
            mav = new ModelAndView("addProduct");
            mav.addObject("productTypes", productTypes);
        } else {
            mav = new ModelAndView("login");
            mav.addObject("error", "กรุณาเข้าสู่ระบบก่อน");
        }

        return mav;
    }

    //เพิ่มสินค้า
    @RequestMapping(value = "/addProduct", method = RequestMethod.POST)
    public ModelAndView addProduct(HttpServletRequest request) {
        String imageUrl = request.getParameter("imageUrl");
        String nameProduct = request.getParameter("nameProduct");
        String detail = request.getParameter("detail");
        String brand = request.getParameter("brand");
        double price = Double.parseDouble(request.getParameter("price"));
        int qty = Integer.parseInt(request.getParameter("qty"));
        int typeId = Integer.parseInt(request.getParameter("typeId"));

        Product product = new Product();
        product.setPic_product(imageUrl);
        product.setProduct_name(nameProduct);
        product.setDetail(detail);
        product.setBrand(brand);
        product.setPrice(price);
        product.setProduct_qty(qty);

        ProductManager pm = new ProductManager();
        Type type = pm.getTypeById(typeId);
        product.setType_id(type);

        boolean isSaved = pm.addProduct(product);
        if (isSaved) {
            return new ModelAndView("redirect:/allProducts").addObject("message", "สินค้าใหม่ถูกเพิ่มแล้ว");
        } else {
            return new ModelAndView("addProduct", "error", "เกิดข้อผิดพลาดในการเพิ่มสินค้า");
        }
    }

    
    
    
    //แสดงDetailของProduct
    @RequestMapping(value = "/detailProduct", method = RequestMethod.GET)
    public ModelAndView viewProductDetail(HttpServletRequest request) {
        String productIdParam = request.getParameter("productId");
        int productId = (productIdParam != null) ? Integer.parseInt(productIdParam) : -1;

        ProductManager pm = new ProductManager();
        Product product = pm.getProductById(productId);

        ModelAndView mav = new ModelAndView("detailitem");
        if (product != null) {
            mav.addObject("product", product);
        } else {
            mav.addObject("error_msg", "ไม่พบข้อมูลสินค้าที่คุณเลือก");
        }
        return mav;
    }
    //แสดงตามประเภทProduct
    @RequestMapping(value = "/viewProductsByType", method = RequestMethod.GET)
    public ModelAndView filterByCategory(@RequestParam("typeId") int typeId) {
        ProductManager pm = new ProductManager();
        List<Product> products = pm.getProductsByCategory(typeId);
        List<Type> productTypes = pm.getAllProductTypes();
        String selectedTypeName = pm.getTypeById(typeId).getType_name();

        ModelAndView mav = new ModelAndView("categoryPage"); 
        mav.addObject("products", products);
        mav.addObject("productTypes", productTypes);
        mav.addObject("selectedTypeId", typeId);
        mav.addObject("selectedTypeName", selectedTypeName);
        return mav;
    }

    //แสดงหน้าแก้ไขสินค้า
    @RequestMapping(value = "/editProduct", method = RequestMethod.GET)
    public ModelAndView showEditProductForm(@RequestParam("productId") int productId) {
        ProductManager pm = new ProductManager();
        Product product = pm.getProductById(productId);
        List<Type> productTypes = pm.getAllProductTypes(); 

        if (product != null) {
            ModelAndView mav = new ModelAndView("editProduct");
            mav.addObject("product", product);
            mav.addObject("productTypes", productTypes);
            return mav;
        } else {
            return new ModelAndView("allProduct", "error", "ไม่พบข้อมูลสินค้าที่ต้องการแก้ไข");
        }
    }
    
    //แก้ไขสินค้า
    @RequestMapping(value = "/updateProduct", method = RequestMethod.POST)
    public ModelAndView updateProduct(HttpServletRequest request) {
        int productId = Integer.parseInt(request.getParameter("productId"));
        String imageUrl = request.getParameter("imageUrl") != null ? request.getParameter("imageUrl").trim() : "";
        String nameProduct = request.getParameter("product_name") != null ? request.getParameter("product_name").trim() : "";
        String detail = request.getParameter("detail") != null ? request.getParameter("detail").trim() : "";
        String brand = request.getParameter("brand") != null ? request.getParameter("brand").trim() : "";
        double price = Double.parseDouble(request.getParameter("price"));
        int qty = Integer.parseInt(request.getParameter("product_qty"));
        int typeId = Integer.parseInt(request.getParameter("type_id"));

        ProductManager pm = new ProductManager();
        Product product = pm.getProductById(productId);

        if (product != null) {
            product.setProduct_name(nameProduct);
            product.setPic_product(imageUrl);
            product.setDetail(detail);
            product.setBrand(brand);
            product.setPrice(price);
            product.setProduct_qty(qty);
            
            Type type = pm.getTypeById(typeId);
            product.setType(type);

            boolean isUpdated = pm.updateProduct(product);
            if (isUpdated) {
                return new ModelAndView("redirect:/allProducts").addObject("message", "ข้อมูลสินค้าถูกแก้ไขแล้ว");
            } else {
                return new ModelAndView("editProduct", "error", "เกิดข้อผิดพลาดในการแก้ไขข้อมูล");
            }
        } else {
            return new ModelAndView("allProduct", "error", "ไม่พบข้อมูลสินค้าที่ต้องการแก้ไข");
        }
    }


    //ลบสินค้า
    @RequestMapping(value = "/delProduct", method = RequestMethod.GET)
    public ModelAndView deleteProduct(@RequestParam("productId") int productId, HttpSession session) {
        User loggedInUser = (User) session.getAttribute("loggedInUser");
        boolean isAdmin = loggedInUser != null && "Chanakan@gmail.com".equals(loggedInUser.getEmail());

        if (loggedInUser == null || !isAdmin) {
            return new ModelAndView("login", "error", "กรุณาเข้าสู่ระบบในฐานะผู้ดูแลระบบ");
        }

        ProductManager pm = new ProductManager();
        boolean isDeleted = pm.deleteProduct(productId);

        ModelAndView mav = new ModelAndView("redirect:/allProducts");
        if (!isDeleted) {
            mav.addObject("error_msg", "เกิดข้อผิดพลาดในการลบสินค้า กรุณาลองใหม่อีกครั้ง");
        } else {
            mav.addObject("message", "สินค้าถูกลบเรียบร้อยแล้ว");
        }

        return mav;
    }


    
////////////////////////////////////////// News ///////////////////////////////////////////////////////        
    //แสดงหน้าข่าว
    @RequestMapping(value = "/newsPage", method = RequestMethod.GET)
    public ModelAndView loadnewsPage(HttpSession session) {
    	User loggedInUser = (User) session.getAttribute("loggedInUser");
        boolean isAdmin = loggedInUser != null && "Chanakan@gmail.com".equals(loggedInUser.getEmail());
    	NewsManager nm = new NewsManager();
    	List<News> listNew = nm.getAllNews();
    	
    	ModelAndView mav = new ModelAndView("news");
    	mav.addObject("listNew",listNew);
    	mav.addObject("isAdmin",isAdmin);
        return mav;
    }
    
    
    //แสดงหน้าแก้ไขข่าว
    @RequestMapping(value = "/editNews", method = RequestMethod.POST)
    public ModelAndView editNews(@RequestParam("newsId") int newsId, HttpSession session) {
        User loggedInUser = (User) session.getAttribute("loggedInUser");
        if (loggedInUser == null) {
            return new ModelAndView("login", "error", "กรุณาเข้าสู่ระบบก่อน");
        }

        NewsManager nm = new NewsManager();
        News news = nm.getNewsById(newsId); 

        if (news != null) {
            session.setAttribute("news", news); 
            return new ModelAndView("editNew", "news", news);
        } else {
            return new ModelAndView("news", "message", "ไม่พบข่าวที่ต้องการแก้ไข");
        }
    }
    
    
 // อัพเดทข่าว
    @RequestMapping(value = "/updateNews", method = RequestMethod.POST)
    public ModelAndView updateNews(HttpServletRequest request, HttpSession session) {
        String new_name = request.getParameter("newsTitle");
        String new_detail = request.getParameter("newsContent");
        String new_date = request.getParameter("newsDate");
        String new_pic = request.getParameter("imageUrl");

        News news = (News) session.getAttribute("news");
        
        if (news != null) {
            news.setNew_pic(new_pic);
            news.setNew_name(new_name);
            news.setNew_detail(new_detail);
            news.setNew_date(new_date);

            NewsManager nm = new NewsManager();
            boolean isUpdated = nm.updateNews(news);

            if (isUpdated) {
                session.setAttribute("news", news);
                return new ModelAndView("redirect:/newsPage", "message", "ข้อมูลข่าวถูกอัปเดตเรียบร้อยแล้ว");
            } else {
                return new ModelAndView("editNew", "error_msg", "เกิดข้อผิดพลาดในการอัปเดตข้อมูล กรุณาลองใหม่อีกครั้ง");
            }
        }
        
        return new ModelAndView("news", "message", "ไม่พบข้อมูลข่าวที่คุณต้องการอัปเดต");
    }


    
    //แสดงหน้าเพิ่มข่าว
    @RequestMapping(value = "/OpenAddNew", method = RequestMethod.GET)
    public ModelAndView showEditProfile(HttpSession session) {
    	User loggedInUser = (User) session.getAttribute("loggedInUser");
        if (loggedInUser != null) {
            return new ModelAndView("addNews", "user", loggedInUser);
        } else {
            return new ModelAndView("login", "error", "กรุณาเข้าสู่ระบบก่อน");
        }
    }
    
    //เพิ่มข่าว
    @RequestMapping(value = "/addNews", method = RequestMethod.POST)
    public ModelAndView addNews(HttpServletRequest request) {
        String newsTitle = request.getParameter("newsTitle");
        String newsContent = request.getParameter("newsContent");
        String newsDate = request.getParameter("newsDate");
        String imageUrl = request.getParameter("imageUrl");

        News news = new News();
        news.setNew_name(newsTitle);
        news.setNew_detail(newsContent);
        news.setNew_date(newsDate);
        news.setNew_pic(imageUrl);

        NewsManager nm = new NewsManager();
        boolean isSaved = nm.addNews(news);
        if (isSaved) {
            
            return new ModelAndView("redirect:/newsPage").addObject("message", "ข่าวใหม่ถูกเพิ่มแล้ว");
        } else {
            return new ModelAndView("addNews", "error", "เกิดข้อผิดพลาดในการเพิ่มข่าว");
        }
    }
    
    //อ่านข่าว
    @RequestMapping(value = "/viewNews", method = RequestMethod.GET)
    public ModelAndView viewNews(@RequestParam("newsId") int newsId) {
        NewsManager nm = new NewsManager();
        News news = nm.getNewsById(newsId); 
        
        if (news != null) {
            return new ModelAndView("viewNews", "news", news); 
        } else {
            return new ModelAndView("newsPage", "message", "ไม่พบข้อมูลข่าวที่คุณเลือก");
        }
    }

    //ลบข่าว
    @RequestMapping(value = "/delNews", method = RequestMethod.GET)
    public ModelAndView loadDeleteNews(@RequestParam("newsId") int newsId, HttpSession session) {
        NewsManager nm = new NewsManager();
        User loggedInUser = (User) session.getAttribute("loggedInUser");

        
        if (loggedInUser == null) {
            return new ModelAndView("login", "error", "กรุณาเข้าสู่ระบบก่อน");
        }

        
        News news = nm.getNewsById(newsId);
        boolean result = false;
        if (news != null) {
            result = nm.deleteNews(news);
        }

        
        List<News> listNew = nm.getAllNews(); 
        ModelAndView mav = new ModelAndView("redirect:/newsPage");
        mav.addObject("listNew", listNew); 

        
        if (!result) {
            mav.addObject("error_msg", "เกิดข้อผิดพลาดในการลบข่าว กรุณาลองใหม่อีกครั้ง");
        } else if (listNew.isEmpty()) {
            mav.addObject("error_msg", "ยังไม่มีข่าว");
        }

        return mav;
    }
    
    //ค้นหาข่าว
    @RequestMapping(value = "/searchNews", method = RequestMethod.POST)
    public ModelAndView searchNews(HttpServletRequest request) {
        String keyword = request.getParameter("keyword");
        NewsManager pm = new NewsManager();
        
        List<News> searchResult = pm.searchNews(keyword);
        List<News> newss = pm.getAllNews(); 
        
        ModelAndView mav = new ModelAndView("news");
        mav.addObject("listNew", searchResult);  
        mav.addObject("keyword", keyword);
        mav.addObject("newss", newss);

        if (searchResult.isEmpty()) {
            mav.addObject("error_msg", "ไม่พบข่าวสำหรับคำค้นหา: " + keyword);
        }

        return mav;
    }

    @RequestMapping(value = "/contact", method = RequestMethod.GET)
    public ModelAndView showContactPage() {
        return new ModelAndView("contact");
    }

 // ประมวลผลการส่งข้อความจากแบบฟอร์มติดต่อ
    @RequestMapping(value = "/sendContact", method = RequestMethod.POST)
    public ModelAndView processContactForm(
            @RequestParam("name") String name,
            @RequestParam("email") String email,
            @RequestParam("message") String message) {
        
        // บันทึกข้อมูลลงในฐานข้อมูล
        ContactMessage contactMessage = new ContactMessage();
        contactMessage.setName(name);
        contactMessage.setEmail(email);
        contactMessage.setMessage(message);
        contactMessage.setDate(new SimpleDateFormat("dd/MM/yyyy HH:mm").format(new Date()));

        ContactMessageManager contactManager = new ContactMessageManager();
        contactManager.saveContactMessage(contactMessage);

        ModelAndView mav = new ModelAndView("contact");
        mav.addObject("success", "ข้อความของคุณถูกส่งเรียบร้อยแล้ว!");
        return mav;
    }

    @RequestMapping(value = "/viewMessages", method = RequestMethod.GET)
    public ModelAndView viewMessages(HttpSession session) {
        User loggedInUser = (User) session.getAttribute("loggedInUser");

        if (loggedInUser == null || !loggedInUser.getEmail().equals("Chanakan@gmail.com")) {
            return new ModelAndView("redirect:/login").addObject("error", "คุณไม่มีสิทธิ์เข้าถึงหน้านี้");
        }

        ContactMessageManager contactManager = new ContactMessageManager();
        List<ContactMessage> messages = contactManager.getAllMessages();

        ModelAndView mav = new ModelAndView("viewMessages");
        mav.addObject("messages", messages);
        return mav;
    }

    
}