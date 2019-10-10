package bbs;

import common.db.*;
import common.main.*;

public class BbsUpdateBean extends MainBean
{
	public void funcExecute() throws Exception
	{
		String code = (String)inputTable.get("code");
		BbsInfomation bi = new BbsInfomation(code);

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
		queryBuffer.append("WHERE SEQ='"+seq+"'");

		DBExecute dbe = new DBExecute(queryBuffer.toString());
		outputList = dbe.getDataList();

		if(bi.getFileYn())
		{
			//업로드 파일 삭제
			BbsFileManager bfm = new BbsFileManager();
			int deleteCount = bfm.deleteFile(inputTable);
			inputTable.put("deleteFile", deleteCount+""); //지울 파일의 배열 길이가 들어감

			//업로드 파일
			int uploadCount = bfm.uploadFile(inputTable);
			inputTable.put("uploadFile", uploadCount+"");
		}
		else
		{
			inputTable.put("deleteFile", "0");
			inputTable.put("uploadFile", "0");
		}
	}
}