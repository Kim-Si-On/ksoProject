package poly.persistance.mapper;

import java.util.List;

import config.Mapper;
import poly.dto.NoticeDTO;

@Mapper("NoticeMapper")
public interface NoticeMapper {

	public List<NoticeDTO> getNoticeList() throws Exception;
	
	public void NoticeInfo(NoticeDTO nDTO) throws Exception;

	public int InsertNotice(NoticeDTO nDTO) throws Exception;
	
	public NoticeDTO getNotice(String bno) throws Exception;
	
	public int DeleteNotice(NoticeDTO nDTO) throws Exception;
	
	public int UpdateNotice(NoticeDTO nDTO) throws Exception;
}
