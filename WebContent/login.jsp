<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String userid = null;
	String name = null;
	String idx = null;
	if(session.getAttribute("userid") != null) {	//세션변수 값이 null이 아닐 때
			userid = (String)session.getAttribute("userid");	//userid에 session변수값저장
			name = (String)session.getAttribute("name");
			idx = (String)session.getAttribute("idx");
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>
	<p>로그인</p>
<%
	if(userid == null) {
%>
	<form method="post" action="login_ok.jsp">
			<p>아이디 : <input type="text" name="userid"></p>
			<p>비밀번호 : <input type="password" name="userpw"></p>
			<p><input type="submit" value="로그인"></p>
			<p>아직 회원이 아니신가요? <a href='./regist.jsp'>회원가입</a></p>
	</form>

<%
	} else {
%>
	<h3><%=userid%>(<%=name %>)님 환영합니다!</h3>
	<p><input type="button" value="커뮤니티" onclick="location.href='./board/list.jsp'"></p>
	<p><input type="button" value="정보수정" onclick="location.href='info.jsp'"></p>
	<p><input type="button" value="로그아웃" onclick="location.href='logout.jsp'"></p>
<%
	}
%>	
</body>
</html>