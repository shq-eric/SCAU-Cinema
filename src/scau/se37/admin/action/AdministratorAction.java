package scau.se37.admin.action;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.request;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import scau.se37.common.service.AdministratorService;
import scau.se37.entity.Administrator;

@Controller
@RequestMapping("/administrator")
public class AdministratorAction {
	@Autowired
    private AdministratorService administratorservice;
	
	@RequestMapping("/login")
	public ModelAndView Login(){
		ModelAndView mav = new ModelAndView();
        mav.setViewName("admin_Login");
        return mav;
	}
	
	@ResponseBody
	@RequestMapping("/checklogin")
    public String checkLogin(String adminname,String password,HttpSession session){
        //调用service方法
		Administrator administrator = administratorservice.checkLogin(adminname, password);

		//若有administrator跳转到成功页面
        if(administrator != null){
//            model.addAttribute("administrator",administrator);
            session.setAttribute("administratorId", administrator.getAdministratorId());
			session.setAttribute("administratorName", administrator.getAdministratorName());
			session.setAttribute("administratorPassword", administrator.getAdministratorPassword());
			session.setAttribute("administratorLevel",administrator.getAdministratorLevel());
			System.out.println(administrator.getAdministratorPassword());
			System.out.println(administrator.getAdministratorLevel());
            return "success";
        }
        return "fail";
    }
	
	@RequestMapping(value="/logout")
	 public ModelAndView logout(HttpSession session){
		 session.invalidate();
		return new ModelAndView("redirect:/administrator/login.do");
		 
	 }
    
    @RequestMapping("/showadministrator")
    public ModelAndView showAdministrator(){
    	
        ModelAndView mav = new ModelAndView();
        List<Administrator> records = administratorservice.findAllAdministrator();
        mav.addObject("administrators", records);
        
        mav.setViewName("admin_Manager_Update");
        return mav;
    }
    
    //增加页面
    @RequestMapping("/addadmin")			
    public ModelAndView addAdmin(){	
    	ModelAndView mav = new ModelAndView();
    	mav.setViewName("admin_Manager_Add");
        return mav;
    }
    
    //增加administrator
    @ResponseBody
    @RequestMapping("/addadministrator")			
    public String addAdministrator(String adminname,String adminemali,String adminpassword,String admintel){	
    	//判断是否成功
    	boolean is_exist = administratorservice.isNameExist(adminname);
    	if(is_exist){
    		return "adminname is exist";
    	}
    	else{
    		Administrator admin = new Administrator();
    		admin.setAdministratorName(adminname);
    		admin.setAdministratorEmail(adminemali);
    		admin.setAdministratorPassword(adminpassword);
    		admin.setAdministratorPhone(admintel);
    		admin.setAdministratorLevel("0");
    		boolean is_save = administratorservice.saveAdministrator(admin);
    		if(is_save){
    			return "success";
    		}
    		return "fail";
    	}
    }
    
    //删除administrator
    @RequestMapping("/deleteadministrator")	
    @ResponseBody
    public boolean deleteAdministrator(int id){	
    	//判断是否成功
    	boolean is_delete = administratorservice.deleteAdministrator(id);
        return is_delete;
    }
    
    //修改administrator
    @RequestMapping("/updateadministrator")	
    @ResponseBody
    public ModelAndView updateAdministrator(Administrator administrator){	
    	//判断是否成功
    	Administrator tmp = administratorservice.findByAdministratorId(administrator.getAdministratorId());
    	administrator.setAdministratorLevel(tmp.getAdministratorLevel());
    	boolean is_update = administratorservice.updateAdministrator(administrator);
    	System.out.println(is_update);
    	System.out.println(administrator.getAdministratorId());
        return new ModelAndView("redirect:/administrator/showadministrator.do");
    }
    
    //修改将数据绑定
    @RequestMapping("/updatebinddata")
    @ResponseBody
    public Administrator InsertBindData(int id){
    	Administrator administrator = administratorservice.findByAdministratorId(id);
    	return administrator;
    }
    
    
}
