package com.onechou.shop.board.freeboard;

import static org.junit.Assert.*;


import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.onechou.shop.MyJunitTest;
import com.onechou.shop.util.Pager;


public class FreeBoardDAOTest extends MyJunitTest{

	@Autowired
	private FreeBoardDAO freeBoardDAO;
	
	@Test
	public void listTest() throws Exception {
		Pager pager=new Pager();
		pager.setPage(5L);
		assertNotNull(freeBoardDAO.list(pager));
	}
	
	//@Test
	public void addTest() throws Exception{
		Pager pager=new Pager();
		pager.setPage(1L);
		int result=0;
			FreeBoardDTO freeBoardDTO = new FreeBoardDTO();
			
			
			result = freeBoardDAO.add(freeBoardDTO);
			

		assertNotEquals(result, 0);
	}

}
