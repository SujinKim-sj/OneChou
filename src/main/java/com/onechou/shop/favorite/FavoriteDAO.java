package com.onechou.shop.favorite;



import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.onechou.shop.member.MemberDTO;

@Repository
public class FavoriteDAO {
	
	@Autowired
	private SqlSession sqlSession;

	private final String namespace="com.onechou.shop.favorite.FavoriteDAO.";
	
	public int update(FavoriteDTO favoriteDTO)throws Exception{
		return sqlSession.update(namespace+"update", favoriteDTO);
	}
	
	public int noteUpdate(CupnoteDTO cupnoteDTO)throws Exception{
		return sqlSession.update(namespace+"noteUpdate", cupnoteDTO);
	}
	public FavoriteDTO detail(FavoriteDTO favoriteDTO) throws Exception{
		return sqlSession.selectOne(namespace+"detail",favoriteDTO);
	}
	public List<CupnoteDTO> noteList(FavoriteDTO favoriteDTO) throws Exception{
		return sqlSession.selectList(namespace+"noteList",favoriteDTO);
	}


}
