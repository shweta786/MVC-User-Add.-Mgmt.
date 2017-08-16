/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mvc.bean;

import java.util.ArrayList;

public class UserBean {

    private String mailPhone;
    private String password;
    private String dob;
    private String gender;
    private String name;
    private String phone;
    private int status;
    private int user_id;
    private ArrayList<Address> al;
    private int interest[];

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }
    public int[] getInterest() {
        return interest;
    }

    public void setInterest(int[] interest) {
        this.interest = interest;
    }

    public ArrayList<Address> getAl() {
        return al;
    }

    public void setAl(ArrayList<Address> al) {
        this.al = al;
    }
    
    public String getDob() {
        return dob;
    }

    public void setDob(String dob) {
        this.dob = dob;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getMailPhone() {
        return this.mailPhone;
    }

    public void setMailPhone(String mail) {
        this.mailPhone = mail;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public boolean validate() {
        if (mailPhone.equals("admin@admin.com") && password.equals("imadmin")) {
            return true;
        } else {
            return false;
        }
    }
}
