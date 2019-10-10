package common.conf;

import java.io.*;
import java.util.*;

public class ReadFile
{
	private String fileName;

	private File file;
	private FileReader fr;
	private BufferedReader br;

	private ArrayList readDataList = new ArrayList();

	/**
	 * ����		: ���� ��ο� ���� �̸��� �޾ ������ �ʱ�ȭ �Ѵ�.
	 * �Է� ��	: String fileName
	 * ��� ��	:
	 */
	public ReadFile(String fileName)
	{
		this.fileName = fileName;
	}

	/**
	 * ����		: ������ ��� ������ �� ������ �о� �鿩�� ArrayList�� �����Ѵ�.
	 * �Է� ��	:
	 * ��� ��	:
	 */
	public void readData() throws IOException
	{
		file = new File(fileName);
		fr = new FileReader(file);
		br = new BufferedReader(fr);

		System.out.println(".......... "+fileName+" File Loading");
		String readLine = br.readLine();
		while(readLine != null)
		{
			readLine = readLine.trim();
			readDataList.add(readLine);
			
			readLine = br.readLine();
		}
		br.close();
	}

	/**
	 * ����		: ���Ͽ��� ���� ��� Data�� ��Ƽ� ArrayList���·� Return�Ѵ�.
	 * �Է� ��	:
	 * ��� ��	: ArrayList readDataList
	 */
	public ArrayList getReadDataList()
	{
		return readDataList;
	}
}