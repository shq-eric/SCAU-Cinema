package scau.se37.admin.action;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import scau.se37.common.service.StatisticsService;
import scau.se37.entity.Statistics;

@Controller
@RequestMapping("/statistics")
public class StatisticsAction {
	@Autowired
	private StatisticsService statisticsService;
	
	
	@RequestMapping("/countmovie")
	public ModelAndView CountMovie(){
		ModelAndView mav = new ModelAndView();
		List<Statistics> Tlist = statisticsService.CountMovie();
		mav.addObject("lists",Tlist);
		mav.addObject("increase",480/5);
		System.out.println(480/Tlist.size());
		mav.setViewName("Admin_Statistics");
		return mav;
	}
}
