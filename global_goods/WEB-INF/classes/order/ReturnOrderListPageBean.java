package order;

import common.db.*;
import common.main.*;

import java.util.*;

public class ReturnOrderListPageBean extends MainBean
{
	public void funcExecute() throws Exception
	{
		
		String pageType = (String)inputTable.get("pageType");

		int pageNum = Integer.parseInt((String)inputTable.get("pageNum"));				//사용자가 선택한 페이지 번호
		int pageTotalNum = 0;				// 전체 페이지 번호
		int pageStartNum = 0;				// 시작페이지 번호
		int pageEndNum = 0;				// 끝페이지 번호

		int articleTotalNum = 0;				// 전체 글 수
		int articlePerPage = Integer.parseInt((String)inputTable.get("articlePerPage"));				// 한페이지 당 출력되는 글 수.
		int articleStartNum = 0;				// 시작 글 번호
		int articleEndNum = 0;				// 끝 글 번호

		queryBuffer = new StringBuffer("");
		queryBuffer.append("SELECT COUNT(CODE) RETURN_CNT FROM RETURN_LIST ");
	

		DBExecute dbe = new DBExecute(queryBuffer.toString());
		ArrayList bbsInfoList = dbe.getDataList();

		Hashtable tempBbsInfoTable = (Hashtable)bbsInfoList.get(0);
		articleTotalNum = Integer.parseInt((String)tempBbsInfoTable.get("RETURN_CNT"));

		if(articleTotalNum > 0)
		{
			//전체 페이지 번호
			pageTotalNum = articleTotalNum/articlePerPage;
			if(articleTotalNum%articlePerPage > 0)
			{
				pageTotalNum = pageTotalNum + 1;
			}

			if(pageTotalNum<pageNum)
			{
				pageNum = pageTotalNum;
			}

			// 시작페이지 번호
			pageStartNum = makePageStartNum(pageType, pageNum, pageTotalNum);

			// 끝페이지 번호
			pageEndNum = makePageEndNum(pageType, pageNum, pageStartNum, pageTotalNum);

			// 시작 글 번호
			articleStartNum = (pageNum*articlePerPage) - (articlePerPage-1);

			// 끝 글 번호
			articleEndNum = articleStartNum+(articlePerPage-1);
			if(articleEndNum>articleTotalNum)
			{
				articleEndNum = articleTotalNum;
			}
		}

		Hashtable bbsInfoTable = new Hashtable();

		bbsInfoTable.put("pageType", pageType);
		bbsInfoTable.put("pageNum", new Integer(pageNum));
		bbsInfoTable.put("pageTotalNum", new Integer(pageTotalNum));
		bbsInfoTable.put("pageStartNum", new Integer(pageStartNum));
		bbsInfoTable.put("pageEndNum", new Integer(pageEndNum));
		bbsInfoTable.put("articleTotalNum", new Integer(articleTotalNum));
		bbsInfoTable.put("articleStartNum", new Integer(articleStartNum));
		bbsInfoTable.put("articleEndNum", new Integer(articleEndNum));
		bbsInfoTable.put("articlePerPage", new Integer(articlePerPage));

		outputList.add(bbsInfoTable);
	}

	private int makePageStartNum(String pageType, int pageNum, int pageTotalNum)
	{
		int pageStartNum = 0;
		if(pageType.equals("T"))
		{
			pageStartNum = ((pageNum/10)*10) +1;
			if(pageNum%10 == 0)
			{
				pageStartNum = pageStartNum - 10;
			}
		}
		else if(pageType.equals("C"))
		{
			pageStartNum = pageNum - 5;

			if((pageTotalNum-pageNum) < 5)
			{
				pageStartNum = pageStartNum - (5-(pageTotalNum-pageNum));
			}

			if(pageStartNum<=0)
			{
				pageStartNum = 1;
			}
		}

		return pageStartNum;
	}

	private int makePageEndNum(String pageType, int pageNum, int pageStartNum, int pageTotalNum)
	{
		int pageEndNum = 0;
		if(pageType.equals("T"))
		{
			pageEndNum = pageStartNum + 9;
		}
		else if(pageType.equals("C"))
		{
			pageEndNum = pageStartNum + 10;
			if(pageNum<6)
			{
				pageEndNum = 10;
			}
		}

		if(pageEndNum>pageTotalNum)
		{
			pageEndNum = pageTotalNum;
		}

		return pageEndNum;
	}
}