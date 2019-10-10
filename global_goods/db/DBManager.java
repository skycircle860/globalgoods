/*****************************************************************************
 * �����̸� : DBManager.java
 * ���ϳ��� : DB���� Connection Pool�� �����Ѵ�.(Singleton Design Pattern)
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
	 * ����		: private Constructor
	 * �Է� ��	:
	 * ��� ��	:
	 */
	private DBManager()
	{}

	/**
	 * ����		: DB���ӿ� �ʿ��� ���׵��� �޾Ƽ� ���ο� ConnectionPool�� �����Ѵ�.
	 * �Է� ��	: String poolName, String maxPool, String maxConnection, String maxTime, String dbUrl, String userId, String userPass
	 * ��� ��	:
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
	 * ����		: Singleton���� ������ DBManager ��ü�� return�Ѵ�.
	 * �Է� ��	:
	 * ��� ��	: DBManager dbmw
	 */
	public static DBManager getDBManager()
	{
		return dbm;
	}

	/**
	 * ����		: DBConnectionPool��ü�� return�Ѵ�..
	 * �Է� ��	:
	 * ��� ��	: ConnectionPool pool
	 */
	public static ConnectionPool getConnectionPool()
	{
		return pool;
	}

	/**
	 * ����		: ConnectionPool���� Connection��ü�� �ϳ� return�Ѵ�.
	 * �Է� ��	:
	 * ��� ��	: Connection confListKeyList
	 */
	public static Connection getConnection() throws SQLException
	{
		return pool.getConnection();
	}
}