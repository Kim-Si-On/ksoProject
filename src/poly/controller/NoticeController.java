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


import poly.dto.NoticeDTO;
import poly.service.INoticeService;


/*
 * Controller 선언해야만 Spring 프레임워크에서 Controller인지 인식 가능
 * 자바 서블릿 역할 수행
 * */
@Controller
public class NoticeController {
	private Logger log = Logger.getLogger(this.getClass());

	/*
	 * 비즈니스 로직(중요 로직을 수행하기 위해 사용되는 서비스를 메모리에 적재(싱글톤패턴 적용됨)
	 */
	@Resource(name = "NoticeService")
	private INoticeService noticeService;

	/*
	 * 함수명 위의 value="notice/NoticeList" => /notice/NoticeList.do로 호출되는 url은 무조건 이
	 * 함수가 실행된다. method=RequestMethod.GET => 폼 전송방법을 지정하는 것으로 get방식은 GET, post방식은
	 * POST이다. method => 기입안하면 GET, POST 모두 가능하나, 가급적 적어주는 것이 좋다.
	 */

	@RequestMapping(value = "main")
	public String main(HttpServletRequest request, HttpServletResponse response, Model model, HttpSession session)
			throws Exception {

		System.out.println("main");
		return "/main";
	}

	/**
	 * 게시판 리스트 보여주기
	 */
	@RequestMapping(value = "notice/NoticeList", method = RequestMethod.GET)
	public String NoticeList(HttpServletRequest request, HttpServletResponse response,
			ModelMap model) throws Exception {

		// 로그 찍기(추후 찍은 로그를 통해 이 함수에 접근했는지 파악하기 용이하다.)
		log.info(this.getClass().getName() + ".NoticeList start!");
		
		
		
		
		// 공지사항 리스트 가져오기
		
		 List<NoticeDTO> rList = noticeService.getNoticeList(); 
		 log.info("빼애액"); 
		 if (rList==null){ 
			 rList = new ArrayList<NoticeDTO>();
		  
		  } 
		  log.info("빼애액2");
		  log.info("리스트의 개수 "+rList.size());
		  
		  model.addAttribute("rList", rList);
		  log.info("빼애액3");
		  rList = null;
		 

		// 로그 찍기(추후 찍은 로그를 통해 이 함수 호출이 끝났는지 파악하기 용이하다.)
		log.info(this.getClass().getName() + ".NoticeList end!");

		// 함수 처리가 끝나고 보여줄 JSP 파일명(/WEB-INF/view/notice/NoticeList.jsp)
		return "/notice/NoticeList";

	}

	@RequestMapping(value = "notice/NoticeReg", method = RequestMethod.GET)
	public String NoticeReg(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {

		log.info(this.getClass().getName() + ".NoticeReg start!");

		log.info(this.getClass().getName() + ".NoticeReg end!");

		return "/notice/NoticeReg";

	}

	@RequestMapping(value = "notice/NoticeInfo", method = RequestMethod.GET)
	public String NoticeInfo(HttpServletRequest request, HttpServletResponse response, ModelMap model)
			throws Exception {

		log.info(this.getClass().getName() + ".NoticeInfo start!");

		log.info(this.getClass().getName() + ".NoticeInfo end!");
		String bno  = request.getParameter("nSeq");
		
		NoticeDTO nDTO = new NoticeDTO();
		nDTO = noticeService.getNotice(bno);
		
		model.addAttribute("nDTO", nDTO);

		return "/notice/NoticeInfo";

	}

	@RequestMapping(value = "/notice/NoticeEditInfo", method = RequestMethod.GET)
	public String NoticeEditInfo(HttpServletRequest request, HttpServletResponse response, ModelMap model)
			throws Exception {

	
		String seq = request.getParameter("nSeq");

		NoticeDTO nDTO = new NoticeDTO();
		 nDTO.setNotice_seq(seq);
		
		log.info("제목 "+ seq);

		nDTO = noticeService.getNotice(seq);
		model.addAttribute("nDTO", nDTO);	

		return "/notice/NoticeEditInfo";
	
		
	}
	//공지게시판 등록
		@RequestMapping(value="/notice/Noticeinsert" , method = RequestMethod.POST)
		public String Noticeinsert(HttpServletRequest request,HttpSession session, Model model) throws Exception {
			int result = 0;
			String title = request.getParameter("title");
			String contents = request.getParameter("contents");
			String user_id =(String) session.getAttribute("user_id");

			
			NoticeDTO nDTO = new NoticeDTO();
			 nDTO.setTitle(title);
			 nDTO.setContents(contents);
			 nDTO.setUser_id(user_id);
		 
			
			
			log.info("제목 "+ title);
			log.info("내용 "+ contents);
			log.info("내용 "+ user_id);

			
			result = noticeService.InsertNotice(nDTO);
			
			if(result != 1) {
				String msg = "게시판 등록 실패";
				String url = "/notice/NoticeList.do";
				model.addAttribute("msg",msg);
				model.addAttribute("url",url);
				return "/alert";
				
			}
				
			String msg = "게시판 등록 완료";
			String url = "/notice/NoticeList.do";
			model.addAttribute("msg",msg);
			model.addAttribute("url",url);
			return "/alert";

			}
		//공지사항 삭제
		@RequestMapping(value = "/notice/NoticeDelete", method = RequestMethod.GET)
		public String NoticeDelete(HttpServletRequest request, HttpSession session, HttpServletResponse response, ModelMap model) 
				throws Exception {

			int result = 0;
			String seq = request.getParameter("nSeq");


			
			NoticeDTO nDTO = new NoticeDTO();
			 nDTO.setNotice_seq(seq);
		 
			
			
			log.info("제목 "+ seq);


			
			result = noticeService.DeleteNotice(nDTO);
			
			if(result != 1) {
				String msg = "게시판 삭제 실패";
				String url = "/notice/NoticeList.do";
				model.addAttribute("msg",msg);
				model.addAttribute("url",url);
				return "/alert";
				
			}
				
			String msg = "게시판 삭제 완료";
			String url = "/notice/NoticeList.do";
			model.addAttribute("msg",msg);
			model.addAttribute("url",url);
			return "/alert";

			}		
		
		//공지사항 수정
				@RequestMapping(value = "/notice/NoticeUpdate", method = RequestMethod.POST)
				public String NoticeUpdate(HttpServletRequest request, HttpSession session, HttpServletResponse response, ModelMap model) 
						throws Exception {
					int result = 0;
					String title = request.getParameter("title");
					String notice_yn = request.getParameter("notice_yn");					
					String notice_seq = request.getParameter("nSeq");
					String contents = request.getParameter("contents");

					
					NoticeDTO nDTO = new NoticeDTO();
					 nDTO.setTitle(title);
					 nDTO.setNotice_yn(notice_yn);
					 nDTO.setNotice_seq(notice_seq);
					 nDTO.setContents(contents);

					
					
					log.info("제목 "+ title);
					log.info("제목 "+ notice_yn);
					log.info("제목 "+ notice_seq);
					log.info("내용 "+ contents);
			

					
					result = noticeService.UpdateNotice(nDTO);
					
					if(result != 1) {
						String msg = "게시판 수정 실패";
						String url = "/notice/NoticeList.do";
						model.addAttribute("msg",msg);
						model.addAttribute("url",url);
						return "/alert";
						
					}
						
					String msg = "게시판 수정 완료";
					String url = "/notice/NoticeList.do";
					model.addAttribute("msg",msg);
					model.addAttribute("url",url);
					return "/alert";

				}

}

