package com.guest;

public class GuestDTO {

	private String id;
	private int pwd;
	private String name;
	
	private String content;

	
	
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getPwd() {
		return pwd;
	}

	public void setPwd(int pwd) {
		this.pwd = pwd;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	
	

	
}


/*
create table guestCustom
(id varchar2(10) primary key,
pwd number not null,
name varchar2(10) not null);

create table guestRecord
(id varchar2(10) primary key,
content varchar2(10),
created date,
constraint guestRecord_id_fk foreign key(id)
references guestCustom(id));
*/








