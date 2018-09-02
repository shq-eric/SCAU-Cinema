package scau.se37.dao;

import java.util.List;

import scau.se37.entity.RefundOrder;

public interface RefundOrderDao {

	public int saveRefundOrder(RefundOrder refundOrder);
	
	public int deleteRefundOrder(int refundOrderId);
    
    public RefundOrder findByRefundOrderId(int refundOrderId);
    
    
    public List<RefundOrder> findAllRefundOrder();
   
    public int updateRefundOrder(RefundOrder refundOrder);
	
}
