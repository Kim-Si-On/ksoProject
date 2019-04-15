package poly.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import poly.dto.BbsDTO;
import poly.persistance.mapper.BbsMapper;
import poly.service.IBbsService;

@Service("BbsService")
public class BbsService implements IBbsService{
	
	@Resource(name="BbsMapper")
	private BbsMapper bbsMapper;

	@Override
	public List<BbsDTO> getBbsList() throws Exception {
		return bbsMapper.getBbsList();
	}

	@Override
	public int InsertBbs(BbsDTO bDTO) throws Exception {
		
		return bbsMapper.InsertBbs(bDTO);
	}
	
	@Override
	public BbsDTO getBbs(String bbo) throws Exception {
		
		return bbsMapper.getBbs(bbo);
	}
	
	@Override
	public int DeleteBbs(BbsDTO bDTO) throws Exception {
	
		return bbsMapper.DeleteBbs(bDTO);
	}
	
	@Override
	public int UpdateBbs(BbsDTO bDTO) throws Exception {
		
		return bbsMapper.UpdateBbs(bDTO);
	}

	
}
