<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE>
    <div class="sidebar" style="background: rgb(49, 49, 49) !important;">
      <!--
        Tip 1: You can change the color of the sidebar using: data-color="blue | green | orange | red"
    -->
      <div class="sidebar-wrapper">
        <div class="logo">
          <h3 align="center" style="margin-top:10px">사업자 페이지</h3>
          <c:if test="${not empty loginUser }">
          <div align="center" style="color: white;">
         ${loginUser.member_name }님 환영합니다!
          </div>
          <br>
          <div align="center" style="color: white; font-size: 12px;">현재오일은 ${loginUser.oil }오일 입니다.</div>  
          <br>
          </c:if>
        </div>
          
        <ul class="nav">
        <c:if test="${not empty loginUser }">
          <li class="active">
            <a onclick="goMain();">
              <i class="tim-icons icon-components"></i>
              메인 페이지
            </a>
          </li>
          <li>
            <a onclick="goExchangePage();">
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
	          <a class="dropdown-item" onclick="goOilStatisticsPage();" style="cursor: pointer;">오일 통계</a>
	          <a class="dropdown-item" onclick="goParkingListStatisticsPage();" style="cursor: pointer;">입/출차 통계</a>
	          <a class="dropdown-item" onclick="goBestPakerStatisticsPage();" style="cursor: pointer;">베스트 파커 통계</a>
	        </div>
          </li>
          <li>
          	<a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
             <i class="tim-icons icon-single-02"></i>
              내역보기  
            </a>
	        <div align="right" class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
	          <a class="dropdown-item" onclick="goParkingDetailListPage();" style="cursor: pointer;">입/출차 내역</a>
	          <a class="dropdown-item" onclick="goReservationPage();" style="cursor: pointer;">예약 내역</a>
	        </div>
          </li>
          <li>
            <a onclick="goPromotionPage();">
              <i class="tim-icons icon-gift-2"></i>
              쿠폰 신청
            </a>
          </li>
          <li>
            <a onclick="goExchangeMoneyPage();">
              <i class="tim-icons icon-tap-02"></i>
              환전 신청
            </a>
          </li>
          <li>
            <a onclick="insertParkingPage();">
              <i class="tim-icons icon-bus-front-12"></i>
              주차장 등록
            </a>
          </li>
          <li>
            <a onclick="goNotePage();">
              <i class="tim-icons icon-bell-55"></i>
              쪽지함
            </a>
          </li> 
          </c:if>
          <c:if test="${empty loginUser }">
              <li>
            	<a onclick="parkingceoLogin();">
              <i class="tim-icons icon-single-02"></i>
             		 로그인
           	 </a>
          	</li>
          
          </c:if>            
        </ul>
      </div>
    </div>