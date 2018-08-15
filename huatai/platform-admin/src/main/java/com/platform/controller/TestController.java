/*
 * 创建时间：2017-09-11 17:19
 * 项目名称:platform
 * 类名称:TestController.java
 * 包名称:com.platform.controller
 *
 * 修改履历:
 *          日期              修正者        主要内容
 *                                      
 *
 * Copyright (c) 2016-2017 兆尹科技
 */
package com.platform.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 名称：TestController <br>
 * 描述：测试<br>
 *
 * @author 李鹏军
 * @version 1.0
 * @since 1.0.0
 */
@Controller
@RequestMapping("test")
public class TestController {
    @RequestMapping("/toTest")
    public String tojsp() {
        return "test";
    }
}
