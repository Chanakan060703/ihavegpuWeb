package com.springmvc.controller;

import java.util.Collections;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import com.springmvc.model.CartItem;
import com.springmvc.model.HibernateConnection;
import com.springmvc.model.SavedSpecGroup;
import com.springmvc.model.User;

public class SavedSpecGroupManager {
    private SessionFactory sessionFactory = HibernateConnection.doHibernateConnection();

    // เพิ่มสเปคที่บันทึกพร้อมรายการ CartItem
    public boolean saveSavedSpecGroup(SavedSpecGroup savedSpecGroup) {
        Transaction transaction = null;
        try (Session session = sessionFactory.openSession()) {
            transaction = session.beginTransaction();
            session.save(savedSpecGroup); // บันทึก SavedSpecGroup และบันทึก CartItem ทั้งหมดอัตโนมัติ (Cascade)
            transaction.commit();
            return true;
        } catch (Exception e) {
            if (transaction != null) transaction.rollback();
            e.printStackTrace();
            return false;
        }
    }

    // ดึง SavedSpecGroup ทั้งหมดสำหรับผู้ใช้ตาม email
    public List<SavedSpecGroup> getSavedSpecGroupsByUser(String email) {
        Session session = null;
        Transaction transaction = null;
        List<SavedSpecGroup> savedSpecGroups = null;

        try {
            session = sessionFactory.openSession();
            transaction = session.beginTransaction();

            String hql = "FROM SavedSpecGroup WHERE user.email = :email";
            Query<SavedSpecGroup> query = session.createQuery(hql, SavedSpecGroup.class);
            query.setParameter("email", email);

            savedSpecGroups = query.getResultList();

            for (SavedSpecGroup specGroup : savedSpecGroups) {
                specGroup.getCartItems().size(); 
            }

            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        } finally {
            if (session != null) {
                session.close();
            }
        }

        return savedSpecGroups;
    }

    // ดึงข้อมูล SavedSpecGroup ตาม ID
    public SavedSpecGroup getSavedSpecGroupById(int groupId) {
        try (Session session = sessionFactory.openSession()) {
            return session.get(SavedSpecGroup.class, groupId);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    // อัปเดต SavedSpecGroup
    public boolean updateSavedSpecGroup(SavedSpecGroup savedSpecGroup) {
        Transaction transaction = null;
        try (Session session = sessionFactory.openSession()) {
            transaction = session.beginTransaction();
            session.update(savedSpecGroup);
            transaction.commit();
            return true;
        } catch (Exception e) {
            if (transaction != null) transaction.rollback();
            e.printStackTrace();
            return false;
        }
    }

    // ลบ SavedSpecGroup ตาม ID และลบ CartItem ที่เกี่ยวข้อง
    public boolean deleteSavedSpecGroup(int groupId) {
        Transaction transaction = null;
        try (Session session = sessionFactory.openSession()) {
            transaction = session.beginTransaction();
            SavedSpecGroup specGroup = session.get(SavedSpecGroup.class, groupId);
            if (specGroup != null) {
                session.delete(specGroup);
                transaction.commit();
                return true;
            }
        } catch (Exception e) {
            if (transaction != null) transaction.rollback();
            e.printStackTrace();
        }
        return false;
    }
    
    // บันทึก CartItem แยก
    public boolean saveCartItem(CartItem cartItem) {
        Transaction transaction = null;
        try (Session session = sessionFactory.openSession()) {
            transaction = session.beginTransaction();
            session.save(cartItem);
            transaction.commit();
            return true;
        } catch (Exception e) {
            if (transaction != null) transaction.rollback();
            e.printStackTrace();
            return false;
        }
    }

    // ดึง CartItem ที่เกี่ยวข้องกับ SavedSpecGroup ตาม groupId
    public List<CartItem> getCartItemsByGroupId(int groupId) {
        try (Session session = sessionFactory.openSession()) {
            String hql = "FROM CartItem c WHERE c.savedSpecGroup.groupId = :groupId";
            Query<CartItem> query = session.createQuery(hql, CartItem.class);
            query.setParameter("groupId", groupId);
            return query.list();
        } catch (Exception e) {
            e.printStackTrace();
            return Collections.emptyList();
        }
    }
    
    public int getNextGroupId() {
        try (Session session = sessionFactory.openSession()) {
            Integer maxId = (Integer) session.createQuery("select max(s.groupId) from SavedSpecGroup s")
                                              .uniqueResult();
            return (maxId != null ? maxId + 1 : 1);
        } catch (Exception e) {
            e.printStackTrace();
            return 1; // เริ่มต้นที่ 1 ในกรณีไม่มีข้อมูลในฐานข้อมูล
        }
    }
    
    
}
