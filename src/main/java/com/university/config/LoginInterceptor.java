package com.university.config;

import com.university.controllers.client.model.User;
import com.university.utils.CommonUtils;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LoginInterceptor extends HandlerInterceptorAdapter {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        final User user = CommonUtils.getUserFromRequest(request);
        if (user == null) {
            final String url = request.getRequestURL().toString();
            request.getSession().setAttribute("redirectUrl", url);

            response.sendRedirect("/sign-in");
            return false;
        }

        return super.preHandle(request, response, handler);
    }
}
