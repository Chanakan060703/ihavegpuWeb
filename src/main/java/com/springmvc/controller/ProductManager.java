package com.springmvc.controller;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;



import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import com.springmvc.model.*;

public class ProductManager {
	private SessionFactory sessionFactory = HibernateConnection.doHibernateConnection();
	// ดึงข้อมูลสินค้าทั้งหมด
    public List<Product> getAllProduct() {
        List<Product> list = null;
        try {
            Session session = sessionFactory.openSession();
            session.beginTransaction();
            list = session.createQuery("FROM Product").list(); 
            session.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return list;
    }

	//ค้นหาสินค้า
    public List<Product> searchProduct(String keyword) {
        List<Product> list = new ArrayList<>();
        try (Session session = sessionFactory.openSession()) {
            String hql = "FROM Product WHERE product_name LIKE :keyword";
            list = session.createQuery(hql, Product.class)
                          .setParameter("keyword", "%" + keyword + "%")
                          .list();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return list;
    }


	
	//เพิ่มสินค้า
    public boolean addProduct(Product product) {
        Transaction transaction = null;
        try (Session session = sessionFactory.openSession()) {
            transaction = session.beginTransaction();
            session.save(product);
            transaction.commit();
            return true;
        } catch (Exception e) {
            if (transaction != null) transaction.rollback();
            e.printStackTrace();
            return false;
        }
    }

	

	public Product getProductById(int product_id) {
        try (Session session = sessionFactory.openSession()) {
            return session.get(Product.class, product_id);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }


	public Type getTypeById(int typeId) {
        try (Session session = sessionFactory.openSession()) {
            return session.get(Type.class, typeId);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }


	public List<Type> getAllProductTypes() {
        try (Session session = sessionFactory.openSession()) {
            return session.createQuery("FROM Type", Type.class).list();
        }
    }
	
	//อัพเดทสินค้า
	public boolean updateProduct(Product product) {
	    try (Session session = sessionFactory.openSession()) {
	        session.beginTransaction();
	        session.update(product);
	        session.getTransaction().commit();
	        return true;
	    } catch (Exception e) {
	        e.printStackTrace();
	        return false;
	    }
	}

	//เลือกสินค้าตามประเภท
	public List<Product> getProductsByCategory(int typeId) {
	    if (typeId == -1) {
	        return getAllProduct(); 
	    }
	    
	    try (Session session = sessionFactory.openSession()) {
	        Query<Product> query = session.createQuery("FROM Product WHERE type_id.type_id = :typeId", Product.class);
	        query.setParameter("typeId", typeId);
	        return query.list();
	    } catch (Exception e) {
	        e.printStackTrace();
	        return Collections.emptyList();
	    }
	}
	
	//ลบสินค้า
	public boolean deleteProduct(int productId) {
        Transaction transaction = null;
        try (Session session = sessionFactory.openSession()) {
            transaction = session.beginTransaction();
            Product product = session.get(Product.class, productId);
            if (product != null) {
                session.delete(product);
                transaction.commit();
                return true;
            }
        } catch (Exception e) {
            if (transaction != null) transaction.rollback();
            e.printStackTrace();
        }
        return false;
    }
}
