package scau.se37.customer.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import net.sf.json.JSONObject;
import scau.se37.common.service.CustomerService;
import scau.se37.entity.Customer;


@Controller
@RequestMapping("/customer")
public class CustomerAction {
	String basePath="http://localhost:8080/se37/jsp/";
	@Autowired
	private CustomerService customerService;
	
	@RequestMapping("/showCustomer")
	public ModelAndView showCustomer(){
		 ModelAndView mav=new  ModelAndView();
		 List<Customer> list=customerService.findAllCustomer();
		 mav.addObject("customer", list);
		 mav.setViewName("");
		 return mav;
	}
	
	@RequestMapping("/saveCustomer")
	public ModelAndView saveCustomer(Model model,HttpServletRequest request){
		String basePath1 = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";
		Customer customer=new Customer();
		customer.setCustomUsername(request.getParameter("customUsername"));
		customer.setCustomPassword(request.getParameter("customPassword"));
		customer.setCustomTel(request.getParameter("customTel"));
		System.out.println(customer.getCustomUsername());
		customerService.saveCustomer(customer);
		System.out.println(basePath1);
		return new ModelAndView("redirect:"+basePath1+"jsp/login.jsp");
		//return "login";
	}
	
	 @ResponseBody
	@RequestMapping(value="/customerLogin",produces="application/json;charset=UTF-8")
	public String login(String callback,HttpServletRequest request,HttpSession session){
		String customUsername=request.getParameter("customUsername");
		String customPassword=request.getParameter("customPassword");
		Map<String,String> map=new HashMap<String,String>();
		Customer cus=customerService.login(customUsername, customPassword);
		
		if(cus!=null){
			map.put("tf", "true");
			session.setAttribute("customId", String.valueOf(cus.getCustomId()));
			session.setAttribute("customUsername", cus.getCustomUsername());
			session.setAttribute("customPassword", cus.getCustomPassword());
			session.setAttribute("customTel", cus.getCustomTel());
			session.setAttribute("login", customUsername);
			session.setAttribute("customer", cus);
		}
		else
			map.put("tf", "false");
		JSONObject resultJSON = JSONObject.fromObject(map); 
		System.out.println(session.getAttribute("customUsername"));
		String data=callback+"("+resultJSON.toString()+")";
		return data;
	}
	 
	 @RequestMapping(value="/success")
	 public ModelAndView goIndex(HttpServletRequest request){
		 String basePath1 = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";
		 return new ModelAndView("redirect:"+basePath1+"movie/loadMovie.do");
	 }
	 
	 @RequestMapping(value="/logout")
	 public ModelAndView logout(HttpServletRequest request,HttpSession session){
		 String basePath1 = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";
		 session.invalidate();
		return new ModelAndView("redirect:"+basePath1+"movie/loadMovie.do");
		 
	 }
	 
	 
	 @ResponseBody
	@RequestMapping(value="/checkUsername",produces="application/json;charset=UTF-8")
	 public String checkUsername(String callback1,String username){
		 //String customUsername=request.getParameter("customUsername");
		 System.out.println(username);
		 Map<String,String> map=new HashMap<String,String>();
		 Boolean b=customerService.checkUsername(username);
		 if(b){
			 map.put("t", "true");
		 }
		 else
			 map.put("t", "false");
		 JSONObject resultJSON = JSONObject.fromObject(map); 
		 String data=callback1+"("+resultJSON.toString()+")";
		 return data;
	 }
	 
	 @RequestMapping(value="/personalinformation")
	 public String personalinformation(HttpSession session){
		 Customer cus=(Customer)session.getAttribute("customer");
		 if(cus!=null)
		     return "personalinformation";
		 else
			 return null;
	 }
	 
	 @RequestMapping(value="/updateCustomer")
	 public String updateCustomer(Customer customer,HttpSession session){
		 customerService.updateCustomer(customer);
		 session.setAttribute("customer", customer);
		 session.setAttribute("customId", String.valueOf(customer.getCustomId()));
		 session.setAttribute("customUsername", customer.getCustomUsername());
		 session.setAttribute("customPassword", customer.getCustomPassword());
		 session.setAttribute("customTel", customer.getCustomTel());
		 return "personalinformation";
	 }
}
