/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycom.helper;

import java.util.HashMap;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import java.util.Map;

/**
 *
 * @author VAISHNAVI
 */
public class helper1 {
    public static String get10words(String desc){
        String[] strs = desc.split(" ");
        if(strs.length>10){
            String res="";
            for(int i =0;i<10;i++)
            {
            res = res+strs[i];
            }
            return (res + "...");
        }else{
          return (desc + "...");  
        }
        
    }
    
    public static Map<String,Long> getCount(SessionFactory factory){
       Session session = factory.openSession();
       String q1 = "select count(*) from User";
       String q2 = "select count(*) from Product";
       
        Query query1= session.createQuery(q1);
        Query query2 = session.createQuery(q2);
      
     
      Long userCount = (Long)query1.list().get(0);
      Long productCount =(Long)query2.list().get(0);
       
       Map<String,Long> map = new HashMap<>();
       map.put("userCount", userCount);
       map.put("productCount", productCount);
       session.close();
       
       return map;
        
    }
    
}
