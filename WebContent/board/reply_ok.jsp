<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.koreait.db.Dbconn" %>
<%
	request.setCharacterEncoding("UTF-8");
	if(session.getAttribute("userid") == null) {
%>		
	<script>
		alert('로그인 후 이용하세요');
		location.href="../login.jsp";
	</script>

<%
	} else {
		String r_content = request.getParameter("r_content");
		String b_idx = request.getParameter("b_idx");
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "";
		
		try {
			conn = Dbconn.getConnection();
			if(conn != null) {
				sql = "insert into tb_reply(r_userid, r_content, r_boardidx) values (?, ?, ?)";
				
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, (String)session.getAttribute("userid"));
				pstmt.setString(2, r_content);
				pstmt.setString(3, b_idx);
				pstmt.executeUpdate();
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
%>
	<script>
		alert('등록되었습니다.');
		location.href="./view.jsp?b_idx=<%=b_idx%>";
	</script>
<%
	}
%>