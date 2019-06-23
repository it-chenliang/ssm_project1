package cn.allan.test;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Test {
    public static void main(String[] args) {
        Date date = new Date();
        System.out.println(date);
        SimpleDateFormat ft = new SimpleDateFormat ("yyyy-MM-dd");
        System.out.println(ft.format(date));
    }
}
