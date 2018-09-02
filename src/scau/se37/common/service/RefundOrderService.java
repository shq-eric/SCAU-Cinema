package scau.se37.common.service;

import java.util.List;

import scau.se37.entity.RefundOrder;

public interface RefundOrderService {
	 public Boolean saveRefundOrder(RefundOrder refundOrder);
	    
	 public Boolean deleteRefundOrder(int refundOrderId);
	    
	 public RefundOrder findByRefundOrderId(int refundOrderId);
	    
	 public List<RefundOrder> findAllRefundOrder();
	    
	 public Boolean updateRefundOrder(RefundOrder refundOrder); 

}
