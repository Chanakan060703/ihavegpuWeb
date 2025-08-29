package com.springmvc.controller;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.springmvc.model.*;

public class TypeManager {
	private SessionFactory sessionFactory = HibernateConnection.doHibernateConnection();
	public List<Type> getAllType() {
		List<Type> list = null;
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
	
	public Type getTypeById(String type_id) {
        try (Session session = sessionFactory.openSession()) {
            return session.get(Type.class, type_id);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
	
	
}
