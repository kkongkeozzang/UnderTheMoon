package kh.spring.util;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

@Service
public class PageNavigator {
	
	public static List<String> getPageNavigator(int recordTotalCount, int currentPage, int recordCountPerPage, int naviCountPerPage, String select, String sort) {
		
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
			String start = "<a href=\"javascript:void(0);\" onclick=\"getPage";
			start += "(" + (startNavi - 1);
			start += ","; 
			start += "\'";
			start += select;
			start += "',"; 
			start += "\'";
			start += sort;
			start += "')\"><";
			start += "</a>";
			pageNavi.add(start);
		}
		for (int i = startNavi; i <= endNavi; i++) {
			String str = "<a href=\"javascript:void(0);\" onclick=\"getPage";
			str += "(" + i;
			str += ","; 
			str += "\'";
			str += select;
			str += "',"; 
			str += "\'";
			str += sort;
			str += "\')\">";
			str += i+"";
			str += "</a>";
			pageNavi.add(str);
		}
		if(needNext) {
			String end = "<a href=\"javascript:void(0);\" onclick=\"getPage";
			end += "(" + (endNavi + 1);
			end += ","; 
			end += "\'";
			end += select;
			end += "',"; 
			end += "\'";
			end += sort;
			end += "')\">>";
			end += "</a>";
			pageNavi.add(end);
		}
		
		return pageNavi;
	}
	
public static List<String> getPageNavigator(int recordTotalCount, int currentPage, int recordCountPerPage, int naviCountPerPage, String sort) {
		
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
			String start = "<a href=\"#a\" onclick=\"getPage";
			start += "(" + (startNavi - 1);
			start += ","; 
			start += "\'";
			start += sort;
			start += "')\"><";
			start += "</a>";
			pageNavi.add(start);
		}
		for (int i = startNavi; i <= endNavi; i++) {
			String str = "<a href=\"#a\" onclick=\"getPage";
			str += "(" + i;
			str += ","; 
			str += "\'";
			str += sort;
			str += "\')\">";
			str += i+"";
			str += "</a>";
			pageNavi.add(str);
		}
		if(needNext) {
			String end = "<a href=\"#a\" onclick=\"getPage";
			end += "(" + (endNavi + 1);
			end += ","; 
			end += "\'";
			end += sort;
			end += "')\">>";
			end += "</a>";
			pageNavi.add(end);
		}
		
		return pageNavi;
	}
	
}
