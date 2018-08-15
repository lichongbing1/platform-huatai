package test.com.platform.api;

import com.alibaba.fastjson.JSONObject;
import com.platform.utils.HttpUtil;
import org.apache.log4j.BasicConfigurator;
import org.junit.Test;
import org.junit.Before;
import org.junit.After;

import java.util.HashMap;
import java.util.Map;

/**
 * ApiPayController Tester.
 *
 * @author Harmon
 * @version 1.0
 * @since <pre>05/06/2018</pre>
 */
public class ApiPayControllerTest {

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
     * Method: payPrepay(@LoginUser UserVo loginUser, Long orderId)
     */
    @Test
    public void testPayPrepay() throws Exception {
//TODO: Test goes here... 
    }

    /**
     * Method: notify(HttpServletRequest request, HttpServletResponse response)
     */
    @Test
    public void testNotify() throws Exception {
//TODO: Test goes here... 
    }

    /**
     * Method: refund(@LoginUser UserVo loginUser, Long orderId)
     */
    @Test
    public void testRefund() throws Exception {
//TODO: Test goes here... 
    }

    /**
     * Method: test(Long orderId)
     */
    @Test
    public void testTest() throws Exception {
        BasicConfigurator.configure();
        String url = "http://localhost:8060/api/pay/test";
        Map<String, Object> object = new HashMap();

        object.put("orderId", 72);
        String enc = "UTF-8";
        String result = HttpUtil.URLPost(url, object, enc);
        JSONObject rp = JSONObject.parseObject(result);
        System.out.println(rp);
    }

    /**
     * Method: setXml(String return_code, String return_msg)
     */
    @Test
    public void testSetXml() throws Exception {
//TODO: Test goes here... 
    }

    /**
     * Method: callbakcXml(String orderNum)
     */
    @Test
    public void testCallbakcXml() throws Exception {
//TODO: Test goes here... 
    }


} 
