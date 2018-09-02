package scau.se37.customer.action;

import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import net.sf.json.JSONObject;
import scau.se37.common.service.CinemaService;
import scau.se37.common.service.HallService;
import scau.se37.common.service.MovieOrderService;
import scau.se37.common.service.MovieService;
import scau.se37.common.service.ScheduleService;
import scau.se37.common.service.SeatService;
import scau.se37.common.service.TicketService;
import scau.se37.entity.Cinema;
import scau.se37.entity.Customer;
import scau.se37.entity.Hall;
import scau.se37.entity.Movie;
import scau.se37.entity.MovieOrder;
import scau.se37.entity.Schedule;
import scau.se37.entity.Seat;
import scau.se37.entity.Ticket;

@Controller
@RequestMapping("/movie")
public class MovieAction {
	@Autowired
	private MovieService movieService;
	@Autowired
	private CinemaService cinemaService;
	@Autowired
	private HallService hallService;
	@Autowired
	private ScheduleService scheduleService;
	@Autowired
	private SeatService seatService;
	@Autowired
	private TicketService ticketService;
	@Autowired
	private MovieOrderService movieOrderService;
	
	
	@RequestMapping(value="/loadMovie")
	public ModelAndView loadMovie(Model model,HttpSession session,HttpServletRequest request){
		String basePath1 = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";
		List<Movie> movieList=new ArrayList<Movie>();
		List<Movie> mList=new ArrayList<Movie>();
		movieList=movieService.findByMovieStatus("上映中");
		//session.setAttribute("movieList", movieList);
		model.addAttribute("movieList", movieList);
		/*Map<String,List> map=new HashMap<String,List>();
		map.put("movieList", movieList);
		
		
		JSONObject resultJSON = JSONObject.fromObject(map); 
		 String data=callback1+"("+resultJSON.toString()+")";*/
		
		ModelAndView mav=new ModelAndView("index");
			
		return mav;
		
	}
	
	@RequestMapping(value="lMovie")
	public String lMovie(Model model){
		List<Movie> mList=new ArrayList<Movie>();
		mList=movieService.findByMovieStatus("即将上映");
		model.addAttribute("mList", mList);
		return "movie";
	}
	
	
	@RequestMapping(value="/single")
	public ModelAndView single(String movieId,HttpSession session,HttpServletRequest request){
		String basePath1 = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";
		System.out.println(movieId);
		if(movieId!=null){
		int i=Integer.parseInt(movieId);
		//List<Movie> movieList=(List<Movie>)session.getAttribute("movieList");
		Movie movie=(Movie) movieService.findByMovieId(i);
		
		
		System.out.println(movie.getMovieName());
		session.setAttribute("movie", movie);
		
		}
		 return new ModelAndView("redirect:"+basePath1+"jsp/single.jsp");
	}
	
	@RequestMapping(value="/loadBookingInfo")
	public ModelAndView loadBookingInfo(Model model,String selectedDate,HttpServletRequest request,HttpSession session){
		String basePath1 = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";
		Date date;
		java.util.Date d;
		Calendar cal=Calendar.getInstance();   
		SimpleDateFormat f=new SimpleDateFormat("yyyy-MM-dd");
		List<Schedule> customer_scheduleList;
		
		Cinema customer_cinema;
		List<Hall> customer_hallList;
		Movie movie=(Movie)session.getAttribute("movie");
		int year=cal.get(Calendar.YEAR);
		int month=cal.get(Calendar.MONTH);
		int day=cal.get(Calendar.DATE);
		String currentDate=year+"-"+month+"-"+day;
		currentDate=year+"-"+month+"-"+day;
		List<String> bookingTime=new ArrayList<String>();
		List<Date> dateList=scheduleService.findAllScheduleDate();
		int dateListLen=0;
		if(dateList!=null)
			dateListLen=dateList.size();
		for(int i=0;i<dateListLen;i++){
			//cal=Calendar.getInstance();
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
			//cal.set(Calendar.DAY_OF_YEAR,
				//	cal.get(Calendar.DAY_OF_YEAR) + i);
			
			bookingTime.add(df.format(dateList.get(i)));
		}
		model.addAttribute("bookingTime", bookingTime);
		try {
			
			d=dateList.get(0);
			date=new Date(d.getTime());
			if(selectedDate!=null){
					d=f.parse(selectedDate);
					date=new Date(d.getTime());
			}
			
			customer_scheduleList=scheduleService.findByMovieId(date, movie.getMovieId());
			//if(customer_scheduleList!=null)
			//System.out.println(customer_scheduleList.get(0).getMovieName());
			model.addAttribute("customer_scheduleList", customer_scheduleList);
			customer_cinema=cinemaService.findByCinemaId(1);
			model.addAttribute("customer_cinema", customer_cinema);
			customer_hallList=hallService.findAllHall();
			
			model.addAttribute("customer_hallList", customer_hallList);
		} catch (ParseException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		return new ModelAndView("choose_movieTime");
		
	}
	
	@RequestMapping(value="/chooseSeat")
	public String chooseSeat(Model model,String scheduleId){
		Schedule schedule;
		Hall hall;
		List<Ticket> selectedSeatList;
		List<Integer> seatPositionList=new ArrayList<Integer>();
		Cinema cinema;
		//seatPostionList.add(0, 0);
		if(scheduleId!=null){
			schedule=scheduleService.findByScheduleId(Integer.parseInt(scheduleId));
			hall=hallService.findByHallId(schedule.getHallId());
			cinema=cinemaService.findByCinemaId(hall.getCinemaId());
			selectedSeatList=ticketService.findBySchedule(schedule);
			String str,str1,str2;
			int s1,s2,s;
			int strLen;
			int len;
			if(selectedSeatList==null)
				len=0;
			else
				len=selectedSeatList.size();
			System.out.println("被选的座位数："+len);
			for(int i=0;i<len;i++){
				str=selectedSeatList.get(i).getTicketSeat();
				strLen=str.length();
				str1=str.substring(0, str.indexOf("-"));
				str2=str.substring(str.indexOf("-")+1,strLen);
				s1=Integer.parseInt(str1);
				s2=Integer.parseInt(str2);
				if(s2!=17)
				    s=(s1-1)*17+s2;
				else
					s=s1*17+s2;
				System.out.println("座位："+s);
				seatPositionList.add(i, s);
			}
			
			model.addAttribute("seatPostionList",seatPositionList );
			model.addAttribute("customer_schedule", schedule);
			model.addAttribute("customer_hall", hall);
			model.addAttribute("customer_cinema", cinema);
			model.addAttribute("selectedSeatList", selectedSeatList);
		}
		
		
		
		System.out.println(scheduleId);
		return "choose_seat";
		
	}
	
	@RequestMapping(value="/giveMoney")
	public String giveMoney(Model model,String scheduleId,String seat1,String seat2){
		String cseat1,cseat2;
		System.out.println(seat1);
		int sche=Integer.parseInt(scheduleId);
		int s1,s2;
		s1=Integer.parseInt(seat1);
		int row1,column1,row2,column2;
		List<String> seatPositionList=new ArrayList<String>();
		int seatNum=1;
		//转换为行列
		if(s1%17==0){
			row1=s1/17;
			column1=17;
			cseat1=row1+"-"+column1;
			seatPositionList.add(0, cseat1);
		}
		else if(s1%17!=0){
			row1=s1/17;
			column1=s1-row1*17;
			row1=row1+1;
			cseat1=row1+"-"+column1;
			seatPositionList.add(0, cseat1);
		}
		
		
			s2=Integer.parseInt(seat2);
			if(s2!=0)
				seatNum=2;
			if(s2%17==0){
				row2=s2/17;
				column2=17;
				cseat2=row2+"-"+column2;
				seatPositionList.add(1, cseat2);
			}
			else if(s2%17!=0){
				row2=s2/17;
				column2=s2-row2*17;
				row2=row2+1;
				cseat2=row2+"-"+column2;
				seatPositionList.add(1, cseat2);
			}
			
		    model.addAttribute("customer_seatPosition",seatPositionList);
			Schedule schedule=scheduleService.findByScheduleId(sche);
			schedule.setSchedulePrice(schedule.getSchedulePrice()*seatNum);
			System.out.println(schedule.getSchedulePrice());
			model.addAttribute("seatNum", seatNum);
			model.addAttribute("customer_schedule", schedule);
			Hall hall=hallService.findByHallId(schedule.getHallId());
			model.addAttribute("customer_hall", hall);
			Cinema cinema=cinemaService.findByCinemaId(hall.getCinemaId());
			model.addAttribute("customer_cinema", cinema);
			System.out.println(seatPositionList.get(0));
			System.out.println(seatPositionList.get(1));
			
		    return "givemoney";
		
	}
	
	
	@RequestMapping(value="/booking")
	public String booking(Model model,String scheduleId,String seat1,String seat2,String seatNum,HttpSession session){
		int scheId=Integer.parseInt(scheduleId);
		int sNum=Integer.parseInt(seatNum);
		
		Movie movie=(Movie)session.getAttribute("movie");
		Customer cus=(Customer)session.getAttribute("customer");
		Schedule schedule=scheduleService.findByScheduleId(scheId);
		Hall hall=hallService.findByHallId(schedule.getHallId());
		Cinema cinema=cinemaService.findByCinemaId(hall.getCinemaId());
		Ticket ticket=new Ticket();
		MovieOrder movieOrder=new MovieOrder();
		ticket.setMovieId(movie.getMovieId());
		ticket.setCustomId(cus.getCustomId());
		ticket.setMovieName(movie.getMovieName());
		ticket.setScheduleId(scheId);
		ticket.setCinemaAddress(cinema.getCinemaAddress());
		ticket.setHallId(hall.getHallId());
		ticket.setTicketSeat(seat1);
		ticket.setScheduleBegin(schedule.getScheduleBegin());
		ticket.setBeginTime(schedule.getBeginTime());
		ticket.setSchedulePrice(schedule.getSchedulePrice());
		Boolean b=ticketService.saveTicket(ticket);
		Seat bSeat1=seatService.findSelectedSeat(hall.getHallId(), seat1);
		bSeat1.setSeatIsActive(1);
		Boolean bs=seatService.updateSeat(bSeat1);
		System.out.println(bs+":预订座位"+seat1+"成功");
		if(sNum==2){
		Ticket t1=ticket;
		t1.setTicketSeat(seat2);
		ticketService.saveTicket(ticket);
		Seat bSeat2=seatService.findSelectedSeat(hall.getHallId(), seat2);
		bSeat2.setSeatIsActive(1);
		seatService.updateSeat(bSeat2);
		}
		
		
		System.out.println(b);
		movieOrder.setOrderPlatform(cinema.getCinemaName());
		movieOrder.setTicketNum(sNum);
		movieOrder.setOrderPrice(schedule.getSchedulePrice()*sNum);
		movieOrder.setOrderDate(schedule.getScheduleBegin());
		movieOrder.setOrderstatus("已完成");
		
		movieOrder.setOrderCustomerId(cus.getCustomId());
		movieOrder.setOrderCustomerName(cus.getCustomUsername());
		movieOrder.setOrderCustomerTel(cus.getCustomTel());
		b=movieOrderService.saveMovieOrder(movieOrder);
		System.out.println(b);
		List<Ticket> tic=ticketService.findByTicketDate(cus.getCustomId(), schedule.getScheduleBegin());
		model.addAttribute("movieTicket", tic);
		model.addAttribute("customer_cinema", cinema);
		return "booking";
	}
	
	@RequestMapping(value="/sumbooking")
	public String sumbooking(HttpSession session,Model model){
		Customer cus=(Customer)session.getAttribute("customer");
		if(cus!=null){
			List<Ticket> personalTicketList=ticketService.findByCustomId(cus.getCustomId());
			model.addAttribute("movieTicket", personalTicketList);
		    return "booking";
		}
		else
			return null;
	}
	@ResponseBody
	@RequestMapping(value="/deleteTicket",produces="application/json;charset=UTF-8")
	public String deleteTicket(String callback,String ticketId){
		System.out.println("删除票："+ticketId);
		int tId=Integer.parseInt(ticketId);
		Boolean b=ticketService.deleteTicket(tId);
		Map<String,String> map=new HashMap<String,String>();
		if(b){
			 map.put("t", "true");
		 }
		 else
			 map.put("t", "false");
		JSONObject resultJSON = JSONObject.fromObject(map); 
		 String data=callback+"("+resultJSON.toString()+")";
		 return data;
	}
	
	 
	
}
