package kh.spring.service;

import java.util.List;

import org.springframework.stereotype.Service;

import kh.spring.dao.NoticeDAO;
import kh.spring.dto.NoticeDTO;

@Service
public class NoticeService {
	
	private final NoticeDAO dao;
	
	public NoticeService(NoticeDAO dao) {
		this.dao = dao;
	}
	
	public List<NoticeDTO> selectAll(){
		return dao.selectAll();
	}
	
	public NoticeDTO selectById(int notice_id) {
		return dao.selectById(notice_id);
	}
	
	public String selectUsername(int member_id) {
		return dao.selectUsername(member_id);
	}
	
	public NoticeDTO selectUpDown(int notice_id) {
		return dao.selectUpDown(notice_id);
	}
	
	public int insert(NoticeDTO dto) {
		return dao.insert(dto);
	}
	
	public int delete(int notice_id) {
		return dao.delete(notice_id);
	}
	
	public int update(NoticeDTO dto) {
		return dao.update(dto);
	}
	
	public int updateViewCount(int notice_id) {
		return dao.updateViewCount(notice_id);
	}
	
	public String getPageNavi(int currentPage) {
		
		int recordTotalCount = dao.selectRecordCount();  // 게시글 총 개수
		int recordCountPerPage = 10; // 한 페이지당 게시글
		int naviCountPerPage = 10;   // 한 페이지당 네비게이터 개수
		
		int pageTotalCount = 0; 	// 총 몇 개의 페이지가 만들어질지
		if(recordTotalCount % recordCountPerPage == 0) {
			pageTotalCount = recordTotalCount/recordCountPerPage;
		}else {
			pageTotalCount = recordTotalCount/recordCountPerPage + 1;
		}
		
		if(currentPage < 1) {
			currentPage = 1;
		}else if(currentPage > pageTotalCount) {
			currentPage = pageTotalCount;
		} // currentPage 인자값을 클라이언트가 조작했을 시 방어하기 위한 코드
		
		int startNavi = (currentPage - 1) / naviCountPerPage * naviCountPerPage + 1;
		int endNavi = startNavi + naviCountPerPage - 1;
		
		// 공식에 의해 발생한 endNavi 값이 실제 페이지 전체 개수보다 클 경우
		if(endNavi > pageTotalCount) {
			endNavi = pageTotalCount;
		}
		
		boolean needPrev = true;
		boolean needNext = true;
		
		if(startNavi == 1) {needPrev = false;}
		
		if(endNavi == pageTotalCount) {needNext = false;}
		
		String pageNavi = "";
		if(needPrev) {pageNavi += "<a href='/notice/toNotice?cpage="+(startNavi-1)+"'><button type='button' class='btn btn-outline-primary' style='background-color:#406882;color:white;'><</button></a> ";}
		for(int i = startNavi; i <= endNavi; i++) {
			pageNavi += "<a href='/notice/toNotice?cpage="+i+"'><button type='button' class='btn btn-outline-primary' style='background-color:#406882;color:white;'>" + i + "</button></a> ";
		}
		if(needNext) {pageNavi += "<a href='/notice/toNotice?cpage="+(endNavi+1)+"'><button type='button' class='btn btn-outline-primary' style='background-color:#406882;color:white;'>></button></a>";}
		
		return pageNavi;
	}
	
	public List<NoticeDTO> selectByBound(int start, int end){
		return dao.selectByBound(start, end);
	}
	
	public List<NoticeDTO> selectByKeyword(String select, String keyword){
		return dao.selectByKeyword(select, keyword);
	}
	
//	public void insertDummy() {
//		dao.insertDummy();
//	}
	
}
