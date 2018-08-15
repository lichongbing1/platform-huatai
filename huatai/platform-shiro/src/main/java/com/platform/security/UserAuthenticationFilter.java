package com.platform.security;

import com.alibaba.fastjson.JSON;
import com.platform.utils.ServletUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.session.mgt.eis.SessionDAO;
import org.apache.shiro.web.filter.authc.UserFilter;
import org.apache.shiro.web.mgt.DefaultWebSecurityManager;
import org.apache.shiro.web.util.WebUtils;
import org.springframework.stereotype.Service;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.Map;

@Service
public class UserAuthenticationFilter extends UserFilter {


    @Override
    protected boolean onAccessDenied(ServletRequest request,
                                     ServletResponse response) throws Exception {
        HttpServletRequest httpRequest = WebUtils.toHttp(request);
        if (ServletUtils.isAjaxRequest(httpRequest)) {
            String msg = "Session超时请重新登陆";
            DefaultWebSecurityManager securityManager = (DefaultWebSecurityManager) SecurityUtils.getSecurityManager();
            SessionManager sessionManager = (SessionManager) securityManager.getSessionManager();
            SessionDAO sessionDao = (SessionDAO) sessionManager.getSessionDAO();
            Session session = sessionDao.readSession(httpRequest.getCookies()[0].getValue());
            HttpServletResponse res = WebUtils.toHttp(response);
            res.setContentType("application/json");
            res.setCharacterEncoding("utf-8");
            Map<String, Object> obj = new HashMap<String, Object>();
            obj.put("requestCode", -1);
            obj.put("msg", msg);
            res.getWriter().print(JSON.toJSONString(obj));
            return false;
        }
        saveRequestAndRedirectToLogin(request, response);
        return false;
    }
}
