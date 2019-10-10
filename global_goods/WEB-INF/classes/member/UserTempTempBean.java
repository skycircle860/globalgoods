package member;

import common.db.*;
import common.main.*;

public class UserTempTempBean extends MainBean
{
	public void funcExecute() throws Exception
	{
		

		String id =(String)inputTable.get("id");


		queryBuffer = new StringBuffer("");
		queryBuffer.append("SELECT a.MOBILE1,a.MOBILE2,a.MOBILE3,a.MOBILE1,a.HOME1,a.HOME2,a.HOME3,a.MOBILE1,a.OFFICE1,a.OFFICE2,a.OFFICE3,a.ZIPCODE1,a.ZIPCODE2,a.ADDR1,a.ADDR2, ");
		queryBuffer.append("a.EMAIL, b.GOODS_AMOUNT,b.GOODS_CODE FROM ORDER_LIST a , ORDER_GOODS_LIST b WHERE MEMBER_ID = '"+id+"' AND a.CODE = b.ORDER_CODE ");
		
		

		DBExecute dbe = new DBExecute(queryBuffer.toString());
		outputList = dbe.getDataList();
		
		int i = updateQuery();
	}

	public int updateQuery() throws Exception
	{
		int a = 0;
		String id =(String)inputTable.get("id");
		String code =(String)inputTable.get("code");
		String state = (String)inputTable.get("state");
		String depositYn =(String)inputTable.get("depositYn");

		

		queryBuffer = new StringBuffer("");
		
		if(depositYn.equals("Y"))
		{

			queryBuffer.append("UPDATE ORDER_LIST SET ORDER_STATE ='E' WHERE MEMBER_ID='"+id+"' AND CODE = '"+code+"'" );
		}

		else
		{
			queryBuffer.append("UPDATE ORDER_LIST SET CANCLEYN='Y' WHERE MEMBER_ID='"+id+"' AND CODE = '"+code+"'" );
		}
		
		DBExecute dbe = new DBExecute(queryBuffer.toString());

		return a;
	}





}