package poly.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import poly.dto.NoticeDTO;
import poly.persistance.mapper.NoticeMapper;
import poly.service.INoticeService;

@Service("NoticeService")
public class NoticeService implements INoticeService{
	
	@Resource(name="NoticeMapper")
	private NoticeMapper noticeMapper;
	
	@Override
	public List<NoticeDTO> getNoticeList() throws Exception {
		return noticeMapper.getNoticeList();
	}

	@Override
	public int InsertNotice(NoticeDTO nDTO) throws Exception {
		
		return noticeMapper.InsertNotice(nDTO);
	}
	
	@Override
	public NoticeDTO getNotice(String bno) throws Exception {
		
		return noticeMapper.getNotice(bno);
	}
	
	@Override
	public int updateNoticeCount(String bno) throws Exception {
		
		return noticeMapper.updateNoticeCount(bno);
	}
	
	
	
	@Override
	public int DeleteNotice(NoticeDTO nDTO) throws Exception {
	
		return noticeMapper.DeleteNotice(nDTO);
	}

	
	@Override
	public int UpdateNotice(NoticeDTO nDTO) throws Exception {
		
	   return noticeMapper.UpdateNotice(nDTO);
	}

}
