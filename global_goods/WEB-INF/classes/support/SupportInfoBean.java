package support;

import common.db.*;
import common.main.*;

import java.util.*;

public class SupportInfoBean extends MainBean
{
	public void funcExecute() throws Exception
	{
		String code = (String)inputTable.get("code");

		String section = (String)inputTable.get("section");
		String word = (String)inputTable.get("word");
		
		String perPageStr = (String)inputTable.get("perPage");

		SupportInfomation si = new SupportInfomation(code, perPageStr);

		String replySort = si.getReplySort();
		String numberType = si.getNumberType();

		int pageNum = Integer.parseInt((String)inputTable.get("pageNum"));				//����ڰ� ������ ������ ��ȣ
		int pageTotalNum = 0;				// ��ü ������ ��ȣ
		int pageStartNum = 0;				// ���������� ��ȣ
		int pageEndNum = 0;				// �������� ��ȣ

		int articleTotalNum = 0;				// ��ü �� ��
		int perPage = si.getPerPage();				// �������� �� ��µǴ� �� ��.
		int articleStartNum = 0;				// ���� �� ��ȣ
		int articleEndNum = 0;				// �� �� ��ȣ

		queryBuffer = new StringBuffer("");
		queryBuffer.append("SELECT COUNT(SEQ) CONT_CNT FROM BBS ");
		queryBuffer.append("WHERE CODE='"+code+"'");
		if(!si.getReplyYn())
		{
			queryBuffer.append(" AND STEP='000' ");
		}

		if(si.getSearchYn() && word.length() > 0)
		{
			if(section.equals("TC"))
			{
				queryBuffer.append(" AND (TITLE LIKE '%" + word + "%' OR CONTENT LIKE '%" + word + "%')");
			}
			else if(section.equals("TT"))
			{
				queryBuffer.append(" AND TITLE LIKE '%" + word + "%'");
			}
			else if(section.equals("CT"))
			{
				queryBuffer.append(" AND CONTENT LIKE '%" + word + "%'");
			}
			else if(section.equals("WT"))
			{
				queryBuffer.append("AND REG_ID = '" + word + "' ");
			}
			else if(section.equals("WN"))
			{
				queryBuffer.append(" AND (SELECT DISTINCT a.NAME FROM MEMBER a, BBS b WHERE b.REG_ID = a.ID) LIKE '%" + word + "%' ");
			}
		}

		DBExecute dbe = new DBExecute(queryBuffer.toString());
		ArrayList bbsInfoList = dbe.getDataList();

		Hashtable tempBbsInfoTable = (Hashtable)bbsInfoList.get(0);
		articleTotalNum = Integer.parseInt((String)tempBbsInfoTable.get("CONT_CNT"));

		if(articleTotalNum > 0)
		{
			//��ü ������ ��ȣ
			pageTotalNum = articleTotalNum/perPage;
			if(articleTotalNum%perPage > 0)
			{
				pageTotalNum = pageTotalNum + 1;
			}

			if(pageTotalNum<pageNum)
			{
				pageNum = pageTotalNum;
			}

			// ���������� ��ȣ
			pageStartNum = makePageStartNum(numberType, pageNum, pageTotalNum);

			// �������� ��ȣ
			pageEndNum = makePageEndNum(numberType, pageNum, pageStartNum, pageTotalNum);

			// ���� �� ��ȣ
			articleStartNum = (pageNum*perPage) - (perPage-1);

			// �� �� ��ȣ
			articleEndNum = articleStartNum+(perPage-1);
			if(articleEndNum>articleTotalNum)
			{
				articleEndNum = articleTotalNum;
			}
		}

		Hashtable bbsInfoTable = new Hashtable();
		bbsInfoTable.put("section", section);
		bbsInfoTable.put("word", word);
		bbsInfoTable.put("code", code);
		bbsInfoTable.put("pageNum", new Integer(pageNum));
		bbsInfoTable.put("pageTotalNum", new Integer(pageTotalNum));
		bbsInfoTable.put("pageStartNum", new Integer(pageStartNum));
		bbsInfoTable.put("pageEndNum", new Integer(pageEndNum));
		bbsInfoTable.put("articleTotalNum", new Integer(articleTotalNum));
		bbsInfoTable.put("articleStartNum", new Integer(articleStartNum));
		bbsInfoTable.put("articleEndNum", new Integer(articleEndNum));

		outputList.add(bbsInfoTable);
	}

	private int makePageStartNum(String numberType, int pageNum, int pageTotalNum)
	{
		int pageStartNum = 0;
		if(numberType.equals("T"))
		{
			pageStartNum = ((pageNum/10)*10) +1;
			if(pageNum%10 == 0)
			{
				pageStartNum = pageStartNum - 10;
			}
		}
		else if(numberType.equals("C"))
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

	private int makePageEndNum(String numberType, int pageNum, int pageStartNum, int pageTotalNum)
	{
		int pageEndNum = 0;
		if(numberType.equals("T"))
		{
			pageEndNum = pageStartNum + 9;
		}
		else if(numberType.equals("C"))
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