/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycom.DAO;

import org.hibernate.SessionFactory;
import com.mycom.entity.Category;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import java.util.List;

/**
 *
 * @author VAISHNAVI
 */
public class CategoryDao {
    private SessionFactory factory;
    
    public CategoryDao(SessionFactory factory){
        this.factory= factory;
        
    }
//    save db
    public int saveCategory(Category cat){
        Session openSession = this.factory.openSession();
        Transaction tx = openSession.beginTransaction();
        int catId = (int) openSession.save(cat);
         tx.commit();
        openSession.close();
        return catId;
        
    }
    
    public List<Category> getCategories(){
        Session s= this.factory.openSession();
        Query query =s.createQuery("from Category");
        List<Category> list=query.list();
        return list;
        
    }
    
    public Category getCategoryById(int cid)
    {
        Category cat=null;
        try{
            
            Session session =this.factory.openSession();
            cat = session.get(Category.class, cid);
            session.close();
            
        }catch(Exception e){
            e.printStackTrace();
        }
        return cat;
    }    
    
}
