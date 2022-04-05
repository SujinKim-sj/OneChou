package com.onechou.shop.interceptor;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.onechou.shop.member.MemberDTO;

@Component
public class GeneralMemberCheckInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		boolean check = true;
		
		MemberDTO memberDTO = (MemberDTO) request.getSession().getAttribute("member");
				
		if(memberDTO.getKind() != 2) {
			check = false; 
			
			request.setAttribute("message", "일반회원유형만 이용 가능합니다");
			request.setAttribute("path", "/shop"); 
			RequestDispatcher view = request.getRequestDispatcher("../WEB-INF/views/common/result.jsp");
			view.forward(request, response);
		}
		
		return check;
	}
}
