package com.ispan6.bean.chatsystem;

import java.util.Date;


import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

//import com.alibaba.fastjson.annotation.JSONField;
import com.fasterxml.jackson.annotation.JsonFormat;

public class WebsocketMessage {
	// 发送者name
	public String from;
	// 接收者name 0上线消息 -1给所有人 -2下线消息
	public String to;
	// 发送的文本
	public String text;
	// 发送时间
	//發訊息時間
		@Temporal(TemporalType.TIMESTAMP)
		@JsonFormat(pattern = "yyyy/MM/dd HH:mm:ss", timezone = "GMT+8")
		@DateTimeFormat(pattern ="yyyy/MM/dd HH:mm:ss") // Java 環境內的格式
		private Date date;

	public String getFrom() {
		return from;
	}

	public void setFrom(String from) {
		this.from = from;
	}

	public String getTo() {
		return to;
	}

	public void setTo(String to) {
		this.to = to;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

}
