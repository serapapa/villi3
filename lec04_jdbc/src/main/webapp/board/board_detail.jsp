<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<title>Spring Framework</title>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">	
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.1/css/all.css" 
		integrity="sha384-5sAR7xN1Nv6T6+dT2mhtzEpVJvfS3NScPQTrOxhwjIuvcA67KV2R5Jz6kr4abQsz" 
		crossorigin="anonymous">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>	
</head>

<body class="bg-light">
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

          <!-- 이미지 -->   
	<div class="container-lg" >
		<div class="border-bottom border-dark p-3 " align="center">
                                  <!-- 이미지 -->                                    
	            <div id="carouselExampleIndicators" class="carousel carousel-dark slide" data-bs-ride="carousel">
	              <div class="carousel-indicators">
				    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
				    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
				    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
				    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="3" aria-label="Slide 4"></button>
				    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="4" aria-label="Slide 5"></button>
				  </div>
				  
				  
				  <div class="carousel-inner">
				 
				        <div class="carousel-item active embed-responsive embed-responsive-4by3" data-bs-interval="10000">	        	
                         <c:if test="${ !empty  board.fileName1}">	
				         <img src="resources/images/${ board.fileName1 }"   class="d-block w-75 card-img-top embed-responsive-item" alt="img" width="500" height="500">
				         </c:if>	
				     	  <c:if test="${ empty  board.fileName1}">
				     	 <img src="resources/images/noimg.png"  class="d-block w-75 card-img-top embed-responsive-item" alt="img" width="500" height="500">
				         </c:if>              
				        </div>
				        
				        
					    <div class="carousel-item embed-responsive embed-responsive-4by3" data-bs-interval="2000">
				         <c:if test="${ !empty  board.fileName2}">	
				         <img src="resources/images/${ board.fileName2 }"   class="d-block w-75 card-img-top embed-responsive-item" alt="img" width="500" height="500">
				         </c:if>	
				     	  <c:if test="${ empty  board.fileName2}">
				     	 <img src="resources/images/noimg.png"  class="d-block w-75 card-img-top embed-responsive-item" alt="img" width="500" height="500">
				         </c:if>
				        </div>	       
				        
				                   
					    <div class="carousel-item embed-responsive embed-responsive-4by3" >
				         <c:if test="${ !empty  board.fileName3}">	
				         <img src="resources/images/${ board.fileName3 }"   class="d-block w-75 card-img-top embed-responsive-item" alt="img" width="500" height="500">
				         </c:if>	
				     	  <c:if test="${ empty  board.fileName3}">
				     	 <img src="resources/images/noimg.png"  class="d-block w-75 card-img-top embed-responsive-item" alt="img" width="500" height="500">
				         </c:if>
				        </div>	
				        
				        
				        
					    <div class="carousel-item embed-responsive embed-responsive-4by3" >
				         <c:if test="${ !empty  board.fileName4}">	
				         <img src="resources/images/${ board.fileName4}"   class="d-block w-75 card-img-top embed-responsive-item" alt="img" width="500" height="500">
				         </c:if>	
				     	  <c:if test="${ empty  board.fileName4}">
				     	 <img src="resources/images/noimg.png"  class="d-block w-75 card-img-top embed-responsive-item" alt="img" width="500" height="500">
				         </c:if>
				        </div>	
				        
				        
					    <div class="carousel-item embed-responsive embed-responsive-4by3" >
				           <c:if test="${ !empty  board.fileName5}">	
				         <img src="resources/images/${ board.fileName5}"   class="d-block w-75 card-img-top embed-responsive-item" alt="img" width="500" height="500">
				         </c:if>	
				     	  <c:if test="${ empty  board.fileName5}">
				     	 <img src="resources/images/noimg.png"  class="d-block w-75 card-img-top embed-responsive-item" alt="img" width="500" height="500">
				         </c:if>
				        </div>
				  </div>

		</div>
	</div> 
</div>
	
	<div class="container" align="center">
		<form action="updateBoard.do" method="post">			
	<div class="card">
	  <div class="card-body">
	    <h5 class="card-title text-start">
	    <img src="resources/images/noimg.png" class="rounded-circle border border-dark" alt="img" width="75" height="75">
	   <span>${ board.writer }</span> 
	   <span class="fs-6 bg-warning text-white rounded-pill">회원등급</span>
<!-- 	   <p class="fs-4 bg-secondary text-end">대여중</p>    -->
	    </h5>
	    
	  </div>
	  <ul class="list-group list-group-flush">
	    <li class="list-group-item text-start"><p class="fs-3 fw-bold">(${ board.cate })${ board.title }</p>
	    <p>${ board.cate2 }</p>
	    <p>${board.regDate}</p>
	    <p class="fs-3 text-center mt-4">${ board.content }</p>
	    <p class="mt-4">조회 : ${ board.cnt }</p>
	    
	    </li>
	    <li class="list-group-item text-start"><a href="report/report_insert.jsp" class="btn btn-danger">이 게시글 신고하기</a></li>
	  </ul>
	  <div class="card-body">	
		    <input type="submit" class="btn btn-primary" value="글수정" />
<!-- 		<a href="board/board_insert.jsp" class="btn btn-primary">글등록</a> -->
			<a href="getBoardList.do" class="btn btn-primary">글목록</a>
			<a href="#" class="btn btn-danger"  onclick="deleteBoard()">글삭제</a>
	  </div>
	</div>
		</form>			
	</div>
<div class="container bg-white z-index-10">
	  <div class="row border-bottom border-dark border-top border-dark mt-3 p-3" > 
		 <div class="col" align="center">
            
		 </div>
		 <div class="col" align="center">
		    
		 </div>
		 <div class="col" align="center">
		    
		 </div>
		 <div class="col text-end" align="center">
		   <a href="#" class="btn btn-info">채팅하기</a>
		 </div>
	  </div>
</div>

	<script>
		function deleteBoard() {
			if(confirm("자료를 삭제하겠습니까?")) {
		    	self.location.href = "deleteBoard.do?seq=${ board.seq }";
		    }
		}
	</script>
</body>
</html>
