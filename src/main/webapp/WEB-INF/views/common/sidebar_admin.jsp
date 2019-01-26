<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="sidebar-wrapper">
	<div class="logo">
		<h3 align="center" style="margin-top: 10px">관리자 페이지</h3>
		<a href="javascript:void(0)" class="simple-text logo-mini"> JJG </a> <a
			href="javascript:void(0)" class="simple-text logo-normal"> 지금
			주차하러 갑니다 </a>
	</div>
	<ul class="nav">
		<li class=" "><a href="statisticsList.ad"> <i
				class="tim-icons icon-chart-bar-32"></i>
				<p>메인 페이지</p>
		</a></li>
		<li><a class="nav-link dropdown-toggle" href=""
			id="navbarDropdownMenuLink" data-toggle="dropdown"
			aria-haspopup="true" aria-expanded="false"> <i
				class="tim-icons icon-atom"></i>
				<p>
					사업자
					관리&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b
						style="font-size: 15px">▽</b>
				</p>
		</a>
			<div align="right" class="dropdown-menu dropdown-black"
				aria-labelledby="navbarDropdownMenuLink">
				<a class="dropdown-item" href="searchCEOList.ad">사업자 조회</a> <a
					class="dropdown-item" href="parkingLotList.ad">주차장 조회</a> <a
					class="dropdown-item" href="parkingLotCertification.ad">주차장 인증</a>
				<a class="dropdown-item" href="exchangeMoney.ad">환전 승인 및 조회</a> <a
					class="dropdown-item" href="couponCertification.ad">쿠폰 관리</a> <a
					class="dropdown-item" href="#">통계</a>
			</div></li>
		<li><a class="nav-link dropdown-toggle" href=""
			id="navbarDropdownMenuLink" data-toggle="dropdown"
			aria-haspopup="true" aria-expanded="false"> <i class="tim-icons icon-satisfied"></i>
				<p>사용자 관리&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b
						style="font-size: 15px">▽</b>
				</p>
		</a>
			<div align="right" class="dropdown-menu dropdown-black"
				aria-labelledby="navbarDropdownMenuLink">
				<a class="dropdown-item" href="searchCustomerList.ad">사용자 조회</a> <a
					class="dropdown-item" href="#">통계</a>
			</div></li>
		<li><a class="nav-link dropdown-toggle" href=""
			id="navbarDropdownMenuLink" data-toggle="dropdown"
			aria-haspopup="true" aria-expanded="false"> <i class="tim-icons icon-single-copy-04"></i>
				<p>게시판 관리&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b
						style="font-size: 15px">▽</b>
				</p>
		</a>
			<div align="right" class="dropdown-menu dropdown-black"
				aria-labelledby="navbarDropdownMenuLink">
				<a class="dropdown-item" href="boardQnA.ad">문의 게시판</a> <a
					class="dropdown-item" href="boardReview.ad">후기 게시판</a><a
					class="dropdown-item" href="filter.ad">필터설정</a>
			</div></li>
	</ul>
</div>
</div>
<div class="main-panel">
	<!-- Navbar -->
	<nav class="navbar navbar-expand-lg navbar-absolute navbar-transparent">
		<div class="container-fluid">
			<div class="navbar-wrapper">
				<div class="navbar-toggle d-inline">
					<button type="button" class="navbar-toggler">
						<span class="navbar-toggler-bar bar1"></span> <span
							class="navbar-toggler-bar bar2"></span> <span
							class="navbar-toggler-bar bar3"></span>
					</button>
				</div>
				<a class="navbar-brand" href="javascript:void(0)">Welcome</a>
			</div>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navigation" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-bar navbar-kebab"></span> <span
					class="navbar-toggler-bar navbar-kebab"></span> <span
					class="navbar-toggler-bar navbar-kebab"></span>
			</button>
			<div class="collapse navbar-collapse" id="navigation">
				<ul class="navbar-nav ml-auto">
					<li class="search-bar input-group">
						<button class="btn btn-link" id="search-button"
							style="color: gray;">
							<i class="tim-icons icon-button-power"></i>&nbsp;&nbsp;LogOut <span
								class="d-lg-none d-md-block"></span>
						</button>
					</li>
				</ul>
			</div>
		</div>
	</nav>
	<div class="modal modal-search fade" id="searchModal" tabindex="-1"
		role="dialog" aria-labelledby="searchModal" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<input type="text" class="form-control" id="inlineFormInputGroup"
						placeholder="SEARCH">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<i class="tim-icons icon-simple-remove"></i>
					</button>
				</div>
			</div>
		</div>
	</div>