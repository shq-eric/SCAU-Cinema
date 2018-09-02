package scau.se37.common.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import scau.se37.common.service.RefundOrderService;
import scau.se37.dao.RefundOrderDao;
import scau.se37.entity.RefundOrder;
import scau.se37.entity.RefundOrder;

@Service
public class RefundOrderServiceImpl implements RefundOrderService {

	@Autowired
	private RefundOrderDao refundOrderDao;

	@Override
	public Boolean saveRefundOrder(RefundOrder refundOrder) {
		// TODO Auto-generated method stub
		int num=refundOrderDao.saveRefundOrder(refundOrder);
		if(num==1)
			return true;
		else
			return false;
	}

	@Override
	public Boolean deleteRefundOrder(int refundOrderId) {
		// TODO Auto-generated method stub
		int num=refundOrderDao.deleteRefundOrder(refundOrderId);
		if(num==1)
			return true;
		else
			return false;
	}

	@Override
	public RefundOrder findByRefundOrderId(int refundOrderId) {
		// TODO Auto-generated method stub
		return refundOrderDao.findByRefundOrderId(refundOrderId);
	}

	@Override
	public List<RefundOrder> findAllRefundOrder() {
		// TODO Auto-generated method stub
		return refundOrderDao.findAllRefundOrder();
	}

	@Override
	public Boolean updateRefundOrder(RefundOrder refundOrder) {
		// TODO Auto-generated method stub
		int num=refundOrderDao.updateRefundOrder(refundOrder);
		if(num==1)
			return true;
		else
			return false;
	}


}
