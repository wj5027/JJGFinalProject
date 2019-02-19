package com.kh.tsp.customer.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;

import com.kh.tsp.common.PageInfo;
import com.kh.tsp.customer.model.exception.BoardSelectListException;
import com.kh.tsp.customer.model.vo.Board;

@Repository
public class BoardDaoImpl implements BoardDao{
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	//공지사항 리스트 
	@Override
	public List<Board> selectNoticeList(Board b) {
		
		return sqlSession.selectList("boardList", b);
	}
	//조회수 업데이트
	@Override
	public int updateCount(SqlSessionTemplate sqlSession, int bno) {
		
		
		return sqlSession.update("Board.updateBoardCount", bno);
	}
	//공지사항 상세보기
	@Override
	public Board selectOneNotice(SqlSessionTemplate sqlSession, int bno) {
		
		return sqlSession.selectOne("Board.selectOneNotice", bno);
	}
	//공지사항 삭제
	@Override
	public int deleteNotice(SqlSessionTemplate sqlSession, int bno) {
		return sqlSession.delete("Board.deleteNotice", bno);
	}
	//공지사항 수정1
	@Override
	public Board updateNotice(SqlSessionTemplate sqlSession, int bno) {
		
		return sqlSession.selectOne("Board.updateNotice", bno);
	}
	//공지사항 수정2
	@Override
	public int updateNotice2(SqlSessionTemplate sqlSession, Board b) {
		System.out.println("dao Impl b"+b);
		return sqlSession.update("Board.updateNotice2", b);
	}
	//공지사항 등록
	@Override
	public int insertNotice(SqlSessionTemplate sqlSession, Board b) {
		
		return sqlSession.insert("Board.insertNotice", b);
	}
	//문의 목록
	@Override
	public List<Board> selectQnaList(Board b) {
		System.out.println("dao b: "+b);
		return sqlSession.selectList("selectQnaList", b);
	}
	//문의 등록
	@Override
	public int insertQna(SqlSessionTemplate sqlSession, Board b) {

		return sqlSession.insert("Board.insertQna", b);
	}
	//문의 상세보기
	@Override
	public Board selectOneQna(SqlSessionTemplate sqlSession, int bno) {
		
		return sqlSession.selectOne("Board.selectOneQna", bno);
	}
	//문의 수정1
	@Override
	public Board updateQna(SqlSessionTemplate sqlSession, int bno) {
		
		return sqlSession.selectOne("Board.updateQna", bno);
	}
	//문의 수정2
	@Override
	public int updateQna2(SqlSessionTemplate sqlSession, Board b) {
		
		return sqlSession.update("Board.updateQna2", b);
	}
	//문의 삭제
	@Override
	public int deleteQna(SqlSessionTemplate sqlSession, int bno) {
		
		return sqlSession.delete("Board.deleteQna", bno);
	}
	//후기 목록
	@Override
	public List<Board> selectReviewList(SqlSessionTemplate sqlSession, Board b) {

		return sqlSession.selectList("selectReviewList", b);
	}
	//후기 작성
	@Override
	public int insertReview(SqlSessionTemplate sqlSession, Board b) {
		System.out.println("dao b: "+b);
		return sqlSession.insert("Board.insertReview", b);
	}
	//후기 상세보기
	@Override
	public Board selectOneReview(SqlSessionTemplate sqlSession, int bno) {
		
		return sqlSession.selectOne("Board.selectOneReview", bno);

	}
	//후기 수정1
	@Override
	public Board updateReview(SqlSessionTemplate sqlSession, int bno) {
		
		return sqlSession.selectOne("Board.updateReview", bno);
	}
	//후기 수정2
	@Override
	public int updateReview2(SqlSessionTemplate sqlSession, Board b) {
			
		return sqlSession.update("Board.updateReview2", b);
	}
	//후기 삭제
	@Override
	public int deleteReview(SqlSessionTemplate sqlSession, int bno) {

		return sqlSession.update("Board.deleteReview", bno);
	}
	//후기 전체 게시글 수 조회
	@Override
	public int getListCount(SqlSessionTemplate sqlSession) {

		return sqlSession.selectOne("Board.selectListCount");
	}
	//페이징 처리 된 후기 목록 조회
	@Override
	public ArrayList<Board> selectReviewList(SqlSessionTemplate sqlSession, PageInfo pi) {
		ArrayList<Board> list = null;
		
		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();
		//몇 개의 게시물을 건너뛰고 조회할지에 대한 변수(ex.2p면 10개의 게시물을 건너뛰고 조회해야함 11번째부터)

		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		
		return (ArrayList)sqlSession.selectList("Board.selectReviewList", null, rowBounds);
	}
	//공지 전체 게시글 수 조회
	@Override
	public int getNoticeListCount(SqlSessionTemplate sqlSession) {
	
		return sqlSession.selectOne("Board.selectNoticeListCount");
	}
	//페이징 처리 된 공지 목록 조회
	@Override
	public ArrayList<Board> selectNoticeList(SqlSessionTemplate sqlSession, PageInfo pi) {
		ArrayList<Board> list = null;
		
		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();

		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		
		return (ArrayList)sqlSession.selectList("Board.boardList", null, rowBounds);
	}
	//문의 전체 게시글 수 조회
	@Override
	public int getQnaListCount(SqlSessionTemplate sqlSession) {

		return sqlSession.selectOne("Board.selectQnaListCount");
	}
	//페이징 처리 된 문의 목록 조회
	@Override
	public ArrayList<Board> selectQnaList(SqlSessionTemplate sqlSession, PageInfo pi) {
		ArrayList<Board> list = null;
		
		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();

		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		
		return (ArrayList)sqlSession.selectList("Board.selectQnaList", null, rowBounds);
	}

	//페이징 처리된 주차장 문의 게시판 목록 조회
	@Override
	public ArrayList<Board> selectParkingQnaList(SqlSessionTemplate sqlSession, PageInfo pi) {
		ArrayList<Board> list = null;
		
		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();

		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		
		return (ArrayList)sqlSession.selectList("Board.selectParkingQnaList", null, rowBounds);
	}
	//주차장 문의 상세보기
	@Override
	public Board selectOneParkingQna(SqlSessionTemplate sqlSession, int bno) {

		return sqlSession.selectOne("Board.selectOneParkingQna", bno);
	}
	
	
	
	
	
	

}
