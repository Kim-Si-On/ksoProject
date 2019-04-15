package poly.service;

import java.util.List;

import poly.dto.BbsDTO;

public interface IBbsService {

	

	//자유게시판 등록
	public int InsertBbs(BbsDTO bDTO) throws Exception;
	
	public List<BbsDTO> getBbsList() throws Exception;
	
	public BbsDTO getBbs(String bbo) throws Exception;

	//자유게시판 삭제
	public int DeleteBbs(BbsDTO bbo) throws Exception;
	
	
	//자유게시판 삭제
	public int UpdateBbs(BbsDTO bDTO) throws Exception;
	
	
	
}
