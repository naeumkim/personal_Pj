package com.tmeal.Upload;
import java.sql.Date;

public class UploadBean {

	private int num;
	private String id;
	private String pass;
	private String subject;
	private	String content;
	private int readcount;
	private Date date;
	private String ip;
	private String file;
		
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	
	public void setId(String id) {
		this.id = id;
	}
	public String getId() {
		return id;
	}
	public void setName(String id) {
		this.id = id;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getReadcount() {
		return readcount;
	}
	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}
	
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	public String getFile() {
		return file;
	}
	public void setFile(String file) {
		this.file = file;
	}

	@Override
	public String toString() {
		return "BestBean [num=" + num + ", id=" + id + ", pass=" + pass + ", subject=" + subject + ", content="
				+ content + ", readcount=" + readcount + ", date=" + date + ", ip=" + ip + ", file=" + file + "]";
	}
	
	}


