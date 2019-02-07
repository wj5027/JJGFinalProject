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
	//공지사항 수정1
	@Override
	public Board updateNotice(int bno) {
		
		return bd.updateNotice(sqlSession, bno);
	}
	//공지사항 수정2
	@Override
	public int updateNotice2(Board b) {
		System.out.println("service b: "+b);
		return bd.updateNotice2(sqlSession, b);
	}
	//공지사항 등록
	@Override
	public int insertNotice(Board b) {

		return bd.insertNotice(sqlSession, b);
	}
	//문의 목록
	@Override
	public List<Board> selectQnaList(Board b) {
		System.out.println("service b: "+b);
		return bd.selectQnaList(b);
	}
	//문의 등록
	@Override
	public int insertQna(Board b) {
	
		return bd.insertQna(sqlSession, b);
	}
	//문의 상세보기
	@Override
	public Board selectOneQna(int bno) {
		Board b = null;
		
		//조회수 증가
		int result = bd.updateCount(sqlSession, bno);
		
		if(result > 0) {
			b = bd.selectOneQna(sqlSession, bno);
		}
		
		return b;
	}
	//문의 수정
	@Override
	public Board updateQna(int bno) {
		
		return bd.updateQna(sqlSession, bno);
	}
	//문의 수정2
	@Override
	public int updateQna2(Board b) {
		
		return bd.updateQna2(sqlSession, b);
	}
	//문의 삭제
	@Override
	public int deleteQna(int bno) {
		
		return bd.deleteQna(sqlSession, bno);
	}
	
	

	
}
