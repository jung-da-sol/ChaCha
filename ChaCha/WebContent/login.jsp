<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.io.PrintWriter"%>
<%@ page import="member.MemberDAO" %>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<!-- bootstrap 반응형 viewport 추가 -->
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<link rel="stylesheet" href="css/custom.css">
	<title>Cha Cha Chat</title>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script src="js/bootstrap.js"></script>
	
</head>
<body>
<%
	String memberID = null;

	if(session.getAttribute("memberID") != null ){
		memberID = (String) session.getAttribute("memberID");
	}
	
	
	if(memberID != null) {
		session.setAttribute("messageType", "오류메시지");
		session.setAttribute("messageContent", "현재 로그인이 되어있는 상태입니다.");
		response.sendRedirect("index.jsp");
		return;
	}

%>
<nav class="navbar navbar-default">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
			data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="index.jsp">Cha Cha Chat</a>
		</div>
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li class="active"><a href="index.jsp">메인</a></li>
				<li ><a href="find.jsp">친구찾기</a></li>
				<li ><a href="box.jsp">메시지함<span id="unread" class="label label-info"></span></a></li>
				<li ><a href="boardView.jsp">자유게시판</a></li>
			</ul>
			<%
				if(memberID == null) {
					
			%>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
					접속하기<span class="caret"></span>
					</a>
					<ul class="dropdown-menu">
						<li><a href="login.jsp">로그인</a></li>
						<li><a href="join.jsp">회원가입</a></li>
					</ul>
				</li>	
			</ul>
			<%
			}
			%>

		</div>
	</nav>	
	<div class="container">
		<form method="post" action="./memberLogin">
			<table class="table table-bordered table-hover" style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th colspan="2"><h4>로그인</h4></th>
					</tr>
				</thead>	
				<tbody>
					<tr>
						<td style="width: 110px;"><h5>아이디</h5></td>
						<td><input class="form-control" type="text" name="memberID" maxlength="20" placeholder="아이디를 입력하세요"></td>
					</tr>
					<tr>
						<td style="width: 110px;"><h5>비밀번호</h5></td>
						<td><input class="form-control" type="password" name="memberPassword" maxlength="20" placeholder="비밀번호를 입력하세요"></td>
					</tr>
						
				</tbody>	
			</table>
			<input class="btn btn-primary pull-right" type="submit" value="로그인">
		</form>
	</div>
	<%
		String messageType = null;
		if(session.getAttribute("messageType") != null) {
			messageType = (String) session.getAttribute("messageType");
		}
	
		String messageContent = null;
		if(session.getAttribute("messageContent") != null) {
			messageContent = (String) session.getAttribute("messageContent");
		}
		if(messageContent != null) {
	%>
	<div class="modal fade" id="messageModal" tabindex="-1" role="dialog" aria-hidden="true">
		<div class="vertical-alignment-helper">
			<div class="modal-dialog vertical-align-center">
				<div class="modal-content <%if(messageType.equals("오류 메시지")) out.println("panel-warning"); else out.println("panel-success"); %>">
					<div class="modal-header panel-heading">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">&times</span>
							<span class="sr-only">Close</span>
						</button>
						<h4 class="modal-title">
							<%=messageType %>
						</h4>
					</div>
					<div class="modal-body">
						<%=messageContent %>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-primary" data-dismiss="modal">확인</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
		$('#messageModal').modal("show");
	</script>
	<% 		
		session.removeAttribute("messageType");
		session.removeAttribute("messageContent");
	
		}
	%>
	<!--  중복확인 했을 때 메세지 출력 Ajax로 값 보내는 거 -->
	<div class="modal fade" id="checkModal" tabindex="-1" role="dialog" aria-hidden="true">
		<div class="vertical-alignment-helper">
			<div class="modal-dialog vertical-align-center">
				<div id="checkType" class="modal-content panel-info">  
					<div class="modal-header panel-heading">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">&times</span>
							<span class="sr-only">Close</span>
						</button>
						<h4 class="modal-title">
							확인 메시지
						</h4>
					</div>
					<div id="checkMessage" class="modal-body">
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-primary" data-dismiss="modal">확인</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>