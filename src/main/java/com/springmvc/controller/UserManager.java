package com.springmvc.controller;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.springmvc.model.*;

public class UserManager {
	private SessionFactory sessionFactory = HibernateConnection.doHibernateConnection();
	public List<User> getAllUser() {
		List<User> list = null;
		try {
			Session session = sessionFactory.openSession();
			session.beginTransaction();
			list = session.createQuery("From User").list();
			session.close();
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		return list;
	}
	
	public boolean saveUser(User user) {
        try (Session session = sessionFactory.openSession()) {
            session.beginTransaction();
            session.save(user);
            session.getTransaction().commit();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    // ตรวจสอบข้อมูลการเข้าสู่ระบบ
	public static String validateLogin(String email, String password) {
	    Session session = HibernateConnection.doHibernateConnection().openSession();
	    try {
	        User user = session.get(User.class, email);
	        if (user == null) {
	            return "ไม่พบอีเมลนี้ในระบบ";
	        } else if (!user.getPassword().equals(password)) {
	            return "รหัสผ่านไม่ถูกต้อง";
	        } else {
	            return "success";
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	        return "เกิดข้อผิดพลาดในระบบ";
	    } finally {
	        session.close();
	    }
	}

    // ดึงข้อมูลผู้ใช้จากอีเมล
    public User getRegisterByEmail(String email) {
        try (Session session = sessionFactory.openSession()) {
            return session.get(User.class, email);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
    
   
    
    public boolean updateUser(User user) {
        try (Session session = sessionFactory.openSession()) {
            session.beginTransaction();
            session.update(user);
            session.getTransaction().commit();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
    
    public boolean deleteUser(User u) {
        try (Session session = sessionFactory.openSession()) {
            session.beginTransaction();
            session.delete(u);
            session.getTransaction().commit();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

	
}
