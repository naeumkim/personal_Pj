package com.tmeal.reply;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.tmeal.board.BoardBean;

public class replyDAO {
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

	public int insertreply(String repid, String repcontent, int board_no,String reply_date){
		int result = 0;
		int reply_no = 0;
		try {
			conn = getConnection();
			
			sql = "select max(reply_no) from reply_board";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()){ reply_no = rs.getInt(1) +1; }
			System.out.println("reply_no");
			sql = "insert into reply_board values(?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
		
			
			pstmt.setInt(1, reply_no);
			pstmt.setInt(2, board_no);
			pstmt.setString(3, repid);
			pstmt.setString(4, reply_date);
			pstmt.setString(5, repcontent);
			

			result = pstmt.executeUpdate();
			System.out.println("저장완료!");
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			closeDB();
		}
		return result;
		
	}
	
	//getreply();	
	public ArrayList getreplylist(int num){
		ArrayList getreplylist = new ArrayList();
		replyDTO rp = null; 
		
		
		try {
			
			conn = getConnection();
		
			sql = "select * from reply_board where board_no= ? limit 10;";
			pstmt = conn.prepareStatement(sql);
			
			System.out.println("num와 일치하는 데이터를 찾았쓔");
			
			pstmt.setInt(1, num);
			
			System.out.println("num을 저장햇슴");
			
			rs = pstmt.executeQuery();
			
			
			while(rs.next()){
				rp = new replyDTO();
				
				rp.setRepcontent(rs.getString("repcontent"));
				rp.setRepid(rs.getString("repid"));
				rp.setReply_date(rs.getString("reply_date"));
				
				
				getreplylist.add(rp);				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			closeDB();
		}
		
		return getreplylist;
		
		
	}
	//getreply();	

	
	
	//getreplycount();	
	public int getreplycount(int num){
		int recnt = 0;
		int result = 0;
		
			try {
				conn = getConnection();
				sql ="select count(*) from reply_board where board_no =?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, num);
				
				rs = pstmt.executeQuery();
				
				if(rs.next()){
					recnt = rs.getInt(1);
					
					result = 1;
					
				}
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
		return result; 
	}
	
	
	//getreplycount();	
	
}//replyDAO
