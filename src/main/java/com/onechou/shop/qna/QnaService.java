package com.onechou.shop.qna;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class QnaService {

	@Autowired
	private QnaDAO qnaDAO;
	
	public int add(QnaDTO qnaDTO) throws Exception {
		return qnaDAO.add(qnaDTO);
	}
	
	public QnaDTO detail(QnaDTO qnaDTO) throws Exception {
		return qnaDAO.detail(qnaDTO);
	}
	
	public int reply(QnaDTO qnaDTO) throws Exception {
		QnaDTO parentQna = qnaDAO.detail(qnaDTO);
		
		qnaDTO.setRef(parentQna.getRef());
		qnaDTO.setStep(parentQna.getStep()+1);
		qnaDTO.setDepth(parentQna.getDepth()+1);
		
		qnaDAO.stepUpdate(parentQna);
		
		return qnaDAO.reply(qnaDTO);
	}
	
	public int delete(QnaDTO qnaDTO) throws Exception {
		qnaDTO = qnaDAO.detail(qnaDTO);
		
		int result = 0;
		
		// 질문글이 부모글일 경우에는 답변글까지 삭제하도록
		if(qnaDTO.getStep()==0) {
			result = qnaDAO.deleteAll(qnaDTO);
		} else { // 질문글이 답변글인 경우 그 글만 삭제하도록
			result = qnaDAO.deleteReply(qnaDTO);
		}
		
		return result;
	}
}
