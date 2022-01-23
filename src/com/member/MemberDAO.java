package com.koreait.member;

import java.sql.*;
import com.koreait.db.Dbconn;

public class MemberDAO {
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	String sql = "";

	public int join(MemberDTO member) {
		try {
			conn = Dbconn.getConnection();
			sql = "insert into tb_member(mem_userid, mem_userpw, mem_name, mem_hp, mem_email, mem_hobby, mem_ssn1, mem_ssn2, mem_zipcode, mem_address1, mem_address2, mem_address3) values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member.getUserid());
			pstmt.setString(2, member.getUserpw());
			pstmt.setString(3, member.getUsername());
			pstmt.setString(4, member.getHp());
			pstmt.setString(5, member.getEmail());
			String hobbystr = "";
			for (String hobby : member.getHobby()) {
				hobbystr = hobbystr + hobby + " ";
			}
			pstmt.setString(6, hobbystr);
			pstmt.setString(7, member.getSsn1());
			pstmt.setString(8, member.getSsn2());
			pstmt.setString(9, member.getZipcode());
			pstmt.setString(10, member.getAddress1());
			pstmt.setString(11, member.getAddress2());
			pstmt.setString(12, member.getAddress3());
			if (pstmt.executeUpdate() > 0) {
				return 1;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}
	
	public MemberDTO login(MemberDTO member) {
		
		try {
			conn = Dbconn.getConnection();
			sql = "select mem_idx, mem_name from tb_member where mem_userid=? and mem_userpw=?";
	        pstmt = conn.prepareStatement(sql);
	        pstmt.setString(1, member.getUserid());
	        pstmt.setString(2, member.getUserpw());
	        rs = pstmt.executeQuery();
	        
	        if(rs.next()){   // 로그인 성공
	        	member.setUsername(rs.getString("mem_name"));
	        	member.setIdx(rs.getInt("mem_idx"));
	        	
	        	return member;
	        } 
			}catch(Exception e) {
				e.printStackTrace();
			} return null;
	}
	
	public MemberDTO info(MemberDTO member) {
		try {
			conn = Dbconn.getConnection();
			sql = "select *tb_member where mem_userid=?";
	        pstmt = conn.prepareStatement(sql);
	        pstmt.setString(1, member.getUserid());
	        rs = pstmt.executeQuery();
	        
	        if(rs.next()){   // 로그인 성공
	        	member.setUserpw(rs.getString("mem_userpw"));
	        	member.setUsername(rs.getString("mem_userpw"));
	        	member.setHp(rs.getString("mem_hp"));
	        	member.setEmail(rs.getString("mem_email"));
	        	member.setHobby(rs.getString("hobby").split(" "));
	        	member.setSsn1(rs.getString("mem_ssn1"));
	        	member.setSsn2(rs.getString("mem_ssn2"));
	        	member.setZipcode(rs.getString("mem_zipcode"));
	        	member.setAddress1(rs.getString("mem_address1"));
	        	member.setAddress2(rs.getString("mem_address2"));
	        	member.setAddress3(rs.getString("mem_address3"));
	        	
	        	return member;
	        } 
			}catch(Exception e) {
				e.printStackTrace();
			} return null;
	}
}
