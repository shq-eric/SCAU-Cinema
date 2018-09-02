package scau.se37.admin.action;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import scau.se37.common.service.RefundOrderService;
import scau.se37.entity.RefundOrder;

@Controller
@RequestMapping("/refundorder")
public class AdminRefundOrderAction {
	@Autowired
    private RefundOrderService refundorderService;
    
    @RequestMapping("/showrefundorder")
    public ModelAndView showRefundOrder(){
    	
        ModelAndView mav = new ModelAndView();
        List<RefundOrder> records = refundorderService.findAllRefundOrder();
        mav.addObject("refundorders", records);
        
        mav.setViewName("admin_RefundOrder");
        return mav;
    }
    
}
