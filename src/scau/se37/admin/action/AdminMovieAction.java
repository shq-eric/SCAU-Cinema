package scau.se37.admin.action;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import scau.se37.common.service.MovieService;
import scau.se37.entity.Movie;

@Controller
@RequestMapping("/movie")
public class AdminMovieAction {
	@Autowired
    private MovieService movieService;
    
    @RequestMapping("/showmovie")
    public ModelAndView showMovie(){
    	
        ModelAndView mav = new ModelAndView();
        List<Movie> records = movieService.findAllMovie();
        mav.addObject("movies", records);
        
        mav.setViewName("admin_Movie_Manage");
        return mav;
    }
    
    //增加movie
    @RequestMapping("/addmovie")			
    public ModelAndView addMovie(HttpServletRequest request,Movie movie) throws IllegalStateException, IOException{	
//    	ServletContext sc = request.getSession().getServletContext();
    	//定义文件保存的本地路径
        ServletContext sc = request.getSession().getServletContext();  
        String image_path = sc.getRealPath("/jsp/images") + "/"; // 设定文件保存的目录 
          String filename=null; 
          if(!movie.getMovieFile().isEmpty()){ 
        	//判断插入是否成功
        	  boolean is_save = movieService.saveMovie(movie);
        	  //String contentType=movie.getMovieFile().getContentType(); 
              //获得文件后缀名   
              //String suffixName=contentType.substring(contentType.indexOf("/")+1);
              filename= String.valueOf(movieService.findMaxMovieId()) + ".jpg"; 
              //文件保存路径
              //movie.getMovieFile().transferTo(new File(image_path+filename)); 
	          FileOutputStream fos = new FileOutputStream(image_path + filename);  
	          InputStream in = movie.getMovieFile().getInputStream();  
	          int b = 0;  
	          while ((b = in.read()) != -1) {  
	              fos.write(b);  
	          }  
	          fos.close();  
	          in.close();  
          }
          //把图片的相对路径保存至数据库
          System.out.println(image_path+filename);
        
        return new ModelAndView("redirect:/movie/showmovie.do");
    }
    
    //删除movie
    @RequestMapping("/deletemovie")	
    @ResponseBody
    public boolean deleteMovie(int id){	
    	//判断是否成功
    	boolean is_delete = movieService.deleteMovie(id);
        return is_delete;
    }
    
    //修改movie
    @RequestMapping("/updatemovie")	
    @ResponseBody
    public ModelAndView updateMovie(Movie movie){	
    	//判断是否成功
    	boolean is_update = movieService.updateMovie(movie);
    	System.out.println(is_update);
    	System.out.println(movie.getMovieId());
        return new ModelAndView("redirect:/movie/showmovie.do");
    }
    
    //修改将数据绑定
    @RequestMapping("/updatebinddata")
    @ResponseBody
    public Movie InsertBindData(int id){
    	Movie movie = movieService.findByMovieId(id);
    	return movie;
    }
}
