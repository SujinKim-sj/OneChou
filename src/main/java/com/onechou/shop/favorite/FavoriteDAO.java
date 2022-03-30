package com.onechou.shop.favorite;



import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class FavoriteDAO {
	
	@Autowired
	private SqlSession sqlSession;
	private final String namespace="com.onechou.shop.favorite.FavoriteDAO.";
	
	public int add(FavoriteDTO favoriteDTO)throws Exception {
		return sqlSession.insert(namespace+"add", favoriteDTO);
	}
	public int noteAdd(CupnoteDTO cupnoteDTO)throws Exception{
		return sqlSession.insert(namespace+"noteAdd", cupnoteDTO);
	}
	public int update(FavoriteDTO favoriteDTO)throws Exception{
		return sqlSession.update(namespace+"update", favoriteDTO);
	}
	public int noteUpdate(CupnoteDTO cupnoteDTO)throws Exception{
		return sqlSession.update(namespace+"noteUpdate", cupnoteDTO);
	}

}
