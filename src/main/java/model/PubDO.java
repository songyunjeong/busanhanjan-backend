package model;

public class PubDO {
//하나의 행 정보를 저장하기 위한 객체
//폼으로 넘어오는 전체 파라미터를 저장하기 위한 객체
//데이터 저장 및 전달

	private int pno;
	private String pname;
	private String place;
	private String tel;
	private int plike;
	private long star;
	private long category;
	private String link;
	private String homepage;	

	public PubDO() {
	}

	public int getPno() {
		return pno;
	}

	public void setPno(int pno) {
		this.pno = pno;
	}

	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public String getPlace() {
		return place;
	}

	public void setPlace(String place) {
		this.place = place;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public int getPlike() {
		return plike;
	}

	public void setPlike(int plike) {
		this.plike = plike;
	}

	public long getStar() {
		return star;
	}

	public void setStar(long star) {
		this.star = star;
	}

	public long getCategory() {
		return category;
	}

	public void setCategory(long category) {
		this.category = category;
	}

	public String getLink() {
		return link;
	}

	public void setLink(String link) {
		this.link = link;
	}

	public String getHomepage() {
		return homepage;
	}

	public void setHomepage(String homepage) {
		this.homepage = homepage;
	}
}
