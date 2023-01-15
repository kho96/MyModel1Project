package vo;

public class LikeVo {
	private int likno;
	private int bno;
	private String user_id;

	public LikeVo(int likno, int bno, String user_id) {
		super();
		this.likno = likno;
		this.bno = bno;
		this.user_id = user_id;
	}

	public int getLikno() {
		return likno;
	}

	public void setLikno(int likno) {
		this.likno = likno;
	}

	public int getBno() {
		return bno;
	}

	public void setBno(int bno) {
		this.bno = bno;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	@Override
	public String toString() {
		return "LikeVo [likno=" + likno + ", bno=" + bno + ", user_id=" + user_id + "]";
	}

}
