package com.springmvc.controller;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.springmvc.model.ContactMessage;
import com.springmvc.model.HibernateConnection;

import java.util.List;

public class ContactMessageManager {
    private SessionFactory sessionFactory = HibernateConnection.doHibernateConnection();

    public boolean saveContactMessage(ContactMessage contactMessage) {
        Transaction transaction = null;
        try (Session session = sessionFactory.openSession()) {
            transaction = session.beginTransaction();
            session.save(contactMessage);
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

    public List<ContactMessage> getAllMessages() {
        try (Session session = sessionFactory.openSession()) {
            return session.createQuery("FROM ContactMessage", ContactMessage.class).list();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
    
}
