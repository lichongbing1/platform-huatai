package com.platform.api;

import com.alibaba.fastjson.JSONObject;
import com.platform.utils.HttpUtil;
import org.apache.log4j.BasicConfigurator;
import org.junit.Test;
import org.junit.Before;
import org.junit.After;

import java.util.HashMap;
import java.util.Map;

/**
 * ApiIndexController Tester.
 *
 * @author Harmon
 * @version 1.0
 * @since <pre>${YEAR}-${MONTH}-${DAY} ${HOUR}:${MINUTE}</pre>
 */
public class ApiIndexControllerTest {

    @Before
    public void before() throws Exception {
    }

    @After
    public void after() throws Exception {
    }

    /**
     * Method: index()
     */
    @Test
    public void testIndex() throws Exception {
        BasicConfigurator.configure();
        String url = "http://localhost:8060/api/index/index.w";
        Map<String, Object> object = new HashMap();
        String result = HttpUtil.URLPost(url, object, "UFT-8");
        JSONObject rp = JSONObject.parseObject(result);
        System.out.println(rp);
    }


} 
