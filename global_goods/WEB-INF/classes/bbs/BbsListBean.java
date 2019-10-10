package bbs;

import common.db.*;
import common.main.*;
import java.util.*;

public class BbsListBean extends MainBean
{
	public void funcExecute() throws Exception
	{
		String code = (String)inputTable.get("code");
		String section = (String)inputTable.get("section");
		String word = (String)inputTable.get("word");
		Integer articleStartNum = (Integer)inputTable.get("articleStartNum");
		Integer articleEndNum = (Integer)inputTable.get("articleEndNum");

		BbsInfomation bi = new BbsInfomation(code);

		queryBuffer = new StringBuffer("");
		if(bi.getFileYn())
		{
			queryBuffer.append("SELECT g.*, h.* FROM (SELECT BBS_SEQ, ORG_NAME, SAVE_NAME, ");
			queryBuffer.append("PATH FROM BBS_FILE WHERE DISP_YN='Y') h, (");
		}
		queryBuffer.append("SELECT f.* FROM (SELECT ROWNUM DATA_NUM, e.* FROM (SELECT ROWNUM DISP_NUM, ");
		queryBuffer.append("d.* FROM (SELECT a.GROUP_NUM, a.STEP, a.DEPTH, a.WIDTH, a.SEQ, ");
		queryBuffer.append("a.TITLE, a.HIT_CNT, a.REG_ID, b.NAME, ");
		queryBuffer.append("TO_CHAR(a.REG_DATE, 'YYYY-MM-DD') REG_DATE ");
		if(bi.getAddYn())
		{
			queryBuffer.append(", COUNT(c.SEQ) ADD_CNT ");
		}
		queryBuffer.append("FROM BBS a, MEMBER b ");
		if(bi.getAddYn())
		{
			queryBuffer.append(", (SELECT SEQ, BBS_SEQ FROM BBS_ADD WHERE DISP_YN='Y') c ");
		}
		queryBuffer.append("WHERE a.REG_ID=b.ID AND a.DISP_YN='Y' AND a.CODE='"+code+"' ");
		if(!bi.getReplyYn())
		{
			queryBuffer.append("AND a.STEP='000' ");
		}
		if(bi.getAddYn())
		{
			queryBuffer.append("AND a.SEQ=c.BBS_SEQ(+) ");
		}
		if(word.length() > 0)
		{
			if(section.equals("TC"))
			{
				queryBuffer.append("AND (a.TITLE LIKE '%" + word + "%' OR a.CONTENT LIKE '%" + word + "%') ");
			}
			else if(section.equals("TT"))
			{
				queryBuffer.append("AND a.TITLE LIKE '%" + word + "%' ");
			}
			else if(section.equals("CT"))
			{
				queryBuffer.append("AND a.CONTENT LIKE '%" + word + "%' ");
			}
			else if(section.equals("WT"))
			{
				queryBuffer.append("AND a.REG_ID = '" + word + "' ");
			}
		}
		queryBuffer.append("GROUP BY a.GROUP_NUM, a.STEP, a.DEPTH, a.WIDTH, a.SEQ, a.TITLE, ");
		queryBuffer.append("a.HIT_CNT, a.REG_ID, b.NAME, a.REG_DATE ORDER BY GROUP_NUM ASC ");
		if(bi.getReplyYn())
		{
			queryBuffer.append(", "+bi.getReplySort()+" DESC ");
		}
		queryBuffer.append(") d ORDER BY DISP_NUM DESC ) e ) f ");
		queryBuffer.append("WHERE DATA_NUM>="+articleStartNum+" AND DATA_NUM<="+articleEndNum);
		if(bi.getFileYn())
		{
			queryBuffer.append(") g WHERE g.SEQ=h.BBS_SEQ(+) ORDER BY g.DATA_NUM");
		}

		DBExecute dbe = new DBExecute(queryBuffer.toString());
		if(bi.getFileYn())
		{
			ArrayList tempList = dbe.getDataList();

			String dataNum = "";
			ArrayList fileList = new ArrayList();
			Hashtable bbsTable;
			for(int i=0; i<tempList.size(); i++)
			{
				Hashtable tempTable = (Hashtable)tempList.get(i);
				String tempDataNum = (String)tempTable.get("DATA_NUM");
				String tempOrgName = (String)tempTable.get("ORG_NAME");
				String tempSaveName = (String)tempTable.get("SAVE_NAME");
				String tempPath = (String)tempTable.get("PATH");

				if(!dataNum.equals(tempDataNum))
				{
					tempTable.remove("ORG_NAME");
					tempTable.remove("SAVE_NAME");
					tempTable.remove("PATH");

					bbsTable = tempTable;

					fileList = new ArrayList();
					dataNum = tempDataNum;

					bbsTable.put("FILE_LIST", fileList);
					outputList.add(bbsTable);
				}

				Hashtable fileTable = new Hashtable();
				fileTable.put("ORG_NAME", tempOrgName);
				fileTable.put("SAVE_NAME", tempSaveName);
				fileTable.put("PATH", tempPath);

				fileList.add(fileTable);
			}
		}
		else
		{
			outputList = dbe.getDataList();
		}
	}
}