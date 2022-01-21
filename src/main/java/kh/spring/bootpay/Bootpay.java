package kh.spring.bootpay;







import java.util.HashMap;

import org.apache.http.HttpResponse;


import kh.spring.bootpay.model.request.Cancel;
import kh.spring.bootpay.model.request.Payload;
import kh.spring.bootpay.model.request.Subscribe;
import kh.spring.bootpay.model.request.SubscribePayload;
import kh.spring.bootpay.model.request.UserToken;
import kh.spring.bootpay.model.response.ResDefault;
import kh.spring.bootpay.service.BillingService;
import kh.spring.bootpay.service.CancelService;
import kh.spring.bootpay.service.EasyService;
import kh.spring.bootpay.service.LinkService;
import kh.spring.bootpay.service.SubmitService;
import kh.spring.bootpay.service.TokenService;
import kh.spring.bootpay.service.VerificationService;

import java.util.HashMap;

public class Bootpay extends BootpayObject {
    public Bootpay() { }

    public Bootpay(String rest_application_id, String private_key) {
        super(rest_application_id, private_key);
    }

    public Bootpay(String rest_application_id, String private_key, String devMode) {
        super(rest_application_id, private_key, devMode);
    }

    //token
    public ResDefault<HashMap<String, Object>> getAccessToken() throws Exception {
        return TokenService.getAccessToken(this);
    }

    //billing
    public ResDefault<HashMap<String, Object>> getBillingKey(Subscribe subscribeBilling) throws Exception {
        return (ResDefault<HashMap<String, Object>>) BillingService.getBillingKey(this, subscribeBilling);
    }
    public ResDefault<HashMap<String, Object>> requestSubscribe(SubscribePayload payload) throws Exception {
        return (ResDefault<HashMap<String, Object>>) BillingService.requestSubscribe(this, payload);
    }
    public ResDefault<HashMap<String, Object>> reserveSubscribe(SubscribePayload payload) throws Exception {
        return (ResDefault<HashMap<String, Object>>) BillingService.reserveSubscribe(this, payload);
    }
    public ResDefault<HashMap<String, Object>> reserveCancelSubscribe(String reserve_id) throws Exception {
        return (ResDefault<HashMap<String, Object>>) BillingService.reserveCancelSubscribe(this, reserve_id);
    }
    public ResDefault<HashMap<String, Object>> destroyBillingKey(String billing_key) throws Exception {
        return (ResDefault<HashMap<String, Object>>) BillingService.destroyBillingKey(this, billing_key);
    }

    //cancel
    public HttpResponse receiptCancel(Cancel cancel) throws Exception {
        return CancelService.receiptCancel(this, cancel);
    }

    //easy
    public HttpResponse getUserToken(kh.spring.bootpay.request.UserToken userToken) throws Exception {
        return EasyService.getUserToken(this, userToken);
    }

    //link
    public HttpResponse requestLink(kh.spring.bootpay.request.Payload payload) throws Exception {
        return LinkService.requestLink(this, payload);
    }

    //submit
    public HttpResponse submit(String receiptId) throws Exception {
        return SubmitService.submit(this, receiptId);
    }

    //veriy
    public ResDefault<HashMap<String, Object>> verify(String receiptId) throws Exception {
        return (ResDefault<HashMap<String, Object>>) VerificationService.verify(this, receiptId);
    }
    public ResDefault<HashMap<String, Object>> certificate(String receiptId) throws Exception {
        return (ResDefault<HashMap<String, Object>>) VerificationService.certificate(this, receiptId);
    }
}
