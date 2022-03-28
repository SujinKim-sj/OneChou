package com.onechou.shop.roastery;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.onechou.shop.util.FileManager;

@Service
public class RoasteryService {

	@Autowired
	private RoasteryDAO roasteryDAO;

	@Autowired
	private FileManager fileManager;

	public int add(RoasteryDTO roasteryDTO, MultipartFile file) throws Exception {
		int result = roasteryDAO.add(roasteryDTO);

		String fileName = fileManager.save(file, "resources/upload/roastery/");
		RoasteryFileDTO roasteryFileDTO = new RoasteryFileDTO();
		roasteryFileDTO.setFileName(fileName);
		roasteryFileDTO.setOriName(file.getOriginalFilename());
		roasteryFileDTO.setRoasteryNum(roasteryDTO.getNum());
		result = roasteryDAO.addFile(roasteryFileDTO);

		return result;
	};

}
