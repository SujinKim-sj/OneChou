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
}
