<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
				<c:choose>
					<c:when test="${empty qnaDTOs}">
						<div class="my-5">
							<h5 class="text-center">아직 이 상품에는 아무런 질문도 없어요</h5>
						</div>
					</c:when>
					<c:otherwise>
						<table class="table my-5">
							<thead>
							  <tr>
								<th scope="col">작성자</th>
								<th colspan="5" style="width:45%" scope="col">질문 내용</th>
								<th scope="col">작성일</th>
								<th scope="col"></th>
								<th></th>
								<th scope="col"></th>
							  </tr>
							</thead>
							<tbody>
								<c:forEach items="${qnaDTOs}" var="qnaDTO">
								  <tr>
									<td>${qnaDTO.writer}</td>
									<td class="text-wrap" id="qnaContents${qnaDTO.num}" colspan="5" style="width:45%">
									<c:forEach begin="1" end="${qnaDTO.depth}">└───</c:forEach>
									${qnaDTO.contents}</td>
									<td>${qnaDTO.regDate}</td>
									<td class="text-center">
										<c:if test="${not empty member}">
											<c:choose> 
												<c:when test="${qnaDTO.step==0}"> <!-- 답변에 답글은 못달게 함 -->
													<a class="btn btn-secondary" href="../qna/reply?num=${qnaDTO.num}">답글달기</a>
												</c:when>
												<c:otherwise>
												</c:otherwise>
											</c:choose>
										</c:if>
									</td>
									<td class="text-center">
										<c:if test="${qnaDTO.memberId == member.id}">
											<!-- 부모글이냐 답글이냐에 따라 data-reply 속성의 값을 다르게 함 -->
											<c:choose>
												<c:when test="${qnaDTO.step == 0}">
													<button class="btn btn-secondary qnaUpdateBtn" type="button" data-reply="0" data-num="${qnaDTO.num}">수정하기</button>
												</c:when>
												<c:otherwise>
													<button class="btn btn-secondary qnaUpdateBtn" type="button" data-reply="1" data-num="${qnaDTO.num}">수정하기</button>
												</c:otherwise>
											</c:choose>
										</c:if>
									</td>
									<td class="text-center">
										<c:if test="${qnaDTO.memberId == member.id}">
											<button class="btn btn-secondary qnaDeleteBtn" type="button" data-num="${qnaDTO.num}">삭제하기</button>
										</c:if>
									</td>
								  </tr>
								</c:forEach>
							</tbody>
						</table>
					</c:otherwise>
				</c:choose>
				<c:if test="${check == 0}">
					<div class="input-group mb-3">
					  <span class="input-group-text">질문이 있으신가요?</span>
					  <textarea class="form-control" id="qnaContents" name="contents"></textarea>
					  <button class="btn btn-outline-secondary qnaAddBtn" type="submit">질문등록</button>
					</div>
				</c:if>