package com.onechou.shop.member;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.onechou.shop.favorite.CupnoteDTO;
import com.onechou.shop.favorite.FavoriteDTO;
import com.onechou.shop.roastery.RoasteryDTO;
import com.onechou.shop.roastery.RoasteryFileDTO;

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
	
	public Long idDuplicateCheck(MemberDTO memberDTO) throws Exception {
		return memberDAO.idDuplicateCheck(memberDTO);
	}
	
	public Long nicknameDuplicateCheck(MemberDTO memberDTO) throws Exception {
		return memberDAO.nicknameDuplicateCheck(memberDTO);
	}
	public Long emailDuplicateCheck(MemberDTO memberDTO) throws Exception {
		return memberDAO.emailDuplicateCheck(memberDTO);
	}
	
	public int update(MemberDTO memberDTO) throws Exception{
		return memberDAO.update(memberDTO);
	}
	public MemberDTO mypage(MemberDTO memberDTO) throws Exception{
		return memberDAO.mypage(memberDTO);
	}
	public FavoriteDTO favoriteDetail(MemberDTO memberDTO) throws Exception{
		return memberDAO.favoriteDetail(memberDTO);
	}
	public List<CupnoteDTO> noteDetail(FavoriteDTO favoriteDTO) throws Exception{
		return memberDAO.noteDetail(favoriteDTO);
	}
	public RoasteryDTO roasteryDetail(MemberDTO memberDTO) throws Exception{
		return memberDAO.roasteryDetail(memberDTO);
	}
	public RoasteryFileDTO roasteryFile(RoasteryDTO roasteryDTO) throws Exception{
		return memberDAO.roasteryFile(roasteryDTO);
	}

	
}
