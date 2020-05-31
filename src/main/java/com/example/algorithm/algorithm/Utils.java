package com.example.algorithm.algorithm;

import com.sun.org.apache.bcel.internal.generic.IF_ACMPEQ;

public class Utils {

     private String VALIDATESTR = "[]";
    /**
     *剑指offer之 字符串转数字，实现字符串转为int
     * 1.输入null字符串和空字符串，字符串的长度是否超过int类型长度
     * 2.输入的数为非数字
     * 3.正数和负数的处理，第一个数为-为负数、+为正、数字也为正
     * @param str
     * @return
     */
    public static int strToInt(String str){
        //校验字符串符合要求是0-9的数字

        if (str == null || str.length() == 0 || !isNumberStr(str)) {
            throw new RuntimeException("输入错误，不能转化为数字");
        }
        char [] cs = str.toCharArray();
        //开始转换
        char firstc = cs[0];

        int i = 0;
        if (firstc == '+' || firstc == '-') {
            i = 1;
        }
        int sum = 0;
        for (;i<cs.length;i++) {
            //将当前
            int c = cs[i] - '0';
            sum += c* Math.pow(10,cs.length -1 -i);
        }


        if (firstc == '-') {
            return 0 - sum;
        } else {
            return sum;
        }


    }

    public static boolean isNumberStr(String str){
        char cs[] = str.toCharArray();
        for (int i = 0 ;i<cs.length;i++) {
            if (i == 0 &&(cs[i] == '+'|| cs[i] == '-')) {
                continue;
            }
            if (cs[i] < '0' || cs[i]>'9') {
                return false;
            }
        }
        return true;

    }

    public static boolean isNumberStr(char c){
        return !(c >= '0' || c<'9');

    }
    public static int transCharToInt(char c){
        return c-'0';
    }


    public static void main(String[] args) {

//        System.out.println(Utils.isNumberStr('0'));
//        System.out.println(0-Utils.transCharToInt('4'));
        System.out.println(Math.pow(2,32));
        System.out.println(strToInt("-123"));



    }
}
