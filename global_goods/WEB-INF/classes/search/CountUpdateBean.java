package search;

import java.util.*;
import common.main.*;
import common.db.*;

public class CountUpdateBean extends MainBean
{
	public void funcExecute() throws Exception
	{
		String word = (String)inputTable.get("word");

		queryBuffer = new StringBuffer("");
		queryBuffer.append("SELECT COUNT(SEQ) COUNT FROM SEARCH_WORDS WHERE WORD = '" + word + "'");

		DBExecute dbe1 = new DBExecute(queryBuffer.toString());
		ArrayList wordCount = dbe1.getDataList();
		long count = Long.parseLong((String)((Hashtable)wordCount.get(0)).get("COUNT"));

		queryBuffer = new StringBuffer("");
		if(count>0)
		{
			queryBuffer.append("UPDATE SEARCH_WORDS SET COUNT = COUNT+1 WHERE WORD = '" + word + "'");
		}
		else
		{
			queryBuffer.append("INSERT INTO SEARCH_WORDS (SEQ, WORD, COUNT) ");
			queryBuffer.append("VALUES (SEARCH_WORDS_SEQ.NEXTVAL, '" + word + "', 1)");
		}

		DBExecute dbe2 = new DBExecute(queryBuffer.toString());
	}
}