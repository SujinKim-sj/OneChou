package com.onechou.shop.product;

import static org.junit.Assert.*;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.onechou.shop.MyJunitTest;

public class ProductDAOTest extends MyJunitTest {

	@Autowired
	private ProductDAO productDAO;
	
	@Test
	public void test() {
		assertNotNull(productDAO);
	}

}
