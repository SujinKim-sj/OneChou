package com.onechou.shop.board;

import java.util.List;

import com.onechou.shop.util.Pager;

public interface BoardDAO {
	public List<BoardDTO> list(Pager pager)throws Exception;
	public BoardDTO detail(BoardDTO boardDTO) throws Exception;
	public int add(BoardDTO boardDTO) throws Exception;
	public int addFile(BoardDTO boardDTO) throws Exception;
	public int update(BoardDTO boardDTO) throws Exception;
	public int delete(BoardDTO boardDTO) throws Exception;
	public Long total(Pager pager) throws Exception;
}

