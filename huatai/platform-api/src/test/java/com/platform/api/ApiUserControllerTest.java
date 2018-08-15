package com.platform.api;

import com.alibaba.fastjson.JSONObject;
import com.platform.utils.HttpUtil;
import com.platform.utils.aes.BaseStr64;
import com.platform.utils.aes.Encrypt;
import org.apache.log4j.BasicConfigurator;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import java.util.HashMap;
import java.util.Map;

/**
 * ApiUserController Tester.
 *
 * @author <Authors name>
 * @version 1.0
 * @since <pre>一月 8, 2018</pre>
 */
public class ApiUserControllerTest {

    @Before
    public void before() throws Exception {
    }

    @After
    public void after() throws Exception {
    }

    /**
     * Method: login(@LoginUser UserVo userVo, String idCard, String email, String address)
     */
    @Test
    public void testLogin() throws Exception {
        BasicConfigurator.configure();
        String url = "http://localhost:8060/api/auth/login";
        Map<String, Object> object = new HashMap();

        object.put("userId", 29);
        String enc = "UTF-8";
        String result = HttpUtil.URLPostByJsonData(url, new HashMap(), object, enc);
        JSONObject rp = JSONObject.parseObject(result);
        System.out.println(rp);
    }


    /**
     * Method: info(String mobile)
     */
    @Test
    public void testInfo() throws Exception {
        String str = "测试";
        String out = Encrypt.encrypt(str, "c096dc67dc44952a8944593ee851f969");
        out = BaseStr64.encode(out);
        System.out.print(out);
    }

    /**
     * Method: saveAvatar(@LoginUser UserVo loginUser, String avatar)
     */
    @Test
    public void testSaveAvatar() throws Exception {
//TODO: Test goes here... 
    }

    /**
     * Method: smscode(@LoginUser UserVo loginUser)
     */
    @Test
    public void testSmscode() throws Exception {
        BasicConfigurator.configure();
        String url = "http://localhost:8050/admin/api/user/smscode";
        Map<String, Object> object = new HashMap();
        object.put("phone", "17775341102");
        String enc = "UTF-8";
        String result = HttpUtil.URLPostByJsonData(url, TestConfig.headerMap, object, enc);
        JSONObject rp = JSONObject.parseObject(result);
        System.out.println(rp);
    }

    /**
     * Method: getCurUser(@LoginUser UserVo loginUser)
     */
    @Test
    public void testGetCurUser() throws Exception {
        BasicConfigurator.configure();
//        String url = "http://222.186.59.51/admin/api/user/getCurUser";
        String url = "http://localhost:8050/admin/api/user/getCurUser";
        Map<String, Object> object = new HashMap();
        String enc = "UTF-8";
        String result = HttpUtil.URLPostByJsonData(url, TestConfig.headerMap, object, enc);
        JSONObject rp = JSONObject.parseObject(result);
        System.out.println(rp);
    }


    /**
     * Method: signUp(@LoginUser UserVo userVo, String idCard, String email, String address)
     */
    @Test
    public void testSignUp() throws Exception {
        BasicConfigurator.configure();
//        String url = "http://222.186.59.51/admin/api/auth/login";
        String url = "http://localhost:8050/admin/api/user/signUp";
        Map<String, Object> object = new HashMap();

        String enc = "UTF-8";
        String result = HttpUtil.URLPost(url, TestConfig.headerMap, object, enc);
        JSONObject rp = JSONObject.parseObject(result);
        System.out.println(rp);
    }
} 
