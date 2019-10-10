package support;

import java.io.*;
import java.util.*;
import common.db.*;

public class SupportFileManager
{
	public ArrayList getSupportFileList(Hashtable supportTable) throws Exception
	{
		String seq = (String)supportTable.get("SEQ"); //공유하는 시퀀스 값을 꺼내서

		StringBuffer queryBuffer = new StringBuffer("");
		queryBuffer.append("SELECT SEQ, ORG_NAME, SAVE_NAME, PATH, FILE_SIZE ");
		queryBuffer.append("FROM BBS_FILE WHERE BBS_SEQ="+seq+" AND DISP_YN='Y'");
		DBExecute dbe = new DBExecute(queryBuffer.toString());

		return dbe.getDataList(); //뽑아낸 파일 정보가 담긴 어레이 리스트를 넘김 이것의 숫자땜에 중복이 일어남.
	}

	public int deleteFile(Hashtable inputTable) throws Exception
	{
		String id = (String)inputTable.get("id");
		String client = (String)inputTable.get("client");
		String[] deleteFileArray = (String[])inputTable.get("deleteFile");	//델리트 체크박스의 리턴값이 저장된 스트링배열
		if(deleteFileArray.length==0)	//지울 파일이 없을 경우 0 리턴
		{
			return 0;
		}

		StringBuffer queryBuffer = new StringBuffer("");
		queryBuffer.append("UPDATE BBS_FILE SET DISP_YN='N', UPD_ID='"+id+"', UPD_DATE=SYSDATE, UPD_IP='"+client+"' WHERE ");

		//파일 저장 및 DB 등록
		for(int i=0; i<deleteFileArray.length; i++)
		{
			if(i!=0)
			{
				queryBuffer.append(" OR ");
			}
			String fileSeq = deleteFileArray[i];
			queryBuffer.append("SEQ="+fileSeq);
		}	//시퀀스 값이 "" 이거나 ""이거나 "" 일때 다지워라!!! OR

		DBExecute dbe = new DBExecute(queryBuffer.toString());
		dbe.getDataList();	//흠... OR 문을 사용했기 떄문에 카운터를 ++ 할 수 없다.,.. 리턴된 카운트 값이 1 일테니..

		return deleteFileArray.length;//그대로 배열 사이즈 리턴.. 
	}

	public int uploadFile(Hashtable inputTable) throws Exception
	{
		int uploadCount = 0;
		String seq = (String)inputTable.get("seq");
		String id = (String)inputTable.get("id");
		String client = (String)inputTable.get("client");
		ArrayList uploadFileList = (ArrayList)inputTable.get("uploadFile"); //업로드할 파일 정보가 들은 어레이 리스트

		for(int i=0; i<uploadFileList.size(); i++) //파일 숫자 만큼 포문을 돌며 없로드 쿼리를 날려줌
		{
			Hashtable uploadFileTable = (Hashtable)uploadFileList.get(i);
			String savePath = (String)uploadFileTable.get("savePath"); //저장 경로
			savePath = savePath.replace('\\', '/');

			String orgFileName = (String)uploadFileTable.get("orgFileName");	//원래 이름
			String saveFileName = (String)uploadFileTable.get("saveFileName");	//저장될 이름(중복시 변경된 이름)

			orgFileName = orgFileName.replaceAll("'", "''");	//파일 원래 이름의 ' 를 변경
			saveFileName = saveFileName.replaceAll("'", "''");	//바뀐 파일 이름의 ' 를 변경

			File file = new File(savePath, saveFileName);	//경로와 바뀐 파일 이름을 이용해 파일객체 생성
			long fileSize = file.length();	//파일 객체를 통해 파일의 크기를 알아옴.

			//DB에 등록
			StringBuffer queryBuffer = new StringBuffer("");
			queryBuffer.append("INSERT INTO BBS_FILE (SEQ, BBS_SEQ, PATH, ORG_NAME, SAVE_NAME, FILE_SIZE, REG_ID, REG_IP, UPD_ID, UPD_IP) ");
			queryBuffer.append("VALUES (BBS_FILE_SEQ.NEXTVAL, "+seq+", '"+savePath+"', '"+orgFileName+"', '"+saveFileName+"', "+fileSize+", '"+id+"', '"+client+"', '"+id+"', '"+client+"')");
		//시퀀스값(글과 공유), 저장 경로 , 원래 이름 , 변경이름, 파일 크기, 파일 업로더 아이디, 글쓴이 ip주소 업로드
			DBExecute dbe = new DBExecute(queryBuffer.toString());
			if(Integer.parseInt((String)((Hashtable)(dbe.getDataList()).get(0)).get("COUNT")) > 0) //업로드 성공시 카운트 ++
			{
				uploadCount++;
			}
		}

		return uploadCount;//업로드 한 횟수 리턴
	}
}