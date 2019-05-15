package poly.service;

import java.util.List;

import poly.dto.NoticeDTO;


public interface INoticeService {

  
	public int InsertNotice(NoticeDTO nDTO) throws Exception;

	public List<NoticeDTO> getNoticeList() throws Exception;
	
	public int updateNoticeCount(String bno) throws Exception;
	
	public NoticeDTO getNotice(String bno) throws Exception;
	
	public int DeleteNotice(NoticeDTO bno) throws Exception;
	
	public int UpdateNotice(NoticeDTO nDTO) throws Exception;

}
