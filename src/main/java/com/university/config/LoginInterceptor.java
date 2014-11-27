package com.university.config;

import com.university.controllers.client.model.User;
import com.university.utils.CommonUtils;
import org.springframework.http.HttpHeaders;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.HashSet;

public class LoginInterceptor extends HandlerInterceptorAdapter {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        final User user = CommonUtils.getUserFromRequest(request);
        if(user == null) {
            String url = request.getRequestURL().toString();

            /*if(url.contains("/admin/") ||
               url.contains("/student/") ||
               url.contains("/teacher/"))
            {
                final HttpSession session = request.getSession();
                session.setAttribute("URLBeforeSignIn", url);

                response.sendRedirect("/sign-in");
                return false;
            }*/
            final HttpSession session = request.getSession();
            session.setAttribute("URLBeforeSignIn", url);

            response.sendRedirect("/sign-in");
            return false;
        }

        /*if (request.getRequestURL().toString().contains("/admin")) {
            response.sendRedirect("/sign-in");
        }*/
        return super.preHandle(request, response, handler);
    }
}
