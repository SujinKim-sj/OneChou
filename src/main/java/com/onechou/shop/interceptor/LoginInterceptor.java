package com.onechou.shop.interceptor;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.onechou.shop.member.MemberDTO;

@Component
public class LoginInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		MemberDTO memberDTO = (MemberDTO) request.getSession().getAttribute("member");
		
		boolean check = true;
		if (memberDTO == null) { 
			check = false; 
			
			request.setAttribute("message", "회원만 이용 가능합니다");
			request.setAttribute("path", "../member/login"); 
			RequestDispatcher view = request.getRequestDispatcher("../WEB-INF/views/common/result.jsp");
			view.forward(request, response);

		}
		
		return check;
	}
	
}
