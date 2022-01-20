package kh.spring.bootpay;


import org.apache.http.HttpResponse;

import kh.spring.bootpay.request.Cancel;
import kh.spring.bootpay.request.Payload;
import kh.spring.bootpay.request.Subscribe;
import kh.spring.bootpay.request.SubscribePayload;
import kh.spring.bootpay.request.UserToken;
import kh.spring.bootpay.service.BillingService;
import kh.spring.bootpay.service.CancelService;
import kh.spring.bootpay.service.EasyService;
import kh.spring.bootpay.service.LinkService;
import kh.spring.bootpay.service.SubmitService;
import kh.spring.bootpay.service.VerificationService;

public class Bootpay extends BootpayObject {
    public Bootpay() { }

    public Bootpay(String rest_application_id, String private_key) {
        super(rest_application_id, private_key);
    }

    public Bootpay(String rest_application_id, String private_key, String devMode) {
        super(rest_application_id, private_key, devMode);
    }

    //billing
    public HttpResponse getBillingKey(Subscribe subscribeBilling) throws Exception {
        return BillingService.getBillingKey(this, subscribeBilling);
    }
    public HttpResponse requestSubscribe(SubscribePayload payload) throws Exception {
        return BillingService.requestSubscribe(this, payload);
    }
    public HttpResponse reserveSubscribe(SubscribePayload payload) throws Exception {
        return BillingService.reserveSubscribe(this, payload);
    }
    public HttpResponse reserveCancelSubscribe(String reserve_id) throws Exception {
        return BillingService.reserveCancelSubscribe(this, reserve_id);
    }
    public HttpResponse destroyBillingKey(String billing_key) throws Exception {
        return BillingService.destroyBillingKey(this, billing_key);
    }

    //cancel
    public HttpResponse receiptCancel(Cancel cancel) throws Exception {
        return CancelService.receiptCancel(this, cancel);
    }

    //easy
    public HttpResponse getUserToken(UserToken userToken) throws Exception {
        return EasyService.getUserToken(this, userToken);
    }

    //link
    public HttpResponse requestLink(Payload payload) throws Exception {
        return LinkService.requestLink(this, payload);
    }

    //submit
    public HttpResponse submit(String receiptId) throws Exception {
        return SubmitService.submit(this, receiptId);
    }

    //veriy
    public HttpResponse verify(String receiptId) throws Exception {
        return VerificationService.verify(this, receiptId);
    }
    public HttpResponse certificate(String receiptId) throws Exception {
        return VerificationService.certificate(this, receiptId);
    }
}
