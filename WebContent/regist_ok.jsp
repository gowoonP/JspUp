<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.koreait.db.Dbconn" %>
<%
   request.setCharacterEncoding("UTF-8");
   String userid = request.getParameter("userid");
   String userpw = request.getParameter("userpw");
   String name = request.getParameter("name");
   String hp = request.getParameter("hp");
   String email = request.getParameter("email");
   //String hobby = request.getParameter("hobby"); 여러개라 배열로 받아야함
   String hobby[] = request.getParameterValues("hobby");
   String hobbystr = "";
   for(int i = 0; i < hobby.length; i++){
      hobbystr = hobbystr + hobby[i] + " ";   // 드라이브, 등산
   }
   String ssn1 = request.getParameter("ssn1");
   String ssn2 = request.getParameter("ssn2");
   String zipcode = request.getParameter("zipcode");
   String address1 = request.getParameter("address1");
   String address2 = request.getParameter("address2");
   String address3 = request.getParameter("address3");
   
   Connection conn = null;
   PreparedStatement pstmt = null;
   
   String sql = "";
   
   try{
      conn = Dbconn.getConnection();
      if(conn != null){
         sql = "insert into tb_member(mem_userid, mem_userpw, mem_name, mem_hp, mem_email, mem_hobby, mem_ssn1, mem_ssn2, mem_zipcode, mem_address1, mem_address2, mem_address3) values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
         pstmt = conn.prepareStatement(sql);
         pstmt.setString(1, userid);
         pstmt.setString(2, userpw);
         pstmt.setString(3, name);
         pstmt.setString(4, hp);
         pstmt.setString(5, email);
         pstmt.setString(6, hobbystr);
         pstmt.setString(7, ssn1);
         pstmt.setString(8, ssn2);
         pstmt.setString(9, zipcode);
         pstmt.setString(10, address1);
         pstmt.setString(11, address2);
         pstmt.setString(12, address3);
         pstmt.executeUpdate();
      }
   }catch(Exception e){
      e.printStackTrace();
   }
   
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
   <h2>회원가입 완료!</h2>
   <p>아이디 : <%=userid%></p>
    <p>이름 : <%=name%></p>
    <p>휴대폰 번호 : <%=hp%></p>
    <p>이메일 : <%=email%></p>
    <p>취미 : <%=hobbystr%></p>
    <p>주민등록번호 : <%=ssn1%> - <%=ssn2%></p>
    <p>우편번호 : <%=zipcode%></p>
    <p>주소 : <%=address1%></p>
    <p>세부주소 : <%=address2%></p>
    <p>참고항목 : <%=address3%></p>
    <p><a href="./login.jsp">로그인하러 가기</a></p>
</body>
</html>