package bbs;

import common.conf.*;

import java.util.*;

public class BbsInfomation
{
	private Hashtable bbsInfoTable;

	private String code;
	private String name;
	private String replySort;
	private String addSort;
	private String numberType;
	private String regId;
	private String regDate;
	private String regIp;
	private String updId;
	private String updDate;
	private String updIp;

	private boolean replyYn;
	private boolean addYn;
	private boolean searchYn;
	private boolean updateYn;
	private boolean fileYn;

	private int perPage;

	public BbsInfomation(String code)
	{
		this.code = code;
		setBbsInfo();
	}

	private void setBbsInfo()
	{
		ReadConf rc = ReadConf.getReadConf();
		Hashtable confTable = rc.getConfTable();
		ArrayList bbsInfoList = (ArrayList)confTable.get("bbsInfoList");
		for(int i=0; i<bbsInfoList.size(); i++)
		{
			Hashtable bbsInfoTable = (Hashtable)bbsInfoList.get(i);
			String code = (String)bbsInfoTable.get("CODE");
			if(code.equals(this.code))
			{
				this.bbsInfoTable = bbsInfoTable;
				this.name = (String)bbsInfoTable.get("NAME");
				this.replySort = (String)bbsInfoTable.get("REPLY_SORT");
				this.addSort = (String)bbsInfoTable.get("ADD_SORT");
				this.numberType = (String)bbsInfoTable.get("NUMBER_TYPE");
				this.regId = (String)bbsInfoTable.get("REG_ID");
				this.regDate = (String)bbsInfoTable.get("REG_DATE");
				this.regIp = (String)bbsInfoTable.get("REG_IP");
				this.updId = (String)bbsInfoTable.get("UPD_ID");
				this.updDate = (String)bbsInfoTable.get("UPD_DATE");
				this.updIp = (String)bbsInfoTable.get("UPD_IP");

				this.perPage = Integer.parseInt((String)bbsInfoTable.get("PER_PAGE"));

				String replyYn = (String)bbsInfoTable.get("REPLY_YN");
				if(replyYn.equals("Y"))
				{
					this.replyYn = true;
				}

				String addYn = (String)bbsInfoTable.get("ADD_YN");
				if(addYn.equals("Y"))
				{
					this.addYn = true;
				}

				String updateYn = (String)bbsInfoTable.get("UPDATE_YN");
				if(updateYn.equals("Y"))
				{
					this.updateYn = true;
				}

				String searchYn = (String)bbsInfoTable.get("SEARCH_YN");
				if(searchYn.equals("Y"))
				{
					this.searchYn = true;
				}

				String fileYn = (String)bbsInfoTable.get("FILE_YN");
				if(fileYn.equals("Y"))
				{
					this.fileYn = true;
				}

				break;
			}
		}
	}

	public Hashtable getBbsInfoTable()
	{
		return bbsInfoTable;
	}

	public String getCode()
	{
		return code;
	}

	public String getName()
	{
		return name;
	}

	public String getReplySort()
	{
		return replySort;
	}

	public String getAddSort()
	{
		return addSort;
	}

	public String getNumberType()
	{
		return numberType;
	}

	public String getRegId()
	{
		return regId;
	}

	public String getRegDate()
	{
		return regDate;
	}

	public String getRegIp()
	{
		return regIp;
	}

	public String getUpdId()
	{
		return updId;
	}

	public String getUpdDate()
	{
		return updDate;
	}

	public String getUpdIp()
	{
		return updIp;
	}

	public boolean getReplyYn()
	{
		return replyYn;
	}

	public boolean getAddYn()
	{
		return addYn;
	}

	public boolean getUpdateYn()
	{
		return updateYn;
	}

	public boolean getSearchYn()
	{
		return searchYn;
	}

	public boolean getFileYn()
	{
		return fileYn;
	}

	public int getPerPage()
	{
		return perPage;
	}
}