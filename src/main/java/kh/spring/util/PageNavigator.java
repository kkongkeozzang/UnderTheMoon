package kh.spring.util;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import kh.spring.dao.MdDAO;

@Service
public class PageNavigator {
	
	public static List<String> getPageNavigator(int recordTotalCount, int currentPage, int recordCountPerPage, int naviCountPerPage) {
		int pageTotalCount = 0;
		
		if(recordTotalCount % recordCountPerPage == 0) {
			pageTotalCount = recordTotalCount / recordCountPerPage;
		} else {
			pageTotalCount = recordTotalCount / recordCountPerPage + 1;
		}
		
		if (currentPage < 1) {
			currentPage = 1;
		} else if (currentPage > pageTotalCount) {
			currentPage = pageTotalCount;
		}
		
		int startNavi = (currentPage-1)/naviCountPerPage * naviCountPerPage + 1;
		int endNavi = startNavi + (naviCountPerPage-1);
		
		if(endNavi > pageTotalCount) {
			endNavi = pageTotalCount;
		}
		
		boolean needPrev = true;
		boolean needNext = true;
		
		if(startNavi == 1) {needPrev = false;}
		if(endNavi == pageTotalCount) {needNext = false;}
		
		List<String> pageNavi = new ArrayList<>();
		if(needPrev) {
			String start = "<a href='#' onclick='getPage(";
			start += "" + (startNavi - 1);
			start += ")'><</a>";
			pageNavi.add(start);
		}
		for (int i = startNavi; i <= endNavi; i++) {
			String str = "<a href='#' onclick='getPage(";
			str += "" + i;
			str += ")'>";
			str += i+"";
			str += "</a>";
			pageNavi.add(str);
		}
		if(needNext) {
			String end = "<a href='#' onclick='getPage(";
			end += "" + (endNavi + 1);
			end += ")'>></a>";
			pageNavi.add(end);
		}
		
		return pageNavi;
	}
	
	public static List<String> getPageNavigatorReviewSort(int recordTotalCount, int currentPage, int recordCountPerPage, int naviCountPerPage) {
		int pageTotalCount = 0;
		
		if(recordTotalCount % recordCountPerPage == 0) {
			pageTotalCount = recordTotalCount / recordCountPerPage;
		} else {
			pageTotalCount = recordTotalCount / recordCountPerPage + 1;
		}
		
		if (currentPage < 1) {
			currentPage = 1;
		} else if (currentPage > pageTotalCount) {
			currentPage = pageTotalCount;
		}
		
		int startNavi = (currentPage-1)/naviCountPerPage * naviCountPerPage + 1;
		int endNavi = startNavi + (naviCountPerPage-1);
		
		if(endNavi > pageTotalCount) {
			endNavi = pageTotalCount;
		}
		
		boolean needPrev = true;
		boolean needNext = true;
		
		if(startNavi == 1) {needPrev = false;}
		if(endNavi == pageTotalCount) {needNext = false;}
		
		List<String> pageNavi = new ArrayList<>();
		if(needPrev) {
			String start = "<a href='#' onclick='getPageReviewSort(";
			start += "" + (startNavi - 1);
			start += ")'><</a>";
			pageNavi.add(start);
		}
		for (int i = startNavi; i <= endNavi; i++) {
			String str = "<a href='#' onclick='getPageReviewSort(";
			str += "" + i;
			str += ")'>";
			str += i+"";
			str += "</a>";
			pageNavi.add(str);
		}
		if(needNext) {
			String end = "<a href='#' onclick='getPageReviewSort(";
			end += "" + (endNavi + 1);
			end += ")'>></a>";
			pageNavi.add(end);
		}
		
		return pageNavi;
	}
	
	public static List<String> getPageNavigatorNewSort(int recordTotalCount, int currentPage, int recordCountPerPage, int naviCountPerPage) {
		int pageTotalCount = 0;
		
		if(recordTotalCount % recordCountPerPage == 0) {
			pageTotalCount = recordTotalCount / recordCountPerPage;
		} else {
			pageTotalCount = recordTotalCount / recordCountPerPage + 1;
		}
		
		if (currentPage < 1) {
			currentPage = 1;
		} else if (currentPage > pageTotalCount) {
			currentPage = pageTotalCount;
		}
		
		int startNavi = (currentPage-1)/naviCountPerPage * naviCountPerPage + 1;
		int endNavi = startNavi + (naviCountPerPage-1);
		
		if(endNavi > pageTotalCount) {
			endNavi = pageTotalCount;
		}
		
		boolean needPrev = true;
		boolean needNext = true;
		
		if(startNavi == 1) {needPrev = false;}
		if(endNavi == pageTotalCount) {needNext = false;}
		
		List<String> pageNavi = new ArrayList<>();
		if(needPrev) {
			String start = "<a href='#' onclick='getPageNewSort(";
			start += "" + (startNavi - 1);
			start += ")'><</a>";
			pageNavi.add(start);
		}
		for (int i = startNavi; i <= endNavi; i++) {
			String str = "<a href='#' onclick='getPageNewSort(";
			str += "" + i;
			str += ")'>";
			str += i+"";
			str += "</a>";
			pageNavi.add(str);
		}
		if(needNext) {
			String end = "<a href='#' onclick='getPageNewSort(";
			end += "" + (endNavi + 1);
			end += ")'>></a>";
			pageNavi.add(end);
		}
		
		return pageNavi;
	}
}
