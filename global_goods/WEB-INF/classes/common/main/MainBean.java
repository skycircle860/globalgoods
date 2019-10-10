/*****************************************************************************
 * �����̸� : MainBean.java
 * ���ϳ��� : �������� ȣ���ϴ� ��� Beans���� ��ӹ޴� Ŭ����
*****************************************************************************/
package common.main;

import java.util.*;

public abstract class MainBean
{
	/**
	 * ����		: Servlet ���� �޾ƿ��� Data Table.
	 */
	protected Hashtable inputTable;

	/**
	 * ����		: DB�� �ִ� Query�� �����ϱ� ���� StringBuffer.
	 */
	protected StringBuffer queryBuffer;

	/**
	 * ����		: Servlet�� �Ѱ��ִ� Data List.
	 */
	protected ArrayList outputList = new ArrayList();

	/**
	 * ����		: Servlet ���� �Ѱܹ��� Data�� �޾Ƽ� �ʱ�ȭ �Ѵ�.
	 * �Է� ��	: Hashtable inputTable
	 * ��� ��	:
	 */
	public void setDataTable(Hashtable inputTable)
	{
		this.inputTable = inputTable;
	}

	/**
	 * ����		: Bean���� ó���� ��� Data�� Servlet���� return �Ѵ�.
	 * �Է� ��	:
	 * ��� ��	: ArrayList outputList
	 */
	public ArrayList getDataList()
	{
		return outputList;
	}

	/**
	 * ����		: �� Ŭ������ ��ӹ޴� ��� Ŭ�������� �����ؾ��ϴ� �޼ҵ�ν�, �ݵ�� �����ؾ� �Ѵ�.
	 * �Է� ��	:
	 * ��� ��	:
	 */
	public abstract void funcExecute() throws Exception;
}