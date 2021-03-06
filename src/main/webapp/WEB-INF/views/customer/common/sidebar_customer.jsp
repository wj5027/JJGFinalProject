<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<div class="sidebar" style="background: rgb(49, 49, 49) !important; margin-top:0px; width:260px; font-size:0.7em;">
      <!--
        Tip 1: You can change the color of the sidebar using: data-color="blue | green | orange | red"
    -->
    <div style="display: none;" id="cSetArea"></div>
      <div class="sidebar-wrapper" style="overflow: hidden; z-index:10000;">
        <div class="logo">
        
        
        
          <br>
          <br>
          
          <!-- <a id="userId" href="javascript:void(0)" class="simple-text logo-mini">
           	송현영
          </a> -->
          <div style="color:white;">
          <c:if test="${ empty loginUser }">
          	  <button class="btn btn-info btn-sm" onclick="location.href='customer_loginPage.cu'" style="font-size:0.7em;">로그인</button>
          </c:if>
          </div>
          <c:if test="${ !empty loginUser }">
          <div style="color:white;">
		      <span id="userId" >
		           ${ loginUser.member_name }
	          </span>
	          <span>님 환영합니다.</span>
	          </div>
	          <div style="font-size: 1em;color: wheat;">
	           <span>현재 보유오일 :</span>
	          <span id="oilmount">${ UserOilInfo }</span>
	          </div>
          </c:if>
          
          <!-- <a href="javascript:void(0)" class="simple-text logo-normal">
         	님 환영합니다.
          </a> -->
          <c:if test="${ empty loginUser }">
              
          </c:if>
          <c:if test="${ !empty loginUser }">
			  <!--정보수정  -->
	          <button class="btn btn-link" id="search-button" onclick="location.href='customerInfo.cu'" style="color: gray; font-size:0.7em; "><i class="tim-icons icon-badge"></i>&nbsp;&nbsp;내정보수정
	                  <span class="d-lg-none d-md-block"></span>
	          </button>
	          <!--로그아웃  -->
	          <button class="btn btn-link" id="search-button" onclick="location.href='customerLogOut.cu'" style="color: gray; font-size:0.7em;"><i class="tim-icons icon-button-power"></i>&nbsp;&nbsp;로그아웃
	                  <span class="d-lg-none d-md-block"></span>
	          </button>
          </c:if>
          
         
          
        </div>
        <ul class="nav">
          <li style="font-size:0.7em;" >
            <a href="./coupon.cu">
              <i class="tim-icons icon-chart-bar-32"></i>
            	쿠폰함
            </a>
          </li>
          <li style="font-size:0.7em;">
            <a href="./oil.cu">
              <i class="tim-icons icon-atom"></i>
              	오일
            </a>
          </li>
          <li style="font-size:0.7em;">
            <a href="./reserv.cu">
              <i class="tim-icons icon-satisfied"></i>
              	예약내역
            </a>
          </li>
          <li style="font-size:0.7em;">
            <a href="./customer.cu">
              <i class="tim-icons icon-single-copy-04"></i>
             	 지도
            </a>
          </li> 
          <li style="font-size:0.7em;">
          <a href="./customerNotice.cu">
              <i class="tim-icons icon-single-copy-04"></i>
              	공지사항
            </a>
          </li>
           <li style="font-size:0.7em;">
          <a href="./review.cu">
              <i class="tim-icons icon-single-copy-04"></i>
              	내 후기
            </a>
          </li>  
           <li style="font-size:0.7em;">
          <a href="./qna.cu">
              <i class="tim-icons icon-single-copy-04"></i>
              	내 문의
            </a>
          </li>           
        </ul>
        <script>
        var oilSelectMemberNo = ${loginUser.member_no};
        $(function(){
         $(".nav").children("li").mouseover(function(){
        	 $(this).attr("class","active");
        	 $(this).css("background","gray");
        	 
         }).mouseout(function(){
        	 $(this).attr("class","null");
        	 $(this).css("background","rgb(49,49,49)");
         })
        	
        });
        </script>
      </div>
    </div>