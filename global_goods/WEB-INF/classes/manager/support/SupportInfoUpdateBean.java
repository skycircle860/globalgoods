package manager.support;

import common.db.*;
import common.main.*;

public class SupportInfoUpdateBean extends MainBean
{
	public void funcExecute() throws Exception
	{
		String code = (String)inputTable.get("code");
		String name = (String)inputTable.get("name");
		String useYn = (String)inputTable.get("useYn");
		String perPage = (String)inputTable.get("perPage");
		String updateYn = (String)inputTable.get("updateYn");
		String searchYn = (String)inputTable.get("searchYn");
		String numberType = (String)inputTable.get("numberType");
		String replyYn = (String)inputTable.get("replyYn");
		String replySort = (String)inputTable.get("replySort");
		String addYn = (String)inputTable.get("addYn");
		String addSort = (String)inputTable.get("addSort");
		String fileYn = (String)inputTable.get("fileYn");

		String id = (String)inputTable.get("id");
		String client = (String)inputTable.get("client");

		queryBuffer = new StringBuffer("");
		queryBuffer.append("UPDATE BBS_INFO SET NAME = '" + name + "', USE_YN='" + useYn + "', ");
		queryBuffer.append("PER_PAGE = '" + perPage + "', UPDATE_YN='" + updateYn + "', SEARCH_YN='" + searchYn + "', ");
		queryBuffer.append("NUMBER_TYPE = '" + numberType + "', REPLY_YN='" + replyYn + "', REPLY_SORT='" + replySort + "', ");
		queryBuffer.append("ADD_YN = '" + addYn + "', ADD_SORT='" + addSort + "', FILE_YN='" + fileYn + "', ");
		queryBuffer.append("UPD_ID='" + id + "', UPD_DATE=SYSDATE, UPD_IP='" + client + "' WHERE CODE = '" + code + "'");

		DBExecute dbe = new DBExecute(queryBuffer.toString());
		outputList = dbe.getDataList();
	}
}