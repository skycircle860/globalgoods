package support;

import java.io.*;
import java.util.*;
import common.db.*;

public class SupportFileManager
{
	public ArrayList getSupportFileList(Hashtable supportTable) throws Exception
	{
		String seq = (String)supportTable.get("SEQ"); //�����ϴ� ������ ���� ������

		StringBuffer queryBuffer = new StringBuffer("");
		queryBuffer.append("SELECT SEQ, ORG_NAME, SAVE_NAME, PATH, FILE_SIZE ");
		queryBuffer.append("FROM BBS_FILE WHERE BBS_SEQ="+seq+" AND DISP_YN='Y'");
		DBExecute dbe = new DBExecute(queryBuffer.toString());

		return dbe.getDataList(); //�̾Ƴ� ���� ������ ��� ��� ����Ʈ�� �ѱ� �̰��� ���ڶ��� �ߺ��� �Ͼ.
	}

	public int deleteFile(Hashtable inputTable) throws Exception
	{
		String id = (String)inputTable.get("id");
		String client = (String)inputTable.get("client");
		String[] deleteFileArray = (String[])inputTable.get("deleteFile");	//����Ʈ üũ�ڽ��� ���ϰ��� ����� ��Ʈ���迭
		if(deleteFileArray.length==0)	//���� ������ ���� ��� 0 ����
		{
			return 0;
		}

		StringBuffer queryBuffer = new StringBuffer("");
		queryBuffer.append("UPDATE BBS_FILE SET DISP_YN='N', UPD_ID='"+id+"', UPD_DATE=SYSDATE, UPD_IP='"+client+"' WHERE ");

		//���� ���� �� DB ���
		for(int i=0; i<deleteFileArray.length; i++)
		{
			if(i!=0)
			{
				queryBuffer.append(" OR ");
			}
			String fileSeq = deleteFileArray[i];
			queryBuffer.append("SEQ="+fileSeq);
		}	//������ ���� "" �̰ų� ""�̰ų� "" �϶� ��������!!! OR

		DBExecute dbe = new DBExecute(queryBuffer.toString());
		dbe.getDataList();	//��... OR ���� ����߱� ������ ī���͸� ++ �� �� ����.,.. ���ϵ� ī��Ʈ ���� 1 ���״�..

		return deleteFileArray.length;//�״�� �迭 ������ ����.. 
	}

	public int uploadFile(Hashtable inputTable) throws Exception
	{
		int uploadCount = 0;
		String seq = (String)inputTable.get("seq");
		String id = (String)inputTable.get("id");
		String client = (String)inputTable.get("client");
		ArrayList uploadFileList = (ArrayList)inputTable.get("uploadFile"); //���ε��� ���� ������ ���� ��� ����Ʈ

		for(int i=0; i<uploadFileList.size(); i++) //���� ���� ��ŭ ������ ���� ���ε� ������ ������
		{
			Hashtable uploadFileTable = (Hashtable)uploadFileList.get(i);
			String savePath = (String)uploadFileTable.get("savePath"); //���� ���
			savePath = savePath.replace('\\', '/');

			String orgFileName = (String)uploadFileTable.get("orgFileName");	//���� �̸�
			String saveFileName = (String)uploadFileTable.get("saveFileName");	//����� �̸�(�ߺ��� ����� �̸�)

			orgFileName = orgFileName.replaceAll("'", "''");	//���� ���� �̸��� ' �� ����
			saveFileName = saveFileName.replaceAll("'", "''");	//�ٲ� ���� �̸��� ' �� ����

			File file = new File(savePath, saveFileName);	//��ο� �ٲ� ���� �̸��� �̿��� ���ϰ�ü ����
			long fileSize = file.length();	//���� ��ü�� ���� ������ ũ�⸦ �˾ƿ�.

			//DB�� ���
			StringBuffer queryBuffer = new StringBuffer("");
			queryBuffer.append("INSERT INTO BBS_FILE (SEQ, BBS_SEQ, PATH, ORG_NAME, SAVE_NAME, FILE_SIZE, REG_ID, REG_IP, UPD_ID, UPD_IP) ");
			queryBuffer.append("VALUES (BBS_FILE_SEQ.NEXTVAL, "+seq+", '"+savePath+"', '"+orgFileName+"', '"+saveFileName+"', "+fileSize+", '"+id+"', '"+client+"', '"+id+"', '"+client+"')");
		//��������(�۰� ����), ���� ��� , ���� �̸� , �����̸�, ���� ũ��, ���� ���δ� ���̵�, �۾��� ip�ּ� ���ε�
			DBExecute dbe = new DBExecute(queryBuffer.toString());
			if(Integer.parseInt((String)((Hashtable)(dbe.getDataList()).get(0)).get("COUNT")) > 0) //���ε� ������ ī��Ʈ ++
			{
				uploadCount++;
			}
		}

		return uploadCount;//���ε� �� Ƚ�� ����
	}
}