package com.onechou.shop.roastery;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.onechou.shop.member.MemberDTO;

@Repository
public class RoasteryDAO {
	
	@Autowired
	private SqlSession sqlSession;
	private final String namespace="com.onechou.shop.roastery.RoasteryDAO.";
	
	public int update(RoasteryDTO roasteryDTO) throws Exception {
		return sqlSession.update(namespace+"update", roasteryDTO);
	}
	
	public int updateFile(RoasteryFileDTO roasteryFileDTO)throws Exception{
		return sqlSession.update(namespace+"updateFile",roasteryFileDTO);
	}
	
	public RoasteryFileDTO file(RoasteryDTO roasteryDTO) throws Exception{
		return sqlSession.selectOne(namespace+"file", roasteryDTO);
	}
	
	public RoasteryDTO detail(RoasteryDTO roasteryDTO) throws Exception {
		return sqlSession.selectOne(namespace+"detail", roasteryDTO);
	}

	
}
