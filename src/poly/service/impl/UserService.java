package poly.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import poly.dto.UserDTO;
import poly.persistance.mapper.UserMapper;
import poly.service.IUserService;

@Service("UserService")
public class UserService implements IUserService{
	
	@Resource(name="UserMapper")
	private UserMapper userMapper;
	
	
	
	@Override
	public List<UserDTO> getUserList() throws Exception {
		
		return userMapper.getUserList();
	}	
		
	//회원가입
	@Override
	public int insertUserReg(UserDTO uDTO) throws Exception {
	
		return userMapper.insertUserReg(uDTO);
		
	}
	//로그인
	@Override
	public UserDTO getUserLogin(UserDTO uDTO) throws Exception {

		return userMapper.getUserLogin(uDTO);
	}	
		@Override
		public String getIdFind(UserDTO uDTO) throws Exception {

			return userMapper.getIdFind(uDTO);		
	}
		
		@Override
		public String getPasswordFind(UserDTO uDTO) throws Exception {

			return userMapper.getPasswordFind(uDTO);		
	}
	
		@Override
		public UserDTO getUserInfo(String usr) throws Exception {
			
			return userMapper.getUserInfo(usr);
	}
	 	
		@Override
		public int DeleteUser(UserDTO uDTO) throws Exception {
			
			return userMapper.DeleteUser(uDTO);
		}
	
		@Override
		public int UpdateUser(UserDTO uDTO) throws Exception {
			
			return userMapper.UpdateUser(uDTO);
		}
		
		
}
