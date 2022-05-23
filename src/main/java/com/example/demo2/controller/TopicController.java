package com.example.demo2.controller;

import com.example.demo2.dao.TopicDao;
import com.example.demo2.dao.UserDao;
import com.example.demo2.entity.MultipleList;
import com.example.demo2.entity.Topic;
import com.example.demo2.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
public class TopicController {
    private TopicDao topicDao;
    private UserDao userDao;
    //实例化一个新对象
    MultipleList mulList=new MultipleList();
    //取值：
    /*List<Topic> bL= mulList.getBigList();
    List<Topic> sL= mulList.getSmallList();
    int cP= mulList.getCurrentPage();
    int pP= mulList.getPerPage();
    int aP= mulList.getAllPage();
    int rC= mulList.getRecordCount();*/

    @Autowired
    public void setTopicDao(TopicDao topicDao,UserDao userDao) {
        this.topicDao = topicDao;
        this.userDao=userDao;
    }

    //查询topic所有数据
    @RequestMapping("/selTopicAll")
    public ModelAndView TopicAll(){
        List<Topic> allList=topicDao.selTopicAll();
        mulList.setBigList(allList);    //bigList初始化

        mulList.setCurrentPage(1);  //初始化当前页码
        mulList.setPerPage(3);  //初始化每页显示行数

        int aL=allList.size();
        mulList.setRecordCount(aL); //初始化总记录行数

        int aP=calculateAllPage();
        mulList.setAllPage(aP); //总页数

        List<Topic> list=select();

        ModelAndView mv=new ModelAndView();
        mv.addObject("list",list);
        mv.addObject("allPage",aP);
        mv.addObject("cP",mulList.getCurrentPage());
        mv.setViewName("postList");
        return mv;
    }

    //calculateAllPage方法：计算总页数
    public int calculateAllPage() {
        int rC= mulList.getRecordCount();
        int pP= mulList.getPerPage();
        int allPage;
        //总行数可以被每页行数整除
        int line=rC/pP;
        //判断行数是否多于要求的每页行数
        if (rC<=pP){
            allPage=1;
        }else {
            allPage=rC%pP>0?(line+1):line;
        }
        return allPage;
    }

    //select方法：将大集合分成小集合
    public List<Topic> select() {
        List<Topic> bL= mulList.getBigList();
        int cP= mulList.getCurrentPage();
        int pP= mulList.getPerPage();

        List<Topic> smallList = new ArrayList<>();
        //通过当前页码，每页行数，分割大集合
        int pointer=(cP-1)*pP;
        //开始分割
        for (int i=pointer;i<(pointer+pP);i++){
            if (i<mulList.getBigList().size()){
                smallList.add(bL.get(i));
            }
        }
        return smallList;
    }

    //方法：上一页
    public int previousPage(int currentPage) {
        if (currentPage>1){
            currentPage--;
            mulList.setCurrentPage(currentPage);
        }
        return currentPage;
    }

    //方法：下一页
    public int nextPage(int currentPage) {
        if (currentPage<mulList.getAllPage()){
            currentPage++;
            mulList.setCurrentPage(currentPage);
        }
        return currentPage;
    }

    //表格分页功能：下一页
    @RequestMapping("/nextList")
    public ModelAndView nextList(){
        nextPage(mulList.getCurrentPage());
        List<Topic> list=select();

        ModelAndView mv=new ModelAndView();
        mv.addObject("list",list);
        mv.addObject("allPage",mulList.getAllPage());
        mv.addObject("cP",mulList.getCurrentPage());
        mv.setViewName("postList");
        return mv;
    }

    //表格分页功能：上一页
    @RequestMapping("/previousList")
    public ModelAndView previousList(){
        previousPage(mulList.getCurrentPage());
        List<Topic> list=select();

        ModelAndView mv=new ModelAndView();
        mv.addObject("list",list);
        mv.addObject("allPage",mulList.getAllPage());
        mv.addObject("cP",mulList.getCurrentPage());
        mv.setViewName("postList");
        return mv;
    }

    //表格分页功能：最后一页
    @RequestMapping("/lastList")
    public ModelAndView lastList(){
        int lastPage=mulList.getAllPage();
        mulList.setCurrentPage(lastPage);
        List<Topic> list=select();

        ModelAndView mv=new ModelAndView();
        mv.addObject("list",list);
        mv.addObject("allPage",mulList.getAllPage());
        mv.addObject("cP",mulList.getCurrentPage());
        mv.setViewName("postList");
        return mv;
    }

    //
    @RequestMapping("/navigationList")
    public ModelAndView naviList(HttpServletRequest request){
        String str=request.getParameter("naviPage");
        int naviPage= Integer.parseInt(str);
        mulList.setCurrentPage(naviPage);
        List<Topic> list=select();

        ModelAndView mv=new ModelAndView();
        mv.addObject("list",list);
        mv.addObject("allPage",mulList.getAllPage());
        mv.addObject("cP",mulList.getCurrentPage());
        mv.setViewName("postList");
        return mv;
    }

    //插入发表的文章
    @RequestMapping("/addTopic")
    public ModelAndView addTopic(Topic topic, HttpServletRequest request){
        //单独为modify Time传当前系统时间值
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
        // new Date()为获取当前系统时间
        topic.setModifyTime(Timestamp.valueOf(df.format(new Date())));
        //获取boardId及uId，并传值
        String uName=request.getParameter("name");
        try {
            int boardId= Integer.parseInt(request.getParameter("boardId"));
            System.out.println(boardId);
            topic.setBoardId(boardId);
        }catch (NumberFormatException e){
            e.printStackTrace();
        }


        User user=userDao.selOne(uName);
        int uId=user.getuId();
        topic.setuId(uId);

        ModelAndView mv=new ModelAndView();

        int i=topicDao.addTopic(topic);
        if (i>0){
            List<Topic> list=topicDao.selTopicAll();

            mv.addObject("list",list);
            mv.setViewName("postList");
            return mv;
        }else {
            mv.setViewName("editPost");
            return mv;
        }
    }

    //跳转到帖子详情界面
    @RequestMapping("/selView")
    public ModelAndView selView(){
        int topicId= 1;
        Topic topicView=topicDao.selView(topicId);

        ModelAndView mv=new ModelAndView();
        mv.addObject("topicView",topicView);
        mv.addObject("topicId",topicId);
        mv.setViewName("postView");
        return mv;
    }

}
