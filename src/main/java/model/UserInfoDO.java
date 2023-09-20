package model;

public class UserInfoDO {
	
	private String ID;
	private String PWD;

	private String username;
	private String id;
	private String pwd;
	private String email;
	
	public UserInfoDO() {
	}

	public String getID() {
		return ID;
	}

	public String getPWD() {
		return PWD;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	
}
