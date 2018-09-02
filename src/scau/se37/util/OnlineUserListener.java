package scau.se37.util;

import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

public class OnlineUserListener implements HttpSessionListener {
	@Override
    public void sessionCreated(HttpSessionEvent event) {
    }

    @Override
    public void sessionDestroyed(HttpSessionEvent event) {
        HttpSession session = event.getSession();
        //ServletContext application = session.getServletContext();

        // 取得登录的用户名
        String username = (String) session.getAttribute("customUsername");
 
        //session.invalidate();
        // 从在线列表中删除用户名
       // List onlineUserList = (List) application.getAttribute("onlineUserList");
       // onlineUserList.remove(username);

        System.out.println(username + "超时退出。");
    }

	

}
