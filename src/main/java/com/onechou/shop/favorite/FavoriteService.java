package com.onechou.shop.favorite;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.onechou.shop.member.MemberDTO;

@Service
public class FavoriteService {

	@Autowired
	private FavoriteDAO favoriteDAO;
	
	public boolean update(FavoriteDTO favoriteDTO) throws Exception{
		boolean check = true;
		
		if(favoriteDAO.update(favoriteDTO) < 1) {
			check = false;
		}
		
		if(favoriteDAO.deleteCupnote(favoriteDTO) < 1) {
			check = false;
		}
		
		List<CupnoteDTO> cupnoteDTOs = favoriteDTO.getCupnoteDTOs();
		for(int i=0;i<cupnoteDTOs.size();i++) {
			CupnoteDTO cupnoteDTO = cupnoteDTOs.get(i);
			cupnoteDTO.setFavoriteNum(favoriteDTO.getNum());
			if(favoriteDAO.addCupnote(cupnoteDTO) < 1) {
				check = false;
			}
		}
		
		return check;
	}

}
