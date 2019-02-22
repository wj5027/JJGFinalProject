package com.kh.tsp.customer.model.service;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.kh.tsp.common.PageInfo;
import com.kh.tsp.customer.model.dao.BoardDao;
import com.kh.tsp.customer.model.exception.BoardSelectListException;
import com.kh.tsp.customer.model.vo.Board;
import com.kh.tsp.customer.model.vo.Reply;


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
	//후기 목록
	@Override
	public List<Board> selectReviewList(Board b) {

		return bd.selectReviewList(sqlSession, b);
	}
	//후기 작성
	@Override
	public int insertReview(Board b) {
		System.out.println("service b : "+b);
		return bd.insertReview(sqlSession, b);
	}
	
	//후기 상세보기
	@Override
	public Board selectOneReview(int bno) {
		Board b = null;
		
		//조회수 증가
		int result = bd.updateCount(sqlSession, bno);
		
		if(result > 0) {
			b = bd.selectOneReview(sqlSession, bno);
		}
		
		return b;
	}
	//후기 수정1
	@Override
	public Board updateReview(int bno) {
		
		return bd.updateReview(sqlSession, bno);
	}
	//후기 수정2
	@Override
	public int updateReview2(Board b) {
		
		return bd.updateReview2(sqlSession, b);
	}
	//후기 삭제
	@Override
	public int deleteReview(int bno) {
		
		return bd.deleteReview(sqlSession, bno);
	}
	//후기 전체 게시물 수
	@Override
	public int getListCount() {

		return bd.getListCount(sqlSession);
	}
	//페이징 처리 된 후기 목록
	@Override
	public ArrayList<Board> selectReviewList(PageInfo pi, int mno) {

		return bd.selectReviewList(sqlSession, pi, mno);
	}
	//공지 게시글 수 조회
	@Override
	public int getNoticeListCount() {
	
		return bd.getNoticeListCount(sqlSession);
	}
	//페이징 처리 된 공지 목록 조회
	@Override
	public ArrayList<Board> selectNoticeList(PageInfo pi) {

		return bd.selectNoticeList(sqlSession, pi);
	}
	//문의 전체 게시글 수 조회
	@Override
	public int getQnaListCount() {

		return bd.getQnaListCount(sqlSession);
	}
	//페이징 된 내 문의 목록 조회
	@Override
	public ArrayList<Board> selectQnaList(PageInfo pi, int mno) {
		
		return bd.selectQnaList(sqlSession, pi, mno);
	}
	//페이징처리 된 주차장 문의 게시판 목록 조회
	@Override
	public ArrayList<Board> selectParkingQnaList(PageInfo pi, String pno) {

		return bd.selectParkingQnaList(sqlSession, pi, pno);
	}

	//주차장 문의 상세보기
	@Override
	public Board selectOneParkingQna(int bno) {
		Board b = null;
		
		//조회수 증가
				int result = bd.updateCount(sqlSession, bno);
				
				if(result > 0) {
					b = bd.selectOneParkingQna(sqlSession, bno);
				}
				
				return b;
		
	}
	//페이징 처리된 주차장 후기 목록
	@Override
	public ArrayList<Board> selectParkingReviewList(PageInfo pi, String pno) {

		return bd.selectParkingReviewList(sqlSession, pi, pno);
	}
	//주차장 후기 상세보기
	@Override
	public Board selectOneParkingReview(int bno) {
		Board b = null;
		
		//조회수 증가
		int result = bd.updateCount(sqlSession, bno);
				
		if(result > 0) {
			b = bd.selectOneParkingReview(sqlSession, bno);
		}
				
		return b;
	}
	//주차장 후기 등록
	@Override
	public int insertParkingReview(Board b) {
		System.out.println("service b : "+b);
		
		return bd.insertParkingReview(sqlSession, b);
	}
	//주차장 후기 수정1
	@Override
	public Board updateParkingReview(int bno) {

		return bd.updateParkingReview(sqlSession, bno);
	}
	//주차장 후기 수정2
	@Override
	public int updateParkingReview2(Board b) {

		return bd.updateParkingReview2(sqlSession, b);
	}
	//주차장 문의 게시글 전체 수
	@Override
	public int getParkingQnaListCount(String pno) {

		return bd.getParkingQnaListCount(sqlSession, pno);
	}
	//주차장 후기 전체 게시글 수
	@Override
	public int getReviewListCount(String pno) {

		return bd.getParkingReviewListCount(sqlSession, pno);
	}
	//주차장 문의 등록
	@Override
	public int insertParkingQna(Board b) {

		return bd.insertParkingQna(sqlSession, b);

	}
	//내 후기 전체 게시글 수
	@Override
	public int getMyReviewListCount(int mno) {

		return bd.getMyReviewListCount(sqlSession, mno);
	}
	//내 문의 전체 게시글 수
	@Override
	public int getMyQnaListCount(int mno) {

		return bd.getMyQnaListCount(sqlSession, mno);
	}
	//주차장 문의 수정1(상세보기)
	@Override
	public Board updateParkingQna(int bno) {

		return  bd.updateParkingQna(sqlSession, bno);
	}
	//주차장 문의 수정2(등록)
	@Override
	public int updateParkingQna2(Board b) {

		return bd.updateParkingQna2(sqlSession, b);
	}
	//댓글
	@Override
	public ArrayList<Reply> selectReply(int bno) {

		return bd.selectReply(sqlSession, bno);
	}
	//사업자문의(주차장문의)댓글
	@Override
	public ArrayList<Reply> selectParkingReply(int bno) {

		return bd.selectParkingReply(sqlSession, bno);
	}
	//후기 댓글 조회
	@Override
	public ArrayList<Reply> selectReviewReply(int bno) {

		return bd.selectReviewList(sqlSession,  bno);
	}
	//후기 댓글 작성
	@Override
	public ArrayList<Reply> insertReply(Reply r) {
		ArrayList<Reply> replyList = null;
		
		int result =  bd.insertReply(sqlSession, r);
		
		if(result > 0) {
			replyList = bd.selectReviewList(sqlSession, r.getBoardNo());
		}
		
		return replyList;
	}
	//댓글 갯수
	@Override
	public int replyCnt(int bno) {

		return bd.replyCnt(sqlSession, bno);
	}
	
	
	
	
	

	
}
