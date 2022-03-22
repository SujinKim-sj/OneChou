package com.onechou.shop.favorite;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class FavoriteService {

	@Autowired
	private FavoriteDAO favoriteDAO;
	
	public int add(FavoriteDTO favoriteDTO,String noteName)throws Exception{
		int result = favoriteDAO.add(favoriteDTO);
		String [] noteNames = noteName.split(" ");
		for(int i=0;i<noteNames.length;i++) {
			
			CupnoteDTO cupnoteDTO = new CupnoteDTO();
			cupnoteDTO.setFavoriteNum(favoriteDTO.getNum());
			cupnoteDTO.setNoteName(noteNames[i]);
			result = favoriteDAO.noteAdd(cupnoteDTO);
		}
		return result;
	}

	
}
