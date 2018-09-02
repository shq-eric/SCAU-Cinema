package scau.se37.entity;

public class RefundOrder {
	private int refundOrderId;
	private String refundOrderReason;
	private int ticketNum;
	private double refundOrderPrice;
	private String refundOrderStatus;
	private int refundOrderCustomerId;
	private String refundOrderCustomerName;
	private String refundOrderCustomerTel;
	
	public int getRefundOrderId() {
		return refundOrderId;
	}
	public void setRefundOrderId(int refundOrderId) {
		this.refundOrderId = refundOrderId;
	}
	public String getRefundOrderReason() {
		return refundOrderReason;
	}
	public void setRefundOrderReason(String refundOrderReason) {
		this.refundOrderReason = refundOrderReason;
	}
	public int getTicketNum() {
		return ticketNum;
	}
	public void setTicketNum(int ticketNum) {
		this.ticketNum = ticketNum;
	}
	public double getRefundOrderPrice() {
		return refundOrderPrice;
	}
	public void setRefundOrderPrice(double refundOrderPrice) {
		this.refundOrderPrice = refundOrderPrice;
	}
	public String getRefundOrderStatus() {
		return refundOrderStatus;
	}
	public void setRefundOrderStatus(String refundOrderStatus) {
		this.refundOrderStatus = refundOrderStatus;
	}
	public int getRefundOrderCustomerId() {
		return refundOrderCustomerId;
	}
	public void setRefundOrderCustomerId(int refundOrderCustomerId) {
		this.refundOrderCustomerId = refundOrderCustomerId;
	}
	public String getRefundOrderCustomerName() {
		return refundOrderCustomerName;
	}
	public void setRefundOrderCustomerName(String refundOrderCustomerName) {
		this.refundOrderCustomerName = refundOrderCustomerName;
	}
	public String getRefundOrderCustomerTel() {
		return refundOrderCustomerTel;
	}
	public void setRefundOrderCustomerTel(String refundOrderCustomerTel) {
		this.refundOrderCustomerTel = refundOrderCustomerTel;
	}
	
	
}
