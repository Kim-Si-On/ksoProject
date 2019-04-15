package poly.service;

import java.util.List;

import poly.dto.UserDTO;

public interface IUserService {

	//회원가입
	public int insertUserReg(UserDTO uDTO) throws Exception;
	
	public UserDTO getUserLogin(UserDTO uDTO) throws Exception;


	public List<UserDTO> getUserList() throws Exception;


	public String getIdFind(UserDTO uDTO) throws Exception;
	
	
	public String getPasswordFind(UserDTO uDTO) throws Exception;
	
	//내 정보
	public UserDTO getUserInfo(String usr) throws Exception;
	
	//회원 탈퇴
	public int DeleteUser(UserDTO usr)throws Exception;
	
	//회원정보 수정
	public int UpdateUser(UserDTO uDTO) throws Exception;
	

}
