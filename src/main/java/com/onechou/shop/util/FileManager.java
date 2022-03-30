package com.onechou.shop.util;

import java.io.File;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

@Component
public class FileManager {

	@Autowired
	private ServletContext servletContext;
	
	public String save(MultipartFile multipartFile, String path) throws Exception {
		
		String realPath = servletContext.getRealPath(path);
		System.out.println(realPath);
		
		File file = new File(realPath);
		if(!file.exists()) {
			file.mkdirs();
		}
		
		String oriName = multipartFile.getOriginalFilename();
		String uuId = UUID.randomUUID().toString();
		String fileName = uuId + "_" + oriName;
		
		file = new File(realPath, fileName);
		FileCopyUtils.copy(multipartFile.getBytes(), file);
		
		return fileName;
		
	}
	public boolean remove(String path,String fileName) throws Exception {
		path = servletContext.getRealPath(path);
		File file = new File(path,fileName);
		return file.delete();
		
	}
}
