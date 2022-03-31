<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
									<tr style="border-top : 3px solid Gainsboro; border-left: 3px solid Gainsboro; border-right: 3px solid Gainsboro;">
										<td class="text-center" colspan="10">답글 목록 (총 ${replyCount}개)</td>
									</tr>
									<c:forEach items="${qnaDTOs}" var="qnaDTO">
									<tr style="border-left: 3px solid Gainsboro; border-right: 3px solid Gainsboro;">
								  		<td>${qnaDTO.writer}</td>
										<td class="text-wrap" id="qnaContents${qnaDTO.num}" colspan="5" style="width:45%">
											<c:forEach begin="1" end="${qnaDTO.depth}">└───</c:forEach>
											${qnaDTO.contents}
										</td>
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
								  	<tr style="border-bottom : 3px solid Gainsboro;"></tr>
								  	