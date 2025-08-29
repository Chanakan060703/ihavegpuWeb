package com.springmvc.controller;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.springmvc.model.*;

public class NewsManager {
	private SessionFactory sessionFactory = HibernateConnection.doHibernateConnection();
	public List<News> getAllNews() {
		List<News> list = null;
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
	
	public News getNewsById(int new_id) {
        try (Session session = sessionFactory.openSession()) {
            return session.get(News.class, new_id);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
	
	
	public boolean updateNews(News news) {
        try (Session session = sessionFactory.openSession()) {
            session.beginTransaction();
            session.update(news);
            session.getTransaction().commit();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
    
    public boolean deleteNews(News n) {
        try (Session session = sessionFactory.openSession()) {
            session.beginTransaction();
            session.delete(n);
            session.getTransaction().commit();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
    
    public boolean addNews(News news) {
        try (Session session = sessionFactory.openSession()) {
            session.beginTransaction();
            session.save(news);
            session.getTransaction().commit();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
    
    public List<News> searchNews(String keyword) {
        List<News> list = new ArrayList<>();
        try (Session session = sessionFactory.openSession()) {
            String hql = "FROM News WHERE new_name LIKE :keyword";
            list = session.createQuery(hql, News.class)
                          .setParameter("keyword", "%" + keyword + "%")
                          .list();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return list;
    }
}
