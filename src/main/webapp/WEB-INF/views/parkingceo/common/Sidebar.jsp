<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
    <div class="sidebar" style="background: rgb(49, 49, 49) !important;">
      <!--
        Tip 1: You can change the color of the sidebar using: data-color="blue | green | orange | red"
    -->
      <div class="sidebar-wrapper">
        <div class="logo">
          <h3 align="center" style="margin-top:10px">사업자 페이지</h3>
          <div align="center" style="color: white;">
          [이름]님 환영합니다!
          </div>
          <br>
          <div align="center" style="color: white; font-size: 12px;">[현재오일]은 ㅇㅇㅇ입니다.</div>  
          <br>
        </div>
        <ul class="nav">
          <li class="active ">
            <a onclick="goMain();">
              <i class="tim-icons icon-components"></i>
              메인 페이지
            </a>
          </li>
          <li>
            <a href="./dashboard.jsp">
              <i class="tim-icons icon-alert-circle-exc"></i>
              정보 수정 신청
            </a>
          </li>
          <li>
            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
              <i class="tim-icons icon-chart-bar-32"></i>
              통계보기  
            </a>
	        <div align="right" class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
	          <a class="dropdown-item" href="#">오일 관리하기</a>
	          <a class="dropdown-item" href="#">입출차 내역</a>
	          <a class="dropdown-item" href="#">베스트 파커</a>
	        </div>
          </li>
          <li>
            <a href="./map.jsp">
              <i class="tim-icons icon-single-02"></i>
              현재 입차중인 회원
            </a>
          </li>
          <li>
            <a href="./notifications.jsp">
              <i class="tim-icons icon-gift-2"></i>
              쿠폰 신청
            </a>
          </li>
          <li>
            <a href="./notifications.jsp">
              <i class="tim-icons icon-tap-02"></i>
              환전 신청
            </a>
          </li>
          <li>
            <a href="./notifications.jsp">
              <i class="tim-icons icon-bus-front-12"></i>
              내 주차장
            </a>
          </li>
          <li>
            <a href="./notifications.jsp">
              <i class="tim-icons icon-bell-55"></i>
              쪽지함
            </a>
          </li>             
        </ul>
      </div>
    </div>