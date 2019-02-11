package com.kh.tsp.admin.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.tsp.admin.model.exception.SelectBoardListException;
import com.kh.tsp.common.PageInfo;
import com.kh.tsp.customer.model.vo.Board;

@Repository
public class BoardAdminDaoImpl  implements BoardAdminDao{

	// 문의 게시판 수
	@Override
	public int getListCount(SqlSessionTemplate sqlSession) throws SelectBoardListException {
		int listCount = sqlSession.selectOne("BoardAdmin.getListCount");
		System.out.println("문의 게시판 수 : "+listCount);
		if(listCount <=0) {
			throw new SelectBoardListException("문의 게시판 수 조회 실패!");
		}
		return listCount;
	}

	// 문의 게시판 전체 리스트
	@Override
	public ArrayList<Board> selectBoardQnAList(SqlSessionTemplate sqlSession, PageInfo pi) throws SelectBoardListException {
		ArrayList<Board> list = null;
		int offset = (pi.getCurrentPage()-1)* pi.getLimit();	
		
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		list = (ArrayList)sqlSession.selectList("BoardAdmin.selectBoardQnAList", null, rowBounds);
		System.out.println("문의 게시판 전체 리스트 : "+list);
		if(list == null) {
			throw new SelectBoardListException("문의 게시판 전체 리스트 조회 실패");
		}
		return list;
	}

	// 문의 게시판 삭제
	@Override
	public int deleteBoardQnA(SqlSessionTemplate sqlSession, Board b) throws SelectBoardListException {

		int boardNo = b.getBno();
		System.out.println("boardNo : "+boardNo);
		
		int result = sqlSession.update("BoardAdmin.deleteBoardQnA", boardNo);
		System.out.println("result(DAO 삭제) : "+result);
		
		if(result<=0) {
			throw new SelectBoardListException("문의 게시판 삭제 실패!");
		}
		return result;
	}

	// 문의 게시판 복구
	@Override
	public int updateRecoverBoardQnA(SqlSessionTemplate sqlSession, Board b) throws SelectBoardListException {

		int boardNo = b.getBno();
		System.out.println("boardNo : "+boardNo);
		
		int result = sqlSession.update("BoardAdmin.updateRecoverBoardQnA", boardNo);
		System.out.println("result(DAO 복구) : "+result);
		
		if(result<=0) {
			throw new SelectBoardListException("문의 게시판 복구 실패!");
		}
		return result;
	}

	// 문의 게시판 검색 수
	@Override
	public int getSearchListCount(SqlSessionTemplate sqlSession, String mId, String bTitle, String today,
			String startDate, String endDate) throws SelectBoardListException {

		Map<String, Object> hmap = new HashMap<String, Object>();

		hmap.put("mId", mId);
		hmap.put("bTitle", bTitle);
		hmap.put("today", today);
		hmap.put("startDate", startDate);
		hmap.put("endDate", endDate);
		
		int listCount = sqlSession.selectOne("BoardAdmin.getSearchListCount", hmap);
		System.out.println("listCount DAO : "+listCount);
		return listCount;
	}

	// 문의 게시판 검색 리스트
	@Override
	public ArrayList<Board> selectSearchBoardQnAList(SqlSessionTemplate sqlSession, PageInfo pi, String mId,
			String bTitle, String today, String startDate, String endDate) throws SelectBoardListException {
		
		ArrayList<Board> list = null;
		
		int offset = (pi.getCurrentPage()-1)* pi.getLimit();			
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());

		System.out.println("mId DAO: "+mId);
		System.out.println("bTitle DAO: "+bTitle);
		System.out.println("today DAO: "+today);
		System.out.println("startDate DAO: "+startDate);
		System.out.println("endDate DAO: "+endDate);
		
		Map<String, Object> hmap = new HashMap();

		hmap.put("mId", mId);
		hmap.put("bTitle", bTitle);
		hmap.put("today", today);
		hmap.put("startDate", startDate);
		hmap.put("endDate", endDate);
		
		list = (ArrayList)sqlSession.selectList("BoardAdmin.selectSearchBoardQnAList", hmap, rowBounds);
		
		System.out.println("DAO list : "+list);

		return list;
	}

	// 문의 게시판 답변
	@Override
	public Board answerBoardQnA(SqlSessionTemplate sqlSession, Board b) throws SelectBoardListException {

		int bno = b.getBno();
		System.out.println("bno : "+bno);
		
		b = sqlSession.selectOne("BoardAdmin.answerBoardQnA", bno);
		System.out.println("result(DAO 문의 게시판 답변) : "+b);
		
		if(b==null) {
			throw new SelectBoardListException("특정 문의 게시판 불러오가 실패!");
		}
		return b;
	}

	// 답변 작성
	@Override
	public int insertAnswerBoard(SqlSessionTemplate sqlSession, String bno, String mno, String textareaId) throws SelectBoardListException {

		Map<String, Object> hmap = new HashMap();

		hmap.put("bno", bno);
		hmap.put("mno", mno);
		hmap.put("textareaId", textareaId);
		
		int result = sqlSession.insert("BoardAdmin.insertAnswerBoard", hmap);
		
		if(result<=0) {
			throw new SelectBoardListException("문의 게시판 답변 작성 실패!");
		}
		return result;
	}
	



}
