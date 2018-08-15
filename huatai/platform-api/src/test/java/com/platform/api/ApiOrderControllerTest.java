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
 * ApiOrderController Tester.
 *
 * @author Harmon
 * @version 1.0
 * @since <pre>${YEAR}-${MONTH}-${DAY} ${HOUR}:${MINUTE}</pre>
 */
public class ApiOrderControllerTest {

    @Before
    public void before() throws Exception {
    }

    @After
    public void after() throws Exception {
    }

    /**
     * Method: index(@LoginUser UserVo loginUser)
     */
    @Test
    public void testIndex() throws Exception {
//TODO: Test goes here... 
    }

    /**
     * Method: list(@LoginUser UserVo loginUser, @RequestParam(value = "page", defaultValue = "1") Integer page, @RequestParam(value = "size", defaultValue = "10") Integer size, Integer evaluate_status, Integer order_status)
     */
    @Test
    public void testList() throws Exception {
//TODO: Test goes here... 
    }

    /**
     * Method: detail(@LoginUser UserVo loginUser, Long orderId)
     */
    @Test
    public void testDetail() throws Exception {
//TODO: Test goes here... 
    }

    /**
     * Method: submit(@LoginUser UserVo loginUser)
     */
    @Test
    public void testSubmit() throws Exception {
//TODO: Test goes here... 
    }

    /**
     * Method: cancelOrder(@LoginUser UserVo loginUser, Long orderId)
     */
    @Test
    public void testCancelOrder() throws Exception {
//TODO: Test goes here... 
    }

    /**
     * Method: confirmOrder(@LoginUser UserVo loginUser, Long orderId)
     */
    @Test
    public void testConfirmOrder() throws Exception {
        BasicConfigurator.configure();
        String url = "http://localhost:8060/api/order/confirmOrder.w";
        Map<String, Object> object = new HashMap();
        object.put("orderId", 29);
        String enc = "UTF-8";
        String result = HttpUtil.URLPost(url, TestConfig.headerMap, object, enc);
        JSONObject rp = JSONObject.parseObject(result);
        System.out.println(rp);
    }


} 
