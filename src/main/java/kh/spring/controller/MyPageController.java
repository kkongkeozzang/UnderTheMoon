package kh.spring.controller;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kh.spring.dto.CouponDTO;
import kh.spring.dto.GradeDTO;
import kh.spring.dto.MdAndReviewDTO;
import kh.spring.dto.MdDTO;
import kh.spring.dto.MdInqryDTO;
import kh.spring.dto.MemberDTO;
import kh.spring.dto.MyPagePurchaseDetailDTO;
import kh.spring.dto.PointDTO;
import kh.spring.dto.PurchaseDTO;
import kh.spring.dto.PurchaseDateDTO;
import kh.spring.dto.WishDTO;
import kh.spring.service.CouponService;
import kh.spring.service.GradeService;
import kh.spring.service.MdInqryService;
import kh.spring.service.MdService;
import kh.spring.service.MemberService;
import kh.spring.service.PointService;
import kh.spring.service.PurchaseDetailService;
import kh.spring.service.PurchaseService;
import kh.spring.service.WishService;
import kh.spring.util.PageNavigator;
import kh.spring.util.PageStatic;
import kh.spring.util.ScriptUtils;


@Controller
@RequestMapping("/mypage/")
public class MyPageController {

	private final GradeService gradeService;
	private final MemberService memberService;
	private final PurchaseService purchaseService;
	private final CouponService couponService;
	private final PointService pointService;
	private final BCryptPasswordEncoder bCrptPasswordEncoder;
	private final HttpServletResponse response;
	private final HttpServletRequest request;
	private final MdService mdService;
	private final MdInqryService mdInqryService;
	private final WishService wishService;	
	private final PurchaseDetailService purchaseDetailService;
	
	public MyPageController(GradeService gradeService, MemberService memberService, PurchaseService purchaseService, 
			CouponService couponService, PointService pointService, BCryptPasswordEncoder bCrptPasswordEncoder, HttpServletResponse response,
			HttpServletRequest request, MdService mdService, PurchaseDetailService purchaseDetailService,
			MdInqryService mdInqryService, WishService wishService) {
		this.gradeService = gradeService;
		this.memberService = memberService;
		this.purchaseService = purchaseService;
		this.couponService = couponService;
		this.pointService = pointService;
		this.bCrptPasswordEncoder = bCrptPasswordEncoder;
		this.response = response;
		this.request = request;
		this.mdService = mdService;
		this.purchaseDetailService = purchaseDetailService;
		this.mdInqryService = mdInqryService;
		this.wishService = wishService;
	}
	
	@RequestMapping("myPageList")
	public String myPage(Model model, int cPage) {
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal(); 
        String username = ((UserDetails)principal).getUsername();
		MemberDTO memberDTO = memberService.selectByUsername(username);
		int pointSum = pointService.selectPointById(username).get();
		int couponSum = couponService.selectCouponPossibleById(memberDTO.getMember_id());
		int start = cPage * PageStatic.MYPAGELIST_COUNT_PER_PAGE-(PageStatic.MYPAGELIST_COUNT_PER_PAGE - 1); 
		int end = cPage * PageStatic.MYPAGELIST_COUNT_PER_PAGE;
//		List<MyPagePurchaseDTO> purchaseList = purchaseService.selectByBound(memberDTO.getMember_id(), start, end);
		List<PurchaseDTO> purchaseList = purchaseService.selectPurchaseByBound(memberDTO.getMember_id(), start, end);
		Integer allPurchaseCount = purchaseService.selectRecordCount(memberDTO.getMember_id());
		String pageNavi = PageNavigator.getPageNavigator(allPurchaseCount, cPage, PageStatic.MYPAGELIST_COUNT_PER_PAGE, PageStatic.MYPAGELIST_NAVI_COUNT_PER_PAGE, "myPageList", "all" ,"","");
		
		model.addAttribute("memberDTO",memberDTO);
		model.addAttribute("pointSum",pointSum);
		model.addAttribute("couponSum", couponSum);
		model.addAttribute("purchaseList", purchaseList);
		model.addAttribute("pageNavi", pageNavi);
        
		return "/mypage/myPageList";
	}
	
	//주문에서 상세보기.
	@RequestMapping("myPagePurchaseDetail")
	public String myPagePurchaseDetail(Model model, int cPage, int purchase_id) {
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal(); 
        String username = ((UserDetails)principal).getUsername();
        Integer member_id = memberService.selectIdByUsername(username);
        MemberDTO memberDTO = memberService.selectByUsername(username);
		int pointSum = pointService.selectPointById(username).get();
		int couponSum = couponService.selectCouponPossibleById(member_id);
		int start = cPage * PageStatic.MYPAGELIST_COUNT_PER_PAGE-(PageStatic.MYPAGELIST_COUNT_PER_PAGE - 1); 
		int end = cPage * PageStatic.MYPAGELIST_COUNT_PER_PAGE;
		List<MyPagePurchaseDetailDTO> purchaseList = purchaseService.selectPurchaseDetailByBound(purchase_id, start, end);
		Integer allPurchaseDetailCount = purchaseDetailService.selectRecordCount(purchase_id);
		String pageNavi = PageNavigator.getPageNavigator(allPurchaseDetailCount, cPage, PageStatic.MYPAGELIST_COUNT_PER_PAGE, PageStatic.MYPAGELIST_NAVI_COUNT_PER_PAGE, "myPageList", "all" ,"","");
		System.out.println(member_id+" "+pointSum+" "+couponSum+" "+start+" "+end+" "+purchaseList.get(0).getMd_name());
		model.addAttribute("pointSum",pointSum);
		model.addAttribute("couponSum", couponSum);
		model.addAttribute("purchaseList", purchaseList);
		model.addAttribute("pageNavi", pageNavi);
		model.addAttribute("memberDTO",memberDTO);
        
		return "/mypage/myPagePurchaseDetail";
	}
	
	@RequestMapping("myPageGrade")
	public String myPageGrade(Model model) {
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal(); 
        String username = ((UserDetails)principal).getUsername();
		MemberDTO memberDTO = memberService.selectByUsername(username);
		List<GradeDTO> gradeList = gradeService.selectAll();
		Integer purchasePayment = purchaseService.selectByIdSumPurchasePayment(memberDTO.getMember_id());
		int pointSum = pointService.selectPointById(username).get();
		int couponSum = couponService.selectCouponPossibleById(memberDTO.getMember_id());
		List gradeTarget = gradeService.selectGradeTarget();
				
		if(purchasePayment == null) {
			purchasePayment = 0;
		}
		if(purchasePayment >= (int) gradeTarget.get(1) && purchasePayment < (int) gradeTarget.get(2) && memberDTO.getGrade_name().equals("별")) {
			memberService.updateGradeMoon(username);
			for(int i=0; i<3; i++) {
				couponService.insertMoonGradeDelivery(memberDTO.getMember_id());
			}
			couponService.insertMoonGradeDiscount(memberDTO.getMember_id());
		}else if(purchasePayment >= (int) gradeTarget.get(2) && memberDTO.getGrade_name().equals("달")){
			memberService.updateGradeSun(username);
			for(int i=0; i<5; i++) {
				couponService.insertSunGradeDelivery(memberDTO.getMember_id());
			}
			couponService.insertSunGradeDiscount(memberDTO.getMember_id());
		}
		model.addAttribute("gradeList",gradeList);
		model.addAttribute("memberDTO",memberDTO);
		model.addAttribute("purchasePayment",purchasePayment);
		model.addAttribute("pointSum",pointSum);
		model.addAttribute("couponSum", couponSum);
		
		return "/mypage/myPageGrade";	
	}
	
	@RequestMapping("myPagePoint")
	public String myPagePoint(Model model, int cPage) {
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal(); 
        String username = ((UserDetails)principal).getUsername();
		MemberDTO memberDTO = memberService.selectByUsername(username);
		int pointSum = pointService.selectPointById(username).get();
		//List<PointDTO> pointList = pointService.selectPointListById(memberDTO.getMember_id());
		int couponSum = couponService.selectCouponPossibleById(memberDTO.getMember_id());
		int start = cPage * PageStatic.POINT_COUNT_PER_PAGE-(PageStatic.POINT_COUNT_PER_PAGE - 1); 
		int end = cPage * PageStatic.POINT_COUNT_PER_PAGE;
		List<PointDTO> pointList = pointService.selectByBound(memberDTO.getMember_id(), start, end);
		Integer allPointCount = pointService.selectRecordCount(memberDTO.getMember_id());
		String pageNavi = PageNavigator.getPageNavigator(allPointCount, cPage, PageStatic.POINT_COUNT_PER_PAGE, PageStatic.POINT_NAVI_COUNT_PER_PAGE, "point", "all" ,"","");
		
		model.addAttribute("memberDTO",memberDTO);
		model.addAttribute("pointSum",pointSum);
		model.addAttribute("pointList",pointList);
		model.addAttribute("couponSum", couponSum);
		model.addAttribute("pageNavi", pageNavi);
		
		return "/mypage/myPagePoint";
	}
	
	@RequestMapping("myPageCoupon")
	public String myPageCoupon(Model model, int cPage) {
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal(); 
        String username = ((UserDetails)principal).getUsername();
		MemberDTO memberDTO = memberService.selectByUsername(username);
		int pointSum = pointService.selectPointById(username).get();
		int couponSum = couponService.selectCouponPossibleById(memberDTO.getMember_id());		
		int start = cPage * PageStatic.COUPON_COUNT_PER_PAGE-(PageStatic.COUPON_COUNT_PER_PAGE - 1); 
		int end = cPage * PageStatic.COUPON_COUNT_PER_PAGE;
		List<CouponDTO> couponList = couponService.selectByBound(memberDTO.getMember_id(), start, end);
		Integer allCouponCount = couponService.selectRecordCount(memberDTO.getMember_id());
		String pageNavi = PageNavigator.getPageNavigator(allCouponCount, cPage, PageStatic.COUPON_COUNT_PER_PAGE, PageStatic.COUPON_NAVI_COUNT_PER_PAGE, "coupon", "all" ,"","");
		
		model.addAttribute("memberDTO",memberDTO);
		model.addAttribute("pointSum",pointSum);
		model.addAttribute("couponList",couponList);
		model.addAttribute("couponSum", couponSum);
		model.addAttribute("pageNavi", pageNavi);
		
		return "/mypage/myPageCoupon";
	}
	
	@RequestMapping("myPageModifyProfile")
	public String myPageModifyProfile(Model model) {
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal(); 
        String username = ((UserDetails)principal).getUsername();
		MemberDTO memberDTO = memberService.selectByUsername(username);
		int pointSum = pointService.selectPointById(username).get();
		int couponSum = couponService.selectCouponPossibleById(memberDTO.getMember_id());
		
		model.addAttribute("memberDTO",memberDTO);
		model.addAttribute("pointSum",pointSum);
		model.addAttribute("couponSum", couponSum);
		
		return "/mypage/myPageModifyProfile";
	}
	
	@ResponseBody
	@RequestMapping(value="myPageCheckPassword", produces="text/html;charset=utf8")
	public String myPageCheckPassword(Model model, String member_password) throws Exception{
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal(); 
        String username = ((UserDetails)principal).getUsername();
		MemberDTO memberDTO = memberService.selectByUsername(username);
		String password = memberDTO.getMember_password();
		boolean result = bCrptPasswordEncoder.matches(member_password, password);
		if(result == true) {
			return String.valueOf(1);
		}else {
			return String.valueOf(0);
		}
	}
	
	@RequestMapping("UpdateProfile")
	public String updateMember(Model model, MemberDTO dto) throws Exception{
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal(); 
        String username = ((UserDetails)principal).getUsername();
		MemberDTO memberDTO = memberService.selectByUsername(username);
		int pointSum = pointService.selectPointById(username).get();
		int couponSum = couponService.selectCouponPossibleById(memberDTO.getMember_id());
		memberService.updateMember(dto);
		
		model.addAttribute("memberDTO",memberDTO);
		model.addAttribute("pointSum",pointSum);
		model.addAttribute("couponSum", couponSum);
		ScriptUtils.alert(response, "회원정보가 수정 되었습니다.");
		
		return "/mypage/myPageModifyProfile";
	}

	@RequestMapping("myPageMdReview")
	public String myPageReview(Model model, int cPage) throws Exception{
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal(); 
        String username = ((UserDetails)principal).getUsername();
		MemberDTO memberDTO = memberService.selectByUsername(username);
		int pointSum = pointService.selectPointById(username).get();
		int couponSum = couponService.selectCouponPossibleById(memberDTO.getMember_id());
		int start = cPage * PageStatic.MYPAGEMDREVIEW_COUNT_PER_PAGE-(PageStatic.MYPAGEMDREVIEW_COUNT_PER_PAGE - 1); 
		int end = cPage * PageStatic.MYPAGEMDREVIEW_COUNT_PER_PAGE;
		List<MdAndReviewDTO> mds = mdService.selectByBoundNotReviewMdByMemberId(String.valueOf(memberDTO.getMember_id()), start, end);
		Integer notReviewMdCount = mdService.selectByBoundNotReviewMdCountByMemberId(String.valueOf(memberDTO.getMember_id()));
		Integer reviewMdCount = mdService.selectByBoundReviewMdCountByMemberId(String.valueOf(memberDTO.getMember_id()));
		String pageNavi = PageNavigator.getPageNavigator(notReviewMdCount, cPage, PageStatic.MYPAGEMDREVIEW_COUNT_PER_PAGE, PageStatic.MYPAGEMDREVIEW_NAVI_COUNT_PER_PAGE, "myPageMdReview", "all" ,"","");
		model.addAttribute("memberDTO",memberDTO);
		model.addAttribute("pointSum",pointSum);
		model.addAttribute("couponSum", couponSum);
		model.addAttribute("mds", mds);
		model.addAttribute("pageNavi",pageNavi);
		model.addAttribute("notReviewMdCount", notReviewMdCount);
		model.addAttribute("reviewMdCount", reviewMdCount);
		return "/mypage/myPageMdReview";
	}

	@RequestMapping("myPageAfterMdReview")
	public String myPageAfterMdReview(Model model, int cPage) throws Exception{
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal(); 
        String username = ((UserDetails)principal).getUsername();
		MemberDTO memberDTO = memberService.selectByUsername(username);
		int pointSum = pointService.selectPointById(username).get();
		int couponSum = couponService.selectCouponPossibleById(memberDTO.getMember_id());
		int start = cPage * PageStatic.MYPAGEMDREVIEW_COUNT_PER_PAGE-(PageStatic.MYPAGEMDREVIEW_COUNT_PER_PAGE - 1); 
		int end = cPage * PageStatic.MYPAGEMDREVIEW_COUNT_PER_PAGE;
		List<MdAndReviewDTO> mds = mdService.selectByBoundReviewMdByMemberId(String.valueOf(memberDTO.getMember_id()), start, end);
		Integer notReviewMdCount = mdService.selectByBoundNotReviewMdCountByMemberId(String.valueOf(memberDTO.getMember_id()));
		Integer reviewMdCount = mdService.selectByBoundReviewMdCountByMemberId(String.valueOf(memberDTO.getMember_id()));
		String pageNavi = PageNavigator.getPageNavigator(reviewMdCount, cPage, PageStatic.MYPAGEMDREVIEW_COUNT_PER_PAGE, PageStatic.MYPAGEMDREVIEW_NAVI_COUNT_PER_PAGE, "myPageAfterMdReview", "all" ,"","");
		model.addAttribute("memberDTO",memberDTO);
		model.addAttribute("pointSum",pointSum);
		model.addAttribute("couponSum", couponSum);
		model.addAttribute("mds", mds);
		model.addAttribute("pageNavi",pageNavi);
		model.addAttribute("notReviewMdCount", notReviewMdCount);
		model.addAttribute("reviewMdCount", reviewMdCount);
		return "/mypage/myPageAfterMdReview";
	}
	
	@RequestMapping("myPageReviewWrite")
	public String myPageReviewWrite(Model model, int md_id, int d_purchase_detail_id) throws Exception{
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal(); 
        String username = ((UserDetails)principal).getUsername();
		MemberDTO memberDTO = memberService.selectByUsername(username);
		int pointSum = pointService.selectPointById(username).get();
		int couponSum = couponService.selectCouponPossibleById(memberDTO.getMember_id());
		List<MdDTO> md = mdService.selectMdById(md_id);
		model.addAttribute("memberDTO",memberDTO);
		model.addAttribute("pointSum",pointSum);
		model.addAttribute("couponSum", couponSum);
		model.addAttribute("md",md);
		model.addAttribute("d_purchase_detail_id",d_purchase_detail_id);
		return "/mypage/myPageReviewWrite";
	}
	
	@RequestMapping("myPageQuestion")
	public String myPageQuestion(Model model, int cPage) throws Exception{
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal(); 
        String username = ((UserDetails)principal).getUsername();
		MemberDTO memberDTO = memberService.selectByUsername(username);
		int pointSum = pointService.selectPointById(username).get();
		int couponSum = couponService.selectCouponPossibleById(memberDTO.getMember_id());
		int start = cPage * PageStatic.MYPAGEQUESTION_COUNT_PER_PAGE-(PageStatic.MYPAGEQUESTION_COUNT_PER_PAGE - 1); 
		int end = cPage * PageStatic.MYPAGEQUESTION_COUNT_PER_PAGE;
		List<MdInqryDTO> mdInqryList = mdInqryService.selectByBoundByMemberId(memberDTO.getMember_id(), start, end);
		Integer allMdInqryCount = mdInqryService.selectRecordCount(memberDTO.getMember_id());
		String pageNavi = PageNavigator.getPageNavigator(allMdInqryCount, cPage, PageStatic.MYPAGEQUESTION_COUNT_PER_PAGE, PageStatic.MYPAGEQUESTION_NAVI_COUNT_PER_PAGE, "question", "all" ,"","");
		model.addAttribute("pointSum",pointSum);
		model.addAttribute("couponSum", couponSum);
		model.addAttribute("memberDTO",memberDTO);
		model.addAttribute("mdInqryList", mdInqryList);
		model.addAttribute("pageNavi", pageNavi);
		
		return "/mypage/myPageQuestion";
	}
	
	@RequestMapping("myPageLike")
	public String myPageLike(Model model, int cPage) throws Exception{
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal(); 
        String username = ((UserDetails)principal).getUsername();
		MemberDTO memberDTO = memberService.selectByUsername(username);
		int pointSum = pointService.selectPointById(username).get();
		int couponSum = couponService.selectCouponPossibleById(memberDTO.getMember_id());
		int start = cPage * PageStatic.MYPAGEWISH_COUNT_PER_PAGE-(PageStatic.MYPAGEWISH_COUNT_PER_PAGE - 1); 
		int end = cPage * PageStatic.MYPAGEWISH_COUNT_PER_PAGE;
		List<WishDTO> wishList = wishService.selectByBound(memberDTO.getMember_id(), start, end);
		int allWishCount = wishService.selectRecordCount(memberDTO.getMember_id());
		String pageNavi = PageNavigator.getPageNavigator(allWishCount, cPage, PageStatic.MYPAGEWISH_COUNT_PER_PAGE, PageStatic.MYPAGEWISH_NAVI_COUNT_PER_PAGE, "wish", "all" ,"","");
		
		model.addAttribute("memberDTO",memberDTO);
		model.addAttribute("pointSum",pointSum);
		model.addAttribute("couponSum", couponSum);
		model.addAttribute("wishList", wishList);
		model.addAttribute("pageNavi", pageNavi);
		
		return "/mypage/myPageLike";
	}

	@ResponseBody
	@RequestMapping(value="myPageListselectDate", produces="text/html;charset=utf8")
	public void myPageListselectDate(Model model,int selectDate, int cPage) {
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal(); 
        String username = ((UserDetails)principal).getUsername();
		MemberDTO memberDTO = memberService.selectByUsername(username);
		int pointSum = pointService.selectPointById(username).get();
		int couponSum = couponService.selectCouponPossibleById(memberDTO.getMember_id());
		int start = cPage * PageStatic.MYPAGELIST_COUNT_PER_PAGE-(PageStatic.MYPAGELIST_COUNT_PER_PAGE - 1); 
		int end = cPage * PageStatic.MYPAGELIST_COUNT_PER_PAGE;
		List<PurchaseDateDTO> purchaseList = purchaseService.selectPurchaseDateByBound(memberDTO.getMember_id(), selectDate, start, end);
		Integer allPurchaseCount = purchaseService.selectRecordCount(memberDTO.getMember_id());
		String pageNavi = PageNavigator.getPageNavigator(allPurchaseCount, cPage, PageStatic.MYPAGELIST_COUNT_PER_PAGE, PageStatic.MYPAGELIST_NAVI_COUNT_PER_PAGE, "myPageList", "all" ,"","");
		
		model.addAttribute("memberDTO",memberDTO);
		model.addAttribute("pointSum",pointSum);
		model.addAttribute("couponSum", couponSum);
		model.addAttribute("purchaseList", purchaseList);
		model.addAttribute("pageNavi", pageNavi);
        
		//return purchaseList;
	}
	
	@ResponseBody
	@RequestMapping(value="deleteMember", produces="text/html;charset=utf8")
	public void deleteMember(String member_id) {
		
		memberService.deleteByMemberId(member_id);
		couponService.deleteCouponByMemberId(member_id);
		pointService.deletePointByMemberId(member_id);
	}
	
	@ResponseBody
	@RequestMapping(value="khCollaboration", produces="text/html;charset=utf8")
	public void khCollaboration(String member_id) {
		pointService.insertKhEventMemberPoint(member_id);
	}
	
	@ResponseBody
	@RequestMapping(value="khCollaborationCheck", produces="text/html;charset=utf8")
	public String khCollaborationCheck(String member_id) {
		int result = pointService.selectByIdandCheckKhEvent(member_id);
		return String.valueOf(result);
	}
	
	@RequestMapping("goModify")
	public String goModify(Model model) {
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal(); 
        String username = ((UserDetails)principal).getUsername();
		MemberDTO memberDTO = memberService.selectByUsername(username);
		
		model.addAttribute("memberDTO",memberDTO);
		
		return "/mypage/myPageModifyProfileDetail";
	}
	
	@RequestMapping("failModify")
	public String failModify(Model model) throws Exception {
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal(); 
        String username = ((UserDetails)principal).getUsername();
		MemberDTO memberDTO = memberService.selectByUsername(username);
		int pointSum = pointService.selectPointById(username).get();
		int couponSum = couponService.selectCouponPossibleById(memberDTO.getMember_id());
		model.addAttribute("memberDTO",memberDTO);
		model.addAttribute("pointSum",pointSum);
		model.addAttribute("couponSum", couponSum);
		
		return "/mypage/myPageModifyProfile";
	}
}
