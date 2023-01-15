package vo;

import java.sql.Timestamp;

/**
 * MySQL 타입 배치<br>
 * DATE => java.sql.Date<br>
 * DATETIME => java.sql.Timestamp<br>
 * TIMESTAMP => java.sql.Timestamp
 */
public class BoardVo {
	private int bno;
	private String title;
	private String content;
	private Timestamp regdate;
	private String user_id;
	private int like_count;

	public BoardVo() {
	}

	public BoardVo(int bno, String title, String content, Timestamp regdate, String user_id, int like_count) {
		super();
		this.bno = bno;
		this.title = title;
		this.content = content;
		this.regdate = regdate;
		this.user_id = user_id;
		this.like_count = like_count;
	}

	public int getBno() {
		return bno;
	}

	public void setBno(int bno) {
		this.bno = bno;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public int getLike_count() {
		return like_count;
	}

	public void setLike_count(int like_count) {
		this.like_count = like_count;
	}

	@Override
	public String toString() {
		return "BoardVo [bno=" + bno + ", title=" + title + ", content=" + content + ", regdate=" + regdate
				+ ", user_id=" + user_id + ", like_count=" + like_count + "]";
	}

}
