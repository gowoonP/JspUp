<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@ page import="com.koreait.db.Dbconn" %>
<%
	//DB연결
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs= null;
	ResultSet rs1 = null;
	String sql = "";
	int totalCount = 0;
	int repCount = 0;
	
	try{
	conn = Dbconn.getConnection();
	if(conn != null){
		  sql ="select count(b_idx) as total from tb_board";
		  pstmt= conn.prepareStatement(sql);
		  rs= pstmt.executeQuery();
		  if(rs.next()){
				totalCount = rs.getInt("total");
		  }
		  


		sql = "select b_idx, b_userid, b_title, b_regdate, b_hit, b_like from tb_board order by b_idx desc";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		

	} 
	}catch(Exception e){
	e.printStackTrace();
	}

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>커뮤니티 - 리스트</title>
</head>
<style>
	a {
	text-decoration: none;
	color: black;
	}
</style>
<body>
	<h2>커뮤니티 - 리스트</h2> 
	<p>게시글 : <%=totalCount %>개</p>
	<table border="1" width="800">
		<tr>
			<th width="50">번호</th>
			<th width="300">제목</th>
			<th width="100">글쓴이</th>
			<th width="75">조회수</th>
			<th width="200">날짜</th>
			<th width="75">좋아요</th>
		</tr>
<%
	while(rs.next()) {
		String b_idx = rs.getString("b_idx");
		String b_userid = rs.getString("b_userid");
		String b_title = rs.getString("b_title");
		String b_regdate= rs.getString("b_regdate").substring(0, 10);
		String b_hit = rs.getString("b_hit");
		String b_like = rs.getString("b_like");
		
		sql = "select count(r_boardidx) as tot from tb_reply where r_boardidx=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, b_idx);
		rs1 = pstmt.executeQuery();
		if(rs1.next()) {
			repCount = rs1.getInt("tot");
		}
%>
	<tr align="center">
		<td><%= b_idx%></td>
		<td align="left"><a href="./view.jsp?b_idx=<%=b_idx%>"><%= b_title%>
		<%
			if(repCount != 0) {
		%>
		[<%=repCount %>]
		<%
			}
		%></a></td>
		<td><%= b_userid%></td>
		<td><%= b_hit%></td>
		<td><%= b_regdate%></td>
		<td><%= b_like%></td>
	</tr>
<%
	}
%>
	</table>
	<p><input type= "button" value="글쓰기" onclick="location.href='./write.jsp'"> 
	<input type="button" value="메인" onclick="location.href='../login.jsp'"></p>
</body>
</html>
