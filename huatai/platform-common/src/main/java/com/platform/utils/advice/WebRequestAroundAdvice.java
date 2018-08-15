package com.platform.utils.advice;

import com.alibaba.fastjson.JSONObject;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import java.util.Enumeration;

/**
 * 作者: @author Harmon <br>
 * 时间: 2017-05-02 15:57<br>
 * 描述: WebRequestAroundAdvice <br>
 */
@Aspect
public class WebRequestAroundAdvice {
    private static final Logger logger = LoggerFactory.getLogger(WebRequestAroundAdvice.class);

    @Pointcut(value = "execution(* com.platform.*.*.api.*.*(..))")
    public void pointcut() {
    }

    @Around("pointcut()")
    public Object handle(ProceedingJoinPoint joinPoint) throws Throwable {
        preHandle();

        Object retVal = joinPoint.proceed();

        postHandle(retVal);

        return retVal;
    }


    private void preHandle() {
//        if (logger.isDebugEnabled()) {
            HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();

            StringBuffer sb = new StringBuffer();
            sb.append("{");

            Enumeration<String> headers = request.getHeaderNames();
            int i = 0;
            while (headers.hasMoreElements()) {
                String header = headers.nextElement();

                if (i > 0)
                    sb.append(", ");
                sb.append(header + ": " + request.getHeader(header));
                i++;
            }
            sb.append("}");
            logger.info("Pre handling request: {}, headers: {}", getRequestInfo(request, true), sb.toString());
//        }
    }

    private void postHandle(Object retVal) {
//        if (logger.isDebugEnabled()) {
            HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
            logger.info("Post handling request: {}, response: {}", getRequestInfo(request, false), JSONObject.toJSONString(retVal));
//        }
    }

    private String getRequestInfo(HttpServletRequest request, boolean requestDetails) {
        StringBuffer sb = new StringBuffer();
        sb.append(request.getMethod()).append(" ");
        sb.append(request.getRequestURI());
        if (requestDetails) {
            Enumeration<String> e = request.getParameterNames();
            sb.append(" ").append("{");
            int i = 0;
            while (e.hasMoreElements()) {
                String name = e.nextElement();
                String val = request.getParameter(name);

                if (val != null && !val.isEmpty()) {
                    if (i > 0)
                        sb.append(", ");
                    sb.append(name).append(": ").append(val);

                    i++;
                }
            }
            sb.append("}");
        }

        return sb.toString();
    }
}