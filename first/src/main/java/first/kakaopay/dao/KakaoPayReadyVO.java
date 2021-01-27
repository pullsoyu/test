package first.kakaopay.dao;

import java.util.Date;

public class KakaoPayReadyVO {
    
    //response
    private String tid, next_redirect_pc_url;
    private Date created_at;
    private String ORDER_IDX, ORDER_TOTAL, GOODS_IDX, MEMBER_IDX;
    
    
    
    public String getOrderNum() {
		return ORDER_IDX;
	}
	public void setOrderNum(String ORDER_IDX) {
		this.ORDER_IDX = ORDER_IDX;
	}
	public String getGoodsTcost() {
		return ORDER_TOTAL;
	}
	public void setGoodsTcost(String ORDER_TOTAL) {
		this.ORDER_TOTAL = ORDER_TOTAL;
	}
	public String getItemName() {
		return GOODS_IDX;
	}
	public void setItemName(String GOODS_IDX) {
		this.GOODS_IDX = GOODS_IDX;
	}
	public String getMemID() {
		return MEMBER_IDX;
	}
	public void setMemID(String MEMBER_IDX) {
		this.MEMBER_IDX = MEMBER_IDX;
	}
	public static KakaoPayReadyVO getKakaoPayReadyVO() {
		return kakaoPayReadyVO;
	}
	public static void setKakaoPayReadyVO(KakaoPayReadyVO kakaoPayReadyVO) {
		KakaoPayReadyVO.kakaoPayReadyVO = kakaoPayReadyVO;
	}
	private static KakaoPayReadyVO kakaoPayReadyVO = new KakaoPayReadyVO();
    private KakaoPayReadyVO() {
        System.out.println("Singleton Instance Created..");
    }
    public static KakaoPayReadyVO getInstance() {
        return kakaoPayReadyVO;
    }

	public String getTid() {
		return tid;
	}
	public void setTid(String tid) {
		this.tid = tid;
	}
	public String getNext_redirect_pc_url() {
		return next_redirect_pc_url;
	}
	public void setNext_redirect_pc_url(String next_redirect_pc_url) {
		this.next_redirect_pc_url = next_redirect_pc_url;
	}
	public Date getCreated_at() {
		return created_at;
	}
	public void setCreated_at(Date created_at) {
		this.created_at = created_at;
	}
    
    
    
}
 