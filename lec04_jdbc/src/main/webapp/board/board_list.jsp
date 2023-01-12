<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
	<title>글 목록</title>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">	
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.1/css/all.css" 
		integrity="sha384-5sAR7xN1Nv6T6+dT2mhtzEpVJvfS3NScPQTrOxhwjIuvcA67KV2R5Jz6kr4abQsz" 
		crossorigin="anonymous">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>	
</head>
<body>
                  <!-- ===========header================ -->
 <header>
	<div class="container border-bottom border-dark">
		<div class="row align-items-start mt-3 p-3 opacity-100">
		  <div class="col mt-2"><a href="#"><i class="fas fa-calendar fa-3x text-dark"></i></a></div>
		  <div class="col" align="center"><a href="getBoardList.do"><img src="resources/images/logo.png" alt="logo" width=90px height=90px ></a></div>
		  
		  <div class="col mt-2 text-end"><a href="#"><i class="fas fa-heart fa-3x text-dark"></i></a>
		  <span class="mx-4"><a href="getUserList.do"><i class="fas fa-user fa-3x text-dark"></i></a></span>
		  <span><a href="#"><i class="fas fa-search fa-3x text-dark" ></i></a></span>					
		  </div>
		</div>
	</div>	
</header>



		                    


                  <!-- ============banner=============== -->
  
  <div id="carouselExampleControls" class="carousel carousel-dark slide mt-3" data-bs-ride="carousel" align="center">
  
				  <div class="carousel-indicators">
				    <button type="button" data-bs-target="#carouselExampleControls" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
				    <button type="button" data-bs-target="#carouselExampleControls" data-bs-slide-to="1" aria-label="Slide 2"></button>
				    <button type="button" data-bs-target="#carouselExampleControls" data-bs-slide-to="2" aria-label="Slide 3"></button>
				  </div>
				  <div class="carousel-inner">
				        <div class="carousel-item active embed-responsive embed-responsive-4by3 ">
				          <img src="resources/images/1.png"   class="d-block w-50 card-img-top embed-responsive-item" alt="banner1" width="300" height="600">
				        </div>
					    <div class="carousel-item embed-responsive embed-responsive-4by3">
					      <img src="resources/images/2.png" class="d-block w-50 card-img-top embed-responsive-item" alt="banner2" width="300" height="600">
					    </div>
					    <div class="carousel-item embed-responsive embed-responsive-4by3">
				          <img src="resources/images/3.png" class="d-block w-50 card-img-top embed-responsive-item" alt="banner3" width="300" height="600">
				       </div>
				  </div>
			</div>
  
  
	             <!-- 전체보기 인력 상품 동네 -->
	<div class="container bg-white sticky-top z-index-10">
	  <div class="row border-bottom border-dark border-top border-dark mt-3 p-3">
		 <div class="col" align="right">
		     <!-- ============search=============== -->
              <form action="getBoardList.do" method="post" id="boardForm"> 
               <input type="hidden" id="curPage" name="curPage" value="${searchVO.getCurPage()}"> 
			   <input type="hidden" id="rowSizePerPage" name="rowSizePerPage" value="${searchVO.getRowSizePerPage()}">
                  <div class="container" >
				   <div class="row justify-content-md">
				    <div class="col col-lg-15">
				      <select class="form-select" id="searchType" name="searchType">
				    	<option value="">검색</option>		
				    	<option value="title" ${searchVO.getSearchType()=="title" ? "selected" : ""}>제목</option>							
				    	<option value="writer" ${searchVO.getSearchType()=="writer" ? "selected" : "" }>작성자</option>							
				    	<option value="cate" ${searchVO.getSearchType()=="cate" ? "selected" : ""}>카테고리</option>						
					
					</select>
				    </div>
				    <div class="col-md-auto">
				      <input class="form-control" name="searchWord" type="text" />
				    </div>
				    <div class="col col-lg-2">
				     <input type="submit" class="btn btn-dark"  value=" Search ">
				    </div>
				  </div>
				 </div>
				</form>	      
		 </div>
		 <div class="col" align="right">
		   <a href="getVoteList.do" class="btn btn-success rounded-circle">동네투표</a>
		 </div>
	  </div>
	 	

	              <!-- ================글작성버튼============= -->
  		<div class="container-lg mt-10 bg-white" align="right">
	     <a href="board/board_insert.jsp" class="w-20 p-3 col-1 mt-3 btn btn-secondary">글작성</a>
	 	</div>
  </div>
  
             <!-- =========상품보기=============== -->
              <!-- ======================LIST========================= -->
              
          <c:set var="i" value="0" />
		 <c:set var="j" value="2" />
		 <div class="container mt-1">
		 <div class="col" align="center">
		 <table>
		  <c:choose>
		   <c:when test="${boardList != null && fn:length(boardList) > 0 }">
		    <c:forEach items="${boardList}" var="board">
		     <c:if test="{i%j == 0}">
		      <tr>
		     </c:if>
		     
		       <!-- 사진이 있으면 -->
			     <c:if test="${ !empty  board.fileName1}">
			     <td align="center"><img src="resources/images/${ board.fileName1 }" class="d-block w-50 card-img-top embed-responsive-item border border-dark mt-3" alt="img"  width="350" height="350">
			     </c:if>
			     <!-- 사진이 없으면 -->
			     <c:if test="${ empty  board.fileName1}">
			     <td align="center"><img src="resources/images/noimg.png"  class="d-block w-50 card-img-top embed-responsive-item border border-dark mt-3" alt="img"  width="350" height="350">
			     </c:if>
				 
				 
		         <a href="getBoard.do?seq=${ board.seq}"><h4>(${board.cate})${board.title}</h4></a>  <h5>${board.writer} / ${board.regDate}</h5></td>
		    <c:if test="${i%j == j-1}">
		     </tr>
		    </c:if> 
		   <c:set var="i" value="${i+1}" />
		    </c:forEach>		    
		   </c:when>		   
		  <c:otherwise>
		   <tr>
		    <td>존재하지 않습니다.</td>
		   </tr>
		  </c:otherwise>
		  </c:choose>		    
		 </table>
		 </div>
    </div>
    

	                 <!-- =======================LIST 끝========================== -->         


			  <!--====== admin일경우 사용자관리 및 신고글관리============  -->
		<c:if test="${ sessionScope.isAdmin }">
		<a href="getUserList.do" class="btn btn-primary">사용자관리</a>
		</c:if>	
		
		<c:if test="${ sessionScope.isAdmin }">
		<a href="getReportList.do" class="btn btn-primary">신고글관리</a>
		</c:if>	

	

                    <!-- ==================페이징============== -->
	
			<div class="row align-items-start mt-3">
			<ul class="col pagination justify-content-center">
			
				<c:set var="cp" value="${searchVO.getCurPage()}"/>
				<c:set var="rp" value="${searchVO.getRowSizePerPage()}"/>
				<c:set var="fp" value="${searchVO.getFirstPage()}"/>
				<c:set var="lp" value="${searchVO.getLastPage()}"/>
				<c:set var="ps" value="${searchVO.getPageSize()}"/>
				<c:set var="tp" value="${searchVO.getTotalPageCount()}"/>
				<c:set var="sc" value="${searchVO.getSearchCategory()}"/>
				<c:set var="st" value="${searchVO.getSearchType()}"/>
				<c:set var="sw" value="${searchVO.getSearchWord()}"/>
																
				<c:if test="${ fp != 1 }">
					<li class="page-item"><a href="getBoardList.do?curPage=1&rowSizePerPage=${rp}&searchType=${st}&searchWord=${sw}" class="page-link"><i class="fas fa-fast-backward"></i></a></li>
					<li class="page-item"><a href="getBoardList.do?curPage=${fp-1}&rowSizePerPage=${rp}&searchType=${st}&searchWord=${sw}" class="page-link"><i class="fas fa-backward"></i></a></li>				
				</c:if>
			
				<c:forEach var="page" begin="${fp}" end="${lp}">
					<li class="page-item ${cp==page ? 'active' : ''}"><a href="getBoardList.do?curPage=${page}&rowSizePerPage=${rp}&searchType=${st}&searchWord=${sw}" class="page-link">${page}</a></li>
				</c:forEach>
				
				<c:if test="${ lp < tp }">
					<li class="page-item "><a href="getBoardList.do?curPage=${lp+ps}&rowSizePerPage=${rp}&searchType=${st}&searchWord=${sw}" class="page-link"><i class="fas fa-forward"></i></a></li>				
					<li class="page-item"><a href="getBoardList.do?curPage=${tp}&rowSizePerPage=${rp}&searchType=${st}&searchWord=${sw}" class="page-link"><i class="fas fa-fast-forward"></i></a></li>				
				</c:if>
			</ul> <!-- pagination -->	
		</div> <!-- 페이징 -->	
</body>
</html>