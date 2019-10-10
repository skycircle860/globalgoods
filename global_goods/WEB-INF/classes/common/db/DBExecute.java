/*****************************************************************************
 * 파일이름 : DBExecute.java
 * 파일내용 : query문장을 받아서 DB를 실행 시킨다.
*****************************************************************************/
package common.db;

import java.sql.*;
import java.util.*;

public class DBExecute
{
	private String sql;

	private Connection conn;
	private Statement stmt;
	private ResultSet rs;
	private ResultSetMetaData rsmd;
	
	private int numberOfColumns;
	private ArrayList colNameList = new ArrayList();
	
	private String sqlType;
	private int updateCount = 0;

	private ArrayList dataList = new ArrayList();
	private boolean updateYn;
	
	/**
	 * 내용		: SQL문을 받아서 Connection Pool로 부터 Connection을 가져다가 수행한다.
	 * 입력 값	: String sql
	 * 출력 값	:
	 */
	public DBExecute(String sql) throws Exception
	{
		System.out.println("\n== DBExecute(String sql) ======================================================");

		this.sql = sql.trim();
		conn = DBManager.getConnection();

		if(((sql.trim()).toUpperCase()).startsWith("SELECT"))
		{
			sqlType = "S";
		}
		else
		{
			sqlType = "U";
		}

		runningSQL();
		System.out.println("= DB 실행 결과 : "+dataList.size()+" 개 "+(sql.substring(0, sql.indexOf(" "))).toUpperCase());
		System.out.println("===============================================================================\n");
	}
	/**
	 * 내용		: SQL문을 수행하여 Data를 받아 온다.
	 * 입력 값	:
	 * 출력 값	:
	 */
	private void runningSQL()
	{
		try
		{
			stmt = conn.createStatement();

			System.out.println(sql);
			if(sqlType.equals("S"))
			{
				rs = stmt.executeQuery(sql);

				rsmd = rs.getMetaData();
				numberOfColumns = rsmd.getColumnCount();

				for(int i=1; i<=numberOfColumns; i++)
				{
					colNameList.add(rsmd.getColumnName(i));
				}
			}
			else
			{
				updateCount = stmt.executeUpdate(sql);
			}
			resultSetting();
		}
		catch(SQLException sqle)
		{
			System.out.println("DB 실행 Exception( runningSQL() ) : "+sqle);
		}
		finally
		{
			try{stmt.close();}catch(Exception e){System.out.println("= DB stmt.close() Exception( runningSQL() ) : "+e);}
			System.out.println("= Stmt close : "+stmt);
			try{conn.close();}catch(Exception e){System.out.println("= DB conn.close() Exception( runningSQL() ) : " + e);}
			System.out.println("= Connection close : "+conn);
		}
	}

	/**
	 * 내용		: 저장되어 있는 Data를 가져 가기 알맞도록 setting한다.
	 * 입력 값	:
	 * 출력 값	:
	 */
	private void resultSetting() throws SQLException
	{
		Hashtable dataTable;
		if(sqlType.equals("S"))
		{
			while(rs.next())
			{
				dataTable = new Hashtable();
				for(int i=0; i<numberOfColumns; i++)
				{
					String colName = (String)colNameList.get(i);
					String colData = rs.getString(colName);
					if(colData == null)
					{
						colData = "";
					}
					dataTable.put(colName, colData);
				}
				dataList.add(dataTable);
			}
			rs.close();
		}
		else if(sqlType.equals("U"))
		{
			dataTable = new Hashtable();
			dataTable.put("COUNT", ""+ updateCount);
			dataList.add(dataTable);
		}
	}

	/**
	 * 내용		: update 결과를 Boolean Return (단, UPDATE, DELETE, INSERT 명령에서만 Setting)
	 * 입력 값	:
	 * 출력 값	: boolean updateYn
	 */
	public boolean getUpdateResult()
	{
		if(updateCount>0)
		{
			updateYn = true;
		}

		return updateYn;
	}

	/**
	 * 내용		: Data를 ArrayList Type으로 return(단, SELECT 명령에서만 Setting)
	 * 입력 값	:
	 * 출력 값	: ArrayList dataList
	 */
	public ArrayList getDataList()
	{
		return dataList;
	}
}