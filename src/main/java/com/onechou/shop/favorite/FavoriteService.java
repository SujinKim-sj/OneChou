package com.onechou.shop.favorite;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.onechou.shop.member.MemberDTO;

@Service
public class FavoriteService {

	@Autowired
	private FavoriteDAO favoriteDAO;
	
	public int add(FavoriteDTO favoriteDTO)throws Exception{
		int result = favoriteDAO.add(favoriteDTO);

		return result;
	}
	public int noteAdd(CupnoteDTO cupnoteDTO)throws Exception{
		return favoriteDAO.noteAdd(cupnoteDTO);
	}
	public int update(FavoriteDTO favoriteDTO)throws Exception{
		return favoriteDAO.update(favoriteDTO);
	}
	public int noteUpdate(CupnoteDTO cupnoteDTO) throws Exception{
		return favoriteDAO.noteUpdate(cupnoteDTO);
	}


}
