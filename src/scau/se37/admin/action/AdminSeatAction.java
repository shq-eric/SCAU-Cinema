package scau.se37.admin.action;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import scau.se37.common.service.SeatService;
import scau.se37.entity.Seat;

@Controller
@RequestMapping("/seat")
public class AdminSeatAction {
	@Autowired
	private SeatService seatService;
	//?hallId=1&row=12&col=17
	//批量增加seat
	@RequestMapping("alladdseat")
	@ResponseBody
	public ModelAndView allAddSeat(HttpServletRequest request){
		Seat seat = new Seat();
		int hall_id = Integer.parseInt(request.getParameter("hallId"));
		boolean is_save = true;
		//行
		seat.setHallId(hall_id);
		seat.setSeatIsActive(0);
		int row = Integer.parseInt(request.getParameter("row"));
		//列
		int col = Integer.parseInt(request.getParameter("col"));
		
		for(int i=1; i<=row; i++){
			for(int j=1; j<=col; j++){
				seat.setSeatPosition(i + "-" + j);
				is_save = seatService.saveSeat(seat);
				if(!is_save){
					break;
				}
			}
			if(!is_save) break;
		}
		if(is_save){
		return new ModelAndView("redirect:/movie/showmovie.do");
		}
		return null;
	}
}
