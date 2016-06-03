package jianting;

import java.util.Timer;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.http.HttpServletRequest;

public class LoginStatistic implements ServletContextListener{
 
	private Timer timer = null;     
    public void contextInitialized(ServletContextEvent event){     
            timer = new Timer();     
            timer.schedule(new RunStatistics(),1000,10*1000);     
    }     
    public void contextDestroyed(ServletContextEvent event){     
           timer.cancel();     
     }  
   
}
