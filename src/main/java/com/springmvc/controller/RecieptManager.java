package com.springmvc.controller;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import com.springmvc.model.*;

public class RecieptManager {
	private SessionFactory sessionFactory = HibernateConnection.doHibernateConnection();
	public List<Reciept> getAllReciept() {
		List<Reciept> list = null;
		try {
			Session session = sessionFactory.openSession();
			session.beginTransaction();
			list = session.createQuery("From News").list();
			session.close();
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		return list;
	}
	
	public Reciept getRecieptById(int receiptId) {
        try (Session session = sessionFactory.openSession()) {
            return session.get(Reciept.class, receiptId);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
	// บันทึกใบเสร็จลงในฐานข้อมูล
    public boolean createReciept(Reciept reciept) {
        Transaction transaction = null;
        try (Session session = sessionFactory.openSession()) {
            transaction = session.beginTransaction();
            session.save(reciept);  // บันทึกใบเสร็จหลัก
            transaction.commit();
            return true;
        } catch (Exception e) {
            if (transaction != null) transaction.rollback();
            e.printStackTrace();
            return false;
        }
    }

    // บันทึกรายละเอียดใบเสร็จ
    public boolean addRecieptDetail(RecieptDetail detail) {
        Transaction transaction = null;
        try (Session session = sessionFactory.openSession()) {
            transaction = session.beginTransaction();
            session.save(detail);  // บันทึกรายละเอียดแต่ละรายการของใบเสร็จ
            transaction.commit();
            return true;
        } catch (Exception e) {
            if (transaction != null) transaction.rollback();
            e.printStackTrace();
            return false;
        }
    }
    
    
    public List<Reciept> getOrderHistoryByEmail(String email) {
        List<Reciept> orderHistory = null;
        try (Session session = sessionFactory.openSession()) {
            Query<Reciept> query = session.createQuery("FROM Reciept WHERE email = :email", Reciept.class);
            query.setParameter("email", email);
            orderHistory = query.list();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return orderHistory;
    }

    
    public void saveAddress(Address address) {
        Transaction transaction = null;
        try (Session session = sessionFactory.openSession()) {
            transaction = session.beginTransaction();
            session.save(address);
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) transaction.rollback();
            e.printStackTrace();
        }
    }

    public boolean updateProduct(Product product) {
        Transaction transaction = null;
        try (Session session = sessionFactory.openSession()) {
            transaction = session.beginTransaction();
            session.update(product);  
            transaction.commit();
            return true;
        } catch (Exception e) {
            if (transaction != null) transaction.rollback();
            e.printStackTrace();
            return false;
        }
    }
    
    public boolean deleteRecieptById(int receiptId) {
        Transaction transaction = null;
        try (Session session = sessionFactory.openSession()) {
            transaction = session.beginTransaction();

            Reciept receipt = session.get(Reciept.class, receiptId);
            if (receipt != null) {
                Query<RecieptDetail> deleteDetailQuery = session.createQuery("DELETE FROM RecieptDetail WHERE id.reciept.reciept_id = :receiptId");
                deleteDetailQuery.setParameter("receiptId", receiptId);
                deleteDetailQuery.executeUpdate();

                session.delete(receipt);
            }
            
            transaction.commit();
            return true;
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
            return false;
        }
    }

    public void clearOrderHistoryByUser(String email) {
        Transaction transaction = null;
        try (Session session = sessionFactory.openSession()) {
            transaction = session.beginTransaction();
            
            Query<?> deleteDetailsQuery = session.createQuery("DELETE FROM RecieptDetail WHERE receipt.email = :email");
            deleteDetailsQuery.setParameter("email", email);
            deleteDetailsQuery.executeUpdate();

            Query<?> deleteRecieptsQuery = session.createQuery("DELETE FROM Reciept WHERE email = :email");
            deleteRecieptsQuery.setParameter("email", email);
            deleteRecieptsQuery.executeUpdate();
            
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) transaction.rollback();
            e.printStackTrace();
        }
    }


    public List<RecieptDetail> getRecieptDetailsByReceiptId(int receiptId) {
        List<RecieptDetail> details = null;
        try (Session session = sessionFactory.openSession()) {
            Query<RecieptDetail> query = session.createQuery("FROM RecieptDetail WHERE receipt.id = :receiptId", RecieptDetail.class);
            query.setParameter("receiptId", receiptId);
            details = query.list();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return details;
    }


}
