/*****************************************************************************
 * �����̸� : DBExecute.java
 * ���ϳ��� : query������ �޾Ƽ� DB�� ���� ��Ų��.
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
	 * ����		: SQL���� �޾Ƽ� Connection Pool�� ���� Connection�� �����ٰ� �����Ѵ�.
	 * �Է� ��	: String sql
	 * ��� ��	:
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
		System.out.println("= DB ���� ��� : "+dataList.size()+" �� "+(sql.substring(0, sql.indexOf(" "))).toUpperCase());
		System.out.println("===============================================================================\n");
	}
	/**
	 * ����		: SQL���� �����Ͽ� Data�� �޾� �´�.
	 * �Է� ��	:
	 * ��� ��	:
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
			System.out.println("DB ���� Exception( runningSQL() ) : "+sqle);
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
	 * ����		: ����Ǿ� �ִ� Data�� ���� ���� �˸µ��� setting�Ѵ�.
	 * �Է� ��	:
	 * ��� ��	:
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
	 * ����		: update ����� Boolean Return (��, UPDATE, DELETE, INSERT ��ɿ����� Setting)
	 * �Է� ��	:
	 * ��� ��	: boolean updateYn
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
	 * ����		: Data�� ArrayList Type���� return(��, SELECT ��ɿ����� Setting)
	 * �Է� ��	:
	 * ��� ��	: ArrayList dataList
	 */
	public ArrayList getDataList()
	{
		return dataList;
	}
}