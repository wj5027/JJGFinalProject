package com.kh.tsp.customer.model.service;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.kh.tsp.customer.model.dao.BoardDao;
import com.kh.tsp.customer.model.exception.BoardSelectListException;
import com.kh.tsp.customer.model.vo.Board;


@Service
public class BoardServiceImpl implements BoardService {
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private BoardDao bd;
	

	//공지사항 리스트	
	@Override
	public List<Board> selectNoticeList(Board b) {
		
		return bd.selectNoticeList(b);
	}

	//공지사항 상세보기
	@Override
	public Board selectOneNotice(int bno) {
		Board b = null;
		
		//조회수 증가
		int result = bd.updateCount(sqlSession, bno);
		
		if(result > 0) {
			b = bd.selectOneNotice(sqlSession, bno);
		}
		
		return b;
	}
	//공지사항 삭제
	@Override
	public int deleteNotice(int bno) {
		
		
		return bd.deleteNotice(sqlSession, bno);
	}
	
	

	
}
