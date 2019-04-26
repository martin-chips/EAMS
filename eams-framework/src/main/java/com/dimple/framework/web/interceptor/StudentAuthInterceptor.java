package com.dimple.framework.web.interceptor;

import com.dimple.common.annotation.StudentAuth;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * @className: StudentAuthInterceptor
 * @description: 学生权限验证拦截器
 * @auther: Dimple
 * @date: 04/26/19
 * @version: 1.0
 */
public class StudentAuthInterceptor extends HandlerInterceptorAdapter {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        if (handler.getClass().isAssignableFrom(HandlerMethod.class)) {
            // 获取注解信息
            StudentAuth studentAuth = ((HandlerMethod) handler).getMethodAnnotation(StudentAuth.class);
            //说明不需要验证权限
            if (studentAuth == null || studentAuth.needValidate() == false) {
                return true;
            } else {
                HttpSession session = request.getSession();
                Object student = session.getAttribute("student");
                if (student == null) {
                    response.sendRedirect("/error/404");
                } else {
                    return true;
                }
            }
        }
        return true;
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
        super.postHandle(request, response, handler, modelAndView);
    }
}
