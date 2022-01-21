package kh.spring.bootpay.service;

import com.google.gson.FieldNamingPolicy;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import kh.spring.bootpay.BootpayObject;
import kh.spring.bootpay.request.Subscribe;
import kh.spring.bootpay.request.SubscribePayload;

import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpDelete;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.HttpClientBuilder;

public class BillingService {
    static public HttpResponse getBillingKey(BootpayObject bootpay, kh.spring.bootpay.model.request.Subscribe subscribeBilling) throws Exception {
        if(bootpay.token == null || bootpay.token.isEmpty()) throw new Exception("token 값이 비어있습니다.");
        if(subscribeBilling.itemName == null || subscribeBilling.itemName.isEmpty()) throw new Exception("item_name 값을 입력해주세요.");
        if(subscribeBilling.orderId == null || subscribeBilling.orderId.isEmpty()) throw new Exception("order_id 주문번호를 설정해주세요.");
        if(subscribeBilling.pg == null || subscribeBilling.pg.isEmpty()) throw new Exception("결제하고자 하는 pg alias를 입력해주세요.");

        HttpClient client = HttpClientBuilder.create().build();
        Gson gson = new GsonBuilder()
                .setFieldNamingPolicy(FieldNamingPolicy.LOWER_CASE_WITH_UNDERSCORES)
                .create();
        HttpPost post = bootpay.httpPost("request/card_rebill", new StringEntity(gson.toJson(subscribeBilling), "UTF-8"));

        post.setHeader("Authorization", bootpay.token);
        return client.execute(post);
    }

    static public HttpResponse destroyBillingKey(BootpayObject bootpay, String billingKey) throws Exception {
        if(bootpay.token == null || bootpay.token.isEmpty()) throw new Exception("token 값이 비어있습니다.");
        if(billingKey == null || billingKey.isEmpty()) throw new Exception("billingKey 값이 비어있습니다.");

        HttpClient client = HttpClientBuilder.create().build();
        HttpDelete delete = bootpay.httpDelete("subscribe/billing/" + billingKey);
        delete.setHeader("Authorization", bootpay.token);
        return client.execute(delete);
    }

    static public HttpResponse requestSubscribe(BootpayObject bootpay, kh.spring.bootpay.model.request.SubscribePayload payload) throws Exception {
        if(bootpay.token == null || bootpay.token.isEmpty()) throw new Exception("token 값이 비어있습니다.");
        if(payload.billingKey == null || payload.billingKey.isEmpty()) throw new Exception("billing_key 값을 입력해주세요.");
        if(payload.itemName == null || payload.itemName.isEmpty()) throw new Exception("item_name 값을 입력해주세요.");
        if(payload.price <= 0) throw new Exception("price 금액을 설정을 해주세요.");
        if(payload.orderId == null || payload.orderId.isEmpty()) throw new Exception("order_id 주문번호를 설정해주세요.");

        HttpClient client = HttpClientBuilder.create().build();
        Gson gson = new GsonBuilder()
                .setFieldNamingPolicy(FieldNamingPolicy.LOWER_CASE_WITH_UNDERSCORES)
                .create();
        HttpPost post = bootpay.httpPost("subscribe/billing", new StringEntity(gson.toJson(payload), "UTF-8"));
        post.setHeader("Authorization", bootpay.token);
        return client.execute(post);
    }

    static public HttpResponse reserveSubscribe(BootpayObject bootpay, kh.spring.bootpay.model.request.SubscribePayload payload) throws Exception {
        if(bootpay.token == null || bootpay.token.isEmpty()) throw new Exception("token 값이 비어있습니다.");
        if(payload.billingKey == null || payload.billingKey.isEmpty()) throw new Exception("billing_key 값을 입력해주세요.");
        if(payload.itemName == null || payload.itemName.isEmpty()) throw new Exception("item_name 값을 입력해주세요.");
        if(payload.price <= 0) throw new Exception("price 금액을 설정을 해주세요.");
        if(payload.orderId == null || payload.orderId.isEmpty()) throw new Exception("order_id 주문번호를 설정해주세요.");
        if(payload.executeAt == 0) throw new Exception("execute_at 실행 시간을 설정해주세요.");
        if(payload.schedulerType == null || payload.schedulerType.isEmpty()) payload.schedulerType = "oneshot";

        HttpClient client = HttpClientBuilder.create().build();
        Gson gson = new GsonBuilder()
                .setFieldNamingPolicy(FieldNamingPolicy.LOWER_CASE_WITH_UNDERSCORES)
                .create();
        HttpPost post = bootpay.httpPost("subscribe/billing/reserve", new StringEntity(gson.toJson(payload), "UTF-8"));
        post.setHeader("Authorization", bootpay.token);
        return client.execute(post);
    }


    static public HttpResponse reserveCancelSubscribe(BootpayObject bootpay, String reserve_id) throws Exception {
        if(bootpay.token == null || bootpay.token.isEmpty()) throw new Exception("token 값이 비어있습니다.");
        if(reserve_id == null || reserve_id.isEmpty()) throw new Exception("reserve_id 값이 비어있습니다.");

        HttpClient client = HttpClientBuilder.create().build();
        HttpDelete delete = bootpay.httpDelete("subscribe/billing/reserve/" + reserve_id);
        delete.setHeader("Authorization", bootpay.token);
        return client.execute(delete);
    }
}
