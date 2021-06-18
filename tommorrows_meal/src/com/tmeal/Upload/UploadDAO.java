package com.tmeal.Upload;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.tmeal.Upload.UploadBean;
import com.tmeal.member.tmmemberbean;

public class UploadDAO {

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


	//insertboard(tb);
	public void insertboard(UploadBean bb){
		int num= 0;
		
		
		try {
			conn = getConnection();
			
			sql = "select max(num) from upload_board";
			
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				num = rs.getInt(1) +1;
			}
			System.out.println("글 번호 : " + num);
			
			sql = "insert into upload_board values(?,?,?,?,?,?,now(),?,?)";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, num);
			pstmt.setString(2, bb.getId());
			pstmt.setString(3, bb.getPass());
			pstmt.setString(4, bb.getSubject());
			pstmt.setString(5, bb.getContent());
			pstmt.setInt(6, bb.getReadcount());
			pstmt.setString(7,bb.getIp());
			pstmt.setString(8,bb.getFile());
			
			
			pstmt.executeUpdate();
			System.out.println("글쓰기 완료");
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("db연결 실패");
		}finally{
			try {
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
	}//insertboard(tb);
	
	//getBoardCount()
	public int getBoardCount(){
		int cnt = 0;
		
		try {
			conn = getConnection();
			sql = "select count(*) from upload_board";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				cnt = rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			closeDB();
		}
		return cnt;
	}
	//getBoardCount()

	
	//getBoardList()
	public ArrayList getBoardList(int startRow, int pageSize){
		ArrayList boardlistall = new ArrayList();
		UploadBean bb = null;
		
		try {
			conn = getConnection();
			sql = "select * from upload_board order by num desc limit ?,?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow-1);
			pstmt.setInt(2, pageSize);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				bb = new UploadBean();
				
				bb.setNum(rs.getInt("num"));
				bb.setId(rs.getString("id"));
				bb.setSubject(rs.getString("subject"));
				bb.setReadcount(rs.getInt("readcount"));
				bb.setContent(rs.getString("content"));
				bb.setDate(rs.getDate("date"));
				
				
				boardlistall.add(bb);				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			closeDB();
		}
		
		return boardlistall;
		
	}
	//getBoardList()
	
	//bdao.updateReadcount(num);
	public void updateReadcount(int num) {
		
		
		try {
			//1,2 디비연결
			conn = getConnection(); //이 구문도 예외가 발생한다. 위에서 trycatch구문을 적어놓음
			
			//3 sql구문 작성 & pstmt객체
			sql = "update upload_board set readcount=readcount+1 where num=? ";
			
			pstmt = conn.prepareStatement(sql);
			
			//?
			pstmt.setInt(1, num);		
			
			//4 sql 실행
			pstmt.executeUpdate();
			
			System.out.println("글 조회수 증가 완료!");
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			closeDB();
		}
	}
	//bdao.updateReadcount(num);
	
	
	
	
	public UploadBean getBoard(int num){
		UploadBean bb = null;
		
		try {
			conn = getConnection();
			sql = "select * from upload_board where num = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs =pstmt.executeQuery();
			if(rs.next()){
				bb = new UploadBean();
				bb.setContent(rs.getString("content"));
				bb.setDate(rs.getDate("date"));
				bb.setIp(rs.getString("ip"));
				bb.setName(rs.getString("id"));
				bb.setNum(rs.getInt("num"));
				bb.setPass(rs.getString("pass"));
				bb.setReadcount(rs.getInt("readcount"));
				bb.setSubject(rs.getString("subject"));
				bb.setFile(rs.getString("file"));
			
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			closeDB();
		}
		return bb;
	}
	
	//updatBoard(bb)
	public int updateBoard(UploadBean bb,String id){
		int check = 0;
		try {
			conn = getConnection();
			sql = "select id from upload_board where num = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bb.getNum());
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				if(id.equals(rs.getString("id"))){
					sql = "update upload_board set subject=?,content=? where num=?";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, bb.getSubject());
					pstmt.setString(2, bb.getContent());
					pstmt.setInt(3, bb.getNum());
					
					pstmt.executeUpdate();
					
					check = 1;
					
				}else{
					check = 0;
				}
				
			}else{
				check = -1;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			closeDB();
		}
		
		return check;
	}
	
	//updatBoard(bb)
	
	//deleteBoard(bb);
	public int deleteBoard(UploadBean bb){
		int check = -2;
			try {
				conn = getConnection();
				sql = "select pass from upload_board where num=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, bb.getNum());
				rs = pstmt.executeQuery();
				
				if(rs.next()){
					if(bb.getPass().equals(rs.getString("pass"))){
						sql = "delete from upload_board where num= ?";
						pstmt = conn.prepareStatement(sql);
						pstmt.setInt(1, bb.getNum());
						
						check =  pstmt.executeUpdate();
						
					}else{
						check = 0;
					}
					
				
				}else{
					check = -1;
				}
				
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				closeDB();
			}
		
		return check;
		
	}
	
	//deleteBoard(bb);
	
}//BestDAO
