package poly.service;

import java.util.List;

import poly.dto.NoticeDTO;


public interface INoticeService {

   
	//공지사항 등록
	public int InsertNotice(NoticeDTO nDTO) throws Exception;

	
	public List<NoticeDTO> getNoticeList() throws Exception;
	public NoticeDTO getNotice(String bno) throws Exception;
	
	//공지사항 삭제
	public int DeleteNotice(NoticeDTO bno) throws Exception;
	

	//공지사항 수정
	public int UpdateNotice(NoticeDTO nDTO) throws Exception;

}
