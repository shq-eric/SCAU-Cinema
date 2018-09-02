package scau.se37.util;

import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;

public class test {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Calendar now = Calendar.getInstance();
		 SimpleDateFormat format = new SimpleDateFormat("yyyy-M-d");
		java.util.Date date=new java.util.Date();
	
			/*System.out.println(date.getYear());
			
			date=format.parse("2018-8-1");
			System.out.println(date);
			
			Date d=new Date(date.getTime());
			System.out.println(d);*/
			Calendar calendar = Calendar.getInstance();
			calendar.set(Calendar.DAY_OF_YEAR,
					calendar.get(Calendar.DAY_OF_YEAR) + 25);
			SimpleDateFormat df = new SimpleDateFormat("MM-dd");
			System.out.println("一天以后的时间：" + df.format(calendar.getTime()));
			
		
		
		
	}

}
