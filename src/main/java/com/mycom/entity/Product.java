/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycom.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Column;
import javax.persistence.ManyToOne;
@Entity
public class Product {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
   private int pId;
   private String pName;
   @Column(length=3000)
   private String pdesc;
   private String pPhoto;
   private int pPrice;
   private int pDisc;
   private int pQuantity;
   @ManyToOne
   private Category category;

    public Product() {
    }

    public Product(String pName, String pdesc, String pPhoto, int pPrice, int pDisc, int pQuantity,Category category) {
        this.pName = pName;
        this.pdesc = pdesc;
        this.pPhoto = pPhoto;
        this.pPrice = pPrice;
        this.pDisc = pDisc;
        this.pQuantity = pQuantity;
        this.category=category;
    }

    public int getpId() {
        return pId;
    }

    public void setpId(int pId) {
        this.pId = pId;
    }

    public String getpName() {
        return pName;
    }

    public void setpName(String pName) {
        this.pName = pName;
    }

    public String getPdesc() {
        return pdesc;
    }

    public void setPdesc(String pdesc) {
        this.pdesc = pdesc;
    }

    public String getpPhoto() {
        return pPhoto;
    }

    public void setpPhoto(String pPhoto) {
        this.pPhoto = pPhoto;
    }

    public int getpPrice() {
        return pPrice;
    }

    public void setpPrice(int pPrice) {
        this.pPrice = pPrice;
    }

    public int getpDisc() {
        return pDisc;
    }

    public void setpDisc(int pDisc) {
        this.pDisc = pDisc;
    }

    public int getpQuantity() {
        return pQuantity;
    }

    public void setpQuantity(int pQuantity) {
        this.pQuantity = pQuantity;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }
    
    

    @Override
    public String toString() {
        return "Product{" + "pId=" + pId + ", pName=" + pName + ", pdesc=" + pdesc + ", pPhoto=" + pPhoto + ", pPrice=" + pPrice + ", pDisc=" + pDisc + ", pQuantity=" + pQuantity + '}';
    }
//   calculate price after discount
    
   public int getPriceAfterDisc(){
       int d =(int)((this.getpDisc()/100.0)*this.getpPrice());
       return this.getpPrice() -d;
       
   } 
   
}
