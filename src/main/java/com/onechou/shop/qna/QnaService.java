package com.onechou.shop.qna;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.onechou.shop.member.MemberDTO;
import com.onechou.shop.product.ProductDTO;
import com.onechou.shop.util.Pager;

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
	
	public List<QnaDTO> list(ProductDTO productDTO, Pager pager) throws Exception {
		HashMap<String, Object> hashMap = new HashMap<String, Object>();
		
		pager.setPerPage(10L);
		pager.makeRow();
		pager.makeNum(qnaDAO.getTotal(productDTO));
		
		hashMap.put("num", productDTO.getNum());
		hashMap.put("startRow", pager.getStartRow());
		hashMap.put("lastRow", pager.getLastRow());
		
		return qnaDAO.list(hashMap);
	}
	
	public Long verifyDuplicated(ProductDTO productDTO, MemberDTO memberDTO) throws Exception {
		HashMap<String, Object> hashMap = new HashMap<String, Object>();
		
		hashMap.put("num", productDTO.getNum());
		hashMap.put("memberId", memberDTO.getId());
		
		return qnaDAO.verifyDuplicated(hashMap);
	}
	
	public int update(QnaDTO qnaDTO) throws Exception {
		return qnaDAO.update(qnaDTO);
	}
	
	public List<QnaDTO> replyList(QnaDTO qnaDTO) throws Exception {
		return qnaDAO.replyList(qnaDTO);
	}
}
