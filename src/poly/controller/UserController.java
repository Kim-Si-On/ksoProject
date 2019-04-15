package poly.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import poly.dto.UserDTO;
import poly.service.IUserService;
import poly.util.CmmUtil;

/*
 * Controller 선언해야만 Spring 프레임워크에서 Controller인지 인식 가능
 * 자바 서블릿 역할 수행
 * */
@Controller
public class UserController {
	private Logger log = Logger.getLogger(this.getClass());
	
	/*
	 * 비즈니스 로직(중요 로직을 수행하기 위해 사용되는 서비스를 메모리에 적재(싱글톤패턴 적용됨)
	 * */
	@Resource(name = "UserService")
	private IUserService userService;
	
	/*
	 * 함수명 위의 value="user/UserList" => /user/UserList.do로 호출되는 url은 무조건 이 함수가 실행된다.
	 * method=RequestMethod.GET => 폼 전송방법을 지정하는 것으로 get방식은 GET, post방식은 POST이다.
	 * method => 기입안하면 GET, POST 모두 가능하나, 가급적 적어주는 것이 좋다.
	 * */

	/**

	 * 게시판 리스트 보여주기

	 * */

	@RequestMapping(value="user/UserList", method=RequestMethod.GET)

	public String UserList(HttpServletRequest request, HttpServletResponse response, 
			Model model,HttpSession session) throws Exception {
		if(session.getAttribute("user_seq")==null||!CmmUtil.nvl(session.getAttribute("user_seq").toString()).equals("1")) {
			String msg="관리자만 접근할수 있습니다.";
			String url="/main.do";
			model.addAttribute("msg",msg);
			model.addAttribute("url",url);
			return "/alert";

		}

		//로그 찍기(추후 찍은 로그를 통해 이 함수에 접근했는지 파악하기 용이하다.)
		log.info(this.getClass().getName() + ".UserList start!");
		List<UserDTO> uList = userService.getUserList();
		log.info("빼애액");

		if (uList==null){

			uList = new ArrayList<UserDTO>();
		}

		log.info("빼애액2");
		log.info("리스트의 개수 "+uList.size());


		//조회된 리스트 결과값 넣어주기
		model.addAttribute("uList", uList);
		log.info("빼애액3");
		uList = null;


		//로그 찍기(추후 찍은 로그를 통해 이 함수 호출이 끝났는지 파악하기 용이하다.)
		log.info(this.getClass().getName() + ".UserList end!");
		
		//함수 처리가 끝나고 보여줄 JSP 파일명(/WEB-INF/view/user/UserList.jsp) 
		return "/user/UserList";
	}
	
	
	@RequestMapping(value = "user/UserInfo", method = RequestMethod.GET)
	public String UserInfo(HttpServletRequest request, HttpSession session,HttpServletResponse response, ModelMap model)
			throws Exception {

		log.info(this.getClass().getName() + ".UserInfo start!");

		log.info(this.getClass().getName() + ".UserInfo end!");
		String usr = CmmUtil.nvl((String) session.getAttribute("user_seq"));
		if(usr.equals("1")) {
			usr=request.getParameter("uSeq");
		}
		
		UserDTO uDTO = new UserDTO();
		 uDTO.setUser_seq(usr);
		uDTO = userService.getUserInfo(usr);
		
		model.addAttribute("uDTO", uDTO);

		return "/user/UserInfo";

	}

	@RequestMapping(value = "/user/UserEditInfo", method = RequestMethod.GET)
	public String UserEditInfo(HttpServletRequest request, HttpSession session, HttpServletResponse response, ModelMap model)
			throws Exception {

	
		String Seq3 = CmmUtil.nvl((String) session.getAttribute("user_seq"));
		if(Seq3.equals("1")) {
			Seq3=request.getParameter("uSeq");
		}

		UserDTO uDTO = new UserDTO();
		 uDTO.setUser_seq(Seq3);
		
		log.info("제목 "+ Seq3);

		uDTO = userService.getUserInfo(Seq3);
		
		model.addAttribute("uDTO", uDTO);	

		return "/user/UserEditInfo";	
	
	
	
	}
	
	
	

	
	@RequestMapping(value="user/user_login", method=RequestMethod.GET)
	public String Userlogin(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
		
		//로그 찍기(추후 찍은 로그를 통해 이 함수에 접근했는지 파악하기 용이하다.)
		log.info(this.getClass().getName() + ".UserList start!");

		//로그 찍기(추후 찍은 로그를 통해 이 함수 호출이 끝났는지 파악하기 용이하다.)
		log.info(this.getClass().getName() + ".UserList end!");
		
		
		//함수 처리가 끝나고 보여줄 JSP 파일명(/WEB-INF/view/user/UserList.jsp) 
		return "/user/user_login";
		
	}
	
	@RequestMapping(value="user/user_join", method=RequestMethod.GET)
	public String UserJoin(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
		
		//로그 찍기(추후 찍은 로그를 통해 이 함수에 접근했는지 파악하기 용이하다.)
		log.info(this.getClass().getName() + ".UserList start!");

		//로그 찍기(추후 찍은 로그를 통해 이 함수 호출이 끝났는지 파악하기 용이하다.)
		log.info(this.getClass().getName() + ".UserList end!");
		
		
		//함수 처리가 끝나고 보여줄 JSP 파일명(/WEB-INF/view/user/UserList.jsp) 
		return "/user/user_join";
		
	}
	
	
	//회원 가입 
		@RequestMapping(value="/user/user_join_Action")
		public String user_join_Action(HttpServletRequest request,HttpSession session,Model model) throws Exception {
			log.info("start user_login_Action");


			 String user_id=request.getParameter("user_id");
			 log.info(user_id);
			 String user_password=request.getParameter("user_password");
			 log.info(user_password);
			 String user_password_ck=request.getParameter("user_password_ck");
			 log.info(user_password_ck);
			 String user_name=request.getParameter("user_name");
			 log.info(user_name);
			 String user_gender=request.getParameter("user_gender");
			 log.info(user_gender);
			 String user_email=request.getParameter("user_email") ;
			 log.info(user_email);
			 String user_birthday=request.getParameter("user_birthday");
			 log.info(user_birthday);
			 String user_birthday2=request.getParameter("user_birthday2");
			 log.info(user_birthday2);
			 String user_birthday3=request.getParameter("user_birthday3");
			 log.info(user_birthday3);
			 String user_phoneNumber=request.getParameter("user_phoneNumber");
			 log.info(user_phoneNumber);
			 
			 UserDTO uDTO = new UserDTO();
			 uDTO.setUser_id(user_id);
			 uDTO.setUser_password(user_password);
			 uDTO.setUser_password_ck(user_password_ck);
			 uDTO.setUser_name(user_name);
			 uDTO.setUser_gender(user_gender);
			 uDTO.setUser_email(user_email);
			 uDTO.setUser_birthday(user_birthday);
			 uDTO.setUser_birthday2(user_birthday2);
			 uDTO.setUser_birthday3(user_birthday3);
			 uDTO.setUser_phoneNumber(user_phoneNumber);
			 
			 
			 

			 int result; 
			 result=userService.insertUserReg(uDTO);// 성공하지못하면 아무것도 가져오지 못해서 널
				String msg="";
				String url="";
				if(result==0) {
					//로그인 실패
					msg="회원가입에 실패하셨습니다.";
					url = "/user/user_join.do";
					model.addAttribute("msg",msg);
					model.addAttribute("url",url);
					 		
					
					return "/alert";
				}else {
					//로그인 성공
					msg="회원가입에 성공하셨습니다.";
					url="/main.do";
					model.addAttribute("msg",msg);
					model.addAttribute("url",url);
					return "/alert";
	
				}
				//관리자만 관리버튼 나오게 하려고받는 것
				// userNo 도 받아야됨
				
				
				
			}
	

	
	
	//로그인 
			@RequestMapping(value="/user/user_login_Action",method=RequestMethod.POST)
			public String user_login_Action(HttpServletRequest request,HttpSession session,Model model) throws Exception {
				//1. 
				String user_id=CmmUtil.nvl(request.getParameter("user_id"));
				log.info("user_id : "+user_id);
				String user_password = CmmUtil.nvl(request.getParameter("user_password"));
				log.info("user_password : "+ user_password);
				

				
				
				//로그인을 하고나서는 정보를 다받아와야되니 UserDTO 
				//2.데이터를 받아와서
				UserDTO uDTO =new UserDTO();
				uDTO.setUser_id(user_id);
				uDTO.setUser_password(user_password);
			
				uDTO=userService.getUserLogin(uDTO);// 성공하지못하면 아무것도 가져오지 못해서 널
				String msg="";
				String url="";
				if(uDTO==null) {
					//로그인 실패
					msg="입력한 아이디와 비밀번호가 일치하지 않습니다. 아이디 또는 비밀번호를 다시 한번 입력해 주세요..";
					url = "/user/user_login.do";
					model.addAttribute("msg",msg);
					model.addAttribute("url",url);
					 		
					
					return "/alert";
				}else {
					//로그인 성공
					log.info(uDTO.getUser_seq());
					
					session.setAttribute("user_id",uDTO.getUser_id());
					session.setAttribute("user_seq",uDTO.getUser_seq());
				}
				//관리자만 관리버튼 나오게 하려고받는 것
				// userNo 도 받아야됨
				
				
				return "redirect:/main.do";
			}
			//회원 로그아웃
			@RequestMapping(value="/user/logout")
			public String logout(HttpSession session) throws Exception{
				
				//세션을 초기화 시키는 함수
				session.invalidate();
				//로그아웃끝
				
				
				return "redirect:/main.do";
			}
			@RequestMapping(value="/user/id_find_view")
			public String idfindview() throws Exception{
				
				return "/user/id_find";
			
			}
			@RequestMapping(value="/user/password_find_view")
			public String passwordfindview() throws Exception{
				
				return "/user/password_find";
			}
			
			//아이디 찾기
			@RequestMapping(value="/user/id_find",method=RequestMethod.GET)
			public @ResponseBody String id_find(HttpServletRequest request,HttpSession session,Model model) throws Exception {
				 
				
				
				String user_name=CmmUtil.nvl(request.getParameter("user_name"));
				log.info("user_name"+user_name);
				String user_email= CmmUtil.nvl(request.getParameter("user_email"));
				log.info("user_email:"+user_email);
				

				
				
			
				UserDTO uDTO = new UserDTO();
				uDTO.setUser_name(user_name);
				uDTO.setUser_email(user_email);
			
				
				
				String result = userService.getIdFind(uDTO);
				
				log.info(result);
			
				
				return result;
	
			}
			
			
			
			//비밀번호 찾기
			@RequestMapping(value="/user/password_find",method=RequestMethod.GET)
			public @ResponseBody String password_find(HttpServletRequest request,HttpSession session,Model model) throws Exception {
				 
				String user_id=CmmUtil.nvl(request.getParameter("user_id"));
				log.info("user_id"+user_id);
				String user_name=CmmUtil.nvl(request.getParameter("user_name"));
				log.info("user_name"+user_name);
				String user_email= CmmUtil.nvl(request.getParameter("user_email"));
				log.info("user_email:"+user_email);

				
				UserDTO uDTO = new UserDTO();
				uDTO.setUser_id(user_id);
				uDTO.setUser_name(user_name);
				uDTO.setUser_email(user_email);
			
				
				
				String result = userService.getPasswordFind(uDTO);
				
				log.info(result);
			
				
				return result;
	
			}
			
		
			
			
			//회원 탈퇴
			@RequestMapping(value = "/user/UserDelete", method = RequestMethod.GET)
			public String UserDelete(HttpServletRequest request, HttpSession session, HttpServletResponse response, ModelMap model) 
					throws Exception {

				int result = 0;
				String usr = CmmUtil.nvl((String) session.getAttribute("user_seq"));
				if(usr.equals("1")) {
					usr=request.getParameter("uSeq");
				}

				
				UserDTO uDTO = new UserDTO();
				 uDTO.setUser_seq(usr);
			 
				
				
				log.info("제목 "+ usr);


				
				result = userService.DeleteUser(uDTO);
				
				if(result != 1) {
					String msg = "회원 탈퇴 실패";
					String url = "/user/UserInfo.do";
					model.addAttribute("msg",msg);
					model.addAttribute("url",url);
					return "/alert";
					
				}
					
				String msg = "회원을 탈퇴하셨습니다. 이용해주셔서 감사합니다";
				String url = "/main.do";
				model.addAttribute("msg",msg);
				model.addAttribute("url",url);
				session.invalidate();
				return "/alert";
				}	
			
			//회원정보 수정
			@RequestMapping(value="/user/UserUpdate", method = RequestMethod.POST)
			public String UserUpdate(HttpServletRequest request,HttpSession session,Model model) throws Exception {

				int result = 0;
				 String user_seq=request.getParameter("user_seq");
				 log.info(user_seq);
				 String user_password=request.getParameter("user_password");
				 log.info(user_password);
				 String user_password_ck=request.getParameter("user_password_ck");
				 log.info(user_password_ck);
				 String user_email=request.getParameter("user_email") ;
				 log.info(user_email);
				 String user_phoneNumber=request.getParameter("user_phoneNumber");
				 log.info(user_phoneNumber);
				 
				 UserDTO uDTO = new UserDTO();
				 uDTO.setUser_seq(user_seq);	
				 uDTO.setUser_password(user_password);			 
				 uDTO.setUser_password_ck(user_password_ck);
				 uDTO.setUser_email(user_email);
				 uDTO.setUser_phoneNumber(user_phoneNumber);
				 
				 
				 

				  
				 result = userService.UpdateUser(uDTO);// 성공하지못하면 아무것도 가져오지 못해서 널
					String msg="";
					String url="";
					if(result==0) {
						//회원정보수정 실패
						msg="수정을 실패하셨습니다.";
						url = "/user/UserInfo.do";
						model.addAttribute("msg",msg);
						model.addAttribute("url",url);
						 		
						
						return "/alert";
					}else {
						//회원정보수정 성공
						msg="내정보를 수정하셨습니다.";
						url="/main.do";
						model.addAttribute("msg",msg);
						model.addAttribute("url",url);
						return "/alert";
		
					}
	
					
				}	
			
}
