package com.example.algorithm.algorithm;

public class PrintAscii {


    public void dispAsicii(char ch){
        String a = "aa";
        for (char s : a.toCharArray()){
            System.out.println((int)s);
        }

        int iTemp = (int)ch;
        System.out.println(iTemp);
    }
    public static void main(String args[]) {
    PrintAscii printAscii = new PrintAscii();
    printAscii.dispAsicii('A');

    }
}
