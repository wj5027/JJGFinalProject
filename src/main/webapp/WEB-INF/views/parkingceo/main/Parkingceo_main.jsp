<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
<jsp:include page="/WEB-INF/views/common/bootInfo.jsp"></jsp:include>
<style type="text/css">
	#TabOne,#TabTwo,#TabThree,#TabFour,#TabFive{
		display: none;
	}
	
	#hiddenButton{
		display: none;
	}
	
</style>
</head>

<body class="">
  <div class="wrapper">
  <jsp:include page="/WEB-INF/views/parkingceo/common/Sidebar.jsp"></jsp:include>


    <div class="main-panel">
      <!-- Navbar -->
  		<jsp:include page="/WEB-INF/views/parkingceo/common/menubar.jsp"></jsp:include>
      <!-- End Navbar -->
      
      <div	 class="content">
      
      <!-- 내 주차장 검색 기능 -->
        <div class="row">
		  <div class="col-md-12" style="height: 350px;" >
            <div class="card ">
              <div class="card-header">
                <h4 class="card-title"> 사업자 메인 페이지</h4>
              </div>
              <div class="card-body">
                <div class="table-responsive"  style="overflow: hidden;">
                  <table class="table tablesorter " id="">
                    <tbody>
                      <tr>
                        <td align="center"><div style="color: white;">${loginUser.member_name	 }님의 주차장을 선택해주세요</div></td>
                        <td>
						<select class="custom-select nav-link dropdown-toggle" id="inputGroupSelect01">
    						 <c:if test="${not empty  CurrentParkinglist}">
    						<option selected style="color: black;" value=${CurrentParkinglist[0].parking_no } id="pakringOption1">주차장을 선택해주세요</option>
    						<c:set var="number" value="1"/>
    						<c:forEach var="list" items="${CurrentParkinglist }" varStatus="status">
    							<option value=${list.parking_no } style="color: black;">${list.parking_name }</option>
    						</c:forEach>
    						</c:if>
    						<c:if test="${empty CurrentParkinglist }">
    							<option selected style="color: black;" value="none">등록하신 주차장이 없습니다.</option>
    						</c:if>
  						</select>
						</td>
                      </tr>
                                           <tr>
                      <td colspan="2">
                       <ul>
                        <li>박스를 클릭하지 않으시고 버튼들을 누르면 제일 상위 박스 카테고리가 검색됩니다.</li>
                        <li>주차장 등록을 하지 않으신 경우에는 등록을 진행해주시기 바랍니다.</li>
                        <li>사업자님의 주차장을 선택하신 후 각각 버튼들을 누르면 현황이 표시됩니다.</li>
                        <li>주의하세요! 입/출차 시스템에서 어느 회원인지 잘 확인하시고 시스템을 사용바랍니다.</li>
                       
                       </ul>
                      </td>
                      </tr>                     
                    </tbody>
                  </table>
                </div>
              </div>
            </div>
          </div>

        
        <!--  내 주차장 현황 리스트 -->
          <div class="col-md-12">
            <div class="card ">
              <div class="card-header">
                <h4 class="card-title">내 주차장 입차, 예약 신청 현황</h4>
              </div>
              <div class="card-body">
              
              	   <ul class="nav nav-tabs">
				    <li><a data-toggle="tab" href="#menu1" id="TabOne">입차 현황</a>
				    		<c:if test="${empty CurrentParkinglist }">
    							<button class="btn btn-info animation-on-hover" type="button" data-toggle="tab" onclick="insertParkingSystem(1);" disabled="disabled">입차현황</button>
    						</c:if>
    						<c:if test="${not empty  CurrentParkinglist}">
				    		<button class="btn btn-info animation-on-hover" type="button" data-toggle="tab" onclick="insertParkingSystem(1);">입차현황</button>    						
    						</c:if>
				    </li>
				    <li><a data-toggle="tab" href="#menu2" id="TabTwo">예약신청 현황</a>
				    		<c:if test="${empty CurrentParkinglist }">
    							<button class="btn btn-info animation-on-hover" type="button" data-toggle="tab" onclick="resParkingSystem(1);" disabled="disabled">예약신청현황</button> 
    						</c:if>
    						<c:if test="${not empty  CurrentParkinglist}">
				    		<button class="btn btn-info animation-on-hover" type="button" data-toggle="tab" onclick="resParkingSystem(1);">예약신청현황</button>    						
    						</c:if>
				    		
				    </li>
				  </ul>
	<div class="tab-content">			  
	<div id="menu1" class="tab-pane fade">
      <!-- 일반 회원 입/출차 -->
       <div class="table-responsive"  style="overflow: hidden;">
                  <table class="table tablesorter " id="">
                    <thead class=" text-primary" id="insertListThead">
                      <tr>
                      </tr>
                    </thead>
                    <tbody id="insertListTbody">
                              <tr>
                        <td align="center">결과값이 출력됩니다.</td>
                       </tr>
                    </tbody>
                    <tfoot id="insertListTfoot">
                    	<tr>
                    	</tr>
                    </tfoot>
                  </table>
                </div>
    </div>
    
    <div id="menu2" class="tab-pane fade">
      <!-- 일반 회원 입/출차 -->
       <div class="table-responsive"  style="overflow: hidden;">
                  <table class="table tablesorter " id="">
                    <thead class=" text-primary" id="resThead">
                      <tr>
                      </tr>
                    </thead>
                    <tbody id="resTbody">
                      <tr>
                        <td align="center">결과값이 출력됩니다.</td>
                       </tr>
                    </tbody>
                    <tfoot id="resTfoot">
                    	<tr>
                    	</tr>
                    </tfoot>
                  </table>
                </div>
    		</div>
		</div>  
				  
				              
              
                
              </div>
            </div>
          </div>
        </div>
      <br>
      <br>
      	<!-- 간편 입출차 시스템 -->
    <div class="col-md-12">
            <div class="card ">
              <div class="card-header">
                <h4 class="card-title"> 간편 입/출차 시스템</h4>
              </div>
              <div class="card-body">
   <ul class="nav nav-tabs">
    <li><a data-toggle="tab" href="#menu3" id="TabThree">비회원</a>
    	<c:if test="${empty CurrentParkinglist }">
    		<button class="btn btn-info animation-on-hover" type="button" data-toggle="tab" onclick="nonMemberParkingSystem(1);" disabled="disabled">비회원</button> 
    	</c:if>
    	<c:if test="${not empty  CurrentParkinglist}">
			<button class="btn btn-info animation-on-hover" type="button" data-toggle="tab" onclick="nonMemberParkingSystem(1);">비회원</button>					
    	</c:if>
    </li>
    <li><a data-toggle="tab" href="#menu4" id="TabFour">일반회원</a>
    	<c:if test="${empty CurrentParkinglist }">
    		<button class="btn btn-info animation-on-hover" type="button" data-toggle="tab" onclick="memberParkingSystem(1);" disabled="disabled">일반회원</button> 
    	</c:if>
    	<c:if test="${not empty  CurrentParkinglist}">
			<button class="btn btn-info animation-on-hover" type="button" data-toggle="tab" onclick="memberParkingSystem(1);">일반회원</button>				
    	</c:if>
    </li>
    <li><a data-toggle="tab" href="#menu5" id="TabFive">예약회원</a>
    	<c:if test="${empty CurrentParkinglist }">
    		<button class="btn btn-info animation-on-hover" type="button" data-toggle="tab" onclick="resMemberParkingSystem(1);" disabled="disabled">예약회원</button> 
    	</c:if>
    	<c:if test="${not empty  CurrentParkinglist}">
			<button class="btn btn-info animation-on-hover" type="button" data-toggle="tab" onclick="resMemberParkingSystem(1);">예약회원</button>			
    	</c:if>
    </li>
  </ul>

  <div class="tab-content">
    <div id="menu3" class="tab-pane fade">
      <!-- 비회원 입/출차 -->
       <div class="table-responsive"  style="overflow: hidden;">
                  <table class="table tablesorter " id="">
                    <tbody>
                    <tr>
                    	<td colspan="2" align="center"><h3>비회원 입/출차</h3></td>
                    </tr>
                      <tr>
                        <td align="center" width="500px"><div style="color: white;">현재 ${loginUser.member_name }님의 주차 가능 대수/전체 주차 대수</div></td>
                        <td align="center" id="nonMemberParkingSize">
							
						</td>
                      </tr>  
                      <tr>
                      	<td>
                      	<div class="card" style="margin-top: 20px;">
						    <div class="card-body">
						      <div class="form-group has-success">
						        <input type="text" placeholder="입차할 번호를 넣어주세요" class="form-control form-control-success"  id="nonMemberCarNo"/>
						      </div>
						      <br>
						      <div class="form-group has-success">
						        <input type="text" placeholder="휴대폰 번호를 넣어주세요" class="form-control form-control-success" id="nonMemberPhone"/>
						      </div>
						    </div>
						  </div>
                      	</td>
                      	<td align="center"><button class="btn btn-info animation-on-hover" type="button" onclick="acceptInputCar();" id="nonMemberAcceptInputCar">입차</button></td>
                      </tr>    
                      <tr>
                      	<td>
                      	<div class="card" style="margin-top: 20px;">
						    <div class="card-body">
						      <div class="form-group has-success">
						        <input type="text" placeholder="차 번호를 넣어주세요" class="form-control form-control-success"  id="nonMemberCarNo2"/>
						      </div>
						    </div>
						  </div>
                      	</td>
                      	<td align="center"><button class="btn btn-info animation-on-hover" onclick="nonMemberAcceptOutputCar();" type="button">출차</button></td>
                      </tr>                 
                    </tbody>
                  </table>
                </div>
      
    </div>
    <div id="menu4" class="tab-pane fade">
      <!-- 일반 회원 입/출차 -->
       <div class="table-responsive"  style="overflow: hidden;">
                  <table class="table tablesorter " id="">
                    <tbody>
                    <tr>
                    	<td colspan="2" align="center"><h3>일반회원 입/출차</h3></td>
                    </tr>
                      <tr>
                        <td align="center" width="500px"><div style="color: white;">현재 ${loginUser.member_name }님의 현재 주차 대수/전체 주차 대수</div></td>
                        <td align="center" id="nomalMemberParkingSize">
							
						</td>
                      </tr>  
                      <tr>
                      	<td>
                      	<div class="card" style="margin-top: 20px;">
						    <div class="card-body">
						      <div class="form-group has-success">
						        <input type="text" placeholder="회원 아이디를 입력해주세요" class="form-control form-control-success" id="nomalMemberInputText" />
						      </div>
						    </div>
						  </div>
                      	</td>
                      	<td align="center"><button class="btn btn-info animation-on-hover"  type="button" onclick="nomalMemberInputCar();">입차</button></td>
                      </tr>    
                      <tr>
                      	<td>
                      	<div class="card" style="margin-top: 20px;">
						    <div class="card-body">
						      <div class="form-group has-success">
						        <input type="text" placeholder="회원 아이디를 입력해주세요" class="form-control form-control-success" id="nomalMemberOutputText"/>
						      </div>
						    </div>
						  </div>
                      	</td>
                      	<td align="center"><button class="btn btn-info animation-on-hover" type="button" onclick="nomalMemberOutputCar();">출차</button></td>
                      </tr>                 
                    </tbody>
                  </table>
                </div>
      
    </div>
    <div id="menu5" class="tab-pane fade">
      <!-- 예약 회원 입/출차 -->
       <div class="table-responsive"  style="overflow: hidden;">
                  <table class="table tablesorter " id="">
                    <tbody>
                    <tr>
                    	<td colspan="2" align="center"><h3>예약회원 입/출차</h3></td>
                    </tr>
                      <tr>
                        <td align="center" width="500px"><div style="color: white;">현재 ${loginUser.member_name }님의 현재 주차 대수/전체 주차 대수</div></td>
                        <td align="center" id="resMemberParkingSize">
							
						</td>
                      </tr>  
                      <tr>
                      	<td>
                      	<div class="card" style="margin-top: 20px;">
						    <div class="card-body">
						      <div class="form-group has-success">
						        <input type="text" placeholder="입차할 번호를 넣어주세요" class="form-control form-control-success" />
						      </div>
						    </div>
						  </div>
                      	</td>
                      	<td align="center"><button class="btn btn-info animation-on-hover" data-toggle="modal" data-target=".bd-example-modal-lg-1" type="button">입차</button></td>
                      </tr>    
                      <tr>
                      	<td>
                      	<div class="card" style="margin-top: 20px;">
						    <div class="card-body">
						      <div class="form-group has-success">
						        <input type="text" placeholder="출차할 번호를 넣어주세요" class="form-control form-control-success" />
						      </div>
						    </div>
						  </div>
                      	</td>
                      	<td align="center"><button class="btn btn-info animation-on-hover" data-toggle="modal" data-target=".bd-example-modal-lg-2" type="button">출차</button></td>
                      </tr>                 
                    </tbody>
                  </table>
                </div>
		    </div>
		  </div>
        </div>
      </div>
    </div>
      
      


<!-- 비회원 입차 모달 -->
<div class="modal fade bd-example-modal-lg-1" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content" style="background: rgb(39,41,61);">
    <div class="modal-body">
      <div class="card ">
              <div class="card-header">
                <h4 class="card-title"> 입차 시스템</h4>
              </div>
              <div class="card-body">
                <div class="table-responsive"  style="overflow: hidden;">
                  <table class="table tablesorter " id="">
                    <tbody>
                      <tr>
                        <td align="center" width="500px"><div style="color: white;">입차 차번호</div></td>
                        <td align="center" id="resultCarNo">
							
						</td>
                      </tr>
                       <tr>
                        <td align="center" width="500px"><div style="color: white;">입차 회원 이름</div></td>
                        <td align="center" id="resultMemberName">
						</td>
                      </tr>
                       <tr>
                        <td align="center" width="500px"><div style="color: white;">입차자 휴대폰 번호</div></td>
                        <td align="center" id="resultPhone">
						</td>
                      </tr> 
                      <tr>
                        <td align="center" width="500px"><div style="color: white;">입차 시간</div></td>
                        <td align="center" id="resultInsertDate">
						</td>
                      </tr>    
                      <tr>
                      	<td align="center" colspan="2"> <button class="btn btn-info animation-on-hover"  type="button" onclick="inputCar();">입차</button>
                      	</td>
                      </tr>
                      <tr>
                      	<td align="center" colspan="2"><button type="button" class="btn btn-default" data-dismiss="modal">닫기</button></td>
                      </tr>                 
                    </tbody>
                  </table>
                </div>
              </div>
            </div>
            </div>
    	</div>
  </div>
</div>


<!-- 일반회원 입차 모달 -->
<div class="modal fade bd-example-modal-lg-10" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content" style="background: rgb(39,41,61);">
    <div class="modal-body">
      <div class="card ">
              <div class="card-header">
                <h4 class="card-title"> 입차 시스템</h4>
              </div>
              <div class="card-body">
                <div class="table-responsive"  style="overflow: hidden;">
                  <table class="table tablesorter " id="">
                    <tbody>
                    	<tr>
                        <td align="center" width="500px"><div style="color: white;">회원 아이디</div></td>
                        <td align="center">
							<input type="text" class="form-control form-control-success" id="nomalMemberId" readonly="readonly" style="color: white;"/>
						</td>
                      </tr>
                      <tr>
                        <td align="center" width="500px"><div style="color: white;">입차 차번호</div></td>
                        <td align="center">
							<input type="text" placeholder="입차할 번호를 넣어주세요" class="form-control form-control-success" id="nomalMemberCarNo"/>
						</td>
                      </tr>
                       <tr>
                        <td align="center" width="500px"><div style="color: white;">입차 회원 이름</div></td>
                        <td align="center">
                        	<input type="text" placeholder="회원 이름을 넣어주세요" class="form-control form-control-success" id="nomalMemberName" readonly="readonly" style="color: white;"/>
						</td>
                      </tr>
                       <tr>
                        <td align="center" width="500px"><div style="color: white;">입차자 휴대폰 번호</div></td>
                        <td align="center">
                        	<input type="text" placeholder="휴대폰 번호를 넣어주세요" class="form-control form-control-success" id="nomalMemberPhone"/>
						</td>
                      </tr> 
                      <tr>
                        <td align="center" width="500px"><div style="color: white;">입차 시간</div></td>
                        <td align="center" id="nomalMemberInsertDate">
						</td>
                      </tr>    
                      <tr>
                      	<td align="center" colspan="2"> <button class="btn btn-info animation-on-hover"  type="button" onclick="nomalMemberResultInputCar();">입차</button>
                      	</td>
                      </tr>
                      <tr>
                      	<td align="center" colspan="2"><button type="button" class="btn btn-default" data-dismiss="modal">닫기</button></td>
                      </tr>                 
                    </tbody>
                  </table>
                </div>
              </div>
            </div>
            </div>
    	</div>
  </div>
</div>


   <!--  출차 모달 -->   
 <div class="modal fade bd-example-modal-lg-2" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
 <div class="modal-content" style="background: rgb(39,41,61);">
    <div class="modal-body">
      <div class="card ">
              <div class="card-header">
                <h4 class="card-title"> 출차 시스템</h4>
              </div>
              <div class="card-body">
                <div class="table-responsive"  style="overflow: hidden;">
                  <table class="table tablesorter " id="">
                    <tbody>
                      <tr>
                        <td align="center" width="500px"><div style="color: white;">출차 차번호</div></td>
                        <td align="center" id="resultOutputCarNo">
						</td>
                      </tr>
                       <tr>
                        <td align="center" width="500px"><div style="color: white;">출차자 핸드폰 번호</div></td>
                        <td align="center" id="resultOutputPhone">
						</td>
                      </tr>
                       <tr>
                        <td align="center" width="500px"><div style="color: white;">사용시간</div></td>
                        <td align="center" id="resultOutputDate">
						</td>
                      </tr>   
                    	<tr>
                        <td align="center" width="500px"><div style="color: white;">결제금액</div></td>
                        <td align="center" id="resultOutputPayment">
						</td>
                      </tr>                 
                    </tbody>
                  </table>
                  <div align="center">
                  	<button class="btn btn-info animation-on-hover" data-toggle="modal" data-target=".bd-example-modal-lg-4" type="button" >현장 결제</button>
                  	<button type="button" class="btn btn-info animation-on-hover" data-toggle="modal" data-target=".bd-example-modal-lg-5" type="button" id="pointPayment">포인트 결제</button>
                  	<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
                  </div>
                  
                </div>
              </div>
            </div>
            </div>
    	</div>
  </div>
</div>     


<!-- 일반 회원 출차 모달 -->
<div class="modal fade bd-example-modal-lg-11" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
 <div class="modal-content" style="background: rgb(39,41,61);">
    <div class="modal-body">
      <div class="card ">
              <div class="card-header">
                <h4 class="card-title"> 출차 시스템</h4>
              </div>
              <div class="card-body">
                <div class="table-responsive"  style="overflow: hidden;">
                  <table class="table tablesorter " id="">
                    <tbody>
                    	<tr>
                        <td align="center" width="500px"><div style="color: white;">출차자 회원아이디</div></td>
                        <td align="center" id="resultOutputCarNo">
						</td>
                      </tr>
                      <tr>
                        <td align="center" width="500px"><div style="color: white;">출차 차번호</div></td>
                        <td align="center" id="resultOutputCarNo">
						</td>
                      </tr>
                       <tr>
                        <td align="center" width="500px"><div style="color: white;">출차자 핸드폰 번호</div></td>
                        <td align="center" id="resultOutputPhone">
						</td>
                      </tr>
                       <tr>
                        <td align="center" width="500px"><div style="color: white;">사용시간</div></td>
                        <td align="center" id="resultOutputDate">
						</td>
                      </tr>   
                    	<tr>
                        <td align="center" width="500px"><div style="color: white;">결제금액</div></td>
                        <td align="center" id="resultOutputPayment">
						</td>
                      </tr>                 
                    </tbody>
                  </table>
                  <div align="center">
                  	<button class="btn btn-info animation-on-hover" data-toggle="modal" data-target=".bd-example-modal-lg-4" type="button" >현장 결제</button>
                  	<button type="button" class="btn btn-info animation-on-hover" data-toggle="modal" data-target=".bd-example-modal-lg-5" type="button" id="pointPayment">포인트 결제</button>
                  	<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
                  </div>
                  
                </div>
              </div>
            </div>
            </div>
    	</div>
  </div>
</div>     



	<!-- 입차 눌렀을시 -->
      <div class="modal fade bd-example-modal-lg-3" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content" style="background: rgb(39,41,61);">
    <div class="modal-body">
                     <div class="table-responsive"  style="overflow: hidden;">
                  <table class="table tablesorter " id="">
                    <tbody>
						<tr><td align="center"><b>정상적으로 입차 되었습니다.</b></td></tr>
						<tr><td align="center"><button type="button" class="btn btn-default" data-dismiss="modal" onclick="window.location.reload();">닫기</button></td></tr>      
      			</tbody>
      		</table>
      	</div>
      </div>
    </div>
  </div>
</div>     


<!-- 현장 걸제 눌렀을시 -->
      <div class="modal fade bd-example-modal-lg-4" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content" style="background: rgb(39,41,61);">
    <div class="modal-body">
                     <div class="table-responsive"  style="overflow: hidden;">
                  <table class="table tablesorter " id="">
                    <tbody>
						<tr><td align="center"><b>현장 결제를 진행합니다 확실하십니까?</b></td></tr>
						<tr><td align="center"><button class="btn btn-info animation-on-hover" data-toggle="modal" data-target=".bd-example-modal-lg-6" type="button" >확인</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button></td></tr>      
      			</tbody>
      		</table>
      	</div>
      </div>
    </div>
  </div>
</div>






<!-- 포인트 결제 눌렀을시 -->
     <div class="modal fade bd-example-modal-lg-5" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content" style="background: rgb(39,41,61);">
    <div class="modal-body">
                     <div class="table-responsive"  style="overflow: hidden;">
                  <table class="table tablesorter " id="">
                    <tbody>
						<tr><td align="center"><b>포인트 결제를 진행합니다 확실하십니까?</b></td></tr>
						<tr><td align="center"><button class="btn btn-info animation-on-hover" data-toggle="modal" data-target=".bd-example-modal-lg-6" type="button">확인</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button></td></tr>      
      			</tbody>
      		</table>
      	</div>
      </div>
    </div>
  </div>
</div>



<!-- 결제 확인 눌렀을시 -->
            <div class="modal fade bd-example-modal-lg-6" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content" style="background: rgb(39,41,61);">
    <div class="modal-body">
                     <div class="table-responsive"  style="overflow: hidden;">
                  <table class="table tablesorter " id="">
                    <tbody>
						<tr><td align="center"><b>정상적으로 확인이 되었습니다.</b></td></tr>
						<tr><td align="center"><button type="button" class="btn btn-default" data-dismiss="modal" onclick="window.location.reload();">닫기</button></td></tr>      
      			</tbody>
      		</table>
      	</div>
      </div>
    </div>
  </div>
</div>    
      
      <!-- content -->
      </div>
    </div>
    
    
         <div class="modal fade bd-example-modal-lg-7" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content" style="background: rgb(39,41,61);">
    <div class="modal-body">
                     <div class="table-responsive"  style="overflow: hidden;">
                  <table class="table tablesorter " id="">
                    <tbody>
						<tr><td align="center"><b>예약을 승인합니다. 확실하십니까?</b></td></tr>
						<tr><td align="center"><button class="btn btn-info animation-on-hover" onclick="updateResComplete();" type="button">확인</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button></td></tr>          
      			</tbody>
      		</table>
      	</div>
      </div>
    </div>
  </div>
</div>

       <div class="modal fade bd-example-modal-lg-8" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content" style="background: rgb(39,41,61);">
    <div class="modal-body">
                     <div class="table-responsive"  style="overflow: hidden;">
                  <table class="table tablesorter " id="">
                    <tbody>
						<tr><td align="center"><b>예약을 반송합니다. 확실하십니까?</b></td></tr>
						<tr><td><input type="text" placeholder="반송 사유를 입력해주세요" class="form-control form-control-success" id="resCancelText" /></td></tr>
						<tr><td align="center"><button class="btn btn-info animation-on-hover" onclick="updateResCancel();" type="button">확인</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button></td></tr>         
      			</tbody>
      		</table>
      	</div>
      </div>
    </div>
  </div>
</div>


     <div class="modal fade bd-example-modal-lg-9" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content" style="background: rgb(39,41,61);">
    <div class="modal-body">
                     <div class="table-responsive"  style="overflow: hidden;">
                  <table class="table tablesorter " id="">
                    <tbody>
						<tr><td align="center" id="modalText" style="color: white;"></td></tr>
						<tr><td align="center">
						<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button></td></tr>      
      			</tbody>
      		</table>
      	</div>
      </div>
    </div>
  </div>
</div>




    
    
    <div id="hiddenButton">
 <button class="btn btn-info animation-on-hover" data-toggle="modal" data-target=".bd-example-modal-lg-1" type="button" id="nonMemberInsertCar">입차</button>

 <button class="btn btn-info animation-on-hover" data-toggle="modal" data-target=".bd-example-modal-lg-2" type="button"  id="updateModal">출차모달</button>
<button class="btn btn-info animation-on-hover" data-toggle="modal" data-target=".bd-example-modal-lg-3" type="button" id="insertModal">입차모달</button>
<button class="btn btn-info animation-on-hover" data-toggle="modal" data-target=".bd-example-modal-lg-7" type="button" id="modalBtn">모달버튼</button>
<button class="btn btn-info animation-on-hover" data-toggle="modal" data-target=".bd-example-modal-lg-8" type="button" id="modalBtn2">모달버튼2</button>
<button class="btn btn-info animation-on-hover" data-toggle="modal" data-target=".bd-example-modal-lg-9" type="button" id="modalBtn3">모달 버튼3</button>
 <button class="btn btn-info animation-on-hover" data-toggle="modal" data-target=".bd-example-modal-lg-10" type="button" id="nomalMemberInsertCar">일반회원입차</button>
</div>   
    
    
  </div>

  
</body>
<script type="text/javascript">


	//페이지 이동 함수
	function goMain(){
		location.href="parkingceoMain.pc";
	}
	
	function goExchangePage(){
		location.href = "parkingceoExchange.pc";
	}
	
	function insertParkingPage(){
		location.href = "insertParkingPage.pc";
	}
	
	function goOilStatisticsPage(){
		location.href = "goOilStatisticsPage.pc";
	}
	
	function goParkingListStatisticsPage(){
		location.href = "goParkingListStatisticsPage.pc";
	}
	
	function goBestPakerStatisticsPage(){
		location.href = "goBestPakerStatisticsPage.pc";
	}
	
	function goParkingDetailListPage(){
		location.href = "goParkingDetailListPage.pc";
	}
	
	function goPromotionPage(){
		location.href = "goPromotionPage.pc";
	}
	
	function goExchangeMoneyPage(){
		location.href = "goExchangeMoneyPage.pc";
	}
	
	function goNotePage(){
		location.href = "goNotePage.pc";
	}
	function parkingceoLogin(){
		location.href="parkingceoLogin.pc";	
	}
	function goReservationPage(){
		location.href="parkingceoReservation.pc";
	}
	
	
	//탭버튼 함수
	//전역 페이징 변수
	var currentPage = 1;
	
	function insertParkingSystem(data){
		//주차장 선택 값
		var selectParkingBox = $("#inputGroupSelect01 option:selected").val();
		currentPage = data;
		//입차 현황 데이터 조회 ajax
		$.ajax({
			url:"searchInsertParkingSystemList.pc",
			type:"post",
			data:{selectParkingBox:selectParkingBox,
				currentPage:currentPage},
			success:function(data){
				console.log(data);
				
				//데이터 조회 성공시 입차현황에 테이블 추가
				$theadId = $("#insertListThead");
				$theadId.html('');
				$tbodyId = $("#insertListTbody");
				$tbodyId.html('');
				$tfootId = $("#insertListTfoot");
				$tfootId.html('');
				$theadTr = $("<tr>");
				
				//thead 설정
				$member_idTh = $("<th>").text("사용자 아이디");
				$member_nameTh = $("<th>").text("사용자명");
				$member_phoneTh = $("<th>").text("사용자 휴대폰번호");
				$member_carNoTh = $("<th>").text("사용자 차번호");
				$parking_startTimeTh = $("<th>").text("주차 시작 시간");
				$parking_useTimeTh = $("<th>").text("주차 사용 시간")
				$parking_statusTh = $("<th>").text("주차 상태");
				$exit_payTh = $("<th>").text("정산 요금");
				$entry_typeTh = $("<th>").text("예약/일반");
				$pay_typeTh = $("<th>").text("예약번호");
				
				$theadTr.append($member_idTh);
				$theadTr.append($member_nameTh);
				$theadTr.append($member_phoneTh);
				$theadTr.append($member_carNoTh);
				$theadTr.append($parking_startTimeTh);
				$theadTr.append($parking_useTimeTh);
				$theadTr.append($parking_statusTh);
				$theadTr.append($exit_payTh);
				$theadTr.append($entry_typeTh);
				$theadTr.append($pay_typeTh);
				
				
				$theadId.append($theadTr);
				
				//tbody 설정
				for(var i in data.list){
					$tbodyTr = $("<tr>");
					if(data.list[i].hasOwnProperty('MEMBER_ID') == false){
						$member_idTd = $("<td>").text("아이디 없음");
					}else{
						$member_idTd = $("<td>").text(data.list[i].MEMBER_ID);
					}
					if(data.list[i].hasOwnProperty('MEMBER_NAME') == false){
						$member_nameTd = $("<td>").text("X");
					}else{
						$member_nameTd = $("<td>").text(data.list[i].MEMBER_NAME);
					}
					$member_phoneTd = $("<td>").text(data.list[i].PHONE);
					$member_carNoTd = $("<td>").text(data.list[i].CAR_NO);
					$parking_startTimeTd =  $("<td>").text((1900+data.list[i].START_TIME.year)+"년 "
							+(data.list[i].START_TIME.month+1)+"월 "+
							data.list[i].START_TIME.date + "일 " +
							data.list[i].START_TIME.hours+"시 " +
							data.list[i].START_TIME.minutes+"분"
							);
					if(data.list[i].hasOwnProperty('HOURS')==false || data.list[i].hasOwnProperty('HOURS')== 0){
						$parking_useTimeTd = $("<td>").text("");	
					}else{
						$parking_useTimeTd = $("<td>").text(Math.floor(data.list[i].HOURS/60)+"시 "
								+data.list[i].HOURS%60+"분");
					}

					$parking_statusTd = $("<td>").text(data.list[i].STATUS);
					if(data.list[i].hasOwnProperty('FEE') == false){
						$exit_payTd = $("<td>").text("");
					}else{
						$exit_payTd = $("<td>").text(data.list[i].FEE);							
					}
					$entry_typeTh = $("<td>").text(data.list[i].EE_TYPE);		
					if(data.list[i].hasOwnProperty('RES_NO') == false){							
						$pay_typeTd = $("<td>").text("");	
					}else{
						$pay_typeTd = $("<td>").text(data.list[i].RES_NO);
					}
					$tbodyTr.append($member_idTd);
					$tbodyTr.append($member_nameTd);
					$tbodyTr.append($member_phoneTd);
					$tbodyTr.append($member_carNoTd);
					$tbodyTr.append($parking_startTimeTd);
					$tbodyTr.append($parking_useTimeTd);
					$tbodyTr.append($parking_statusTd);
					$tbodyTr.append($exit_payTd);
					$tbodyTr.append($entry_typeTh);
					$tbodyTr.append($pay_typeTd);
					
					$tbodyId.append($tbodyTr); 
					
					
				}
				
				//페이징
				if(data.pi.listCount != 0){
					$pageTr = $('<tr>');
					$pageTh = $("<th colspan='10'>");
					$pageUl = $('<ul class="pagination pagination-lg justify-content-center">');
					$previousLi = $('<li class="page-item">');
					$previousA = $('<a class="page-link" onclick="insertFirstPageMove(' +1+')" aria-label="Previous">');
					$previousHidden = $('<span aria-hidden="true">').text('<<');
					$previousSrOnly = $('<span class="sr-only">').text('Previous');
					
					$previousA.append($previousHidden);
					$previousA.append($previousSrOnly);
					$previousLi.append($previousA);
					$pageUl.append($previousLi);
					
					if(data.pi.currentPage <= 1){
						$leftIconDisableLi = $('<li class="page-item">');
						$leftAtag = $('<a class="page-link">').text("<");
						$leftIconDisableLi.append($leftAtag);
						$pageUl.append($leftIconDisableLi);
					}else{
						currentPage = (data.pi.currentPage-1);
						$leftIconAbleLi = $('<li class="page-item">');
						$leftAtag2 = $('<a class="page-link" onclick="insertBeforePageMove('+currentPage+')">').text("<");
						$leftIconAbleLi.append($leftAtag2);
						$pageUl.append($leftIconAbleLi);
					}
					
					for(var i = data.pi.startPage ; i <= data.pi.endPage; i++){
						if(i == data.pi.currentPage){
							$currentIconAbleLi = $('<li class="page-item">');
							$currentAtag = $('<a class="page-link">').text(i);
							$currentIconAbleLi.append($currentAtag);
							$pageUl.append($currentIconAbleLi);
						}else{
							$currentIconAbleLi2 = $('<li class="page-item">');
							$currentAtag2 = $('<a class="page-link" onclick="insertOnePageMove('+ i +')">').text(i);
							$currentIconAbleLi2.append($currentAtag2);
							$pageUl.append($currentIconAbleLi2);
						}
					}				
					
					if(data.pi.currentPage >= data.pi.maxPage){
						$rightIconDisableLi = $('<li class="page-item">');
						$rightAtag = $('<a class="page-link">').text(">");
						$rightIconDisableLi.append($rightAtag);
						$pageUl.append($rightIconDisableLi);
					}else{
						currentPage = (data.pi.currentPage+1);
						$rightIconAbleLi = $('<li class="page-item">');
						$rightAtag2 = $('<a class="page-link" onclick="insertNextPageMove('+currentPage+')">').text(">");
						$rightIconAbleLi.append($rightAtag2);
						$pageUl.append($rightIconAbleLi);
					}					

					$nextLi = $('<li class="page-item">');
					$nextA = $('<a class="page-link" onclick="insertLastPageMove(' +data.pi.maxPage	+')" aria-label="Next">');
					$nextHidden = $('<span aria-hidden="true">').text('>>');
					$nextSrOnly = $('<span class="sr-only">').text('Next');
					
					$nextA.append($nextHidden);
					$nextA.append($nextSrOnly);
					$nextLi.append($nextA);
					$pageUl.append($nextLi);
					$pageTh.append($pageUl);
					$pageTr.append($pageTh);
                	
                	//새로고침 버튼 설정
                	$centerDiv = $('<div align="center">');
                	$refreshButton = $('<buttron class="btn btn-info animation-on-hover" type="button" id="insertParkingStatusRefresh"  >').text('새로고침');
					
                	$centerDiv.append($refreshButton);
                	$pageTh.append($centerDiv);
                	$pageTr.append($pageTh);               	
                	
                	$tfootId.append($pageTr);
                	
                	
                	//새로고침 동적 이벤트 구현
                	$("#insertParkingStatusRefresh").on('click',function(){
                		insertParkingSystem(1);	
                	});
                	
					
				}	
			},
			error:function(data){
				console.log("데이터 통신 실패!");
			}
		});		
		
		$("#TabOne").click();
	}
	
	
	//입차 현황 새로고침 함수

	
	//입차 페이징 재귀호출
	function insertFirstPageMove(data){		
		insertParkingSystem(data);		
	}
	function insertBeforePageMove(data){
		insertParkingSystem(data);		
	}
	function insertOnePageMove(data){
		insertParkingSystem(data);		
	}
	function insertNextPageMove(data){
		insertParkingSystem(data);		
	}
	function insertLastPageMove(data){
		insertParkingSystem(data);		
	}
	
	
	
	/* var testDate = new Date(data.list[0].RES_DATE);
	console.log((1900+testDate.getYear())+"년");
	console.log((testDate.getMonth()+1)+"월");
	console.log(testDate.getDate()+"일");
	console.log(testDate.getHours()+"시 "+testDate.getMinutes()+"분 "+testDate.getSeconds()+"초");
	 */
	
	
	
	function resParkingSystem(data){
		//주차장 선택 값
		var selectParkingBox = $("#inputGroupSelect01 option:selected").val();
		currentPage = data;
		//예약 현황 데이터 조회 ajax
		$.ajax({
			url:"searchResParkingSystem.pc",
			type:"post",
			data:{selectParkingBox:selectParkingBox,currentPage:currentPage},
			success:function(data){
				console.log(data);
				
				//데이터 조회 성공시 입차현황에 테이블 추가
				$theadId = $("#resThead");
				$theadId.html('');
				$tbodyId = $("#resTbody");
				$tbodyId.html('');
				$tfootId = $("#resTfoot");
				$tfootId.html('');
				$theadTr = $("<tr>");
				
				//thead 설정
				$res_noTh = $("<th>").text("예약 번호");
				$member_idTh = $("<th>").text("회원 아이디");
				$member_nameTh = $("<th>").text("회원 이름");
				$member_phoneTh = $("<th>").text("휴대폰 번호");
				$member_carNoTh = $("<th>").text("차 번호");
				$res_request_dateTh = $("<th>").text("예약일")
				$res_dateTh = $("<th>").text("주차장 예약 시작일");
				$res_statusTh = $("<th>").text("예약 상태");
				$res_btnTh= $("<th>").text("승인/반송");
				
				$theadTr.append($res_noTh);
				$theadTr.append($member_idTh);
				$theadTr.append($member_nameTh);
				$theadTr.append($member_phoneTh);
				$theadTr.append($member_carNoTh);
				$theadTr.append($res_request_dateTh);
				$theadTr.append($res_dateTh);
				$theadTr.append($res_statusTh);
				$theadTr.append($res_btnTh);
				
				$theadId.append($theadTr);
				
				
				//tbody 설정
				for(var i in data.list){
					$tbodyTr = $("<tr>");
					
					
					
					//상태 값 변경
					if(data.list[i].STATUS == 'Y'){
						data.list[i].STATUS = '승인대기';
					}
					//일자 변환
					var requestResDate = new Date(data.list[i].RES_REQUEST_DATE);
					var resDate = new Date(data.list[i].RES_DATE)
					
					$res_noTd = $("<td id='selectNo'>").text(data.list[i].RES_NO);
					$res_idTd = $("<td>").text(data.list[i].MEMBER_ID);
					$res_nameTd = $("<td>").text(data.list[i].MEMBER_NAME);
					$res_phoneTd = $("<td>").text(data.list[i].PHONE);
					$res_carNoTd = $("<td>").text(data.list[i].CAR_NO);	
					$res_request_dateTd = $("<td>").text((1900+requestResDate.getYear())+"년 "
							+(requestResDate.getMonth()+1)+"월 "+
							requestResDate.getDate() + "일 " +
							requestResDate.getHours()+"시 " +
							requestResDate.getMinutes()+"분 "+
							requestResDate.getSeconds()+"초");
					$res_dateTd = $("<td>").text((1900+resDate.getYear())+"년 "
							+(resDate.getMonth()+1)+"월 "+
							resDate.getDate() + "일 " +
							resDate.getHours()+"시 " +
							resDate.getMinutes()+"분 "+
							resDate.getSeconds()+"초");
					$res_statusTd = $("<td>").text(data.list[i].STATUS);
					$res_btnTd = $('<td id="resBtn">');
					$completeBtn = $('<button class="btn btn-info animation-on-hover btn-sm" onclick="resComplete('+data.list[i].RES_NO+');">').text('승인');
					$cancelBtn = $('<button class="btn btn-warning animation-on-hover btn-sm" onclick="resCancel('+data.list[i].RES_NO+');">').text('반송');
					
					$res_btnTd.append($completeBtn);
					$res_btnTd.append($cancelBtn);
					
					
					$tbodyTr.append($res_noTd);
					$tbodyTr.append($res_idTd);
					$tbodyTr.append($res_nameTd);
					$tbodyTr.append($res_phoneTd);
					$tbodyTr.append($res_carNoTd);
					$tbodyTr.append($res_request_dateTd);
					$tbodyTr.append($res_dateTd);
					$tbodyTr.append($res_statusTd);
					$tbodyTr.append($res_btnTd);
					
					
					$tbodyId.append($tbodyTr); 
				}
				
				if(data.pi.listCount != 0){
					$pageTr = $('<tr>');
					$pageTh = $("<th colspan='9'>");
					$pageUl = $('<ul class="pagination pagination-lg justify-content-center">');
					$previousLi = $('<li class="page-item">');
					$previousA = $('<a class="page-link" onclick="resFirstPageMove(' +1+')" aria-label="Previous">');
					$previousHidden = $('<span aria-hidden="true">').text('<<');
					$previousSrOnly = $('<span class="sr-only">').text('Previous');
					
					$previousA.append($previousHidden);
					$previousA.append($previousSrOnly);
					$previousLi.append($previousA);
					$pageUl.append($previousLi);
					
					if(data.pi.currentPage <= 1){
						$leftIconDisableLi = $('<li class="page-item">');
						$leftAtag = $('<a class="page-link">').text("<");
						$leftIconDisableLi.append($leftAtag);
						$pageUl.append($leftIconDisableLi);
					}else{
						currentPage = (data.pi.currentPage-1);
						$leftIconAbleLi = $('<li class="page-item">');
						$leftAtag2 = $('<a class="page-link" onclick="resBeforePageMove('+currentPage+')">').text("<");
						$leftIconAbleLi.append($leftAtag2);
						$pageUl.append($leftIconAbleLi);
					}
					
					for(var i = data.pi.startPage ; i <= data.pi.endPage; i++){
						if(i == data.pi.currentPage){
							$currentIconAbleLi = $('<li class="page-item">');
							$currentAtag = $('<a class="page-link">').text(i);
							$currentIconAbleLi.append($currentAtag);
							$pageUl.append($currentIconAbleLi);
						}else{
							$currentIconAbleLi2 = $('<li class="page-item">');
							$currentAtag2 = $('<a class="page-link" onclick="resOnePageMove('+ i +')">').text(i);
							$currentIconAbleLi2.append($currentAtag2);
							$pageUl.append($currentIconAbleLi2);
						}
					}				
					
					if(data.pi.currentPage >= data.pi.maxPage){
						$rightIconDisableLi = $('<li class="page-item">');
						$rightAtag = $('<a class="page-link">').text(">");
						$rightIconDisableLi.append($rightAtag);
						$pageUl.append($rightIconDisableLi);
					}else{
						currentPage = (data.pi.currentPage+1);
						$rightIconAbleLi = $('<li class="page-item">');
						$rightAtag2 = $('<a class="page-link" onclick="resNextPageMove('+currentPage+')">').text(">");
						$rightIconAbleLi.append($rightAtag2);
						$pageUl.append($rightIconAbleLi);
					}					

					$nextLi = $('<li class="page-item">');
					$nextA = $('<a class="page-link" onclick="resLastPageMove(' +data.pi.maxPage	+')" aria-label="Next">');
					$nextHidden = $('<span aria-hidden="true">').text('>>');
					$nextSrOnly = $('<span class="sr-only">').text('Next');
					
					$nextA.append($nextHidden);
					$nextA.append($nextSrOnly);
					$nextLi.append($nextA);
					$pageUl.append($nextLi);
					$pageTh.append($pageUl);
					$pageTr.append($pageTh);
					
					
                	//새로고침 버튼 설정
                	$centerDiv = $('<div align="center">');
                	$refreshButton = $('<buttron class="btn btn-info animation-on-hover" type="button" id="resParkingStatusRefresh">').text('새로고침');
					
                	$centerDiv.append($refreshButton);
                	$pageTh.append($centerDiv);
                	$pageTr.append($pageTh);    
					
					$tfootId.append($pageTr);
					
                	//새로고침 동적 이벤트 구현
                	$("#resParkingStatusRefresh").on('click',function(){
                		resParkingSystem(1);	
                	});			
				}
			},
			error:function(data){
				console.log("데이터 통신 실패");
			}
		});
		
		$("#TabTwo").click();
	}
	 
	 //예약 현황 재귀호출
		function resFirstPageMove(data){		
			resParkingSystem(data);		
		}
		function resBeforePageMove(data){
			resParkingSystem(data);		
		}
		function resOnePageMove(data){
			resParkingSystem(data);		
		}
		function resNextPageMove(data){
			resParkingSystem(data);		
		}
		function resLastPageMove(data){
			resParkingSystem(data);		
		}
		
		//승인,반송 함수
		var completeResNo = 0;
		function resComplete(data){
			$("#modalBtn").click();
			completeResNo = data;
		}
		
		function resCancel(data){
			$("#modalBtn2").click();
			completeResNo = data;
		}
		
		//승인 업데이트,반송 업데이트 함수
		function updateResComplete(){
			console.log(completeResNo);
			
			$.ajax({
				url:"updateResComplete.pc",
				type:"post",
				data:{completeResNo:completeResNo},
				success:function(data){
					if(data.message != '예약 업데이트 실패'){
						location.reload();
					}
				},
				error:function(data){
					console.log("데이터 전송 실패");
				}
			});
			
		}
		
		function updateResCancel(){
			var resCancelText = $("#resCancelText").val();
			
			$.ajax({
				url:"updateResCancel.pc",
				type:"post",
				data:{completeResNo:completeResNo,resCancelText:resCancelText},
				success:function(data){
					if(data.message != '반송 업데이트 실패'){
						location.reload();
					}
					console.log(data);
				},
				error:function(data){
					console.log("데이터 전송 실패");
				}
			});
			
		}
	 
		
	//전역변수 설정
	var resultCarNo = "";
	var resultMemberNo = 0;
	/* var resultMemberId = ""; */
	var resultResNo = "";
	var resultPhone = "";
	var resultYear;
	var resultMonth;
	var resultDay;
	var resultHours;
	var resultMin;
	
	//비회원 주차장 현황 조회 메소드
	function nonMemberParkingSystem(){
		var selectParkingBox = $("#inputGroupSelect01 option:selected").val();
		$.ajax({
			url:"searchPakringSize.pc",
			type:"post",
			data:{selectParkingBox:selectParkingBox},
			success:function(data){
				console.log(data);
				$("#nonMemberParkingSize").text(data.hmap.LEFT_SIZE+"/"+data.hmap.PARKING_SIZE);
				if(data.hmap.LEFT_SIZE == "0"){
					$("#nonMemberAcceptInputCar").attr('disabled',true);
				}
			},
			error:function(data){
				console.log("데이터 통신 실패!");
			}
		});
		$("#TabThree").click();
	}
	
	function acceptInputCar(){
		
		var regExp1 = /^[0-9]\d{1,2}[-][가-힣]\d{1,4}/g;
		car_no = $("#nonMemberCarNo").val();
			
		if($("#nonMemberCarNo").val() == ""){
			$("#modalText").html('');
			var modalText = $("<b>").text("차 번호를 입력해주세요.");
			$("#modalText").append(modalText);
			$("#modalBtn3").click();
			return false;
		}else if(!regExp1.test(car_no)){
			$("#modalText").html('');
			var modalText = $("<b>").text("올바른 차 번호를 입력해주세요.[2019년 개정 000-(가-힣)0000]");
			$("#modalText").append(modalText);
			$("#modalBtn3").click();
			return false;
		}
		$("#modalText").html('');
		
		var regExp2 = /\d{1,3}[-]\d{1,4}[-]\d{1,4}/g;
		phone = $("#nonMemberPhone").val();
		if($("#nonMemberPhone").val() == ""){
			$("#modalText").html('');
			var modalText = $("<b>").text("휴대폰 번호를 입력해주세요.");
			$("#modalText").append(modalText);
			$("#modalBtn3").click();
			return false;
		}else if(!regExp2.test(phone)){
			$("#modalText").html('');
			var modalText = $("<b>").text("올바른 휴대폰 번호를 입력해주세요");
			$("#modalText").append(modalText);
			$("#modalBtn3").click();
			return false;
		}
		$("#modalText").html('');
		
		//현재 시간 구하기
		var today = new Date();
		
		$("#resultCarNo").text(car_no);
		$("#resultMemberName").text("비회원");
		$("#resultPhone").text(phone);
		$("#resultInsertDate").text((1900+today.getYear())+"년 "+(today.getMonth()+1)+"월 "+today.getDate()+"일 "+today.getHours()+"시 "+today.getMinutes()+"분");
		
		//전역변수에 값 넣기
		resultCarNo = car_no;
		resultMemberName = "비회원";
		resultPhone = phone;
		resultYear = 1900+today.getYear();
		resultMonth = today.getMonth()+1;
		resultDay = today.getDate();
		resultHours = today.getHours();
		resultMin = today.getMinutes();
		
		$("#nonMemberInsertCar").click();
	}
	
	
	//출차 메소드
	function nonMemberAcceptOutputCar(){
		//주차장 데이터 가져오기
		var selectParkingBox = $("#inputGroupSelect01 option:selected").val();
		
		var regExp1 = /^[0-9]\d{1,2}[-][가-힣]\d{1,4}/g;
		car_no = $("#nonMemberCarNo2").val();
			
		if($("#nonMemberCarNo2").val() == ""){
			$("#modalText").html('');
			var modalText = $("<b>").text("차 번호를 입력해주세요.");
			$("#modalText").append(modalText);
			$("#modalBtn3").click();
			return false;
		}else if(!regExp1.test(car_no)){
			$("#modalText").html('');
			var modalText = $("<b>").text("올바른 차 번호를 입력해주세요.[2019년 개정 000-(가-힣)0000]");
			$("#modalText").append(modalText);
			$("#modalBtn3").click();
			return false;
		}
		$("#modalText").html('');
		
		//비회원 출차모달에 넣을 데이터 조회
		$.ajax({
			url:"selectNonMemberOutputCar.pc",
			type:"post",
			data:{selectParkingBox:selectParkingBox,car_no:car_no},
			success:function(data){
				console.log(data);
				$("#resultOutputCarNo").text(data.hmap.CAR_NO);
				$("#resultOutputPhone").text(data.hmap.PHONE);
				$("#resultOutputPayment").text(data.hmap.FEE+"원");
				$("#resultOutputDate").text((Math.floor(data.hmap.HOURS/60))+"시 "+(data.hmap.HOURS%60)+"분");
				$("#pointPayment").css('display','none');
			},
			error:function(data){
				console.log("데이터 통신 실패");
			}
		});
		
		$("#updateModal").click();
	}
	///// 비회원 출차 완료
	
	
	/// 입차회원 탭 클릭 메소드
	function memberParkingSystem(){
		var selectParkingBox = $("#inputGroupSelect01 option:selected").val();
		$.ajax({
			url:"searchPakringSize.pc",
			type:"post",
			data:{selectParkingBox:selectParkingBox},
			success:function(data){
				console.log(data);
				$("#nomalMemberParkingSize").text(data.hmap.LEFT_SIZE+"/"+data.hmap.PARKING_SIZE);
			},
			error:function(data){
				console.log("데이터 통신 실패!");
			}
		});
		$("#TabFour").click();
	}
	
	//일반회원 입차 클릭시 메소드
	function nomalMemberInputCar(){

		var member_id = $("#nomalMemberInputText").val();
		
		if(member_id == null || member_id == ''){
			$("#modalText").html('');
			var modalText = $("<b>").text("회원 아이디를 입력해주세요.");
			$("#modalText").append(modalText);
			$("#modalBtn3").click();
			return false;
		}
		$("#modalText").html('');
		
		// 조회해온 주차장 번호와 일반유저 아이디로 회원 정보 조회
		
		$.ajax({
			type:"post",
			url:"selectNomalMemberInformation.pc",
			data:{member_id:member_id},
			success:function(data){
				console.log(data);
				
				if(data.hmap.member != null){					
				//조회해온 데이터에 동적으로 테이블 삽입
				//현재 시간 구하기
				var today = new Date();
				$("#nomalMemberId").val(data.hmap.member.member_id);
				$("#nomalMemberCarNo").val(data.hmap.member.member_carNo);
				$("#nomalMemberName").val(data.hmap.member.member_name);
				$("#nomalMemberPhone").val(data.hmap.member.phone);
				$("#nomalMemberInsertDate").text((1900+today.getYear())+"년 "+(today.getMonth()+1)+"월 "+today.getDate()+"일 "+today.getHours()+"시 "+today.getMinutes()+"분");
				$("#nomalMemberInsertCar").click();
				
				resultMemberNo = data.hmap.member.member_no;
				resultYear = 1900+today.getYear();
				resultMonth = today.getMonth()+1;
				resultDay = today.getDate();
				resultHours = today.getHours();
				resultMin = today.getMinutes();
				}else{
					alert("등록된 회원이 아닙니다!");
					return false;
				}
			},
			error:function(data){
				console.log("데이터 통신 실패!");
			}
		});
		
		
		
	}
	
	
	
	
	
	//
	
	function resMemberParkingSystem(){
		var selectParkingBox = $("#inputGroupSelect01 option:selected").val();
		$.ajax({
			url:"searchPakringSize.pc",
			type:"post",
			data:{selectParkingBox:selectParkingBox},
			success:function(data){
				console.log(data);
				$("#resMemberParkingSize").text(data.hmap.LEFT_SIZE+"/"+data.hmap.PARKING_SIZE);
			},
			error:function(data){
				console.log("데이터 통신 실패!");
			}
		});
		$("#TabFive").click();
	}
	
	
	
	
	//비회원 입차 메소드
	function inputCar(){
		var selectParkingBox = $("#inputGroupSelect01 option:selected").val();
		var status = "";
		
		$.ajax({
			url:"insertEntryList.pc",
			type:"post",
			data:{selectParkingBox:selectParkingBox,resultCarNo:resultCarNo,resultMemberNo:resultMemberNo,resultResNo:resultResNo,resultPhone:resultPhone
				,resultYear:resultYear,resultMonth:resultMonth,resultDay:resultDay,resultHours:resultHours,resultMin:resultMin},
			success:function(data){
				console.log(data);
				status = data.message;
			},
			error:function(data){
				console.log(data);
			}
		});
		
		console.log(status);
		if(status == "비회원 입차 실패"){
			return false;
		}
		
		$("#insertModal").click();
	}
	
	
	//일반회원 입차 메소드
		function nomalMemberResultInputCar(){
		resultCarNo = $("#nomalMemberCarNo").val();
		resultPhone = $("#nomalMemberPhone").val();
		var selectParkingBox = $("#inputGroupSelect01 option:selected").val();
		var status = "";
		
		$.ajax({
			url:"insertEntryList.pc",
			type:"post",
			data:{selectParkingBox:selectParkingBox,resultCarNo:resultCarNo,resultMemberNo:resultMemberNo,resultResNo:resultResNo,resultPhone:resultPhone
				,resultYear:resultYear,resultMonth:resultMonth,resultDay:resultDay,resultHours:resultHours,resultMin:resultMin},
			success:function(data){
				console.log(data);
				status = data.message;
			},
			error:function(data){
				console.log(data);
			}
		});
		
		console.log(status);
		if(status == "비회원 입차 실패"){
			return false;
		}
		
		$("#insertModal").click();
	}	
	
	
	
	//일반회원 출차 정보 메소드
	function nomalMemberOutputCar(){
		
var member_id = $("#nomalMemberOutputText").val();
		
		if(member_id == null || member_id == ''){
			$("#modalText").html('');
			var modalText = $("<b>").text("회원 아이디를 입력해주세요.");
			$("#modalText").append(modalText);
			$("#modalBtn3").click();
			return false;
		}
		$("#modalText").html('');
		
		// 조회해온 아이디로 출차 정보 조회
		$.ajax({
			type:"post",
			url:"selectNomalMemberOutputInformation.pc",
			data:{member_id:member_id},
			success:function(data){
				console.log(data);
			},
			error:function(data){
				console.log("데이터 통신 실패!");
			}
		});
		
		
		
		
	}
	

	
	

</script>

</html>