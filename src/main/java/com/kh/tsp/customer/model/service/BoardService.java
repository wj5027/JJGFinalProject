package com.kh.tsp.customer.model.service;


import java.util.ArrayList;
import java.util.List;

import org.springframework.ui.Model;

import com.kh.tsp.customer.model.exception.BoardSelectListException;
import com.kh.tsp.customer.model.vo.Board;

public interface BoardService {
	//공지사항 리스트
	List<Board> selectNoticeList(Board b);
	//공지사항 상세보기
	Board selectOneNotice(int bno);
	//공지사항 삭제
	int deleteNotice(int bno);
	
	
	
	

}
