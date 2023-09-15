package model;

public class LoginBean {

	private final String ID = "busanhanjan";
	private final String PWD = "1234";
	
	private String id;
	private String pwd;
	
	public LoginBean() {
	}

	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	
	public boolean checkLogin(String id, String pwd) {
		boolean result = false;
		
		if (id != null && id.equals(this.ID)
		&& pwd != null && pwd.equals(this.PWD)) {
			result = true;
		}
		
		return result;
	}
	
}
