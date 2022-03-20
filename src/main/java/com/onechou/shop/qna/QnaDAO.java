package com.onechou.shop.qna;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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
}
