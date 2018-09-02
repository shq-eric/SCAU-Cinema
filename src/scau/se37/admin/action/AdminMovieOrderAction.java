package scau.se37.admin.action;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import scau.se37.common.service.MovieOrderService;
import scau.se37.entity.MovieOrder;

@Controller
@RequestMapping("/order")
public class AdminMovieOrderAction {
	@Autowired
    private MovieOrderService movieorderService;
    
    @RequestMapping("/showmovieorder")
    public ModelAndView showMovieOrder(){
    	
        ModelAndView mav = new ModelAndView();
        List<MovieOrder> records = movieorderService.findAllMovieOrder();
        mav.addObject("movieorders", records);
        
        mav.setViewName("admin_Order");
        return mav;
    }
    
}
