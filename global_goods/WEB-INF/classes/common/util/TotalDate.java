/*****************************************************************************
 * �����̸� : TotalDate.java
 * ���ϳ��� : ����Ʈ���� ����ϱ� ���� ���ϴ� ������ ��¥�� �����Ѵ�.
 * �� �� ��  : Soo-bae. Park.
*****************************************************************************/
package common.util;

import java.util.*;
import java.text.*;

public class TotalDate
{
    private static Date date;
    private static Calendar cal;
    private static String result;
    private static String pattern = "yyyy�� M�� d��  a h�� m��";
    private static SimpleDateFormat formatter;
    private static Locale nation = new Locale("ko","KOREA");

    /**
     * ����		: ���� ��¥�� Default Format���� return
     * �Է� ��	:
     * ��� ��	: String result
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
     * ����		: ���� ��¥�� �Է��� Format���� return
     * �Է� ��	: String datePattern
     * ��� ��	: String result
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
     * ����		: ���ϴ� �ñ��� �ϴ����� �Է��� ���ڿ� �ش��ϴ� ��¥�� Default Format���� return
     * �Է� ��	: int change
     * ��� ��	: String result
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
     * ����		: ���ϴ� �ñ��� �ϴ����� �Է��� ���ڿ� �ش��ϴ� ��¥�� �Է��� Format���� return
     * �Է� ��	: String datePattern, int change
     * ��� ��	: String result
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
     * ����		: ���ϴ� �ñ��� �ִ����� �Է��� ���ڿ� �ش��ϴ� ��¥�� Default Format���� return
     * �Է� ��	: int change
     * ��� ��	: String result
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
     * ����		: ���ϴ� �ñ��� �ִ����� �Է��� ���ڿ� �ش��ϴ� ��¥�� �Է��� Format���� return
     * �Է� ��	: String datePattern, int change
     * ��� ��	: String result
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
     * ����		: ���ϴ� �ñ��� �������� �Է��� ���ڿ� �ش��ϴ� ��¥�� Default Format���� return
     * �Է� ��	: String datePattern, int change
     * ��� ��	: String result
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
     * ����		: ���ϴ� �ñ��� �������� �Է��� ���ڿ� �ش��ϴ� ��¥�� �Է��� Format���� return
     * �Է� ��	: String datePattern, int change
     * ��� ��	: String result
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
     * ����		: ���ϴ� �ñ��� ������� �Է��� ���ڿ� �ش��ϴ� ��¥�� Default Format���� return
     * �Է� ��	: String datePattern, int change
     * ��� ��	: String result
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
     * ����		: ���ϴ� �ñ��� ������� �Է��� ���ڿ� �ش��ϴ� ��¥�� �Է��� Format���� return
     * �Է� ��	: String datePattern, int change
     * ��� ��	: String result
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
     * ����		: form���� to���� �ϼ��� ���ϴ� METHOD
     * �Է� ��	: String yyyyMMdd, String yyyyMMdd
     * ��� ��	: String result
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