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
 
   <!-- ============search=============== -->
              <form action="getBoardList.do" method="post" id="boardForm"> 
               <input type="hidden" id="curPage" name="curPage" value="${searchVO.getCurPage()}"> 
			   <input type="hidden" id="rowSizePerPage" name="rowSizePerPage" value="${searchVO.getRowSizePerPage()}">
                  <div class="container">
				   <div class="row justify-content-md">
				    <div class="col col-lg-2">
				      <select class="form-select" id="searchType" name="searchType">
				    	<option value="">검색</option>		
				    	<option value="title" ${searchVO.getSearchType()=="title" ? "selected" : ""}>제목</option>							
				    	<option value="writer" ${searchVO.getSearchType()=="writer" ? "selected" : "" }>작성자</option>							
				    	<option value="cate" ${searchVO.getSearchType()=="cate" ? "selected" : ""}>카테고리</option>						
					
					</select>
				    </div>
				    <div class="col-md-auto">
				      <input class="form-control" name="searchWord" type="text" placeholder="input search keyword..." />
				    </div>
				    <div class="col col-lg-2">
				     <input type="submit" class="btn btn-primary"  value=" Search ">
				    </div>
				  </div>
				 </div>
				</form>
  
</body>
</html>
