<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
				<c:choose>
					<c:when test="${empty reviewDTOs}">
						<h5 class="text-center">아직 이 상품에는 아무런 리뷰도 없어요</h5>
					</c:when>
					<c:otherwise>
						<table class="table">
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
									<td id="rating${reviewDTO.num}">
										<c:choose>
											<c:when test="${reviewDTO.rating == 1}">⭐</c:when>
											<c:when test="${reviewDTO.rating == 2}">⭐⭐</c:when>
											<c:when test="${reviewDTO.rating == 3}">⭐⭐⭐</c:when>
											<c:when test="${reviewDTO.rating == 4}">⭐⭐⭐⭐</c:when>
											<c:otherwise>
											⭐⭐⭐⭐⭐
											</c:otherwise>
										</c:choose>
									</td>
									<td>${reviewDTO.writer}</td>
									<td class="text-wrap" id="contents${reviewDTO.num}" colspan="5" style="width:45%">${reviewDTO.contents}</td>
									<td>${reviewDTO.regDate}</td>
									<td>
										<c:if test="${member.id == reviewDTO.memberId}">
											<button class="btn btn-secondary reviewUpdateBtn" type="button" data-num="${reviewDTO.num}">리뷰수정</button>
										</c:if>
									</td>
									<td>
										<c:if test="${member.id == reviewDTO.memberId}">
											<button class="btn btn-secondary reviewDeleteBtn" type="button" data-num="${reviewDTO.num}">리뷰삭제</button>
										</c:if>
									</td>
								  </tr>
								  </c:forEach>
							</tbody>
						</table>
						<div class="d-flex justify-content-center align-items-center">
							<nav>
								<ul class="pagination">
								
								<c:if test="${pager.pre}">
									<li class="page-item">
										<button class="page-link" type="button" data-page="${pager.startNum-1}" aria-label="Previous">
										<span aria-hidden="true">&laquo;</span>
										</button>
									</li>
								</c:if>
								
								<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
									<li class="page-item"><button class="page-link" data-page="${i}" type="button">${i}</button></li>
								</c:forEach>
								
								<c:if test="${pager.next}">
									<li class="page-item">
										<button class="page-link" type="button" data-page="${pager.lastNum+1}" aria-label="Next">
										<span aria-hidden="true">&raquo;</span>
										</button>
									</li>
								</c:if>
								</ul>
							</nav>
						</div>
					</c:otherwise>
				</c:choose>
