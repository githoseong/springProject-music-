package com.spring.javagreenS_lhs.interceptor;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class VideoInterceptor extends HandlerInterceptorAdapter {
	@Override
  public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
  	HttpSession session = request.getSession();
  	int level = session.getAttribute("sLevel")==null ? 99 : (int) session.getAttribute("sLevel");
  		RequestDispatcher dispatcher;
  		if(level == 99) {	// 비로그인자 사용불가
  			dispatcher = request.getRequestDispatcher("/msg/videoNo");
  			dispatcher.forward(request, response);
  			return false;
  		}
  		else if(level == 1) {	// 비로그인자 사용불가
  			dispatcher = request.getRequestDispatcher("/msg/videoNo2");
  			dispatcher.forward(request, response);
  			return false;
  		}
  		
  	
  	return true;
  }
}
