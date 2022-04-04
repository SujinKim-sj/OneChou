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

	public int update(RoasteryDTO roasteryDTO, MultipartFile file) throws Exception {
		int result = roasteryDAO.update(roasteryDTO);
		if(file.getSize()!=0) {
		String path = "resources/upload/roastery/";
		String fileName = fileManager.save(file, path);
		RoasteryFileDTO roasteryFileDTO = new RoasteryFileDTO();
		roasteryFileDTO.setFileName(fileName);
		roasteryFileDTO.setOriName(file.getOriginalFilename());
		roasteryFileDTO.setRoasteryNum(roasteryDTO.getNum());
		roasteryDTO.setRoasteryFileDTO(roasteryFileDTO);
		result = roasteryDAO.updateFile(roasteryFileDTO);
		}
		return result;
	}
	
	public RoasteryDTO detail(MemberDTO memberDTO) throws Exception{
		return roasteryDAO.detail(memberDTO);
	}
	
	public RoasteryFileDTO file (RoasteryDTO roasteryDTO) throws Exception{
		return roasteryDAO.file(roasteryDTO);
	}
	
}
