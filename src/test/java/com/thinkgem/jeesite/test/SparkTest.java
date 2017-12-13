package com.thinkgem.jeesite.test;

import java.util.Arrays;
import java.util.List;

public class SparkTest {

    public static void main(String[] args){

        SparkTest st = new SparkTest();
        int a  = 2147483647;
        st.test1(a);
    }

    private void test1(int b) {

        System.out.println("It is a test.");
        System.out.println(b);
        superForeachTestArray();
        foreachTestArray();
        superForeachTestIterator();


    }

    public static void superForeachTestArray(){
        String[] args =new String[]{"1","2"};
        for(String s:args) {
            System.out.println(s);
        }
    }

    public static void foreachTestArray(){
        String[] args =new String[]{"1","2"};
        String[] args2 = args;
        int len = args.length;
        for(int i = 0; i < len; ++i) {
            String s= args2[i];
            System.out.println(s);
        }
    }

    public static void superForeachTestIterator(){
        List<String> list = Arrays.asList(new String[]{"1","2"});
        for(String s:list) {
            System.out.println(s);
        }

        for (String ss:list
             ) {
            System.out.println(ss + "w");
        }
    }

}
