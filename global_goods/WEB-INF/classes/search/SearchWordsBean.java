package search;

import java.util.*;
import common.main.*;
import common.db.*;

public class SearchWordsBean extends MainBean
{
	public void funcExecute() throws Exception
	{
		String sw = (String)inputTable.get("sw");

		queryBuffer = new StringBuffer("");
		queryBuffer.append("SELECT WORD, COUNT FROM SEARCH_WORDS WHERE WORD LIKE '%" + sw + "%'");

		DBExecute dbe = new DBExecute(queryBuffer.toString());
		outputList = dbe.getDataList();
	}
}