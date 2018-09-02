package scau.se37.entity;

import java.sql.Date;

public class MovieOrder {

	  private int orderId;
	  private String orderPlatform;
	  private int ticketNum;
	  private double orderPrice;
	  private Date orderDate;
	  private String orderstatus;
	  private int orderCustomerId;
	  private String orderCustomerName;
	  private String orderCustomerTel;
	  
	public int getOrderId() {
		return orderId;
	}
	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}
	public String getOrderPlatform() {
		return orderPlatform;
	}
	public void setOrderPlatform(String orderPlatform) {
		this.orderPlatform = orderPlatform;
	}
	public int getTicketNum() {
		return ticketNum;
	}
	public void setTicketNum(int ticketNum) {
		this.ticketNum = ticketNum;
	}
	public double getOrderPrice() {
		return orderPrice;
	}
	public void setOrderPrice(double orderPrice) {
		this.orderPrice = orderPrice;
	}
	public Date getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}
	public String getOrderstatus() {
		return orderstatus;
	}
	public void setOrderstatus(String orderstatus) {
		this.orderstatus = orderstatus;
	}
	public int getOrderCustomerId() {
		return orderCustomerId;
	}
	public void setOrderCustomerId(int orderCustomerId) {
		this.orderCustomerId = orderCustomerId;
	}
	public String getOrderCustomerName() {
		return orderCustomerName;
	}
	public void setOrderCustomerName(String orderCustomerName) {
		this.orderCustomerName = orderCustomerName;
	}
	public String getOrderCustomerTel() {
		return orderCustomerTel;
	}
	public void setOrderCustomerTel(String orderCustomerTel) {
		this.orderCustomerTel = orderCustomerTel;
	}
	  
	  
}
