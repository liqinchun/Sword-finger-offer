package com.example.algorithm.algorithm.data.structure;

/**
 * 实现一个顺序表
 */

public class SequenceTable {
    static final int MAXLEN = 100;


    public SequenceTable(){

    }


    class Data {
        String name;
        String key;

    }

    class SLType {
        Data[] listData = new Data[MAXLEN+1];
        int listLen;
    }

    /**
     *
     * 初始化顺序表
     * @param sl
     */
    public void slInit(SLType sl) {
        sl.listLen = 0;

    }

    /**
     *
     * 获取顺序表当前的长度
     */
    public int getSlLength(SLType sl){
        return sl.listLen;
    }

    /**
     * 插入节点
     * @param sl
     * @param data
     * @return
     */
    public int slInsert(SLType sl,int n, Data data){
        if(sl.listLen>=MAXLEN) {
            System.out.println("顺序表以及满了，不能插入节点");
            return 0;
        }

        if (n<1 || n>sl.listLen -1) {
            System.out.println("插入的节点序号不对");
            return 0;
        }

        for (int i = sl.listLen;i>=n;i++) {
            sl.listData[i+1] = sl.listData[i];

        }
        sl.listData[n] = data;
        sl.listLen++;
        return 1;
    }






    public static void main(String args[]){

    }



}




