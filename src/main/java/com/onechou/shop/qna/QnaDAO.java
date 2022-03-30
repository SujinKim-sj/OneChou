package com.onechou.shop.qna;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.onechou.shop.product.ProductDTO;

@Repository
public class QnaDAO {

	@Autowired
	private SqlSession sqlSession;
	
	private final String NAMESPACE = "com.onechou.shop.qna.QnaDAO.";
	
	public int add(QnaDTO qnaDTO) throws Exception {
		return sqlSession.insert(NAMESPACE+"add", qnaDTO);
	}
	
	public QnaDTO detail(QnaDTO qnaDTO) throws Exception {
		return sqlSession.selectOne(NAMESPACE+"detail", qnaDTO);
	}
	
	public int stepUpdate(QnaDTO qnaDTO) throws Exception {
		return sqlSession.update(NAMESPACE+"stepUpdate", qnaDTO);
	}
	
	public int reply(QnaDTO qnaDTO) throws Exception {
		return sqlSession.insert(NAMESPACE+"reply", qnaDTO);
	}
	
	public int deleteAll(QnaDTO qnaDTO) throws Exception {
		return sqlSession.delete(NAMESPACE+"deleteAll", qnaDTO);
	}
	
	public int deleteReply(QnaDTO qnaDTO) throws Exception {
		return sqlSession.delete(NAMESPACE+"deleteReply", qnaDTO);
	}
	
	public List<QnaDTO> list(ProductDTO productDTO) throws Exception {
		return sqlSession.selectList(NAMESPACE+"list", productDTO);
	}
	
	public Long verifyDuplicated(HashMap<String, Object> hashMap) throws Exception {
		return sqlSession.selectOne(NAMESPACE+"verifyDuplicated", hashMap);
	}
	
	public int update(QnaDTO qnaDTO) throws Exception {
		return sqlSession.update(NAMESPACE+"update", qnaDTO);
	}
}
