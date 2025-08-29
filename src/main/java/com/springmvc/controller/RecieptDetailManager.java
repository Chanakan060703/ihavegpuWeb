package com.springmvc.controller;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.springmvc.model.*;

public class RecieptDetailManager {
	private SessionFactory sessionFactory = HibernateConnection.doHibernateConnection();
	public List<RecieptDetail> getAllRecieptDetail() {
		List<RecieptDetail> list = null;
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
	public RecieptDetail getAddressById(String address_id) {
        try (Session session = sessionFactory.openSession()) {
            return session.get(RecieptDetail.class, address_id);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
}
