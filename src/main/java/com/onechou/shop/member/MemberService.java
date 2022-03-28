package com.onechou.shop.member;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.onechou.shop.favorite.CupnoteDTO;
import com.onechou.shop.favorite.FavoriteDTO;

@Service
public class MemberService {
	
	@Autowired
	private MemberDAO memberDAO;
	
	public MemberDTO login(MemberDTO memberDTO) throws Exception {
		return memberDAO.login(memberDTO);
	}
	public int join(MemberDTO memberDTO) throws Exception{
		return memberDAO.join(memberDTO);
	}
	public int update(MemberDTO memberDTO) throws Exception{
		return memberDAO.update(memberDTO);
	}
	public MemberDTO mypage(MemberDTO memberDTO) throws Exception{
		return memberDAO.mypage(memberDTO);
	}
	public FavoriteDTO normal(MemberDTO memberDTO) throws Exception{
		return memberDAO.normal(memberDTO);
	}
	
	public List<CupnoteDTO> cupnote(FavoriteDTO favoriteDTO) throws Exception{
		return memberDAO.cupnote(favoriteDTO);
	}

	
}
