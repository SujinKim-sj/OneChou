package com.onechou.shop.favorite;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class FavoriteService {

	@Autowired
	private FavoriteDAO favoriteDAO;
	
	public int add(FavoriteDTO favoriteDTO)throws Exception{
		int result = favoriteDAO.add(favoriteDTO);

		return result;
	}

	
}
