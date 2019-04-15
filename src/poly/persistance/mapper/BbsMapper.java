package poly.persistance.mapper;

import java.util.List;

import config.Mapper;
import poly.dto.BbsDTO;

@Mapper("BbsMapper")
public interface BbsMapper {

	public List<BbsDTO> getBbsList() throws Exception;
	
	public void BbsInfo (BbsDTO bDTO) throws Exception;

	public int InsertBbs(BbsDTO bDTO) throws Exception;
	
	public BbsDTO getBbs(String bbo) throws Exception;
	
	public int DeleteBbs(BbsDTO bDTO) throws Exception;
	
	public int UpdateBbs(BbsDTO bDTO) throws Exception;
}
