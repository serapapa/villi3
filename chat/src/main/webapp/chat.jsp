<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
   <link href="${pageContext.request.contextPath}/resources/css/chat2.css" rel="stylesheet" type="text/css">
<script
  src="https://code.jquery.com/jquery-3.6.3.slim.min.js"
  integrity="sha256-ZwqZIVdD3iXNyGHbSYdsmWP//UBokj2FHAxKuSBKDSo="
  crossorigin="anonymous"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
   <style>

   </style>
   
</head>
<body>

<div class="container">
<!-- 	<h1 class="page-header">villi</h1>	 -->	
	<div id="top-c">
		</div>
	<table class="table table-bordered">
		<tr>
			<DIV id="bar-a">
			<input type="text" name="user" id="user" class="form-control" placeholder="유저명" >
				 <img src="images/logo.png" alt="logo" width=45px height=45px >

			<!-- <div> -->
				<button type="button" class="btn btn-default" id="btnDisconnect" disabled>종료</button>
				<button type="button" class="btn btn-default" id="btnConnect">연결</button>
			<!-- </div> -->
			</div>
		</tr>
		<tr>
			<td colspan="2"><div id="list"></div></td>
		</tr>
		<div id="chat-inlineBlock">
		<!-- <tr> -->
			<td colspan="2">
			<input type="text" name="msg" id="msg" placeholder="대화 내용을 입력하세요." class="form-control" >
			<input id="btn-submit" type="submit" value="전송" ></td>
			</div>
			<!-- 이전전송 버튼 -->
	 <!-- <div class="chat-inlineBlock">
        <div id="bottom-container">
            <input id="inputMessage" type="text">
            <input id="btn-submit" type="submit" value="전송" > -->
        </div>
    </div>
	<!-- </tr> -->
	</table>
	
</div>



<script>
//채팅 서버 주소
let url = "ws://localhost:8090/chat/chatserver"; 
//internet Explorer 와  edge는 웹소켓을 지원하지 않는다
// 웹 소켓
let ws;
// 연결하기
$('#btnConnect').click(function() {
	// 유저명 확인
	console.log('입장');
   	if ($('#user').val().trim() != '') {
   		// 연결
   		console.log('테스트')
	   	ws = new WebSocket(url);
	   	// 소켓 이벤트 매핑
	   	ws.onopen = function (evt) {
   		console.log('테스트')
	   		// console.log('서버 연결 성공');
	   		print($('#user').val(), '입장했습니다.');
	   				
	   		// 현재 사용자가 입장했다고 서버에게 통지(유저명 전달)
	   		// -> 1#유저명
			ws.send('1#' + $('#user').val() + '#');
					
			$('#user').attr('readonly', true);
			$('#btnConnect').attr('disabled', true);
			$('#btnDisconnect').attr('disabled', false);
			$('#msg').attr('disabled', false);
			$('#msg').focus();
		};
        
		ws.onmessage = function (evt) {
			// print('', evt.data);
			let index = evt.data.indexOf("#", 2);
			let no = evt.data.substring(0, 1); 
			let user = evt.data.substring(2, index);
			let txt = evt.data.substring(index + 1);
	   				
			if (no == '1') {
				print2(user);
			} else if (no == '2') {
				print(user, txt);
			} else if (no == '3') {
				print3(user);
			}
			$('#list').scrollTop($('#list').prop('scrollHeight'));
		};
	   			
		ws.onclose = function (evt) {
			console.log('소켓이 닫힙니다.');
		};

		ws.onerror = function (evt) {
			console.log(evt.data);
		};
	} else {
		alert('유저명을 입력하세요.');
		$('#user').focus();
	}
});

// 메세지 전송 및 아이디
function print(user, txt) {
	let temp = '';
	temp += '<div style="margin-bottom:3px;">';
	temp += '[' + user + '] ';
	temp += txt;
	temp += ' <span style="font-size:11px;color:#777;">' + new Date().toLocaleTimeString() + '</span>';
	temp += '</div>';
			
	$('#list').append(temp);
}
		
// 다른 client 접속		
function print2(user) {
	let temp = '';
	temp += '<div style="margin-bottom:3px;">';
	temp += "'" + user + "' 님이 접속했습니다." ;
	temp += ' <span style="font-size:11px;color:#777;">' + new Date().toLocaleTimeString() + '</span>';
	temp += '</div>';
			
	$('#list').append(temp);
}

// client 접속 종료
function print3(user) {
	let temp = '';
	temp += '<div style="margin-bottom:3px;">';
	temp += "'" + user + "' 님이 종료했습니다." ;
	temp += ' <span style="font-size:11px;color:#777;">' + new Date().toLocaleTimeString() + '</span>';
	temp += '</div>';
			
	$('#list').append(temp);
}

$('#user').keydown(function() {
	if (event.keyCode == 13) {
		$('#btnConnect').click();
	}
});
		
		
		
$('#msg').keydown(function() {
	if (event.keyCode == 13) {
				
		//서버에게 메시지 전달
		//2#유저명#메시지
		ws.send('2#' + $('#user').val() + '#' + $(this).val()); //서버에게
		print($('#user').val(), $(this).val()); //본인 대화창에
		
        $('#msg').val('');
		$('#msg').focus();
				
	}
});
		
$('#btnDisconnect').click(function() {
	ws.send('3#' + $('#user').val() + '#');
	ws.close();
			
	$('#user').attr('readonly', false);
    $('#user').val('');
			
	$('#btnConnect').attr('disabled', false);
	$('#btnDisconnect').attr('disabled', true);
			
	$('#msg').val('');
	$('#msg').attr('disabled', true);
});

</script>
 

</body>
</html>