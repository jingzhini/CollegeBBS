package com.example.demo2.entity;

import java.util.List;

public class MultipleList {
    private List<Topic> bigList;    //大集合，存储所有集合
    private List<Topic> smallList;  //小集合，作为方法的返回值
    private int currentPage;    //初始化当前页码
    private int perPage;  //初始化每页显示行数
    private int allPage;    //总页数
    private int recordCount;    //初始化总记录行数

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
}
