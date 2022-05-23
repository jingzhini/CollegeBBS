package com.example.demo2.controller;

import com.example.demo2.entity.Topic;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;


public class ListController {
    private List<Topic> bigList;    //大集合，存储所有集合
    private List<Topic> smallList;  //小集合，作为方法的返回值
    private int currentPage;    //初始化当前页码
    private int perPage;  //初始化每页显示行数
    private int allPage;    //总页数
    private int recordCount;    //初始化总记录行数

    //get及set方法
    public List<Topic> getBigList() {
        return bigList;
    }

    public void setBigList(List<Topic> bigList) {
        this.bigList = bigList;
    }

    public List<Topic> getSmallList() {
        return smallList;
    }

    public void setSmallList(List<Topic> smallList) {
        this.smallList = smallList;
    }

    public int getCurrentPage() {
        return currentPage;
    }

    public void setCurrentPage(int currentPage) {
        this.currentPage = currentPage;
    }

    public int getPerPage() {
        return perPage;
    }

    public void setPerPage(int perPage) {
        this.perPage = perPage;
    }

    public int getAllPage() {
        return allPage;
    }

    public void setAllPage(int allPage) {
        this.allPage = allPage;
    }

    public int getRecordCount() {
        return recordCount;
    }

    public void setRecordCount(int recordCount) {
        this.recordCount = recordCount;
    }

    //calculateAllPage方法：计算总页数
    public int calculateAllPage(){

        //总行数可以被每页行数整除
        int line=recordCount/perPage;
        //判断行数是否多于要求的每页行数
        if (recordCount<perPage){
            allPage=1;
        }else {
            allPage=recordCount%perPage>0?(line+1):line;
        }

        return allPage;
    }

    //select方法：将大集合分成小集合
    /*public List<Topic> select(){
        //通过当前页码，每页行数，分割大集合
        int pointer=(currentPage-1)*perPage;
        //开始分割
        for (int i=pointer;i<(pointer+perPage);i++){
            smallList.add(bigList.get(i));
        }

        return smallList;
    }*/
    /*public List<Topic> select(List<Topic> bigList){
        //通过当前页码，每页行数，分割大集合
        int pointer=(currentPage-1)*perPage;
        System.out.println(currentPage+"\n"+perPage+"\n"+pointer);
        //开始分割
        *//*for (int i=pointer;i<(pointer+perPage);i++){
            System.out.println(pointer+perPage);
            System.out.println(bigList.get(i));
            smallList.add(bigList.get(i));

        }*//*
        smallList.set(3, bigList.get(0));
        System.out.println(smallList);
//        smallList.add(bigList.get(0));
       *//* smallList.add(bigList.get(1));
        System.out.println(smallList);
        smallList.add(bigList.get(2));
        System.out.println(smallList);*//*
        return smallList;
    }*/

    //方法：上一页
    /*public List<Topic> previousPage(){
        if (currentPage<allPage){
            currentPage++;
        }
        return select();
    }*/

    //方法：下一页
    /*public List<Topic> nextPage(){
        if (currentPage<allPage){
            currentPage--;
        }
        return select();
    }*/

//    @RequestMapping("/sel")
}
