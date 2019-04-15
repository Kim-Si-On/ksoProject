package poly.dto;

import java.util.List;


public class UserDTO {

	private String user_seq; // 기본키, 순번
	private String user_id; // 아이디
	private String user_password; // 비밀번호
	private String user_password_ck; // 비밀번호 확인
	private String user_name; // 등록자명
	private String user_gender; // 성별	
	private String user_email; // 이메일
	private String user_birthday; // 생일
	private String user_birthday2; // 생일
	private String user_birthday3; // 생일
	private String user_phoneNumber; // 전화번호
	

	
	private List<UserDTO> clist;

	
	
	public String getUser_seq() {
		return user_seq;
	}

	public void setUser_seq(String user_seq) {
		this.user_seq = user_seq;
	}
	
	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	
	public String getUser_password() {
		return user_password;
	}

	public void setUser_password(String user_password) {
		this.user_password = user_password;
	}
	
	public String getUser_password_ck() {
		return user_password_ck;
	}

	public void setUser_password_ck(String user_password_ck) {
		this.user_password_ck = user_password_ck;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getUser_gender() {
		return user_gender;
	}

	public void setUser_gender(String user_gender) {
		this.user_gender = user_gender;
	}

	
	public String getUser_email() {
		return user_email;
	}

	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}

	public String getUser_birthday() {
		return user_birthday;
	}

	public void setUser_birthday(String user_birthday) {
		this.user_birthday = user_birthday;
	}
	
	public String getUser_birthday2() {
		return user_birthday2;
	}

	public void setUser_birthday2(String user_birthday2) {
		this.user_birthday2 = user_birthday2;
	}
	
	public String getUser_birthday3() {
		return user_birthday3;
	}

	public void setUser_birthday3(String user_birthday3) {
		this.user_birthday3 = user_birthday3;
	}	
	
	public String getUser_phoneNumber() {
		return user_phoneNumber;
	}

	public void setUser_phoneNumber(String user_phoneNumber) {
		this.user_phoneNumber = user_phoneNumber;
	}
	
	public List<UserDTO> getClist() {
		return clist;
	}

	public void setClist(List<UserDTO> clist) {
		this.clist = clist;
	}

}
