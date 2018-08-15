package com.platform.utils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * 检测是否为移动端设备访问
 *
 * @author lipengjun
 * @email 939961241@qq.com
 * @date 2017年10月28日 13:11:27
 */
public class CheckMobile {

    /**
     * \b 是单词边界(连着的两个(字母字符 与 非字母字符) 之间的逻辑上的间隔),
     * 字符串在编译时会被转码一次,所以是 "\\b"
     * \B 是单词内部逻辑间隔(连着的两个字母字符之间的逻辑上的间隔)
     */
    static String phoneReg = "\\b(ip(hone|od)|android|opera m(ob|in)i"
            + "|windows (phone|ce)|blackberry"
            + "|s(ymbian|eries60|amsung)|p(laybook|alm|rofile/midp"
            + "|laystation portable)|nokia|fennec|htc[-_]"
            + "|mobile|up.browser|[1-4][0-9]{2}x[1-4][0-9]{2})\\b";
    static String tableReg = "\\b(ipad|tablet|(Nexus 7)|up.browser"
            + "|[1-4][0-9]{2}x[1-4][0-9]{2})\\b";

    /**
     * 移动设备正则匹配：手机端、平板
     */
    static Pattern phonePat = Pattern.compile(phoneReg, Pattern.CASE_INSENSITIVE);
    static Pattern tablePat = Pattern.compile(tableReg, Pattern.CASE_INSENSITIVE);

    /**
     * 检测是否是移动设备访问
     *
     * @param userAgent 浏览器标识
     * @return true:移动设备接入，false:pc端接入
     */
    public static boolean check(String userAgent) {
        if (null == userAgent) {
            userAgent = "";
        }
        // 匹配    
        Matcher matcherPhone = phonePat.matcher(userAgent);
        Matcher matcherTable = tablePat.matcher(userAgent);
        if (matcherPhone.find() || matcherTable.find()) {
            return true;
        } else {
            return false;
        }
    }

    /**
     * 检查访问方式是否为移动端
     *
     * @param request
     * @param response
     * @return
     * @throws IOException
     */
    public static boolean check(HttpServletRequest request, HttpServletResponse response) throws IOException {
        boolean isFromMobile = false;

        HttpSession session = request.getSession();
        //检查是否已经记录访问方式（移动端或pc端）
        if (null == session.getAttribute("ua")) {
            try {
                //获取ua，用来判断是否为移动端访问  
                String userAgent = request.getHeader("USER-AGENT").toLowerCase();
                if (null == userAgent) {
                    userAgent = "";
                }
                isFromMobile = CheckMobile.check(userAgent);
                //判断是否为移动端访问  
                if (isFromMobile) {
                    System.out.println("移动端访问");
                    session.setAttribute("ua", "mobile");
                } else {
                    System.out.println("pc端访问");
                    session.setAttribute("ua", "pc");
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        } else {
            isFromMobile = session.getAttribute("ua").equals("mobile");
        }
        return isFromMobile;
    }
}  