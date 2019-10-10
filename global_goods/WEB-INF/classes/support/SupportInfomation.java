package support;

import common.conf.*;

import java.util.*;

public class SupportInfomation
{
	private Hashtable supportInfoTable;

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

	public SupportInfomation(String code)
	{
		this.code = code;
		setBbsInfo();
	}

	public SupportInfomation(String code, String perPage)
	{
		this.code = code;
		this.perPage = Integer.parseInt(perPage);
		setBbsInfo();
	}

	private void setBbsInfo()
	{
		ReadConf rc = ReadConf.getReadConf();
		Hashtable confTable = rc.getConfTable();
		ArrayList supportInfoList = (ArrayList)confTable.get("bbsInfoList");
		for(int i=0; i<supportInfoList.size(); i++)
		{
			Hashtable supportInfoTable = (Hashtable)supportInfoList.get(i);
			String code = (String)supportInfoTable.get("CODE");
			if(code.equals(this.code))
			{
				this.supportInfoTable = supportInfoTable;
System.out.println(supportInfoTable);
				this.name = (String)supportInfoTable.get("NAME");
				this.replySort = (String)supportInfoTable.get("REPLY_SORT");
				this.addSort = (String)supportInfoTable.get("ADD_SORT");
				this.numberType = (String)supportInfoTable.get("NUMBER_TYPE");
				this.regId = (String)supportInfoTable.get("REG_ID");
				this.regDate = (String)supportInfoTable.get("REG_DATE");
				this.regIp = (String)supportInfoTable.get("REG_IP");
				this.updId = (String)supportInfoTable.get("UPD_ID");
				this.updDate = (String)supportInfoTable.get("UPD_DATE");
				this.updIp = (String)supportInfoTable.get("UPD_IP");

				//this.perPage = Integer.parseInt((String)supportInfoTable.get("PER_PAGE"));

				String replyYn = (String)supportInfoTable.get("REPLY_YN");
				if(replyYn.equals("Y"))
				{
					this.replyYn = true;
				}

				String addYn = (String)supportInfoTable.get("ADD_YN");
				if(addYn.equals("Y"))
				{
					this.addYn = true;
				}

				String updateYn = (String)supportInfoTable.get("UPDATE_YN");
				if(updateYn.equals("Y"))
				{
					this.updateYn = true;
				}

				String searchYn = (String)supportInfoTable.get("SEARCH_YN");
				if(searchYn.equals("Y"))
				{
					this.searchYn = true;
				}

				String fileYn = (String)supportInfoTable.get("FILE_YN");
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
		return supportInfoTable;
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
		if (perPage == 0)
		{
			return 15;
		}
		else
		{
			return perPage;
		}
	}
}