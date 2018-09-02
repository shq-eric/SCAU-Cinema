package scau.se37.admin.action;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.request;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import scau.se37.common.service.ScheduleService;
import scau.se37.entity.Schedule;

@Controller
@RequestMapping("/schedule")
public class AdminScheduleAction {
	@Autowired
    private ScheduleService scheduleService;
    
    @RequestMapping("/showschedule")
    public ModelAndView showSchedule(){
    	
        ModelAndView mav = new ModelAndView();
//		String basePath1 = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";
//		System.out.println(basePath1);
        List<Schedule> records = scheduleService.findAllSchedule();
//        for(Schedule r: records){
//        	System.out.println(r.getScheduleName());
//        }
        mav.addObject("schedules", records);
        
        mav.setViewName("admin_Schedule_Manage");
        return mav;
    }
    
    //增加schedule
    @RequestMapping("/addschedule")			
    public ModelAndView addSchedule(Schedule schedule){	
    	//判断是否成功
    	boolean is_save = scheduleService.saveSchedule(schedule);
        return new ModelAndView("redirect:/schedule/showschedule.do");
    }
    
    //删除schedule
    @RequestMapping("/deleteschedule")	
    @ResponseBody
    public boolean deleteSchedule(int id){	
    	//判断是否成功
    	boolean is_delete = scheduleService.deleteSchedule(id);
        return is_delete;
    }
    
    //修改schedule
    @RequestMapping("/updateschedule")	
    @ResponseBody
    public ModelAndView updateSchedule(Schedule schedule){	
    	//判断是否成功
    	boolean is_update = scheduleService.updateSchedule(schedule);
    	System.out.println(is_update);
    	System.out.println(schedule.getScheduleId());
        return new ModelAndView("redirect:/schedule/showschedule.do");
    }
    
    //修改将数据绑定
    @RequestMapping("/updatebinddata")
    @ResponseBody
    public Schedule InsertBindData(int id){
    	Schedule schedule = scheduleService.findByScheduleId(id);
    	return schedule;
    }
}
