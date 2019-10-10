/*****************************************************************************
 * 파일이름 : MainBean.java
 * 파일내용 : 서블릿에서 호출하는 모든 Beans에서 상속받는 클래스
*****************************************************************************/
package common.main;

import java.util.*;

public abstract class MainBean
{
	/**
	 * 내용		: Servlet 에서 받아오는 Data Table.
	 */
	protected Hashtable inputTable;

	/**
	 * 내용		: DB에 주는 Query를 저장하기 위한 StringBuffer.
	 */
	protected StringBuffer queryBuffer;

	/**
	 * 내용		: Servlet에 넘겨주는 Data List.
	 */
	protected ArrayList outputList = new ArrayList();

	/**
	 * 내용		: Servlet 에서 넘겨받은 Data를 받아서 초기화 한다.
	 * 입력 값	: Hashtable inputTable
	 * 출력 값	:
	 */
	public void setDataTable(Hashtable inputTable)
	{
		this.inputTable = inputTable;
	}

	/**
	 * 내용		: Bean에서 처리한 결과 Data를 Servlet으로 return 한다.
	 * 입력 값	:
	 * 출력 값	: ArrayList outputList
	 */
	public ArrayList getDataList()
	{
		return outputList;
	}

	/**
	 * 내용		: 본 클래스를 상속받는 모든 클래스에서 구현해야하는 메소드로써, 반드시 구현해야 한다.
	 * 입력 값	:
	 * 출력 값	:
	 */
	public abstract void funcExecute() throws Exception;
}