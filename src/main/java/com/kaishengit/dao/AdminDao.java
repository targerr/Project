package com.kaishengit.dao;

import com.kaishengit.entity.Admin;
import com.kaishengit.util.DbHelp;
import org.apache.commons.dbutils.handlers.BeanHandler;


public class AdminDao {


    public Admin findAdminByName(String adminName) {
        String sql = "select * from admin where adminname = ? ";
        return DbHelp.query(sql,new BeanHandler<Admin>(Admin.class),adminName);
    }
}
