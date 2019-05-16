package poly.persistance.mapper;

import java.util.List;

import config.Mapper;
import poly.dto.UserDTO;

@Mapper("UserMapper")
public interface UserMapper {

	public List<UserDTO> getUserList() throws Exception;

	public int insertUserReg(UserDTO uDTO) throws Exception;

	public UserDTO getUserLogin(UserDTO uDTO) throws Exception;
	
	public String getIdFind(UserDTO uDTO) throws Exception;
	
	public String getPasswordFind(UserDTO uDTO) throws Exception;

	public UserDTO getUserInfo(String usr) throws Exception;
	
	public int DeleteUser(UserDTO uDTO) throws Exception;
	
	public int UpdateUser(UserDTO uDTO) throws Exception;
	
	public int getUseridCheck(String id) throws Exception;
}
