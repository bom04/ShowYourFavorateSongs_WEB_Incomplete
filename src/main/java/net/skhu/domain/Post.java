package net.skhu.domain;

import java.util.Date;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

import org.springframework.data.annotation.CreatedDate;

import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.ToString;

@Data
@Entity
@EqualsAndHashCode(exclude = {"board","user","files"})
@ToString(exclude = {"board","user","files"})

public class Post {
	
	public Post() {
		
	}

	public Post(User user, Board board, String title, String content, int view, Date date) {
		// TODO Auto-generated constructor stub
		this.user=user;
		this.board=board;
		this.title=title;
		this.content=content;
		this.view=view;
		this.date=date;
	}

	//기본키
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	int post_id;

	String title;
	String content;

	Integer view;

	//엔티티 생성시 자동으로 시간 저장
	@CreatedDate 
	Date date;


	@ManyToOne
	@JoinColumn(name = "user_idx")
	User user; 	

	@ManyToOne  
	@JoinColumn(name = "board_id")
	Board board;

	@JsonIgnore
	@OneToMany(mappedBy="post")
	List<File2> files;


}













