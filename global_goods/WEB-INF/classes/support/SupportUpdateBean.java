package support;

import common.db.*;
import common.main.*;

public class SupportUpdateBean extends MainBean
{
	public void funcExecute() throws Exception
	{
		String code = (String)inputTable.get("code");
		SupportInfomation si = new SupportInfomation(code);

		
		String id = (String)inputTable.get("id");
		String seq = (String)inputTable.get("seq");
		String title = (String)inputTable.get("title");
		String content = (String)inputTable.get("content");
		String client = (String)inputTable.get("client");

		if(title.indexOf("'") != -1)
		{
			title = title.replaceAll("'", "''");
		}

		if(content.indexOf("'") != -1)
		{
			content = content.replaceAll("'", "''");
		}

		queryBuffer = new StringBuffer("");
		queryBuffer.append("UPDATE BBS SET ");
		queryBuffer.append("TITLE='"+title+"', CONTENT='"+content+"', UPD_ID='"+id+"', UPD_DATE=SYSDATE, UPD_IP='"+client+"' ");
		queryBuffer.append("WHERE SEQ='"+seq+"' AND CODE='"+code+"'");

		DBExecute dbe = new DBExecute(queryBuffer.toString());
		outputList = dbe.getDataList();

		if(si.getFileYn())
		{
			//���ε� ���� ����
			SupportFileManager sfm = new SupportFileManager();
			int deleteCount = sfm.deleteFile(inputTable);
			inputTable.put("deleteFile", deleteCount+""); //���� ������ �迭 ���̰� ��

			//���ε� ����
			int uploadCount = sfm.uploadFile(inputTable);
			inputTable.put("uploadFile", uploadCount+"");
		}
		else
		{
			inputTable.put("deleteFile", "0");
			inputTable.put("uploadFile", "0");
		}
	}
}