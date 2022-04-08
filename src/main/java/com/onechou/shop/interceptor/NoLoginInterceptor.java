package com.onechou.shop.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.onechou.shop.member.MemberDTO;

@Component
public class NoLoginInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		boolean check = true;
		
		MemberDTO memberDTO = (MemberDTO) request.getSession().getAttribute("member");
		
		if(memberDTO != null) {
			check = false;
			
			response.sendRedirect("/shop");
		}
		
		return check;
	}
	
}
