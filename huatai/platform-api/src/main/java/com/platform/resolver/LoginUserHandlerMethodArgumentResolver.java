package com.platform.resolver;

import com.platform.annotation.LoginUser;
import com.platform.cache.UserTokenCache;
import com.platform.entity.UserVo;
import com.platform.interceptor.AuthorizationInterceptor;
import com.platform.service.ApiUserService;
import org.apache.log4j.Logger;
import org.springframework.core.MethodParameter;
import org.springframework.web.bind.support.WebDataBinderFactory;
import org.springframework.web.context.request.NativeWebRequest;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.method.support.HandlerMethodArgumentResolver;
import org.springframework.web.method.support.ModelAndViewContainer;

/**
 * 有@LoginUser注解的方法参数，注入当前登录用户
 *
 * @author lipengjun
 * @email 939961241@qq.com
 * @date 2017-03-23 22:02
 */
public class LoginUserHandlerMethodArgumentResolver implements HandlerMethodArgumentResolver {
    private Logger logger = Logger.getLogger(getClass());
    private ApiUserService userService;

    public void setUserService(ApiUserService userService) {
        this.userService = userService;
    }

    @Override
    public boolean supportsParameter(MethodParameter parameter) {
        return parameter.getParameterType().isAssignableFrom(UserVo.class) && parameter.hasParameterAnnotation(LoginUser.class);
    }

    @Override
    public Object resolveArgument(MethodParameter parameter, ModelAndViewContainer container,
                                  NativeWebRequest request, WebDataBinderFactory factory) throws Exception {
        //获取用户ID
        Object object = request.getAttribute(AuthorizationInterceptor.LOGIN_USER_KEY, RequestAttributes.SCOPE_REQUEST);
        if (object == null) {
            return null;
        }
        //获取用户信息
        UserVo user = UserTokenCache.getUserInfo((Long) object);
        if (null == user) {
            user = userService.queryObject((Long) object);
            UserTokenCache.putUserInfo(user);
        }

        return user;
    }
}
