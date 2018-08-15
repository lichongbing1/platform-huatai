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
 * ApiGoodsGroupOpenController Tester.
 *
 * @author Harmon
 * @version 1.0
 * @since <pre>${YEAR}-${MONTH}-${DAY} ${HOUR}:${MINUTE}</pre>
 */
public class ApiGoodsGroupOpenControllerTest {

    @Before
    public void before() throws Exception {
    }

    @After
    public void after() throws Exception {
    }

    /**
     * Method: list(Integer type, Integer groupId)
     */
    @Test
    public void testList() throws Exception {
        BasicConfigurator.configure();
        String url = "http://localhost:8060/api/groupopen/list.w";
        Map<String, Object> object = new HashMap();
        object.put("groupId",313);
        String result = HttpUtil.URLPost(url, object, "UFT-8");
        JSONObject rp = JSONObject.parseObject(result);
        System.out.println(rp);
    }

    /**
     * Method: myList(@LoginUser UserVo loginUser, @RequestParam(value = "page", defaultValue = "1") Integer page, @RequestParam(value = "size", defaultValue = "10") Integer size, Integer type, Integer groupId)
     */
    @Test
    public void testMyList() throws Exception {
//TODO: Test goes here... 
    }

    /**
     * Method: info(Long id, Long referrer)
     */
    @Test
    public void testInfo() throws Exception {
//TODO: Test goes here... 
    }

    /**
     * Method: openGroup()
     */
    @Test
    public void testOpenGroup() throws Exception {
//TODO: Test goes here... 
    }

    /**
     * Method: attendGroup()
     */
    @Test
    public void testAttendGroup() throws Exception {
//TODO: Test goes here... 
    }


} 
