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
}
