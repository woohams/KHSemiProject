package common;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Util {
		
	public static String isTwo(String msg) {
		return (msg.length()<2)?"0"+msg:msg;
	}
	
	public static Date setTodates(String mdate) {
		
		Date date = null;
		try {
			if(!mdate.contains("00:00:00")) {
				mdate = mdate + " 00:00:00";
			}
			date = new SimpleDateFormat("yyyy-MM-dd 00:00:00").parse(mdate);
		} catch (ParseException e) {
			e.printStackTrace();
		} catch (NullPointerException e) {
			System.out.println("UTIL getDate할떄 null오류");
		}
		
		
		return date;
		
	}
	
	public static String dateformat(Date date) {
		
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		String res = null;
		try {
		res = format.format(date);
		}catch(NullPointerException e) {
			System.out.println("dateformat Null포인트오류");
		}
		
		return res;
	}

}
