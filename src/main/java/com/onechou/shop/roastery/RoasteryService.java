package com.onechou.shop.roastery;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class RoasteryService {
	
	@Autowired
	private RoasteryDAO roasteryDAO;
	
	public int add(RoasteryDTO roasteryDTO)throws Exception{
		return roasteryDAO.add(roasteryDTO);
	};
	
	
}
