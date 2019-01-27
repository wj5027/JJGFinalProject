<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<!-- Navbar -->
      <nav class="navbar navbar-expand-lg navbar-absolute navbar-transparent">
        <div class="container-fluid">
          <div class="navbar-wrapper">
             <div class="navbar-toggle d-inline">
              <button type="button" class="navbar-toggler">
                <span class="navbar-toggler-bar bar1"></span>
                <span class="navbar-toggler-bar bar2"></span>
                <span class="navbar-toggler-bar bar3"></span>
              </button>
            </div> 
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <div>
	            <button class="btn btn-link" id="search-button" data-toggle="modal" data-target="#searchModal"><i class="tim-icons icon-zoom-split" style="color: white;"></i>
	            </button>
	            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	            <button class="btn btn-link" data-toggle="modal" data-target=".bd-example-modal-lg-6"><i class="fas fa-microphone-alt" style="color: white;"></i>
	            </button>
            </div>
            <!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 음성 인식 모달 -->
            <div class="modal fade bd-example-modal-lg-6" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
			  <div class="modal-dialog modal-lg">
			    <div class="modal-content" style="background: rgb(39,41,61);">
			      <div class="modal-body">
			        <div class="table-responsive"  style="overflow: hidden;">
			          <table class="table tablesorter " id="">
			            <tbody>
			                  <tr><td align="center"><b><i class="fas fa-microphone-alt" style="color: white;"></i> &nbsp;&nbsp; : &nbsp;&nbsp; 안녕하세요??</b></td></tr>
			                  <tr>
			                  	<td align="center">
			                  		검색 결과
			                  	</td>
			                  </tr>
			                  <tr><td align="center"><button type="button" class="btn btn-default" data-dismiss="modal" onclick="window.location.reload();">닫기</button></td></tr>      
			            </tbody>
			          </table>
			        </div>
			      </div>
			    </div>
			  </div>
			</div>
		  <!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
          </div>
          <!-- nav 바 상단 우측 땡댕땡 주석처리 -->
          <!--  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navigation" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-bar navbar-kebab"></span>
            <span class="navbar-toggler-bar navbar-kebab"></span>
            <span class="navbar-toggler-bar navbar-kebab"></span>
          </button>  -->
          <div class="collapse navbar-collapse" id="navigation">
            <ul class="navbar-nav ml-auto">
              <li class="search-bar input-group">
              <!--   <button class="btn btn-link" id="search-button" onclick="location.href='customerInfo.cu'" style="color: gray;"><i class="tim-icons icon-badge"></i>&nbsp;&nbsp;내정보수정
                  <span class="d-lg-none d-md-block"></span>
                </button> -->
              </li>
              <li class="search-bar input-group">
              <!--   <button class="btn btn-link" id="search-button" style="color: gray;"><i class="tim-icons icon-button-power"></i>&nbsp;&nbsp;로그아웃
                  <span class="d-lg-none d-md-block"></span>
                </button> -->
              </li>
            </ul>
          </div>
        </div>
      </nav>
      <div class="modal modal-search fade" id="searchModal" tabindex="-1" role="dialog" aria-labelledby="searchModal" aria-hidden="true">
        <div class="modal-dialog" role="document">
          <div class="modal-content">
            <div class="modal-header">
              <input type="text" class="form-control" id="inlineFormInputGroup" placeholder="SEARCH">
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <i class="tim-icons icon-simple-remove"></i>
              </button>
            </div>
          </div>
        </div>
      </div>
      <!-- End Navbar -->