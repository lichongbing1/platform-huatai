package com.platform.utils.wechat;

import com.alibaba.druid.support.logging.Log;
import com.alibaba.druid.support.logging.LogFactory;
import com.platform.utils.CharUtil;
import com.platform.utils.MapUtils;
import com.platform.utils.ResourceUtil;
import com.platform.utils.XmlUtil;
import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.config.RequestConfig;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.config.RegistryBuilder;
import org.apache.http.conn.socket.ConnectionSocketFactory;
import org.apache.http.conn.socket.PlainConnectionSocketFactory;
import org.apache.http.conn.ssl.SSLConnectionSocketFactory;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.impl.conn.BasicHttpClientConnectionManager;
import org.apache.http.util.EntityUtils;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.math.BigDecimal;
import java.math.MathContext;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * <p>Title: 微信退款工具类</p>
 * <p>Description: 微信退款工具类，通过充值客户端的不同初始化不同的工具类，得到相应微信退款相关的appid和muchid</p>
 *
 * @author xubo
 * @date 2017年6月6日  下午5:05:03
 */
public class WechatUtil {
    private static Log logger = LogFactory.getLog(WechatUtil.class);
    /**
     * 充值客户端类型--微信公众号
     */
    public static Integer CLIENTTYPE_WX = 2;
    /**
     * 充值客户端类型--app
     */
    public static Integer CLIENTTYPE_APP = 1;
    /**
     * 退款地址
     */
    public static final String refundUrl = "https://api.mch.weixin.qq.com/secapi/pay/refund";
    /**
     * 退款查询地址
     */
    public static final String refundqueryUrl = "https://api.mch.weixin.qq.com/pay/refundquery";

    private static final String EMPTY = "";
    private static final String URL_PARAM_CONNECT_FLAG = "&";

    /**
     * 方法描述：微信退款逻辑
     * 创建时间：2017年4月12日  上午11:04:25
     * 作者： xubo
     *
     * @param
     * @return
     */
    public static WechatRefundApiResult wxRefund(String out_trade_no, Double orderMoney, Double refundMoney) {
        //初始化请求微信服务器的配置信息包括appid密钥等
        //转换金钱格式
        BigDecimal bdOrderMoney = new BigDecimal(orderMoney, MathContext.DECIMAL32);
        BigDecimal bdRefundMoney = new BigDecimal(refundMoney, MathContext.DECIMAL32);
        //构建请求参数
        Map<Object, Object> params = buildRequsetMapParam(out_trade_no, bdOrderMoney, bdRefundMoney);
        String mapToXml = MapUtils.convertMap2Xml(params);
        //请求微信
        String reponseXml = sendSSLPostToWx(mapToXml, WechatConfig.getSslcsf());
        WechatRefundApiResult result = (WechatRefundApiResult) XmlUtil.xmlStrToBean(reponseXml, WechatRefundApiResult.class);
        return result;
    }

    /**
     * 方法描述：得到请求微信退款请求的参数
     * 创建时间：2017年6月8日  上午11:27:02
     * 作者： xubo
     *
     * @param
     * @return
     */
    private static Map<Object, Object> buildRequsetMapParam(String out_trade_no, BigDecimal bdOrderMoney, BigDecimal bdRefundMoney) {
        Map<Object, Object> params = new HashMap<Object, Object>();
        params.put("appid", ResourceUtil.getConfigByName("wx.appId"));//微信分配的公众账号ID（企业号corpid即为此appId）
        params.put("mch_id", ResourceUtil.getConfigByName("wx.mchId"));//微信支付分配的商户号
        params.put("nonce_str", CharUtil.getRandomString(16));//随机字符串，不长于32位。推荐随机数生成算法
        params.put("out_trade_no", out_trade_no);//商户侧传给微信的订单号
        params.put("out_refund_no", getBundleId());//商户系统内部的退款单号，商户系统内部唯一，同一退款单号多次请求只退一笔
        params.put("total_fee", bdOrderMoney.multiply(new BigDecimal(100)).intValue());//订单总金额，单位为分，只能为整数
        params.put("refund_fee", bdRefundMoney.multiply(new BigDecimal(100)).intValue());//退款总金额，订单总金额，单位为分，只能为整数
        params.put("op_user_id", ResourceUtil.getConfigByName("wx.mchId"));//操作员帐号, 默认为商户号
        //签名前必须要参数全部写在前面
        params.put("sign", arraySign(params, ResourceUtil.getConfigByName("wx.paySignKey")));//签名
        return params;
    }

    /**
     * 请求微信https
     **/
    public static String sendSSLPostToWx(String mapToXml, SSLConnectionSocketFactory sslcsf) {
        logger.info("*******退款（WX Request：" + mapToXml);
        HttpPost httPost = new HttpPost(refundUrl);
        httPost.addHeader("Connection", "keep-alive");
        httPost.addHeader("Accept", "*/*");
        httPost.addHeader("Content-Type", "application/x-www-form-urlencoded; charset=UTF-8");
        httPost.addHeader("Host", "api.mch.weixin.qq.com");
        httPost.addHeader("X-Requested-With", "XMLHttpRequest");
        httPost.addHeader("Cache-Control", "max-age=0");
        httPost.addHeader("User-Agent", "Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0) ");
        httPost.setEntity(new StringEntity(mapToXml, "UTF-8"));
        CloseableHttpClient httpClient = HttpClients.custom().setSSLSocketFactory(sslcsf).build();
        CloseableHttpResponse response = null;
        try {
            response = httpClient.execute(httPost);
            HttpEntity entity = response.getEntity();
            String xmlStr = EntityUtils.toString(entity, "UTF-8");
            logger.info("*******退款（WX Response：" + xmlStr);
            return xmlStr;
        } catch (Exception e) {
            logger.error(e.getMessage(), e);
            return null;
        } finally {
            try {
                if (response != null) {
                    response.close();
                }
            } catch (IOException e) {
                logger.error(e.getMessage(), e);
            }
        }
    }

    /**
     * 方法描述：微信查询退款逻辑
     * 创建时间：2017年4月12日  上午11:04:25
     * 作者： xubo
     *
     * @param
     * @return
     */
    public Map<String, Object> wxRefundquery(String out_trade_no, String out_refund_no) {
        Map<Object, Object> params = new HashMap<Object, Object>();
        params.put("appid", ResourceUtil.getConfigByName("wx.appId"));//微信分配的公众账号ID（企业号corpid即为此appId）
        params.put("mch_id", ResourceUtil.getConfigByName("wx.mchId"));//微信支付分配的商户号
        params.put("nonce_str", CharUtil.getRandomString(16));//随机字符串，不长于32位。推荐随机数生成算法
        params.put("out_trade_no", out_trade_no);//商户侧传给微信的订单号
        //签名前必须要参数全部写在前面
        params.put("sign", arraySign(params, ResourceUtil.getConfigByName("wx.paySignKey")));//签名
        String mapToXml = MapUtils.convertMap2Xml(params);
        HttpPost httPost = new HttpPost(refundqueryUrl);
        httPost.addHeader("Connection", "keep-alive");
        httPost.addHeader("Accept", "*/*");
        httPost.addHeader("Content-Type", "application/x-www-form-urlencoded; charset=UTF-8");
        httPost.addHeader("Host", "api.mch.weixin.qq.com");
        httPost.addHeader("X-Requested-With", "XMLHttpRequest");
        httPost.addHeader("Cache-Control", "max-age=0");
        httPost.addHeader("User-Agent", "Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0) ");
        httPost.setEntity(new StringEntity(mapToXml, "UTF-8"));
        CloseableHttpClient httpClient = HttpClients.custom().setSSLSocketFactory(WechatConfig.getSslcsf()).build();
        CloseableHttpResponse response = null;
        try {
            response = httpClient.execute(httPost);
            HttpEntity entity = response.getEntity();
            String xmlStr = EntityUtils.toString(entity, "UTF-8");
            System.out.println(xmlStr);
            Map<String, Object> result = XmlUtil.xmlStrToMap(xmlStr);//.xmlStrToBean(xmlStr, WechatRefundApiResult.class);
            return result;
            //将信息保存到数据库
        } catch (Exception e) {
            logger.error(e.getMessage(), e);
            return null;
        } finally {
            try {
                if (response != null) {
                    response.close();
                }
            } catch (IOException e) {
                logger.error(e.getMessage(), e);
            }
        }
    }

    /**
     * 支付交易ID
     */
    public static String getBundleId() {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMddHHmmssSSS");
        String tradeno = dateFormat.format(new Date());
        String str = "000000" + (int) (Math.random() * 1000000);
        tradeno = tradeno + str.substring(str.length() - 6);
        return tradeno;
    }

    /**
     * 方法描述：根据签名加密请求参数
     * 创建时间：2017年6月8日  上午11:28:52
     * 作者： xubo
     *
     * @param
     * @return
     */
    public static String arraySign(Map<Object, Object> params, String paySignKey) {
        boolean encode = false;
        Set<Object> keysSet = params.keySet();
        Object[] keys = keysSet.toArray();
        Arrays.sort(keys);
        StringBuffer temp = new StringBuffer();
        boolean first = true;
        for (Object key : keys) {
            if (first) {
                first = false;
            } else {
                temp.append("&");
            }
            temp.append(key).append("=");
            Object value = params.get(key);
            String valueString = "";
            if (null != value) {
                valueString = value.toString();
            }
            if (encode) {
                try {
                    temp.append(URLEncoder.encode(valueString, "UTF-8"));
                } catch (UnsupportedEncodingException e) {
                    e.printStackTrace();
                }
            } else {
                temp.append(valueString);
            }
        }
        temp.append("&key=");
        temp.append(paySignKey);
        System.out.println(temp.toString());
        String packageSign = MD5.getMessageDigest(temp.toString());
        return packageSign;
    }

    /**
     * 请求，只请求一次，不做重试
     *
     * @param url
     * @param data
     * @return
     * @throws Exception
     */
    public static String requestOnce(final String url, String data) {
        BasicHttpClientConnectionManager connManager;
        connManager = new BasicHttpClientConnectionManager(
                RegistryBuilder.<ConnectionSocketFactory>create()
                        .register("http", PlainConnectionSocketFactory.getSocketFactory())
                        .register("https", SSLConnectionSocketFactory.getSocketFactory())
                        .build(),
                null,
                null,
                null
        );

        HttpClient httpClient = HttpClientBuilder.create()
                .setConnectionManager(connManager)
                .build();

        HttpPost httpPost = new HttpPost(url);

        RequestConfig requestConfig = RequestConfig.custom()
                .setSocketTimeout(5000)
                .setConnectTimeout(5000)
                .setConnectionRequestTimeout(10000).build();

        httpPost.setConfig(requestConfig);

        StringEntity postEntity = new StringEntity(data, "UTF-8");
        httpPost.addHeader("Content-Type", "text/xml");
        httpPost.addHeader("User-Agent", "wxpay sdk java v1.0 " + ResourceUtil.getConfigByName("wx.mchId"));
        httpPost.setEntity(postEntity);

        try {
            HttpResponse httpResponse = httpClient.execute(httpPost);
            HttpEntity httpEntity = httpResponse.getEntity();
            String reusltObj = null;
            reusltObj = EntityUtils.toString(httpEntity, "UTF-8");
            logger.info("请求结果:" + reusltObj);
            return reusltObj;
        } catch (IOException e) {
            e.printStackTrace();
        }
        return "";
    }

    /**
     * 请求，只请求一次，不做重试
     *
     * @param url
     * @param params
     * @return
     * @throws Exception
     */
    public static String requestOnceGet(final String url, Map params) {
        StringBuffer strtTotalURL = new StringBuffer(EMPTY);
        BasicHttpClientConnectionManager connManager;
        connManager = new BasicHttpClientConnectionManager(
                RegistryBuilder.<ConnectionSocketFactory>create()
                        .register("http", PlainConnectionSocketFactory.getSocketFactory())
                        .register("https", SSLConnectionSocketFactory.getSocketFactory())
                        .build(),
                null,
                null,
                null
        );

        HttpClient httpClient = HttpClientBuilder.create()
                .setConnectionManager(connManager)
                .build();
        HttpGet httpGet = new HttpGet(url);
        RequestConfig requestConfig = RequestConfig.custom()
                .setSocketTimeout(5000)
                .setConnectTimeout(5000)
                .setConnectionRequestTimeout(10000).build();

        httpGet.setConfig(requestConfig);
        httpGet.addHeader("Content-Type", "text/xml");
        httpGet.addHeader("User-Agent", "wxpay sdk java v1.0 " + ResourceUtil.getConfigByName("wx.mchId"));
        if (strtTotalURL.indexOf("?") == -1) {
            strtTotalURL.append(url).append("?").append(getUrl(params, "UTF-8"));
        } else {
            strtTotalURL.append(url).append("&").append(getUrl(params, "UTF-8"));
        }
        try {
            HttpResponse httpResponse = httpClient.execute(httpGet);
            HttpEntity httpEntity = httpResponse.getEntity();
            String reusltObj = EntityUtils.toString(httpEntity, "UTF-8");
            logger.info("请求结果:" + reusltObj);
            return reusltObj;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "";

    }

    /**
     * 据Map生成URL字符串
     *
     * @param map      Map
     * @param valueEnc URL编码
     * @return URL
     */
    private static String getUrl(Map<String, String> map, String valueEnc) {

        if (null == map || map.keySet().size() == 0) {
            return (EMPTY);
        }
        StringBuffer url = new StringBuffer();
        Set<String> keys = map.keySet();
        for (Iterator<String> it = keys.iterator(); it.hasNext(); ) {
            String key = it.next();
            if (map.containsKey(key)) {
                String val = map.get(key);
                String str = val != null ? val : EMPTY;
                try {
                    str = URLEncoder.encode(str, valueEnc);
                } catch (UnsupportedEncodingException e) {
                    e.printStackTrace();
                }
                url.append(key).append("=").append(str).append(URL_PARAM_CONNECT_FLAG);
            }
        }
        String strURL = EMPTY;
        strURL = url.toString();
        if (URL_PARAM_CONNECT_FLAG.equals(EMPTY + strURL.charAt(strURL.length() - 1))) {
            strURL = strURL.substring(0, strURL.length() - 1);
        }

        return (strURL);
    }


    public static void main(String[] args) throws Exception {
        Map<Object, Object> parame = new TreeMap<Object, Object>();
        parame.put("mch_id", ResourceUtil.getConfigByName("wx.mchId"));//
        String randomStr = CharUtil.getRandomNum(18).toUpperCase();
        parame.put("nonce_str", randomStr);//
        String sign = WechatUtil.arraySign(parame, ResourceUtil.getConfigByName("wx.paySignKey"));
        parame.put("sign", sign);// 数字签证

        String xml = MapUtils.convertMap2Xml(parame);
        logger.info("xml:" + xml);
        Map<String, Object> resultUn = XmlUtil.xmlStrToMap(WechatUtil.requestOnce("https://apitest.mch.weixin.qq.com/sandboxnew/pay/getsignkey", xml));
        System.out.print(resultUn);
    }
}
