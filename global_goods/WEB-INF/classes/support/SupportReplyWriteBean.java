package support;

import java.util.*;
import common.db.*;
import common.main.*;

public class SupportReplyWriteBean extends MainBean
{
	public void funcExecute() throws Exception
	{
		String code = (String)inputTable.get("code");
		SupportInfomation si = new SupportInfomation(code);

		String title = (String)inputTable.get("title");
		String content = (String)inputTable.get("content");
		title = title.replaceAll("'", "''");
		content = content.replaceAll("'", "''");

		String parentSeq = (String)inputTable.get("seq");
		String parentStep = (String)inputTable.get("step");
		String id = (String)inputTable.get("id");
		String client = (String)inputTable.get("client");

		int groupNum = Integer.parseInt((String)inputTable.get("groupNum"));


		int width = Integer.parseInt((String)inputTable.get("width"))+1;
		//depth의 경우에는 사용자가 댓글을 작성하는 중에 다른 댓글이 등록되면 문제가 발행할 수 있으므로 query에서 해결한다.
		updateDepth(groupNum, parentSeq);
		String step = makeStep(parentStep, groupNum, width);



		String seq = getNextSeq();
		inputTable.put("seq", seq);

		queryBuffer = new StringBuffer("");
		queryBuffer.append("INSERT INTO BBS (SEQ, CODE, GROUP_NUM, WIDTH, DEPTH, ");
		queryBuffer.append("STEP, TITLE, CONTENT, REG_ID, REG_IP, UPD_ID, UPD_IP) ");
		queryBuffer.append("VALUES ("+seq+", '"+code+"', "+groupNum+", "+width);
		queryBuffer.append(", (SELECT DEPTH+1 FROM BBS WHERE SEQ="+parentSeq+"), ");
		queryBuffer.append("'"+step+"', '"+title+"', '"+content+"', '"+id+"', '"+client+"', '"+id+"', '"+client+"')");

		DBExecute dbe = new DBExecute(queryBuffer.toString());
		outputList =dbe.getDataList();

		if(si.getFileYn())
		{
			//업로드 파일
			SupportFileManager sfm = new SupportFileManager();
			int uploadCount = sfm.uploadFile(inputTable);

			inputTable.put("uploadFile", uploadCount+"");	//여기서 값의 교체가 일어나는 모양이다. 이게 bbs서블릿의 테이블과 같은곳을 가리키고 있기에 여기서 교체해줘도 적용되는것 같다.
		}
		else
		{
			inputTable.put("uploadFile", "0");	//업로드 된 파일이 없을 경우 0 으로 치환
		}
	}

	private String makeStep(String parentStep, int groupNum, int width) throws Exception
	{
		String step = "";
		int stepLength = 3 * width + (width-1);

		queryBuffer = new StringBuffer("");
		queryBuffer.append("SELECT MAX(STEP) MAX_STEP FROM BBS WHERE GROUP_NUM="+groupNum);
		queryBuffer.append(" AND LENGTH(STEP)="+stepLength);
		if(!parentStep.equals("000"))
		{
			queryBuffer.append(" AND STEP LIKE '"+parentStep+"%'");
		}

		DBExecute dbe = new DBExecute(queryBuffer.toString());
		ArrayList stepList = dbe.getDataList();

		Hashtable stepTable = (Hashtable)stepList.get(0);
		String maxStep = (String)stepTable.get("MAX_STEP");

		if(maxStep.length()>0)
		{
			if(maxStep.indexOf("^")==-1)
			{
				step = makeStepLocation(Integer.parseInt(maxStep)+1+"");
			}
			else
			{
				String beforeStep = maxStep.substring(0, maxStep.lastIndexOf("^")+1);
				String lastStep = maxStep.substring(maxStep.lastIndexOf("^")+1);
				step = beforeStep + makeStepLocation(Integer.parseInt(lastStep)+1+"");
			}
		}
		else
		{
			if(parentStep.equals("000"))
			{
				step = "001";
			}
			else
			{
				step = parentStep + "^001";
			}
		}

		return step;
	}

	private String makeStepLocation(String step)
	{
		while(step.length()<3)
		{
			step = "0"+step;
		}

		return step;
	}
	private boolean updateDepth(int groupNum, String parentSeq) throws Exception
	{
		queryBuffer = new StringBuffer("");
		queryBuffer.append("UPDATE BBS SET DEPTH = DEPTH+1 WHERE GROUP_NUM="+groupNum);
		queryBuffer.append(" AND DEPTH>(SELECT DEPTH FROM BBS WHERE SEQ="+parentSeq+")");

		DBExecute dbe = new DBExecute(queryBuffer.toString());
		boolean updateResult = dbe.getUpdateResult();
		return updateResult;
	}

	private String getNextSeq() throws Exception
	{
		queryBuffer = new StringBuffer("");
		queryBuffer.append("SELECT BBS_SEQ.NEXTVAL NEXT_SEQ FROM DUAL");

		DBExecute dbe = new DBExecute(queryBuffer.toString());
		ArrayList seqList =dbe.getDataList();
		Hashtable seqTable = (Hashtable)seqList.get(0);
		return (String)seqTable.get("NEXT_SEQ");
	}
}