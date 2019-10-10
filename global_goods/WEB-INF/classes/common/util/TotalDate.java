/*****************************************************************************
 * 파일이름 : TotalDate.java
 * 파일내용 : 사이트에서 사용하기 위한 원하는 형태의 날짜를 리턴한다.
 * 작 성 자  : Soo-bae. Park.
*****************************************************************************/
package common.util;

import java.util.*;
import java.text.*;

public class TotalDate
{
    private static Date date;
    private static Calendar cal;
    private static String result;
    private static String pattern = "yyyy년 M월 d일  a h시 m분";
    private static SimpleDateFormat formatter;
    private static Locale nation = new Locale("ko","KOREA");

    /**
     * 내용		: 오늘 날짜를 Default Format으로 return
     * 입력 값	:
     * 출력 값	: String result
     */
    public static String getToday()
    {
        date = new Date();
        cal = Calendar.getInstance();
        cal.setLenient(true);
        cal.setTime(date);
        
        formatter = new SimpleDateFormat(pattern, nation);
        result = formatter.format(date);
        return result;
    }
    
    /**
     * 내용		: 오늘 날짜를 입력한 Format으로 return
     * 입력 값	: String datePattern
     * 출력 값	: String result
     */
    public static String getToday(String datePattern)
    {
        date = new Date();
        cal = Calendar.getInstance();
        cal.setLenient(true);
        cal.setTime(date);
        
        formatter = new SimpleDateFormat(datePattern, nation);
        result = formatter.format(date);
        return result;
    }

    /**
     * 내용		: 원하는 시기의 일단위로 입력한 숫자에 해당하는 날짜를 Default Format으로 return
     * 입력 값	: int change
     * 출력 값	: String result
     */
    public static String getDayDate(int change)
    {
        date = new Date();
        cal = Calendar.getInstance();
        cal.setLenient(true);
        cal.setTime(date);
        
        formatter = new SimpleDateFormat(pattern, nation);
		cal.add(Calendar.DATE, change);
		Date setDate = cal.getTime();
		result = formatter.format(setDate);
		return result;
    }

    /**
     * 내용		: 원하는 시기의 일단위로 입력한 숫자에 해당하는 날짜를 입력한 Format으로 return
     * 입력 값	: String datePattern, int change
     * 출력 값	: String result
     */
    public static String getDayDate(String datePattern, int change)
    {
        date = new Date();
        cal = Calendar.getInstance();
        cal.setLenient(true);
        cal.setTime(date);
        
        formatter = new SimpleDateFormat(datePattern, nation);
		cal.add(Calendar.DATE, change);
		Date setDate = cal.getTime();
		result = formatter.format(setDate);
		return result;
    }

    /**
     * 내용		: 원하는 시기의 주단위로 입력한 숫자에 해당하는 날짜를 Default Format으로 return
     * 입력 값	: int change
     * 출력 값	: String result
     */
    public static String getWeekDate(int change)
    {
        date = new Date();
        cal = Calendar.getInstance();
        cal.setLenient(true);
        cal.setTime(date);
        
        change = change * 7;
        formatter = new SimpleDateFormat(pattern, nation);
		cal.add(Calendar.DATE, change);
		Date setDate = cal.getTime();
		result = formatter.format(setDate);
		return result;
    }

    /**
     * 내용		: 원하는 시기의 주단위로 입력한 숫자에 해당하는 날짜를 입력한 Format으로 return
     * 입력 값	: String datePattern, int change
     * 출력 값	: String result
     */
    public static String getWeekDate(String datePattern, int change)
    {
        date = new Date();
        cal = Calendar.getInstance();
        cal.setLenient(true);
        cal.setTime(date);
        
        change = change * 7;
        formatter = new SimpleDateFormat(datePattern, nation);
		cal.add(Calendar.DATE, change);
		Date setDate = cal.getTime();
		result = formatter.format(setDate);
		return result;
    }

    /**
     * 내용		: 원하는 시기의 월단위로 입력한 숫자에 해당하는 날짜를 Default Format으로 return
     * 입력 값	: String datePattern, int change
     * 출력 값	: String result
     */
    public static String getMonthDate(int change)
    {
        date = new Date();
        cal = Calendar.getInstance();
        cal.setLenient(true);
        cal.setTime(date);
        
        formatter = new SimpleDateFormat(pattern, nation);
		cal.add(Calendar.MONTH, change);
		Date setDate = cal.getTime();
		result = formatter.format(setDate);
		return result;
    }

    /**
     * 내용		: 원하는 시기의 월단위로 입력한 숫자에 해당하는 날짜를 입력한 Format으로 return
     * 입력 값	: String datePattern, int change
     * 출력 값	: String result
     */
    public static String getMonthDate(String datePattern, int change)
    {
        date = new Date();
        cal = Calendar.getInstance();
        cal.setLenient(true);
        cal.setTime(date);
        
        formatter = new SimpleDateFormat(datePattern, nation);
		cal.add(Calendar.MONTH, change);
		Date setDate = cal.getTime();
		result = formatter.format(setDate);
		return result;
    }

    /**
     * 내용		: 원하는 시기의 년단위로 입력한 숫자에 해당하는 날짜를 Default Format으로 return
     * 입력 값	: String datePattern, int change
     * 출력 값	: String result
     */
    public static String getYearDate(int change)
    {
        date = new Date();
        cal = Calendar.getInstance();
        cal.setLenient(true);
        cal.setTime(date);
        
        formatter = new SimpleDateFormat(pattern, nation);
		cal.add(Calendar.YEAR, change);
		Date setDate = cal.getTime();
		result = formatter.format(setDate);
		return result;
    }

    /**
     * 내용		: 원하는 시기의 년단위로 입력한 숫자에 해당하는 날짜를 입력한 Format으로 return
     * 입력 값	: String datePattern, int change
     * 출력 값	: String result
     */
    public static String getYearDate(String datePattern, int change)
    {
        date = new Date();
        cal = Calendar.getInstance();
        cal.setLenient(true);
        cal.setTime(date);
        
        formatter = new SimpleDateFormat(datePattern, nation);
		cal.add(Calendar.YEAR, change);
		Date setDate = cal.getTime();
		result = formatter.format(setDate);
		return result;
    }

	/**
     * 내용		: form부터 to까지 일수를 구하는 METHOD
     * 입력 값	: String yyyyMMdd, String yyyyMMdd
     * 출력 값	: String result
     */
	public static int daysBetween(String from, String to, String pattern)
	{
		SimpleDateFormat format = new SimpleDateFormat(pattern, Locale.KOREA);
		Date date1 = null;
		Date date2 = null;

		try {
			date1 = format.parse(from);
			date2 = format.parse(to);
		} catch(ParseException e) {
			return -999;
		}

		if(!format.format(date1).equals(from)) return -999;
		if(!format.format(date2).equals(to)) return -999;

		long duration = date2.getTime() - date1.getTime();

		return (int)(duration/(1000 * 60 * 60 * 24));
	}
}