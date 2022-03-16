package com.onechou.shop.board.freeboard;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.onechou.shop.board.BoardDAO;
import com.onechou.shop.board.BoardDTO;
import com.onechou.shop.util.Pager;

@Repository
public class FreeBoardDAO implements BoardDAO{
	
	@Autowired
	private SqlSession sqlSession;
	private final String namespace="com.onechou.shop.board.freeboard.FreeBoardDAO.";
	
	@Override
	public List<BoardDTO> list(Pager pager) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+"list", pager);
	}

	@Override
	public BoardDTO detail(BoardDTO boardDTO) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+"detail", boardDTO);
	}

	@Override
	public int add(BoardDTO boardDTO) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.insert(namespace+"add", boardDTO);
	}

	@Override
	public int addFile(BoardDTO boardDTO) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.insert(namespace+"addFile", boardDTO);
	}

	@Override
	public int update(BoardDTO boardDTO) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.update(namespace+"update", boardDTO);
	}

	@Override
	public int delete(BoardDTO boardDTO) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.delete(namespace+"delete", boardDTO);
	}

	@Override
	public Long total(Pager pager) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+"total",pager);
	}
	public List<FreeReplyDTO> replyList(Pager pager)throws Exception{
		return sqlSession.selectList(namespace+"replyList", pager);
	}
	public int replyAdd(FreeReplyDTO freeReplyDTO)throws Exception{
		return sqlSession.insert(namespace+"replyAdd", freeReplyDTO);
	}
	public int replyUpdate(FreeReplyDTO freeReplyDTO)throws Exception{
		return sqlSession.update(namespace+"replyUpdate", freeReplyDTO);
	}
	public int replyDelete(FreeReplyDTO freeReplyDTO)throws Exception{
		return sqlSession.delete(namespace+"replyDelete", freeReplyDTO);
	}
	public Long replyTotal(Pager pager) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+"replyTotal",pager);
	}

}
