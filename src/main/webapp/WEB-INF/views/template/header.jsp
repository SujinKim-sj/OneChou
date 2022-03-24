<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<nav class="navbar navbar-expand-sm navbar-dark bg-dark" aria-label="Third navbar example">
    <div class="container-fluid">
      <a class="navbar-brand" href="/shop">OneChou</a>
      <div class="collapse navbar-collapse" id="navbarsExample03">
        <ul class="navbar-nav me-auto mb-2 mb-sm-0">
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="/shop/product/list" id="dropdown03" data-bs-toggle="dropdown" aria-expanded="false">상품보기</a>
            <ul class="dropdown-menu" aria-labelledby="dropdown03">
              <li><a class="dropdown-item" href="/shop/product/recommend">추천상품</a></li>
              <li><a class="dropdown-item" href="/shop/product/list">전체상품</a></li>
            </ul>
          </li>
        </ul>
        <ul class="navbar-nav d-flex justify-content-end">
        	<c:choose>
        		<c:when test="${empty member}">
		            <li class="nav-item">
		              <a class="nav-link" href="/shop/member/login">Login</a>
		            </li>
		            <li class="nav-item">
		              <a class="nav-link" href="/shop/member/joinCheck">Join</a>
		            </li>
	            </c:when>
	            <c:otherwise>
	            	<li class="nav-item">
		              <a class="nav-link" href="/shop/member/mypage">Mypage</a>
		            </li>
		            <li class="nav-item">
		              <a class="nav-link" href="/shop/member/logout">Logout</a>
		            </li>
	            </c:otherwise>
            </c:choose>
        </ul>
      </div>
    </div>
  </nav>