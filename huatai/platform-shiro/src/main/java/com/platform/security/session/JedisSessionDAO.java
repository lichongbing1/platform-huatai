package com.platform.security.session;

import com.platform.utils.redis.JedisUtil;
import com.platform.Global;
import com.platform.utils.ServletUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.session.mgt.eis.EnterpriseCacheSessionDAO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.servlet.http.HttpServletRequest;
import java.io.Serializable;

/**
 * 自定义授权会话管理类
 *
 * @author zhuliyun
 */
public class JedisSessionDAO extends EnterpriseCacheSessionDAO {

    private Logger logger = LoggerFactory.getLogger(getClass());

    private String sessionKeyPrefix = "shiro_session_";
    // session 在redis过期时间是30分钟30*60
    private static int expireTime = 1800;

    // 创建session，保存到数据库
    @Override
    protected Serializable doCreate(Session session) {
        Serializable sessionId = super.doCreate(session);
        logger.debug("创建session:{}", session.getId().toString());
        HttpServletRequest request = ServletUtils.getRequest();
        if (request != null) {
            String uri = request.getServletPath();
            // 如果是静态文件，则不创建SESSION
            if (ServletUtils.isStaticFile(uri)) {
                return null;
            }
        }

        JedisUtil.setObject(sessionKeyPrefix + session.getId().toString(), session, expireTime);
        return sessionId;
    }

    // 获取session
    @Override
    protected Session doReadSession(Serializable sessionId) {
        logger.debug("获取session:{}", sessionId);
        // 先从缓存中获取session，如果没有再去数据库中获取
        Session session = (Session) JedisUtil.getObject(sessionKeyPrefix + sessionId.toString());
        return session;
    }

    // 更新session的最后一次访问时间
    @Override
    protected void doUpdate(Session session) {
//        super.doUpdate(session);
        logger.debug("获取session:{}", session.getId());
        String key = sessionKeyPrefix + session.getId().toString();

        HttpServletRequest request = ServletUtils.getRequest();
        if (request != null) {
            String uri = request.getServletPath();
            // 如果是静态文件，则不更新SESSION
            if (ServletUtils.isStaticFile(uri)) {
                return;
            }
            // 手动控制不更新SESSION
            if (Global.NO.equals(request.getParameter("updateSession"))) {
                return;
            }
        }
        if (null == JedisUtil.getObject(key)) {
            return;
        }
        JedisUtil.expire(key, expireTime);
    }

    // 删除session
    @Override
    protected void doDelete(Session session) {
        if (session == null || session.getId() == null) {
            return;
        }
        logger.debug("删除session:{}", session.getId());
//        super.doDelete(session);
        JedisUtil.del(sessionKeyPrefix + session.getId().toString());
    }

    public String getSessionKeyPrefix() {
        return sessionKeyPrefix;
    }

    public void setSessionKeyPrefix(String sessionKeyPrefix) {
        this.sessionKeyPrefix = sessionKeyPrefix;
    }

    public static int getExpireTime() {
        return expireTime;
    }

    public static void setExpireTime(int expireTime) {
        JedisSessionDAO.expireTime = expireTime;
    }
}
