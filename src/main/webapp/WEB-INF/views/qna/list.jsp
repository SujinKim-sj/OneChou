<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
				<c:choose>
					<c:when test="${empty qnaDTOs}">
						<div class="my-5 text-center">
							<h5>아직 이 상품에는 아무런 질문도 없어요</h5>
						</div>
					</c:when>
					<c:otherwise>					
						<table class="table my-4">
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
							<tbody id="firstTbody">
								<c:forEach items="${qnaDTOs}" var="qnaDTO">
								  <tr>
									<td class="align-middle">${qnaDTO.writer}</td>
									<td id="qnaContents${qnaDTO.num}" colspan="5" style="width:45%">
										<div class="d-flex justify-content-between align-items-center">
											${qnaDTO.contents}
											<span class="text-end">
												<button class="replyBtn btn btn-outline-secondary" data-num="${qnaDTO.num}" type="button">답글보기</button>
											</span>
										</div>
									</td>
									<td class="align-middle">${qnaDTO.regDate}</td>
									<td class="text-center">
										<c:if test="${not empty member}">
											<a class="btn btn-secondary" href="../qna/reply?num=${qnaDTO.num}">답글달기</a>
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
								  <tbody class="replyListTbody" id="replyListSection${qnaDTO.num}">

								  </tbody>
								</c:forEach>
							</tbody>
						</table>
					</c:otherwise>
				</c:choose>
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
				<c:if test="${check == 0}">
					<div class="input-group mb-3">
					  <span class="input-group-text">질문이 있으신가요?</span>
					  <textarea class="form-control" id="qnaContents" name="contents"></textarea>
					  <button class="btn btn-outline-secondary qnaAddBtn" type="submit">질문등록</button>
					</div>
				</c:if>
				