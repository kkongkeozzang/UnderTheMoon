package kh.spring.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kh.spring.dto.CouponDTO;
import kh.spring.dto.MdDTO;
import kh.spring.dto.MdInqryDTO;
import kh.spring.dto.MdReviewDTO;
import kh.spring.dto.PointDTO;
import kh.spring.dto.PurchaseDTO;
import kh.spring.dto.PurchaseDetailDTO;
import kh.spring.service.CouponService;
import kh.spring.service.MdInqryService;
import kh.spring.service.MdReviewService;
import kh.spring.service.MdService;
import kh.spring.service.PointService;
import kh.spring.service.PurchaseDetailService;
import kh.spring.service.PurchaseService;

@RequestMapping("/seller/")
@Controller
public class SellerController {
	
	private final MdService mdService;
	private final PurchaseService purchaseService;
	private final PurchaseDetailService purchaseDetailService;
	private final PointService pointService;
	private final CouponService couponService;
	private final MdReviewService mdReviewService;
	private final MdInqryService mdInqryService;
	
	public SellerController(MdService mdService, PurchaseService purchaseService, PurchaseDetailService purchaseDetailService, PointService pointService, CouponService couponService, MdReviewService mdReviewService, MdInqryService mdInqryService) {
		this.mdService = mdService;
		this.purchaseService = purchaseService;
		this.purchaseDetailService = purchaseDetailService;
		this.pointService = pointService;
		this.couponService = couponService;
		this.mdReviewService = mdReviewService;
		this.mdInqryService = mdInqryService;
	}
	
	@RequestMapping("sellerOffice")
	public String sellerOffice(Model model) throws Exception {
		PurchaseDTO year = purchaseService.selectYear();
		PurchaseDTO month = purchaseService.selectMonth();
		List<PurchaseDTO> months = purchaseService.selectMonths();
		int total = purchaseDetailService.selectCount();
		List<PurchaseDetailDTO> ranks = purchaseDetailService.salesRank();
		model.addAttribute("year", year);
		model.addAttribute("month", month);
		model.addAttribute("months", months);
		model.addAttribute("total", total);
		model.addAttribute("ranks", ranks);
	    return "/seller/sellerDashboard";
	}
	
	@RequestMapping("md")
	public String sellerMd(Model model) throws Exception {
		List<MdDTO> mds = mdService.selectAll();
		model.addAttribute("mds", mds);
	    return "/seller/sellerMd";
	}
	
	@ResponseBody
	@RequestMapping("checkMd")
	public String checkMd(String md_name) throws Exception {
		String result = Integer.toString(mdService.checkMd(md_name));
	    return result;
	}
	
	@RequestMapping("insertMd")
	public String insertMd(MdDTO mds) throws Exception {
		int result = mdService.insertMd(mds);
	    return "redirect:/seller/md";
	}
	
	@RequestMapping("deleteMd")
	public String deleteMd(int md_id) throws Exception {
		int result = mdService.deleteMd(md_id);
	    return "redirect:/seller/md";
	}
	
	
	@RequestMapping("updateMd")
	public String updateMd(MdDTO mds) throws Exception {
		int result = mdService.updateMd(mds);
	    return "redirect:/seller/md";
	}
	
	@RequestMapping("purchase")
	public String sellerPurchase(Model model) throws Exception {
		List<PurchaseDTO> purchases = purchaseService.selectAll();
		model.addAttribute("purchases", purchases);
	    return "/seller/sellerPurchase";
	}
	
	@RequestMapping("deletePurchase")
	public String deletePurchase(int purchase_id) throws Exception {
		int result = purchaseService.deletePurchase(purchase_id);
	    return "redirect:/seller/purchase";
	}
	
	@RequestMapping("purchaseDetail")
	public String sellerPurchaseDetail(Model model) throws Exception {
		List<PurchaseDetailDTO> purchaseDetails = purchaseDetailService.selectAll();
		model.addAttribute("purchaseDetails", purchaseDetails);
	    return "/seller/sellerPurchaseDetail";
	}
	
	@RequestMapping("deletePurchaseDetail")
	public String deletePurchaseDetail(int purchase_detail_id) throws Exception {
		int result = purchaseDetailService.deletePurchaseDetail(purchase_detail_id);
	    return "redirect:/seller/purchaseDetail";
	}
	
	@ResponseBody
	@RequestMapping("completeDelivery")
	public String completeDelivery(@RequestParam(value="valueArrTest[]",required=true) List<String> name) throws Exception {

		for(int i=0; i<name.size();i++) {
			purchaseDetailService.completeDelivery(name.get(i));
			System.out.println(name.get(i));
		}
	    return "redirect:/seller/purchaseDetail";
	}
	
	@RequestMapping("cancelDelivery")
	public String cancelDelivery(int purchase_detail_id) throws Exception {
		int result = purchaseDetailService.cancelDelivery(purchase_detail_id);
	    return "redirect:/seller/purchaseDetail";
	}
	
	@RequestMapping("point")
	public String sellerPoint(Model model) throws Exception {
		List<PointDTO> points = pointService.selectAll();
		model.addAttribute("points", points);
	    return "/seller/sellerPoint";
	}
	
	@RequestMapping("insertPoint")
	public String insertPoint(PointDTO points) throws Exception {
		int result = pointService.insertPoint(points);
	    return "redirect:/seller/point";
	}
	
	@RequestMapping("deletePoint")
	public String deletePoint(int point_id) throws Exception {
		int result = pointService.deletePoint(point_id);
	    return "redirect:/seller/point";
	}
	
	@RequestMapping("updatePoint")
	public String updatePoint(PointDTO points) throws Exception {
		int result = pointService.updatePoint(points);
	    return "redirect:/seller/point";
	}
	
	@RequestMapping("coupon")
	public String sellerCoupon(Model model) throws Exception {
		List<CouponDTO> coupons = couponService.selectAll();
		model.addAttribute("coupons", coupons);
	    return "/seller/sellerCoupon";
	}
	
	@RequestMapping("insertCoupon")
	public String insertCoupon(CouponDTO coupons) throws Exception {
		int result = couponService.insertCoupon(coupons);
	    return "redirect:/seller/coupon";
	}
	
	@RequestMapping("deleteCoupon")
	public String deleteCoupon(int coupon_id) throws Exception {
		int result = couponService.deleteCoupon(coupon_id);
	    return "redirect:/seller/coupon";
	}
	
	@RequestMapping("updateCoupon")
	public String updateCoupon(CouponDTO coupons) throws Exception {
		int result = couponService.updateCoupon(coupons);
	    return "redirect:/seller/coupon";
	}
	
	@RequestMapping("mdReview")
	public String sellerMdReview(Model model) throws Exception {
		List<MdReviewDTO> mdReviews = mdReviewService.selectAll();
		model.addAttribute("mdReviews", mdReviews);
	    return "/seller/sellerMdReview";
	}
	
	@RequestMapping("mdInqry")
	public String sellerMdInqry(Model model) throws Exception {
		List<MdInqryDTO> mdInqrys = mdInqryService.selectAll();
		model.addAttribute("mdInqrys", mdInqrys);
	    return "/seller/sellerMdInqry";
	}
	
	@RequestMapping("deleteMdInqry")
	public String deleteMdInqry(int md_question_id) throws Exception {
		int result = mdInqryService.deleteMdInqry(md_question_id);
	    return "redirect:/seller/mdInqry";
	}
	
	@RequestMapping("deleteMdResp")
	public String deleteMdResp(int md_question_id) throws Exception {
		int result1 = mdInqryService.deleteMdResp(md_question_id);
		if(result1 > 0) {
			int result2 = mdInqryService.updateWait(md_question_id);
		}
	    return "redirect:/seller/mdInqry";
	}
	@RequestMapping("deleteMdBoth")
	public String deleteMdBoth(int md_question_id) throws Exception {
		int result1 = mdInqryService.deleteMdInqry(md_question_id);
		if(result1 > 0) {
			int result2 = mdInqryService.deleteMdResp(md_question_id);
		}
	    return "redirect:/seller/mdInqry";
	}
	
	@RequestMapping("insertResp")
	public String insertResp(MdInqryDTO inqrys) throws Exception {
		int member_id = mdInqryService.selectMemberId(inqrys.getMd_response_username());
		inqrys.setMd_response_content(inqrys.getMd_response_content().replace("\r\n","<br>"));
		int result1 = mdInqryService.insertResp(inqrys, member_id);
		if(result1 > 0) {
			int result2 = mdInqryService.updateComplete(inqrys.getSort_md_question_id());
		}
	    return "redirect:/seller/mdInqry";
	}
	
	@RequestMapping("updateResp")
	public String updateResp(MdInqryDTO inqrys) throws Exception {
		inqrys.setMd_response_content(inqrys.getMd_response_content().replace("\r\n","<br>"));
		int result = mdInqryService.updateResp(inqrys);
	    return "redirect:/seller/mdInqry";
	}
}
