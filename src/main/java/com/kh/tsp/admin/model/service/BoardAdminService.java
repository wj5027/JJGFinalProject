package com.kh.tsp.admin.model.service;

import java.util.ArrayList;

import com.kh.tsp.admin.model.exception.SelectBoardListException;
import com.kh.tsp.common.PageInfo;
import com.kh.tsp.customer.model.vo.Board;

public interface BoardAdminService {

	// 문의 게시판 수
	int getListCount() throws SelectBoardListException;

	// 문의 게시판 전체 리스트
	ArrayList<Board> selectBoardQnAList(PageInfo pi) throws SelectBoardListException;

}
