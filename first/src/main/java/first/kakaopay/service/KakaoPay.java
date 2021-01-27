package first.kakaopay.service;

import java.net.URI;
import java.net.URISyntaxException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

import first.kakaopay.dao.AmountVO;
import first.kakaopay.dao.KakaoPayApprovalVO;
//import first.kakaopay.dao.KakaoPayApprovalVO;
import first.kakaopay.dao.KakaoPayReadyVO;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestClientException;
import org.springframework.web.client.RestTemplate;
 
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

@Service("KakaoPayService")
public class KakaoPay implements KakaoPayService{
 
    private static final String HOST = "https://kapi.kakao.com";
    
    private KakaoPayReadyVO kakaoPayReadyVO;
    private KakaoPayApprovalVO kakaoPayApprovalVO;
    KakaoPayReadyVO krvo = KakaoPayReadyVO.getInstance();
    KakaoPayApprovalVO kavo = KakaoPayApprovalVO.getInstance();
    
    public String kakaoPayReady(String ORDER_IDX, String ORDER_TOTAL, String GOODS_IDX, String MEMBER_IDX){
    	System.out.println("1. 진입");
    	System.out.println();
        RestTemplate restTemplate = new RestTemplate();
 
        // ?��버로 ?���??�� Header
        HttpHeaders headers = new HttpHeaders();
        headers.add("Authorization", "KakaoAK " + "4d4824dccabf266a53d73108f008ec38");
        //headers.add("Accept", MediaType.APPLICATION_JSON_VALUE);
        headers.add("Content-type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=UTF-8");
        System.out.println(headers);
        // ?��버로 ?���??�� Body
        MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
        params.add("cid", "TC0ONETIME");
        params.add("partner_order_id", ORDER_IDX);
        params.add("partner_user_id", MEMBER_IDX);
        params.add("item_name", GOODS_IDX);
        params.add("quantity", "1");
        params.add("total_amount", ORDER_TOTAL);
        params.add("tax_free_amount", "0");
        params.add("approval_url", "http://localhost:8080/first/kakaoPaySuccess");
        params.add("cancel_url", "http://localhost:8080/first/kakaoPayCancel");
        params.add("fail_url", "http://localhost:8080/first/kakaoPaySuccessFail");
 
         HttpEntity<MultiValueMap<String, String>> body = new HttpEntity<MultiValueMap<String, String>>(params, headers);
         	
         System.out.println(params);
         System.out.println(body);
        try {
        	String str = restTemplate.postForObject(new URI(HOST + "/v1/payment/ready"), body, String.class);
        	//System.out.println(str);
        	
        	JSONParser parser = new JSONParser();
        	Object obj = parser.parse(str);
        	JSONObject jsonObj = (JSONObject) obj;
        	String url = String.valueOf(jsonObj.get("next_redirect_pc_url"));
        	//System.out.println(url);
        	
        	krvo.setTid(String.valueOf(jsonObj.get("tid")));
        	System.out.println(krvo.getTid());
        	
        	//kakaoPayReadyVO = restTemplate.postForObject(new URI(HOST + "/v1/payment/ready"), body, KakaoPayReadyVO.class);
            krvo.setOrderNum(ORDER_IDX);
            krvo.setMemID(MEMBER_IDX);
            krvo.setItemName(GOODS_IDX);
            krvo.setGoodsTcost(ORDER_TOTAL);
            
            return url; //kakaoPayReadyVO.getNext_redirect_pc_url();
 
        } catch (RestClientException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (URISyntaxException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        
        return "/kakaoPay";
        
    }
    
    public Object kakaoPayInfo(String pg_token) {
    	 System.out.println("2. 진입");
    	 System.out.println(krvo.getTid());
        RestTemplate restTemplate = new RestTemplate();
 
        // ?��버로 ?���??�� Header
        HttpHeaders headers = new HttpHeaders();
        headers.add("Authorization", "KakaoAK " + "4d4824dccabf266a53d73108f008ec38");
        //headers.add("Accept", MediaType.APPLICATION_JSON_VALUE);
        headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=UTF-8");
 
        // ?��버로 ?���??�� Body
        MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
        params.add("cid", "TC0ONETIME");
        params.add("tid", krvo.getTid());
        params.add("partner_order_id", krvo.getOrderNum());
        params.add("partner_user_id", krvo.getMemID());
        params.add("pg_token", pg_token);
        params.add("total_amount", krvo.getGoodsTcost());
        
        HttpEntity<MultiValueMap<String, String>> body = new HttpEntity<MultiValueMap<String, String>>(params, headers);
        //System.out.println(body);
        try {
        	//System.out.println(restTemplate.postForObject(new URI(HOST + "/v1/payment/approve"), body, String.class));
            String resultStr = restTemplate.postForObject(new URI(HOST + "/v1/payment/approve"), body, String.class);
            
            JSONParser parser = new JSONParser();
        	Object obj = parser.parse(resultStr);
        	JSONObject jsonObj = (JSONObject) obj;
            
            return jsonObj;
        
        } catch (RestClientException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (URISyntaxException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        
        return null;
    }
    
}