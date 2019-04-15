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

import poly.dto.BbsDTO;
import poly.service.IBbsService;

/*
 * Controller 선언해야만 Spring 프레임워크에서 Controller인지 인식 가능
 * 자바 서블릿 역할 수행
 * */
@Controller
public class BbsController {
	private Logger log = Logger.getLogger(this.getClass());
	
	/*
	 * 비즈니스 로직(중요 로직을 수행하기 위해 사용되는 서비스를 메모리에 적재(싱글톤패턴 적용됨)
	 * */
	@Resource(name = "BbsService")
	private IBbsService bbsService;
	
	/*
	 * 함수명 위의 value="bbs/BbsList" => /bbs/BbsList.do로 호출되는 url은 무조건 이 함수가 실행된다.
	 * method=RequestMethod.GET => 폼 전송방법을 지정하는 것으로 get방식은 GET, post방식은 POST이다.
	 * method => 기입안하면 GET, POST 모두 가능하나, 가급적 적어주는 것이 좋다.
	 * */

	/**
	 * 게시판 리스트 보여주기
	 * */
	@RequestMapping(value="bbs/BbsList", method=RequestMethod.GET)
	public String BbsList(HttpServletRequest request, HttpServletResponse response, 
			ModelMap model) throws Exception {
		
		//로그 찍기(추후 찍은 로그를 통해 이 함수에 접근했는지 파악하기 용이하다.)
		log.info(this.getClass().getName() + ".BbsList start!");
		
		
		//자유게시판 리스트 가져오기
		
		List<BbsDTO> cList = bbsService.getBbsList();
		log.info("빼애액");
		if (cList==null){
			cList = new ArrayList<BbsDTO>();
			
		}
		log.info("빼애액2");
		log.info("리스트의 개수 "+cList.size());
		
		model.addAttribute("cList", cList);
		log.info("빼애액3");
		cList = null;

		
		//로그 찍기(추후 찍은 로그를 통해 이 함수 호출이 끝났는지 파악하기 용이하다.)
		log.info(this.getClass().getName() + ".BbsList end!");
		
		
		//함수 처리가 끝나고 보여줄 JSP 파일명(/WEB-INF/view/bbs/BbsList.jsp) 
		return "/bbs/BbsList";
		
		
	}
	
	@RequestMapping(value="bbs/BbsReg", method=RequestMethod.GET)
	public String BbsReg(HttpServletRequest request, HttpServletResponse response, 
			ModelMap model) throws Exception {
		
		log.info(this.getClass().getName() + ".BbsReg start!");
		
		log.info(this.getClass().getName() + ".BbsReg end!");
 
		return "/bbs/BbsReg";
	}
	
	@RequestMapping(value="bbs/BbsInfo", method=RequestMethod.GET)
	public String BbsInfo(HttpServletRequest request, HttpServletResponse response, ModelMap model) 
			throws Exception {
		
		log.info(this.getClass().getName() + ".BbsInfo start!");
		
		log.info(this.getClass().getName() + ".BbsInfo end!");
		String bbo = request.getParameter("bSeq");
		
		BbsDTO bDTO = new BbsDTO();
		bDTO = bbsService.getBbs(bbo);
		
		model.addAttribute("bDTO", bDTO);
		
		return "/bbs/BbsInfo";
	}
	
	@RequestMapping(value="bbs/BbsEditInfo", method=RequestMethod.GET)
	public String BbsEditInfo(HttpServletRequest request, HttpServletResponse response, 
			ModelMap model) throws Exception {
		String seq1 = request.getParameter("bSeq");

		BbsDTO bDTO = new BbsDTO();
		 bDTO.setBbs_seq(seq1);
		
		log.info("제목 "+ seq1);

		bDTO = bbsService.getBbs(seq1);
		model.addAttribute("bDTO", bDTO);
		
 
		return "/bbs/BbsEditInfo";
	}
	//자유게시판 등록
		@RequestMapping(value="/bbs/BbsInsert" , method = RequestMethod.POST)
		public String BbsInsert(HttpServletRequest request, HttpSession session, Model model) throws Exception {
			int result = 0;
			String title  = request.getParameter("title");
			String contents= request.getParameter("contents");
			String user_id = (String)session.getAttribute("user_id");


			
			BbsDTO bDTO = new BbsDTO();
			bDTO.setTitle(title);
			bDTO.setContents(contents);
			bDTO.setUser_id(user_id);
			

			log.info("제목 "+ title);
			log.info("내용 "+ contents);
			log.info("내용 "+ user_id);

			
			result = bbsService.InsertBbs(bDTO);
			
			if(result !=1) {
				String msg = "게시판 등록 실패";
				String url = "/bbs/BbsList.do";
				model.addAttribute("msg",msg);
				model.addAttribute("usl",url);
				return "/alert";
			}
			
			String msg = "게시판 등록 완료";
			String url = "/bbs/BbsList.do";
			model.addAttribute("msg",msg);
			model.addAttribute("url",url);
			return "/alert";
	
		}
		
		//자유게시판 삭제
				@RequestMapping(value = "/bbs/BbsDelete", method = RequestMethod.GET)
				public String BbsDelete(HttpServletRequest request, HttpSession session, HttpServletResponse response, ModelMap model) 
						throws Exception {

					int result = 0;
					String seq1 = request.getParameter("bSeq");


					
					BbsDTO bDTO = new BbsDTO();
					 bDTO.setBbs_seq(seq1);
				 
					
					
					log.info("제목 "+ seq1);


					
					result = bbsService.DeleteBbs(bDTO);
					
					if(result != 1) {
						String msg = "게시판 삭제 실패";
						String url = "/bbs/BbsList.do";
						model.addAttribute("msg",msg);
						model.addAttribute("url",url);
						return "/alert";
						
					}
						
					String msg = "게시판 삭제 완료";
					String url = "/bbs/BbsList.do";
					model.addAttribute("msg",msg);
					model.addAttribute("url",url);
					return "/alert";
				
				}
					
					//자유게시판 수정
					@RequestMapping(value = "/bbs/BbsUpdate", method = RequestMethod.POST)
					public String BbsUpdate(HttpServletRequest request, HttpSession session, HttpServletResponse response, ModelMap model) 
							throws Exception {
						int result = 0;
						String title = request.getParameter("title");				
						String bbs_seq = request.getParameter("bSeq");
						String contents = request.getParameter("contents");

						
						BbsDTO bDTO = new BbsDTO();
						 bDTO.setTitle(title);
						 bDTO.setBbs_seq(bbs_seq);
						 bDTO.setContents(contents);

						
						
						log.info("제목 "+ title);
						log.info("제목 "+ bbs_seq);
						log.info("내용 "+ contents);
				

						
						result = bbsService.UpdateBbs(bDTO);
						
						if(result != 1) {
							String msg = "게시판 수정 실패";
							String url = "/bbs/BbsList.do";
							model.addAttribute("msg",msg);
							model.addAttribute("url",url);
							return "/alert";
							
						}
							
						String msg = "게시판 수정 완료";
						String url = "/bbs/BbsList.do";
						model.addAttribute("msg",msg);
						model.addAttribute("url",url);
						return "/alert";	

					
					}	

		
}

