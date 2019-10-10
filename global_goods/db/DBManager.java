/*****************************************************************************
 * 파일이름 : DBManager.java
 * 파일내용 : DB에서 Connection Pool을 관리한다.(Singleton Design Pattern)
*****************************************************************************/
package db;

import snaq.db.*; 
import java.util.*;
import java.sql.*;

public class DBManager
{
	private static DBManager dbm = new DBManager();
	private static ConnectionPool pool;

	/**
	 * 내용		: private Constructor
	 * 입력 값	:
	 * 출력 값	:
	 */
	private DBManager()
	{}

	/**
	 * 내용		: DB접속에 필요한 사항들을 받아서 새로운 ConnectionPool을 생성한다.
	 * 입력 값	: String poolName, String maxPool, String maxConnection, String maxTime, String dbUrl, String userId, String userPass
	 * 출력 값	:
	 */
	public void createPool()
	{
		String poolName = "DB_POOL";
		int maxPool = 10;
		int maxConnection = 30;
		long maxTime = 180000;
		String dbUrl = "jdbc:oracle:thin:@127.0.0.1:1521:JAVADB";
		String userId = "JAVAUSER";
		String userPass = "java123";

		System.out.println("### DB Connection Test Start ##################################################");
		try
		{
			Driver myDriver = (Driver)Class.forName("oracle.jdbc.driver.OracleDriver").newInstance();
			System.out.println(".......... Driver Loading Success : "+myDriver);

			System.out.println(".......... DbUrl : "+dbUrl);
			System.out.println(".......... Db User/Pass : " + userId + " / " + userPass);
			Connection con = DriverManager.getConnection(dbUrl, userId, userPass);
			Statement stmt = con.createStatement();
			String query = "SELECT SYSDATE FROM DUAL";
			System.out.println(".......... Connection Test -----  Query : "+query);
			ResultSet rs = stmt.executeQuery(query);
			rs.next();
			String str_date = rs.getString("SYSDATE");
			System.out.println(".......... Query Test Success ----- SYSDATE : "+str_date);
			rs.close();
			stmt.close();
			con.close();
		}
		catch(Exception e)
		{
			System.out.println("[DBTestServlet]:"+ e.getMessage());
		}
		System.out.println("###############################################################################\n");

		System.out.println("### NEW DB Connection Pool Creation ###########################################");

		System.out.println(".......... POOL_NAME = " + poolName);
		System.out.println(".......... MAX_POOL = " + maxPool);
		System.out.println(".......... MAX_CONNECTION = " + maxConnection);
		System.out.println(".......... CONNECTION_TIME = " + maxTime);
		System.out.println(".......... URL = " + dbUrl);
		System.out.println(".......... ID = " + userId);
		System.out.println(".......... PASS = " + userPass);

		pool = null;
		System.gc();
		pool = new ConnectionPool(poolName, maxPool, maxConnection, maxTime, dbUrl, userId, userPass);

		System.out.println("###############################################################################\n");
	}

	/**
	 * 내용		: Singleton으로 생성된 DBManager 객체를 return한다.
	 * 입력 값	:
	 * 출력 값	: DBManager dbmw
	 */
	public static DBManager getDBManager()
	{
		return dbm;
	}

	/**
	 * 내용		: DBConnectionPool객체를 return한다..
	 * 입력 값	:
	 * 출력 값	: ConnectionPool pool
	 */
	public static ConnectionPool getConnectionPool()
	{
		return pool;
	}

	/**
	 * 내용		: ConnectionPool에서 Connection객체를 하나 return한다.
	 * 입력 값	:
	 * 출력 값	: Connection confListKeyList
	 */
	public static Connection getConnection() throws SQLException
	{
		return pool.getConnection();
	}
}