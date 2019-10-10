package member;

import java.sql.*;
import java.io.*;
import java.util.*;

import common.db.*;
import common.main.*;

public class InterestListBean extends MainBean
{
	public void funcExecute() throws Exception
	{
		queryBuffer = new StringBuffer("");
		queryBuffer.append("SELECT CODE, NAME FROM INTEREST WHERE USEYN = 'Y' ORDER BY CODE");

		DBExecute dbe = new DBExecute(queryBuffer.toString());
		outputList = dbe.getDataList();
	}
}