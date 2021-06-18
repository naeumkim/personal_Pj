package com.tmeal.reply;

import java.sql.Date;
import java.sql.Timestamp;

public class replyDTO {
	
	private int reply_no;
	private int board_no;
	private String repid;
	private	String reply_date;
	private String repcontent;
	
	
	public int getReply_no() {
		return reply_no;
	}
	public void setReply_no(int reply_no) {
		this.reply_no = reply_no;
	}
	public int getBoard_no() {
		return board_no;
	}
	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}
	public String getRepid() {
		return repid;
	}
	public void setRepid(String repid) {
		this.repid = repid;
	}

	public String getReply_date() {
		return reply_date;
	}
	public void setReply_date(String reply_date) {
		this.reply_date = reply_date;
	}
	public String getRepcontent() {
		return repcontent;
	}
	public void setRepcontent(String repcontent) {
		this.repcontent = repcontent;
	}
	@Override
	public String toString() {
		return "replyDTO [reply_no=" + reply_no + ", board_no=" + board_no + ", repid=" + repid + ", reply_date="
				+ reply_date + ", repcontent=" + repcontent + "]";
	}

	
	
	
	
	
}
