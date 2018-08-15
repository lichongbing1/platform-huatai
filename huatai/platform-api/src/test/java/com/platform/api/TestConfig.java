package com.platform.api;

import java.util.HashMap;
import java.util.Map;

/**
 * @author zhouzhengde(CN)
 * @date 2018/1/11.
 */
public class TestConfig {
    public static String token = "99uju1lmc0h8usiohofzsn9wn5zc2bs5";
    public static Map<String, Object> headerMap = new HashMap();

    static {
        headerMap.put("X-Nideshop-Token", token);
    }
}
