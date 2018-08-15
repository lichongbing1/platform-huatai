package com.platform.utils;


import javax.servlet.http.HttpServletRequest;
import java.io.UnsupportedEncodingException;
import java.util.ResourceBundle;

/**
 * 项目参数工具类
 * 项目参数各种操作方法集合类
 *
 * @author lipengjun
 * @email 939961241@qq.com
 * @date 2017年10月28日 13:11:27
 */
public final class ResourceUtil {

    private static ResourceUtil RESOURCE_UTIL = null;

    private static ResourceBundle BUNDLE = ResourceBundle.getBundle("system");

    private ResourceUtil() {

    }

    /**
     * 工厂实现配置文件读取
     *
     * @param properties 参数
     * @return ResourceUtil 工具类
     */
    public static ResourceUtil getInstance(String properties) {
        if (RESOURCE_UTIL == null) {
            RESOURCE_UTIL = new ResourceUtil();
        }
        if (properties != null) {
            BUNDLE = ResourceBundle.getBundle(properties);
        }
        return RESOURCE_UTIL;
    }

    /**
     * 工厂实现配置文件读取
     *
     * @return ResourceUtil
     */
    public static ResourceUtil getInstance() {
        if (RESOURCE_UTIL == null) {
            RESOURCE_UTIL = new ResourceUtil();
        }
        return RESOURCE_UTIL;
    }

    /**
     * 主要功能:获得请求路径
     * 注意事项:无
     *
     * @param request 请求
     * @return 请求路径
     */
    public static String getRequestPath(HttpServletRequest request) {
        String requestPath = request.getRequestURI() + "?"
                + request.getQueryString();
        if (requestPath.indexOf("&") > -1) {
            // 去掉其他参数
            requestPath = requestPath.substring(0, requestPath.indexOf("&"));
        }
        // 去掉项目路径
        requestPath = requestPath.substring(request.getContextPath().length() + 1);
        return requestPath;
    }

    /**
     * 主要功能:获取配置文件参数
     * 注意事项:无
     *
     * @param name 参数名称
     * @return 参数名称对应值
     */
    public static String getConfigByName(String name) {
        String value = "";
        try {
            value = new String(BUNDLE.getString(name).getBytes("iso8859-1"),
                    "UTF-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        return value;
    }

    /**
     * 主要功能:取得系统路径
     * 注意事项:无
     *
     * @return 系统路径
     */
    public static String getSysPath() {
        String path = Thread.currentThread().getContextClassLoader().getResource(
                "").toString();
        String temp = path.replaceFirst("file:/", "").replaceFirst(
                "WEB-INF/classes/", "");
        String separator = System.getProperty("file.separator");
        String resultPath = temp.replaceAll("/", separator + separator).replaceAll(
                "%20", " ");
        return resultPath;
    }

    /**
     * 主要功能:获取项目根目录
     * 注意事项:无
     *
     * @return 项目根目录
     */
    public static String getPorjectPath() {
        // 当前tomcat的bin目录的路径 如
        String nowpath;
        // apache-tomcat-6.0.14\bin
        String tempdir;
        nowpath = System.getProperty("user.dir");
        // 把bin 文件夹变到 webapps文件里面
        tempdir = nowpath.replace("bin", "webapps");
        // 拼成D:\java\software\apache-tomcat-6.0.14\webapps\sz_pro
        tempdir += "\\";
        return tempdir;
    }

    /**
     * 主要功能:取得ClassPath
     * 注意事项:无
     *
     * @return ClassPath
     */
    public static String getClassPath() {
        String path = Thread.currentThread().getContextClassLoader().getResource(
                "").toString();
        String temp = path.replaceFirst("file:/", "");
        String separator = System.getProperty("file.separator");
        String resultPath = temp.replaceAll("/", separator + separator);
        return resultPath;
    }

    /**
     * 主要功能:取得系统临时路径
     * 注意事项:无
     *
     * @return 系统临时路径
     */
    public static String getSystempPath() {
        return System.getProperty("java.io.tmpdir");
    }

    /**
     * 主要功能:取得分隔符
     * 注意事项:无
     *
     * @return 分隔符
     */
    public static String getSeparator() {
        return System.getProperty("file.separator");
    }

    /**
     * 主要功能:获取随机码的长度
     * 注意事项:无
     *
     * @return 随机码的长度
     */
    public static String getRandCodeLength() {
        return BUNDLE.getString("randCodeLength");
    }

    /**
     * 主要功能:获取随机码的类型
     * 注意事项:无
     *
     * @return 随机码的类型
     */
    public static String getRandCodeType() {
        return BUNDLE.getString("randCodeType");
    }

    /**
     * 主要功能:获取组织机构编码长度的类型
     * 注意事项:无
     *
     * @return 组织机构编码长度的类型
     */
    public static String getOrgCodeLengthType() {
        return BUNDLE.getString("orgCodeLengthType");
    }

    /**
     * 主要功能:获取数据库类型
     * 注意事项:无
     *
     * @return 数据库类型
     */
    public String getDbType() {
        return StringUtils.isNullOrEmpty(ResourceBundle.getBundle("platform").getString(
                "dbType")) ? "oracle" : ResourceBundle.getBundle("platform").getString(
                "dbType");
    }

    /**
     * 主要功能:获取数据库的schema，主要针对db2
     * 注意事项:无
     *
     * @return schema 字符串
     */
    public String getDbSchema() {
        String schema = "";
        if (StringUtils.isNotEmpty(ResourceBundle.getBundle("platform").getString(
                "dbType"))
                && "db2".equals(ResourceBundle.getBundle("platform").getString(
                "dbType"))) {
            schema = StringUtils.isNotEmpty(ResourceBundle.getBundle("platform").getString(
                    "dbSchema")) ? ResourceBundle.getBundle("platform").getString(
                    "dbSchema")
                    + "." : "";
        }
        return schema;
    }
}
