package com.onechou.shop.favorite;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.onechou.shop.member.MemberDTO;

@Service
public class FavoriteService {

	@Autowired
	private FavoriteDAO favoriteDAO;
	
	public int update(FavoriteDTO favoriteDTO)throws Exception{
		return favoriteDAO.update(favoriteDTO);
	}
	
	public int noteUpdate(CupnoteDTO cupnoteDTO) throws Exception{
		return favoriteDAO.noteUpdate(cupnoteDTO);
	}
	public FavoriteDTO detail (FavoriteDTO favoriteDTO) throws Exception{
		return favoriteDAO.detail(favoriteDTO);
	}
	public List<CupnoteDTO> noteList(FavoriteDTO favoriteDTO) throws Exception{
		return favoriteDAO.noteList(favoriteDTO);
	}
	

}
