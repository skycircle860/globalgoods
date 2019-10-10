package bbs;

import common.db.*;
import common.main.*;

import java.util.*;

public class BbsWriteBean extends MainBean
{
	public void funcExecute() throws Exception
	{
		String code = (String)inputTable.get("code");
		BbsInfomation bi = new BbsInfomation(code);

		String id = (String)inputTable.get("id");
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

		String seq = getNextSeq();
		inputTable.put("seq", seq);

		queryBuffer = new StringBuffer("");
		queryBuffer.append("INSERT INTO BBS (");
		queryBuffer.append("SEQ, CODE, GROUP_NUM, TITLE, CONTENT, REG_ID, REG_IP, UPD_ID, UPD_IP");
		queryBuffer.append(") VALUES (");
		queryBuffer.append(seq + ", '"+code+"', "+seq+", '"+title+"', '"+content+"', '"+id+"', '"+client+"', '"+id+"', '"+client+"'");
		queryBuffer.append(")");

		DBExecute dbe = new DBExecute(queryBuffer.toString());
		outputList = dbe.getDataList();

		if(bi.getFileYn())
		{
			//���ε� ����
			BbsFileManager bfm = new BbsFileManager();
			int uploadCount = bfm.uploadFile(inputTable);

			inputTable.put("uploadFile", uploadCount+"");	//���⼭ ���� ��ü�� �Ͼ�� ����̴�. �̰� bbs�������� ���̺��� �������� ����Ű�� �ֱ⿡ ���⼭ ��ü���൵ ����Ǵ°� ����.
		}
		else
		{
			inputTable.put("uploadFile", "0");	//���ε� �� ������ ���� ��� 0 ���� ġȯ
		}
	}

	private String getNextSeq() throws Exception //�������� ���� ���ε忡�� ���� �ۿ����� ���⶧���� �̸� ���;���.
	{
		queryBuffer = new StringBuffer("");
		queryBuffer.append("SELECT BBS_SEQ.NEXTVAL NEXT_SEQ FROM DUAL");

		DBExecute dbe = new DBExecute(queryBuffer.toString());
		ArrayList seqList =dbe.getDataList();
		Hashtable seqTable = (Hashtable)seqList.get(0);
		return (String)seqTable.get("NEXT_SEQ");	//�̸� ������Ų ���������� ����
	}
}