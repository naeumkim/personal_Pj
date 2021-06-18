package com.tmeal.board;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.tmeal.board.BoardBean;
import com.tmeal.member.tmmemberbean;

public class BoardDAO {

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
	public void insertboard(BoardBean tb){
		int num= 0;
		
		
		try {
			conn = getConnection();
			
			sql = "select max(num) from tm_board";
			
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				num = rs.getInt(1) +1;
			}
			System.out.println("글 번호 : " + num);
			
			sql = "insert into tm_board values(?,?,?,?,?,?,?,?,?,now(),?,?)";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, num);
			pstmt.setString(2, tb.getId());
			pstmt.setString(3, tb.getPass());
			pstmt.setString(4, tb.getSubject());
			pstmt.setString(5, tb.getContent());
			pstmt.setInt(6, tb.getReadcount());
			pstmt.setInt(7, num);
			pstmt.setInt(8, tb.getRe_lev());
			pstmt.setInt(9, tb.getRe_seq());
			pstmt.setString(10,tb.getIp());
			pstmt.setString(11,tb.getFile());
			
			
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
			sql = "select count(*) from tm_board";
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
	public ArrayList getBoardList(){
		ArrayList boardlistall = new ArrayList();
		BoardBean bb = null;
		
		try {
			conn = getConnection();
			sql = "select * from tm_board";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				bb = new BoardBean();
				
				bb.setNum(rs.getInt("num"));
				bb.setId(rs.getString("id"));
				bb.setSubject(rs.getString("subject"));
				bb.setReadcount(rs.getInt("readcount"));
				
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
	
	
	//getBoardList()
	public ArrayList getBoardList(int startRow, int pageSize){
		ArrayList boardlistall = new ArrayList();
		BoardBean bb = null;
		
		try {
			conn = getConnection();
			sql = "select * from tm_board order by num desc limit ?,?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow-1);
			pstmt.setInt(2, pageSize);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				bb = new BoardBean();
				
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
			sql = "update tm_board set readcount=readcount+1 where num=? ";
			
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
	
	
	
	
	public BoardBean getBoard(int num){
		BoardBean bb = null;
		
		try {
			conn = getConnection();
			sql = "select * from tm_board where num = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs =pstmt.executeQuery();
			if(rs.next()){
				bb = new BoardBean();
				bb.setContent(rs.getString("content"));
				bb.setDate(rs.getDate("date"));
				bb.setIp(rs.getString("ip"));
				bb.setName(rs.getString("id"));
				bb.setNum(rs.getInt("num"));
				bb.setPass(rs.getString("pass"));
				bb.setReadcount(rs.getInt("readcount"));
				bb.setSubject(rs.getString("subject"));
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
	public int updateBoard(BoardBean bb,String id){
		int check = 0;
		try {
			conn = getConnection();
			sql = "select id from tm_board where num = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bb.getNum());
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				if(id.equals(rs.getString("id"))){
					sql = "update tm_board set subject=?,content=? where num=?";
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
	public int deleteBoard(BoardBean bb){
		int check = -2;
			try {
				conn = getConnection();
				sql = "select pass from tm_board where num=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, bb.getNum());
				rs = pstmt.executeQuery();
				
				if(rs.next()){
					if(bb.getPass().equals(rs.getString("pass"))){
						sql = "delete from tm_board where num= ?";
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
	
}//TmaelDAO
