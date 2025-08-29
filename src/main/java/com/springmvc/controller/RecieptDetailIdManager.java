package com.springmvc.controller;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.springmvc.model.HibernateConnection;
import com.springmvc.model.*;

public class RecieptDetailIdManager {
	private SessionFactory sessionFactory = HibernateConnection.doHibernateConnection();
	public List<RecieptDetailId> getAllRecieptDetailId() {
		List<RecieptDetailId> list = null;
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
}
