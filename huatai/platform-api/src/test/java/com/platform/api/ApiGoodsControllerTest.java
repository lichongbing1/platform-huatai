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
 * ApiGoodsController Tester.
 *
 * @author Harmon
 * @version 1.0
 * @since <pre>${YEAR}-${MONTH}-${DAY} ${HOUR}:${MINUTE}</pre>
 */
public class ApiGoodsControllerTest {

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
     * Method: sku(@LoginUser UserVo loginUser, Integer id)
     */
    @Test
    public void testSku() throws Exception {
//TODO: Test goes here... 
    }

    /**
     * Method: detail(Integer id, Long referrer)
     */
    @Test
    public void testDetail() throws Exception {
        BasicConfigurator.configure();
        String url = "http://localhost:8060/api/goods/detail.w";
        Map<String, Object> object = new HashMap();
        object.put("id", 1151013);
        object.put("referrer", 15);
        String result = HttpUtil.URLPost(url, object, "UFT-8");
        JSONObject rp = JSONObject.parseObject(result);
        System.out.println(rp);
    }

    /**
     * Method: category(@LoginUser UserVo loginUser, Integer id)
     */
    @Test
    public void testCategory() throws Exception {
//TODO: Test goes here... 
    }

    /**
     * Method: list(@LoginUser UserVo loginUser, Integer categoryId, Integer brandId, String keyword, Integer isNew, Integer isHot, @RequestParam(value = "page", defaultValue = "1") Integer page, @RequestParam(value = "size", defaultValue = "10") Integer size, String sort, String order)
     */
    @Test
    public void testList() throws Exception {
//TODO: Test goes here... 
    }

    /**
     * Method: filter(@LoginUser UserVo loginUser, Integer categoryId, String keyword, Integer isNew, Integer isHot)
     */
    @Test
    public void testFilter() throws Exception {
//TODO: Test goes here... 
    }

    /**
     * Method: newAction(@LoginUser UserVo loginUser)
     */
    @Test
    public void testNewAction() throws Exception {
//TODO: Test goes here... 
    }

    /**
     * Method: hot(@LoginUser UserVo loginUser)
     */
    @Test
    public void testHot() throws Exception {
//TODO: Test goes here... 
    }

    /**
     * Method: related(@LoginUser UserVo loginUser, Integer id)
     */
    @Test
    public void testRelated() throws Exception {
//TODO: Test goes here... 
    }

    /**
     * Method: count(@LoginUser UserVo loginUser)
     */
    @Test
    public void testCount() throws Exception {
//TODO: Test goes here... 
    }


} 
