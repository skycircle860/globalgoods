package member;

import java.sql.*;
import java.io.*;
import java.util.*;

import common.db.*;
import common.main.*;

public class LoginBean extends MainBean
{
	public void funcExecute() throws Exception
	{
		String id = (String)inputTable.get("id");
		String pass = (String)inputTable.get("pass");

		queryBuffer = new StringBuffer("");
		queryBuffer.append("SELECT PASS, NAME, ADMINYN FROM MEMBER WHERE ID='" + id + "' AND USEYN='Y'");

		DBExecute dbe = new DBExecute(queryBuffer.toString());
		ArrayList userList = dbe.getDataList();

		Hashtable userTable = new Hashtable();
		if(userList.size() > 0)
		{
			userTable = (Hashtable)userList.get(0);
			String userPass = (String)userTable.get("PASS");

			if(pass.equals(userPass))
			{
				userTable.put("check", "0");
			}
			else
			{
				userTable.put("check", "-1");
			}
		}
		else
		{
			userTable.put("check", "-2");
		}

		outputList.add(userTable);
	}
}