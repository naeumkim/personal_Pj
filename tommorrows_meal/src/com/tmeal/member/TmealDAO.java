package com.tmeal.member;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import javax.xml.ws.Response;

import com.tmeal.board.BoardBean;

public class TmealDAO {

	public Connection conn = null;
	private PreparedStatement pstmt = null;
	public ResultSet rs = null;
	private String sql = "";
	
	public Connection getConnection(){
	
		try {
		
		Context initCTX = new InitialContext();
				
		DataSource ds = 
		(DataSource) initCTX.lookup("java:comp/env/jdbc/mysqlDB");
			
		conn = ds.getConnection();
		System.out.println("드라이버 로드, 디비연결 성공!");
		System.out.println(conn);
		
	} catch (NamingException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
			
	return conn; 
}//getConnection 끝
	
	public void closeDB(){
		
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
	}//closeDB

	//login(tm);
	public int login(tmmemberbean tm){
		
		int result = 0;
		
		PreparedStatement pstmt;
		try {
			conn = getConnection();
			
			sql = "select pw from tm_member where id = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, tm.getId());
		
			rs =  pstmt.executeQuery();
			if(rs.next()){
				if(tm.getPw().equals(rs.getString("pw"))){
					result = 1;
				
					
				}else{
					
					result = 0;
				}
			}else{
				result = -1;
			}
				}
			catch (SQLException e) {
			e.printStackTrace();
		}finally {
			closeDB();
		}
		return result;
			
	}//login(tm);
	
	

	public int idcheck(String id){
		int check = 0;

		try {
			conn = getConnection();
			sql ="select * from tm_member where id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				check = 0; //이미 존재하는 회원
			}else{
				check = 1; //가입 가능
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			closeDB();
		}
		return check;
		
	}
	
	
	public int pwcheck(String id,String pw){
		int check = 0;
		
		try {
			conn = getConnection();
			sql ="select pw from tm_member where id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				if(pw.equals(rs.getString("pw"))){
					
					check = 1; //비밀번호 일치
					
				}else{
					check = -1; //비밀번호 불일치
					
				}
			}else{
				check = 0; //아이디없음
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			closeDB();
		}
		return check;
		
	}
	
	
	
	
	
	//join(tm);
	public int join(tmmemberbean mb){
		int result = 0;
		
		try {
			
			conn = getConnection();
			sql = "select * from tm_member where id= ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mb.getId());
		
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				
				result = 0;
				
				
			}else{
			
			sql = "insert into tm_member values(?,?,?,?,?,?,?,?,?,?)";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, mb.getId());
			pstmt.setString(2, mb.getPw());
			pstmt.setString(3, mb.getPwck());
			pstmt.setString(4, mb.getName());
			pstmt.setString(5, mb.getPhoneNumber());
			pstmt.setString(6, mb.getEmail());
			pstmt.setString(7, mb.getAddress());
			pstmt.setString(8, mb.getGender());
			pstmt.setString(9,mb.getBirth());
			pstmt.setTimestamp(10,mb.getRegdate());
			
			result = pstmt.executeUpdate();
			
			System.out.println("회원가입 성공");
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			closeDB();
		}
		return result;
	}//join(mb);
	
	//tmember_info(tm);
	public void tmember_info(tmmemberbean mb,String id){

		try {
			
			conn = getConnection();
			
			sql = "select * from tm_member where id=?";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				mb.setId(rs.getString("id"));
				mb.setPw(rs.getString("pw"));
				mb.setName(rs.getString("name"));
				mb.setPhoneNumber(rs.getString("phoneNumber"));
				mb.setEmail(rs.getString("email"));
				mb.setAddress(rs.getString("address"));
				mb.setGender(rs.getString("gender"));
				mb.setBirth(rs.getString("birth"));
				mb.setRegdate(rs.getTimestamp("regdate"));
				
				System.out.println("회원정보" + mb) ;
			}
				
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			closeDB();
		}
		
	}
	//tmember_info(tm);
	
	//updateForm(mb);
	public int updateForm(tmmemberbean mb){
		int result = 0;
		try {
			conn = getConnection();
			sql = "select pw from tm_member where id= ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mb.getId());
			
			rs = pstmt.executeQuery();
			
			
			if(rs.next()){
				if(mb.getPw().equals(rs.getString("pw"))){
					
					//새비밀번호 설정x
					if(mb.getNewpw() == null || mb.getNewpwck() == null){ 
						
						sql = "update tm_member set pw=?,name=?,phoneNumber=?,email=?,address=? where id=?";
						pstmt = conn.prepareStatement(sql);
						pstmt.setString(1, mb.getPw());
						pstmt.setString(2, mb.getName());
						pstmt.setString(3, mb.getPhoneNumber());
						pstmt.setString(4, mb.getEmail());
						pstmt.setString(5, mb.getAddress());
						pstmt.setString(6, mb.getId());
						
						pstmt.executeUpdate();
						
						System.out.println("비밀번호 제외 변경 완료");
						
						
						result = 2;
						//새비밀번호 설정x
						
					}else{
						
						//새비밀번호 설정o
					
								if(mb.getNewpw().equals(mb.getNewpwck())){
								sql = "update tm_member set pw=?,name=?,phoneNumber=?,email=?,address=? where id=?";
								pstmt = conn.prepareStatement(sql);
								pstmt.setString(1, mb.getNewpw());
								pstmt.setString(2, mb.getName());
								pstmt.setString(3, mb.getPhoneNumber());
								pstmt.setString(4, mb.getEmail());
								pstmt.setString(5, mb.getAddress());
								pstmt.setString(6, mb.getId());
								
								result= pstmt.executeUpdate();
						
								}else{result = -2;}
							 //비밀번호 일치x
						}
					
					
					
					
					
					}else{result = -1;} 
					
			
			}//pw == 
			
			
			
			}catch (SQLException e) {e.printStackTrace();
			}finally {closeDB();
			}
		return result;
	
			
	}//updateForm(mb);
	

				
				
				
				
	//deleteinfo(mb);
	public int deleteinfo(tmmemberbean mb){
		int result = 0;
		try {
			conn = getConnection();
			sql = "select * from tm_member where id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mb.getId());
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				
				if(mb.getPw().equals(rs.getString("pw"))){
					sql = "delete from tm_member where id=?";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, mb.getId());
					pstmt.executeUpdate();
					
					
				return result = 1;
				
				}else{
					return result = -3;
				}
				
			}else{
				return result = -1;
			}
			
		
		
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			closeDB();
		}
		return result;
	}//deleteinfo(mb);
	
	//view(mb)
	public ArrayList viewlist(){
		
		ArrayList viewlistall = new ArrayList();
		
		tmmemberbean mb = null;
		
		try {
			conn = getConnection();
			sql = "select * from tm_member where id != 'admin'";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				mb = new tmmemberbean();
				
				mb.setId(rs.getString("id"));
				mb.setPw(rs.getString("pw"));
				mb.setName(rs.getString("name"));
				mb.setPhoneNumber(rs.getString("phoneNumber"));
				mb.setEmail(rs.getString("email"));
				mb.setAddress(rs.getString("address"));
				mb.setGender(rs.getString("gender"));
				mb.setBirth(rs.getString("birth"));
				mb.setRegdate(rs.getTimestamp("regdate"));
				
				viewlistall.add(mb);				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			closeDB();
		}
		
		return viewlistall;
	}
	//view(mb)
	
	
}//TmaelDAO
