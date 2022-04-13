package com.onechou.shop.favorite;



import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class FavoriteDAO {
	
	@Autowired
	private SqlSession sqlSession;

	private final String namespace="com.onechou.shop.favorite.FavoriteDAO.";
	
	public int update(FavoriteDTO favoriteDTO) throws Exception{
		return sqlSession.update(namespace+"update", favoriteDTO);
	}
	
	public int deleteCupnote(FavoriteDTO favoriteDTO) throws Exception {
		return sqlSession.delete(namespace+"deleteCupnote", favoriteDTO);
	}
	
	public int addCupnote(CupnoteDTO cupnoteDTO) throws Exception {
		return sqlSession.insert(namespace+"addCupnote", cupnoteDTO);
	}

}
