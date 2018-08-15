/*
 * 创建时间：2017-08-19 08:55
 * 项目名称:platform
 * 类名称:Test.java
 * 包名称:com.platform
 *
 * 修改履历:
 *          日期              修正者        主要内容
 *                                      
 *
 * Copyright (c) 2016-2017 兆尹科技
 */
package com.platform;

/**
 * 名称：Test <br>
 * 描述：<br>
 *
 * @author 李鹏军
 * @version 1.0
 * @since 1.0.0
 */
public class Test {
    public static void main(String[] args) {
        //Integer使用equals判断
        Integer a = 127;
        Integer b = 127;
        System.out.println(a == b);
        Integer c = 129;
        Integer d = 129;
        System.out.println(c == d);

        System.out.println(c.equals(d));

    }
}
