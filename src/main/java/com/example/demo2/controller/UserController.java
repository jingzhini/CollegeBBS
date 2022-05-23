package com.example.demo2.controller;

import com.example.demo2.dao.UserDao;
import com.example.demo2.entity.Board;
import com.example.demo2.entity.Topic;
import com.example.demo2.entity.User;
import com.sun.xml.internal.fastinfoset.util.StringArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
public class UserController {

    private UserDao userDao;

    @Autowired
    public void setUserDao(UserDao userDao) {
        this.userDao = userDao;
    }

    //注册
    @RequestMapping("/addOne")
    public String addUser(User user){
        int i=userDao.addUser(user);
        if (i>0){
            return "login";
        }else {
            return "register";
        }
    }

    //登录
    @RequestMapping("/selOne")
    public ModelAndView login(HttpServletRequest request){
        String lName=request.getParameter("lName");
        String lPass=request.getParameter("lPass");
        User user=userDao.selOne(lName);
        String uPass=user.getuPass();

        ModelAndView mv=new ModelAndView();

        //如果登录失败，将login放入mav中；如果成功，返回页面jsp及用户名
        if (!lPass.equals(uPass)){
            mv.setViewName("login");
            return mv;
        }else {
            mv.addObject("name",lName);
            mv.setViewName("index");
            return mv;
        }
    }


}
