package com.onechou.shop.roastery;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class RoasteryDAO {
	
	@Autowired
	private SqlSession sqlSession;
	private final String namespace="com.onechou.shop.roastery.RoasteryDAO.";
	
	
	public int add(RoasteryDTO roasteryDTO) throws Exception {
		return sqlSession.insert(namespace+"add", roasteryDTO);
	}
	
	public int addFile(RoasteryFileDTO roasteryFileDTO)throws Exception{
		return sqlSession.insert(namespace+"addFile",roasteryFileDTO);
	}

	
}
