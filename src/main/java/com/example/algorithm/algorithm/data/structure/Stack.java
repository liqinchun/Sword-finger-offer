package com.example.algorithm.algorithm.data.structure;

public class Stack {
    StackStruct stackStruct = new StackStruct();
    int MAX_LENGTH = 100;
    class Data{
        String name;
    }

    class StackStruct{
        //顺序表
        Data[] data = new Data[100];
        //栈顶
        int top;
    }

    /**
     *
     * 栈的插入操作
     */
    public int posh(Data data){
        //判断栈是否满了
        if (stackStruct.top + 1 > MAX_LENGTH) {
            System.out.println("栈满了");
            return 0;
        }
        stackStruct.data[++ stackStruct.top] = data;
        return 1;
    }

    /**
     * 清空栈
     */
    public void STClear() {
        stackStruct.top = 0;
    }

    /**
     * 释放栈空间
     */
    public void STFree(){
        if (stackStruct != null) {
            stackStruct = null;
        }
    }

    public void InitStack(){
        stackStruct = new StackStruct();
        if (stackStruct !=null) {
            stackStruct.top = 0;
        }
    }


    /**
     * 判断是否是空栈
     */

//    public b
}
