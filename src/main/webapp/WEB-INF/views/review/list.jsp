<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
				<c:choose>
					<c:when test="${empty reviewDTOs}">
						<h5 class="text-center">아직 이 상품에는 아무런 리뷰도 없어요</h5>
					</c:when>
					<c:otherwise>
						<table class="table table-striped">
							<thead>
							  <tr>
								<th scope="col">별점</th>
								<th scope="col">작성자</th>
								<th colspan="5" scope="col" style="width:45%">리뷰내용</th>
								<th scope="col">작성일</th>
								<th></th>
								<th></th>
							  </tr>
							</thead>
							<tbody>
								<c:forEach items="${reviewDTOs}" var="reviewDTO">
								  <tr>
									<th scope="row">
										<c:choose>
											<c:when test="${reviewDTO.rating == 1}">⭐</c:when>
											<c:when test="${reviewDTO.rating == 2}">⭐⭐</c:when>
											<c:when test="${reviewDTO.rating == 3}">⭐⭐⭐</c:when>
											<c:when test="${reviewDTO.rating == 4}">⭐⭐⭐⭐</c:when>
											<c:otherwise>
											⭐⭐⭐⭐⭐
											</c:otherwise>
										</c:choose>
									</th>
									<td>${reviewDTO.writer}</td>
									<td class="text-wrap" colspan="5" style="width:45%">${reviewDTO.contents}</td>
									<td>${reviewDTO.regDate}</td>
									<td>
										<c:if test="${member.id == reviewDTO.memberId}">
											<button class="btn btn-secondary" type="button" data-num="${reviewDTO.num}" id="reviewUpdateBtn">수정하기</button>
										</c:if>
									</td>
									<td>
										<c:if test="${member.id == reviewDTO.memberId}">
											<button class="btn btn-secondary" type="button" data-num="${reviewDTO.num}" id="reviewDeleteBtn">삭제하기</button>
										</c:if>
									</td>
								  </tr>
								  </c:forEach>
							</tbody>
						</table>
					</c:otherwise>
				</c:choose>
