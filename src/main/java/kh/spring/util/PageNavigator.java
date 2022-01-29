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
			String start = "<a href=\"javascript:void(0);\" class=\"navi-btn\" onclick=\"getPage";
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
			String str = "<a href=\"javascript:void(0);\" class=\"navi-btn\" onclick=\"getPage";
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
			String end = "<a href=\"javascript:void(0);\" class=\"navi-btn\" onclick=\"getPage";
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

	public static String getPageNavigator(int recordTotalCount, int currentPage, int recordCountPerPage, int naviCountPerPage, String board, String option, String select, String keyword) {

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

		String pageNavi = "";
		if(board.equals("notice")) {
			if(option.equals("all")) {
				if(needPrev) {pageNavi += "<a href='/notice/toNotice?cPage="+(startNavi-1)+"'><button type='button' class='btn btn-outline-primary' style='background-color:#406882;color:white;'><</button></a> ";}
				for (int i = startNavi; i <= endNavi; i++) {
					pageNavi += "<a href='/notice/toNotice?cPage="+i+"'><button type='button' class='btn btn-outline-primary' style='background-color:#406882;color:white;'>" + i + "</button></a> ";
				}
				if(needNext) {pageNavi += "<a href='/notice/toNotice?cPage="+(endNavi+1)+"'><button type='button' class='btn btn-outline-primary' style='background-color:#406882;color:white;'>></button></a>";}
			}else if(option.equals("search")) {
				if(needPrev) {pageNavi += "<a href='/notice/search?select="+select+"&keyword="+keyword+"&cPage="+(startNavi-1)+"'><button type='button' class='btn btn-outline-primary' style='background-color:#406882;color:white;'><</button></a> ";}
				for (int i = startNavi; i <= endNavi; i++) {
					pageNavi += "<a href='/notice/search?select="+select+"&keyword="+keyword+"&cPage="+i+"'><button type='button' class='btn btn-outline-primary' style='background-color:#406882;color:white;'>" + i + "</button></a> ";
				}
				if(needNext) {pageNavi += "<a href='/notice/search?select="+select+"&keyword="+keyword+"&cPage="+(endNavi+1)+"'><button type='button' class='btn btn-outline-primary' style='background-color:#406882;color:white;'>></button></a>";}
			}
		}else if(board.equals("faq")){
			if(option.equals("all")) {
				if(needPrev) {pageNavi += "<a href='/faq/toFaq?cPage="+(startNavi-1)+"'><button type='button' class='btn btn-outline-primary' style='background-color:#406882;color:white;'><</button></a> ";}
				for (int i = startNavi; i <= endNavi; i++) {
					pageNavi += "<a href='/faq/toFaq?cPage="+i+"'><button type='button' class='btn btn-outline-primary' style='background-color:#406882;color:white;'>" + i + "</button></a> ";
				}
				if(needNext) {pageNavi += "<a href='/faq/toFaq?cPage="+(endNavi+1)+"'><button type='button' class='btn btn-outline-primary' style='background-color:#406882;color:white;'>></button></a>";}
			}else if(option.equals("search")) {
				if(needPrev) {pageNavi += "<a href='/faq/search?select="+select+"&keyword="+keyword+"&cPage="+(startNavi-1)+"'><button type='button' class='btn btn-outline-primary' style='background-color:#406882;color:white;'><</button></a> ";}
				for (int i = startNavi; i <= endNavi; i++) {
					pageNavi += "<a href='/faq/search?select="+select+"&keyword="+keyword+"&cPage="+i+"'><button type='button' class='btn btn-outline-primary' style='background-color:#406882;color:white;'>" + i + "</button></a> ";
				}
				if(needNext) {pageNavi += "<a href='/faq/search?select="+select+"&keyword="+keyword+"&cPage="+(endNavi+1)+"'><button type='button' class='btn btn-outline-primary' style='background-color:#406882;color:white;'>></button></a>";}
			}
		}else if(board.equals("coupon")) {
			if(option.equals("all")) {
				if(needPrev) {pageNavi += "<a href='/mypage/myPageCoupon?cPage="+(startNavi-1)+"'><button type='button' class='btn btn-outline-primary' style='background-color:#406882;color:white;'><</button></a> ";}
				for (int i = startNavi; i <= endNavi; i++) {
					pageNavi += "<a href='/mypage/myPageCoupon?cPage="+i+"'><button type='button' class='btn btn-outline-primary' style='background-color:#406882;color:white;'>" + i + "</button></a> ";
				}
				if(needNext) {pageNavi += "<a href='/mypage/myPageCoupon?cPage="+(endNavi+1)+"'><button type='button' class='btn btn-outline-primary' style='background-color:#406882;color:white;'>></button></a>";}
			}

		}else if(board.equals("myPageList")) {
			if(option.equals("all")) {
				if(needPrev) {pageNavi += "<a href='/mypage/myPageList?cPage="+(startNavi-1)+"'><button type='button' class='btn btn-outline-primary' style='background-color:#406882;color:white;margin:auto; display:inline-block;'><</button></a> ";}
				for (int i = startNavi; i <= endNavi; i++) {
					pageNavi += "<a href='/mypage/myPageList?cPage="+i+"'><button type='button' class='btn btn-outline-primary' style='background-color:#406882;color:white;margin:auto; display:inline-block;'>" + i + "</button></a> ";
				}
				if(needNext) {pageNavi += "<a href='/mypage/myPageList?cPage="+(endNavi+1)+"'><button type='button' class='btn btn-outline-primary' style='background-color:#406882;color:white;margin:auto; display:inline-block;'>></button></a>";}
			}

		}else if(board.equals("point")) {
			if(option.equals("all")) {
				if(needPrev) {pageNavi += "<a href='/mypage/myPagePoint?cPage="+(startNavi-1)+"'><button type='button' class='btn btn-outline-primary' style='background-color:#406882;color:white;margin:auto; display:inline-block;'><</button></a> ";}
				for (int i = startNavi; i <= endNavi; i++) {
					pageNavi += "<a href='/mypage/myPagePoint?cPage="+i+"'><button type='button' class='btn btn-outline-primary' style='background-color:#406882;color:white;margin:auto; display:inline-block;'>" + i + "</button></a> ";
				}
				if(needNext) {pageNavi += "<a href='/mypage/myPagePoint?cPage="+(endNavi+1)+"'><button type='button' class='btn btn-outline-primary' style='background-color:#406882;color:white;margin:auto; display:inline-block;'>></button></a>";}
			}

		}else if(board.equals("question")) {
			if(option.equals("all")) {
				if(needPrev) {pageNavi += "<a href='/mypage/myPageQuestion?cPage="+(startNavi-1)+"'><button type='button' class='btn btn-outline-primary' style='background-color:#406882;color:white;margin:auto; display:inline-block;'><</button></a> ";}
				for (int i = startNavi; i <= endNavi; i++) {
					pageNavi += "<a href='/mypage/myPageQuestion?cPage="+i+"'><button type='button' class='btn btn-outline-primary' style='background-color:#406882;color:white;margin:auto; display:inline-block;'>" + i + "</button></a> ";
				}
				if(needNext) {pageNavi += "<a href='/mypage/myPageQuestion?cPage="+(endNavi+1)+"'><button type='button' class='btn btn-outline-primary' style='background-color:#406882;color:white;margin:auto; display:inline-block;'>></button></a>";}
			}

		}else if(board.equals("wish")) {
			if(option.equals("all")) {
				if(needPrev) {pageNavi += "<a href='/mypage/myPageLike?cPage="+(startNavi-1)+"'><button type='button' class='btn btn-outline-primary' style='background-color:#406882;color:white;margin:auto; display:inline-block;'><</button></a> ";}
				for (int i = startNavi; i <= endNavi; i++) {
					pageNavi += "<a href='/mypage/myPageLike?cPage="+i+"'><button type='button' class='btn btn-outline-primary' style='background-color:#406882;color:white;margin:auto; display:inline-block;'>" + i + "</button></a> ";
				}
				if(needNext) {pageNavi += "<a href='/mypage/myPageLike?cPage="+(endNavi+1)+"'><button type='button' class='btn btn-outline-primary' style='background-color:#406882;color:white;margin:auto; display:inline-block;'>></button></a>";}
			}
		}else if(board.equals("myPageMdReview")) {
			if(option.equals("all")) {
				if(needPrev) {pageNavi += "<a href='/mypage/myPageMdReview?cPage="+(startNavi-1)+"'><button type='button' class='btn btn-outline-primary' style='background-color:#406882;color:white;margin:auto; display:inline-block;'><</button></a> ";}
				for (int i = startNavi; i <= endNavi; i++) {
					pageNavi += "<a href='/mypage/myPageMdReview?cPage="+i+"'><button type='button' class='btn btn-outline-primary' style='background-color:#406882;color:white;margin:auto; display:inline-block;'>" + i + "</button></a> ";
				}
				if(needNext) {pageNavi += "<a href='/mypage/myPageMdReview?cPage="+(endNavi+1)+"'><button type='button' class='btn btn-outline-primary' style='background-color:#406882;color:white;margin:auto; display:inline-block;'>></button></a>";}
			}

		}else if(board.equals("myPageAfterMdReview")) {
			if(option.equals("all")) {
				if(needPrev) {pageNavi += "<a href='/mypage/myPageAfterMdReview?cPage="+(startNavi-1)+"'><button type='button' class='btn btn-outline-primary' style='background-color:#406882;color:white;margin:auto; display:inline-block;'><</button></a> ";}
				for (int i = startNavi; i <= endNavi; i++) {
					pageNavi += "<a href='/mypage/myPageAfterMdReview?cPage="+i+"'><button type='button' class='btn btn-outline-primary' style='background-color:#406882;color:white;margin:auto; display:inline-block;'>" + i + "</button></a> ";
				}
				if(needNext) {pageNavi += "<a href='/mypage/myPageAfterMdReview?cPage="+(endNavi+1)+"'><button type='button' class='btn btn-outline-primary' style='background-color:#406882;color:white;margin:auto; display:inline-block;'>></button></a>";}
			}

		}

		return pageNavi;
	}
	
}

