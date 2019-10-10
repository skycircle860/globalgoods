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
	 * 내용		: 파일 경로와 파일 이름을 받어서 변수를 초기화 한다.
	 * 입력 값	: String fileName
	 * 출력 값	:
	 */
	public ReadFile(String fileName)
	{
		this.fileName = fileName;
	}

	/**
	 * 내용		: 파일의 모든 내용을 행 단위로 읽어 들여서 ArrayList에 저장한다.
	 * 입력 값	:
	 * 출력 값	:
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
	 * 내용		: 파일에서 읽은 모든 Data를 담아서 ArrayList형태로 Return한다.
	 * 입력 값	:
	 * 출력 값	: ArrayList readDataList
	 */
	public ArrayList getReadDataList()
	{
		return readDataList;
	}
}