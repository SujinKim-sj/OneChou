package com.onechou.shop.member;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.onechou.shop.favorite.CupnoteDTO;
import com.onechou.shop.favorite.FavoriteDTO;
import com.onechou.shop.roastery.RoasteryDTO;
import com.onechou.shop.roastery.RoasteryFileDTO;
import com.onechou.shop.util.FileManager;

@Service
public class MemberService {
	
	@Autowired
	private MemberDAO memberDAO;
	
	@Autowired
	private FileManager fileManager;
	
	public MemberDTO login(MemberDTO memberDTO) throws Exception {
		return memberDAO.login(memberDTO);
	}

	public boolean join(MemberDTO memberDTO, MultipartFile image) throws Exception{
		boolean check = true;
		
		// MEMBER 테이블에 데이터 삽입
		if(memberDAO.addMember(memberDTO) < 1) {
			check = false;
		}
		
		if(memberDTO.getKind() == 1) { // 로스터리 회원인 경우
			// ROASTERY 테이블에 데이터 삽입
			RoasteryDTO roasteryDTO = memberDTO.getRoasteryDTO();
			roasteryDTO.setMemberId(memberDTO.getId());
			if(memberDAO.addRoastery(roasteryDTO) < 1) {
				check = false;
			}
			
			// ROASTERYFILE 테이블에 데이터 삽입
			String fileName = fileManager.save(image, "resources/upload/roastery/");
			RoasteryFileDTO roasteryFileDTO = new RoasteryFileDTO();
			roasteryFileDTO.setFileName(fileName);
			roasteryFileDTO.setOriName(image.getOriginalFilename());
			roasteryFileDTO.setRoasteryNum(roasteryDTO.getNum());
			
			if(memberDAO.addRoasteryFile(roasteryFileDTO) < 1) {
				check = false;
			}
			
		} else { // 일반 회원인 경우
			// FAVORITE 테이블에 데이터 삽입
			FavoriteDTO favoriteDTO = memberDTO.getFavoriteDTO();
			favoriteDTO.setMemberId(memberDTO.getId());
			
			if(memberDAO.addFavorite(favoriteDTO) < 1) {
				check = false;
			}
			
			// CUPNOTE 테이블에 데이터 삽입
			List<CupnoteDTO> cupnoteDTOs = favoriteDTO.getCupnoteDTOs();
			
			for(int i=0;i<cupnoteDTOs.size();i++) {
				CupnoteDTO cupnoteDTO = cupnoteDTOs.get(i);
				cupnoteDTO.setFavoriteNum(favoriteDTO.getNum());
				if(memberDAO.addCupnote(cupnoteDTO) < 1) {
					check = false;
				}
			}
		}

		return check;
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
	
	public Long phoneDuplicateCheck(MemberDTO memberDTO) throws Exception {
		return memberDAO.phoneDuplicateCheck(memberDTO);
	}
	
	public Long roasteryNameDuplicateCheck(RoasteryDTO roasteryDTO) throws Exception {
		return memberDAO.roasteryNameDuplicateCheck(roasteryDTO);
	}
	
	public int update(MemberDTO memberDTO) throws Exception{
		return memberDAO.update(memberDTO);
	}
	
	public MemberDTO genenalMemberMypage(MemberDTO memberDTO) throws Exception {
		return memberDAO.genenalMemberMypage(memberDTO);
	}
	
	public MemberDTO roasteryMemberMypage(MemberDTO memberDTO) throws Exception {
		return memberDAO.roasteryMemberMypage(memberDTO);
	}

	public MemberDTO memberDetail(MemberDTO memberDTO) throws Exception {
		return memberDAO.memberDetail(memberDTO);
	}
	
	public int updatePw(MemberDTO memberDTO) throws Exception {
		return memberDAO.updatePw(memberDTO);
	}
}
