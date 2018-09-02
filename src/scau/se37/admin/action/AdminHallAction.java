package scau.se37.admin.action;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import scau.se37.common.service.HallService;
import scau.se37.common.service.ScheduleService;
import scau.se37.entity.Hall;
import scau.se37.entity.Schedule;

@Controller
@RequestMapping("/hall")
public class AdminHallAction {
	@Autowired
    private HallService hallService;
	@Autowired
	private ScheduleService scheduleService;
    
    @RequestMapping("/showhall")
    public ModelAndView showHall(){
    	
        ModelAndView mav = new ModelAndView();
        List<Hall> records = hallService.findAllHall();
        mav.addObject("halls", records);
        
        mav.setViewName("admin_Hall_Manage");
        return mav;
    }
    
    //增加hall
    @RequestMapping("/addhall")			
    public ModelAndView addHall(Hall hall){	
    	//判断是否成功
    	boolean is_save = hallService.saveHall(hall);
        return new ModelAndView("redirect:/hall/showhall.do");
    }
    
    //删除hall
    @RequestMapping("/deletehall")	
    @ResponseBody
    public String deleteHall(int id){	
    	//判断是否成功
    	if(scheduleService.findByHallId(id)){
    		return "schedule exit";
    	}
    	if(hallService.deleteHall(id)){
    		return "ok";
    	}
        return "fail";
    }
    
    //修改hall
    @RequestMapping("/updatehall")	
    @ResponseBody
    public ModelAndView updateHall(Hall hall){	
    	//判断是否成功
    	boolean is_update = hallService.updateHall(hall);
    	System.out.println(is_update);
    	System.out.println(hall.getHallId());
        return new ModelAndView("redirect:/hall/showhall.do");
    }
    
    //修改将数据绑定
    @RequestMapping("/updatebinddata")
    @ResponseBody
    public Hall InsertBindData(int id){
    	Hall hall = hallService.findByHallId(id);
    	return hall;
    }
}
