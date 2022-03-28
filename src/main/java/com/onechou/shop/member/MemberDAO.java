package com.onechou.shop.member;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.onechou.shop.favorite.CupnoteDTO;
import com.onechou.shop.favorite.FavoriteDTO;


@Repository
public class MemberDAO {
	
	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE="com.onechou.shop.member.MemberDAO.";
	
	public MemberDTO login(MemberDTO memberDTO) throws Exception {
		return sqlSession.selectOne(NAMESPACE + "login", memberDTO);
	}
	
	public int join(MemberDTO memberDTO) throws Exception{
		return sqlSession.insert(NAMESPACE+"join", memberDTO);
	}
	
	public MemberDTO mypage(MemberDTO memberDTO) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"mypage", memberDTO);
	}
	
	public int update(MemberDTO memberDTO) throws Exception{
		return sqlSession.update(NAMESPACE+"update", memberDTO);
	}
	public FavoriteDTO normal(MemberDTO memberDTO)throws Exception{
		return sqlSession.selectOne(NAMESPACE+"normal", memberDTO);
	}
	public List<CupnoteDTO> cupnote(FavoriteDTO favoriteDTO) throws Exception{
		return sqlSession.selectList(NAMESPACE+"cupnote",favoriteDTO);
	}

}
