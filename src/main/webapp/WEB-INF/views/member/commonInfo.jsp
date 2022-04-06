<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
				<div class="text-center mb-2">
					<h5>내 정보</h5>
				</div>

				<div>
					<ul class="list-group list-group-flush">
					  <li class="list-group-item">아이디 : ${memberDTO.id}</li>
					  <li class="list-group-item">이름 : ${memberDTO.name}</li>
					  <li class="list-group-item">별명 : ${memberDTO.nickname}</li>
					  <li class="list-group-item">이메일 : ${memberDTO.email}</li>
					  <li class="list-group-item">전화번호 : ${memberDTO.phone}</li>
					  <li class="list-group-item">주소 : ${memberDTO.address}</li>
					</ul>
				</div>
				<div class="mt-4 ">
					<a href="./updateCheck" class="btn btn-outline-secondary">내 정보 수정하기</a>
				</div>