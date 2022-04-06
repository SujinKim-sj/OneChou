package com.onechou.shop.roastery;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.onechou.shop.member.MemberDTO;
import com.onechou.shop.util.FileManager;

@Service
public class RoasteryService {

	@Autowired
	private RoasteryDAO roasteryDAO;

	@Autowired
	private FileManager fileManager;

	public boolean update(RoasteryDTO roasteryDTO, MultipartFile image) throws Exception {
		boolean check = true;
		
		if(roasteryDAO.update(roasteryDTO) < 1) {
			check = false;
		}
		
		if(image != null && check == true) {
			RoasteryFileDTO roasteryFileDTO = roasteryDTO.getRoasteryFileDTO();
			
			// 기존 파일 HDD에서 삭제
			fileManager.remove("resources/upload/roastery/", roasteryFileDTO.getFileName());
			
			// 수정 파일 HDD에 저장
			String fileName = fileManager.save(image, "resources/upload/roastery/");
			
			// DB 업데이트 처리
			roasteryFileDTO.setFileName(fileName);
			roasteryFileDTO.setOriName(image.getOriginalFilename());
			roasteryFileDTO.setRoasteryNum(roasteryDTO.getNum());
			
			if(roasteryDAO.updateFile(roasteryFileDTO) < 1) {
				check = false;
			}
			
		}
		
		return check;
	}
	
	public RoasteryDTO detail(RoasteryDTO roasteryDTO) throws Exception{
		return roasteryDAO.detail(roasteryDTO);
	}
	
	public RoasteryFileDTO file (RoasteryDTO roasteryDTO) throws Exception{
		return roasteryDAO.file(roasteryDTO);
	}
	
}
