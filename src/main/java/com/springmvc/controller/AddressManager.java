package com.springmvc.controller;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.springmvc.model.*;

public class AddressManager {
	private SessionFactory sessionFactory = HibernateConnection.doHibernateConnection();
	public List<Address> getAllAddress() {
		List<Address> list = null;
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
	
	public Address getAddressById(String address_id) {
        try (Session session = sessionFactory.openSession()) {
            return session.get(Address.class, address_id);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
	
	public void saveAddress(Address address) {
        Transaction transaction = null;
        try (Session session = sessionFactory.openSession()) {
            transaction = session.beginTransaction();
            session.save(address);  // บันทึกข้อมูลที่อยู่ลงในฐานข้อมูล
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) transaction.rollback();
            e.printStackTrace();
        }
    }
}
