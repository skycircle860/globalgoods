package service;

import common.main.*;
import common.util.*;
import bbs.*;
import support.*;

import java.io.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;

import com.oreilly.servlet.*;
import com.oreilly.servlet.multipart.*;

public class SupportServlet extends MainServlet
{
	protected MultipartRequest multi;
	protected String savePath;
	protected String supportFileUploadPath;

	public void init(ServletConfig config) throws ServletException 
	{
		super.init(config);

		try
		{
			supportFileUploadPath = confRoot + "/" + (String)((Hashtable)confTable.get("FILE_UPLOAD")).get("BBS");	//���μ������� ���� ���ؽ�Ʈ�� ���� �� ��Ʈ ��ο�
		}	//���� �����																//Static �������̺� �ӿ��� ���� ���ε� ���� ���� ������ BBS������ ��. ��.�Խ��ǿ��� ���ε� �������� ���� ���
		catch(Exception e)
		{
			System.out.println("############### �ý��� SupportServlet.init() Error �Դϴ�.");
		}
	}

	public void performTask(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, Exception
	{
		
		String pageNum = request.getParameter("pageNum");
		String section = request.getParameter("section");
		String word = request.getParameter("word");
	
		String code = request.getParameter("code");

		String perPage = request.getParameter("perPage");
		
		if((request.getContentType()) != null && (request.getContentType()).startsWith("multipart"))	//��Ƽ��Ʈ Ÿ���� ���ڰ� ���ڵ� ���� �ʾ� ���� ���ٿ �ַ� �̿�ȴٰ� �Ѵ�.
		{	//������Ʈ�� ����ƮŸ���� multipart�� ������ ��.
			File dayFile = new File(supportFileUploadPath+"/"+TotalDate.getToday("yyyy/MM/dd"));	//��Ʈ��ο� ������ ���� ��ο� ���� ��¥ ������ �����Ѵ�.
			if(!dayFile.exists())
			{
				dayFile.mkdirs();//��ο� ���� ������ ���� ����
			}

			savePath = dayFile.getAbsolutePath();	// ������ ���丮 (������)
			int sizeLimit = 1000 * 1024 * 1024; // 1000�ް����� ���� �Ѿ�� ���ܹ߻�
			multi = new MultipartRequest(request, savePath, sizeLimit, "KSC5601", new DefaultFileRenamePolicy());
						//MultipartRequest(������Ʈ ��ü,������,����뷮,���ڵ�,���ϸ�������å);
			//enctype="multipart/form-data"
			//��Ƽ ��Ʈ������Ʈ�� Ÿ��� �Ķ���ʹ� ��Ƽ��Ʈ������Ʈ ��ü���� ���� �ϴ°� ����. ������ �׳� ������Ʈ���� �� �� ���� Null �� ����.
			func = multi.getParameter("func");

			code = multi.getParameter("code");
			pageNum = multi.getParameter("pageNum");
			section = multi.getParameter("section");
			word = multi.getParameter("word");
		}
		// �α��� �ʿ��� �޴� �ɷ� ����
		/*	
		if((func.equals("support_003") || func.equals("support_004")|| func.equals("member_005")|| func.equals("member_006") || func.equals("member_007") || func.equals("member_008") || func.equals("member_009") || func.equals("member_010")  ) && (session==null || session.getAttribute("loginYn")==null || ((String)session.getAttribute("loginYn")).equals("N")))
		{
			mode = "T";
			moveType = "FW";
			message = "�α����� �ʿ��� �޴� �Դϴ�. �α��� �Ŀ� �õ��ϼ���.";
			stepUrl = "/servlet/service.CommonServlet";
			return;
		}
		*/

		if(pageNum==null || pageNum.length()<=0)
		{
			pageNum = "1";
		}

		if(section==null || section.length()==0)
		{
			section = "TC";
		}

		if(word==null || word.length()==0)
		{
			word = "";
		}

		if (perPage==null || perPage.length()==0)
		{
			perPage = "15";
		}

		if(code != null)
		{
			inputTable.put("code",code);
		}
		
		inputTable.put("perPage", perPage);
		inputTable.put("pageNum", pageNum);
		inputTable.put("section", section);
		inputTable.put("word", entoKo(word));

		SupportInfomation si = new SupportInfomation(code, perPage);

		session.setAttribute("category", "support"); //session�� key:category���� value:support�� ����

		/** left menu ���� '�ӽðԽ���' Ŭ����  �������� ���������� ���� */
		if(func.equals("support_001"))  							
		{	
				
			moveType = "FW";
			mode = "S";
			mainUrl = "/support/supportList.jsp";
		}
		/**  ������ ����Ʈ  ������ ����*/
		else if(func.equals("support_002"))
		{
			SupportInfoBean sib = new SupportInfoBean();
			sib.setDataTable(inputTable);
			sib.funcExecute();
			ArrayList supportInfoList = sib.getDataList();
			inputTable = (Hashtable)supportInfoList.get(0);
			inputTable.put("perPage", perPage);

			SupportListBean sblb = new SupportListBean();
			sblb.setDataTable(inputTable);
			sblb.funcExecute();

			ArrayList supportViewList = sblb.getDataList();

			outputTable.put("supportViewList", supportViewList);
			outputTable.put("perPage", perPage);

			moveType = "FW";
			mode = "S";
			mainUrl = "/support/supportList.jsp";
		}
		 //������ �۾��� ������ ����
		else if(func.equals("support_003"))
		{
			
			moveType = "FW";
			mode = "S";
			mainUrl = "/support/supportWrite.jsp";
		}
		//������ �۾��� 
		else if(func.equals("support_004"))
		{
			String title = multi.getParameter("title");	//��Ƽ��Ʈ������Ʈ
			String content = multi.getParameter("content");
			String client = request.getRemoteAddr();
			String id = (String)session.getAttribute("id");

			inputTable.put("id", id);
			inputTable.put("title", title);
			inputTable.put("content", content);
			inputTable.put("client", client);

			ArrayList uploadFileList = new ArrayList();
			if(si.getFileYn())//���� ���ε带 ����� ���
			{
				Enumeration formNames=multi.getFileNames();  // form ���� �̸� ��ȯ
				while(formNames.hasMoreElements())
				{
					String fileFormName=(String)formNames.nextElement(); // ���ε� �ϴ� ������ ���� ��� while �� ���
					String orgFileName=multi.getOriginalFileName(fileFormName); // ���ε�� ������ �̸� ���
					String saveFileName=multi.getFilesystemName(fileFormName); // ���ε�Ǿ� ����� ������ �̸� ��� //����Ʈ��������å�� ���Ѱ�
					if(saveFileName!=null && saveFileName.length()>0)
					{
						Hashtable tempFileTable = new Hashtable();
						tempFileTable.put("savePath", savePath);
						tempFileTable.put("orgFileName", orgFileName);
						tempFileTable.put("saveFileName", saveFileName);
						uploadFileList.add(tempFileTable);	//���, �����̸�, �ٲ��̸��� �ݷ��ǿ� ����
					}
				}
				inputTable.put("uploadFile", uploadFileList);
			}


			SupportWriteBean swb = new SupportWriteBean();	//�� ���ʿ��� ���� ���ε� �� �� ȣ���� ���ϱ��� ���ε� ��Ŵ.
			swb.setDataTable(inputTable);
			swb.funcExecute();

			ArrayList resultList = swb.getDataList();

			int resultCount = Integer.parseInt((String)((Hashtable)resultList.get(0)).get("COUNT"));
			if(resultCount>0)
			{
				int uploadFileCount = Integer.parseInt((String)inputTable.get("uploadFile"));
				if(uploadFileCount<uploadFileList.size())	//���ε��� ������ ���ڿ� ���ε� �� ������� ��ġ�� ��
				{
					message = "���� ���������� ��ϵǾ�����, ������ �Ϻθ� ��ϵǾ����ϴ�. �����ڿ��� �����ϼ���.";
				}
				else
				{
					message = "���� ���������� ��ϵǾ����ϴ�.";
				}

				inputTable.put("func", "support_002");
				inputTable.put("pageNum", "1");
			}
			else
			{
				message = "�� ����� ������ �߻��Ͽ����ϴ�.";
				inputTable.put("func", "support_003");
			}

			moveType = "FW";
			mode = "T";
			stepUrl = "/supportServlet.mo";
		}
		//������ �� ���� 
		else if(func.equals("support_005"))
		{
			String seq = request.getParameter("seq");
			inputTable.put("seq", seq);

			String hit = request.getParameter("hit");
			if(hit != null && hit.equals("Y"))
			{
				SupportHitPlusBean shpb = new SupportHitPlusBean();
				shpb.setDataTable(inputTable);
				shpb.funcExecute();
			}

			SupportViewBean svb = new SupportViewBean();
			svb.setDataTable(inputTable);
			svb.funcExecute();
			ArrayList supportViewList = svb.getDataList();
			outputTable.put("supportViewList",supportViewList);

			if(si.getFileYn())	//�Խ��ǿ��� ���� ���ε带 ��� �� ���	
			{
				Hashtable supportTable = (Hashtable)supportViewList.get(0);
				SupportFileManager sfm = new SupportFileManager();	//���� �Ŵ��� ��ü ����
				ArrayList fileList = sfm.getSupportFileList(supportTable);//������ ���� ��� ���̺��� �Ѱ� ���� ����Ʈ�� ���Ϲ���.
				supportTable.put("FILE_LIST", fileList); //���� ����Ʈ�� bbsTable�� �����
			}//���̺��� Ư���� ���߿� �־��� ������ outputTable�� �Ǿ��� �ִ� ���...

			if(si.getAddYn())	//�Խ��ǿ��� ������ ����ϴ��� ����
			{
				SupportAddViewBean savb = new SupportAddViewBean();
				savb.setDataTable(inputTable);
				savb.funcExecute();
				ArrayList supportAddList = savb.getDataList();
				outputTable.put("supportAddList",supportAddList);
			}

			moveType = "FW";
			mode = "S";
			mainUrl = "/support/supportView.jsp";
		}

// �������� ���� ������ ����(support_006)
		else if(func.equals("support_006"))
		{
			String seq = request.getParameter("seq");
			//String title = entoKo(request.getParameter("title"));
			//String content = entoKo(request.getParameter("content"));
			//String regId = request.getParameter("regId");
			//String regName = request.getParameter("regName");

			inputTable.put("seq", seq);
		//	inputTable.put("title", title);
		//	inputTable.put("content", content);
		//	inputTable.put("regId", regId);
		//	inputTable.put("regName", regName);

			SupportViewBean svb = new SupportViewBean();
			svb.setDataTable(inputTable);
			svb.funcExecute();

			ArrayList supportViewList = svb.getDataList();
			outputTable.put("supportViewList",supportViewList);

			if(si.getFileYn()) //�������� ������� �� ��
			{
				Hashtable supportTable = (Hashtable)supportViewList.get(0);
				SupportFileManager sfm = new SupportFileManager();
				ArrayList fileList = sfm.getSupportFileList(supportTable);
				supportTable.put("FILE_LIST", fileList);
			}

			if(si.getAddYn())
			{
				SupportAddViewBean savb = new SupportAddViewBean();
				savb.setDataTable(inputTable);
				savb.funcExecute();
				ArrayList supportAddList = savb.getDataList();
				outputTable.put("supportAddList", supportAddList);
			}

			moveType = "FW";
			mode = "S";
			mainUrl = "/support/supportUpdate.jsp";
		}
	/** �������� �� ���� */
		else if(func.equals("support_007"))
		{
			String id = (String)session.getAttribute("id");
			String seq = multi.getParameter("seq");
			String title = multi.getParameter("title");
			String content = multi.getParameter("content");
			String client = request.getRemoteAddr();

			String[] deleteFileArray = new String[0];
			ArrayList uploadFileList = new ArrayList();

			inputTable.put("id", id);
			inputTable.put("seq", seq);
			inputTable.put("title", title);
			inputTable.put("content", content);
			inputTable.put("client", client);

			if(si.getFileYn())
			{
				if(multi.getParameterValues("deleteFile") != null)
				{
					deleteFileArray = multi.getParameterValues("deleteFile");	//�̰� üũ�ڽ��� �����Ѱ�.. ��Ʈ�� �迭�� �Ѿ��
				}

				Enumeration formNames=multi.getFileNames();  // form ���� �̸� ��ȯ	//���ε��ϱ����� ���� �߰��� ���ϵ�
				while(formNames.hasMoreElements())
				{
					String fileFormName=(String)formNames.nextElement(); // ���ε� �ϴ� ������ ���� ��� while �� ���
					String orgFileName=multi.getOriginalFileName(fileFormName); // ���ε�� ������ �̸� ���
					String saveFileName=multi.getFilesystemName(fileFormName); // ���ε�Ǿ� ����� ������ �̸� ���
					if(saveFileName!=null && saveFileName.length()>0)
					{
						Hashtable tempFileTable = new Hashtable();
						tempFileTable.put("savePath", savePath);
						tempFileTable.put("orgFileName", orgFileName);
						tempFileTable.put("saveFileName", saveFileName);
						uploadFileList.add(tempFileTable);
					}
				}
				inputTable.put("deleteFile", deleteFileArray);
				inputTable.put("uploadFile", uploadFileList);	//������ ���ڴ� jsp���� ������ �Ѿ�´�.
			}

			SupportUpdateBean sub = new SupportUpdateBean();	//BBSWrite�� ��������� ������ ���������� �ִ�.
			sub.setDataTable(inputTable);
			sub.funcExecute();
			ArrayList resultList = sub.getDataList();

			int resultCount = Integer.parseInt((String)((Hashtable)resultList.get(0)).get("COUNT"));
			if(resultCount>0)
			{
				int uploadFileCount = Integer.parseInt((String)inputTable.get("uploadFile"));
				int deleteFileCount = Integer.parseInt((String)inputTable.get("deleteFile"));
				if(uploadFileCount<uploadFileList.size() || deleteFileCount<deleteFileArray.length)
				{
					message = "���� ���������� �����Ǿ�����, ������ �Ϻθ� �����Ǿ����ϴ�. �����ڿ��� �����ϼ���.";
				}
				else
				{
					message = "�� ������ ���� �Ͽ����ϴ�.";
				}

				inputTable.put("func", "support_005");
				inputTable.put("hit", "N");
			}
			else
			{
				message = "�� ������ ������ �߻��Ͽ����ϴ�.";
				inputTable.put("func", "support_006");
			}

			moveType = "FW";
			mode = "T";
			stepUrl = "/supportServlet.mo";
		}


		/** �������� �� ���� */
		else if(func.equals("support_008"))
		{
			String id = (String)session.getAttribute("id");
			String seq = request.getParameter("seq");
			String step = request.getParameter("step");
			String client = request.getRemoteAddr();

			inputTable.put("id", id);
			inputTable.put("seq", seq);
			inputTable.put("step", step);
			inputTable.put("client", client);

			/* �� �κп� "�����ڿ� ���� ������ ���Դϴ�."*/
			//��� ǥ���Ұ�

			SupportDeleteBean sdb = new SupportDeleteBean();
			sdb.setDataTable(inputTable);
			sdb.funcExecute();
			ArrayList resultList = sdb.getDataList();

			int resultCount = Integer.parseInt((String)((Hashtable)resultList.get(0)).get("COUNT"));
			
			if(resultCount>0)
			{
				message = "���� ���� �Ǿ����ϴ�.";
				inputTable.put("func", "support_002");
			}
			else
			{
				message = "�� ���� �۾� �� Error�� �߻� �Ͽ����ϴ�.";
				inputTable.put("func", "support_005");
				inputTable.put("hit", "N");
			
			}

			moveType = "FW";
			mode = "T";
			stepUrl = "/supportServlet.mo";
		}
		//��� ����                         *���-����Ʈ���� �ؿ�����  ���-�� ���������� ���� 
		else if(func.equals("support_009"))
		{
			String id = (String)session.getAttribute("id");

			String seq = multi.getParameter("seq");
			String groupNum = multi.getParameter("groupNum");
			String width = multi.getParameter("width");
			String step = multi.getParameter("step");
			String title = multi.getParameter("title");
			String content = multi.getParameter("content");
			String client = request.getRemoteAddr();

			inputTable.put("id", id);
			inputTable.put("seq", seq);
			inputTable.put("groupNum", groupNum);
			inputTable.put("width", width);
			inputTable.put("step", step);
			inputTable.put("title", title);
			inputTable.put("content", content);
			inputTable.put("client", client);

			ArrayList uploadFileList = new ArrayList();
			if(si.getFileYn())	//�׳� write�� ����.
			{
				Enumeration formNames=multi.getFileNames();  // form ���� �̸� ��ȯ
				while(formNames.hasMoreElements())
				{
					String fileFormName=(String)formNames.nextElement(); // ���ε� �ϴ� ������ ���� ��� while �� ���
					String orgFileName=multi.getOriginalFileName(fileFormName); // ���ε�� ������ �̸� ���
					String saveFileName=multi.getFilesystemName(fileFormName); // ���ε�Ǿ� ����� ������ �̸� ���
					if(saveFileName!=null && saveFileName.length()>0)
					{
						Hashtable tempFileTable = new Hashtable();
						tempFileTable.put("savePath", savePath);
						tempFileTable.put("orgFileName", orgFileName);
						tempFileTable.put("saveFileName", saveFileName);
						uploadFileList.add(tempFileTable);
					}
				}
				inputTable.put("uploadFile", uploadFileList);
			}

			SupportReplyWriteBean srwb = new SupportReplyWriteBean();
			srwb.setDataTable(inputTable);
			srwb.funcExecute();
			ArrayList resultList = srwb.getDataList();

			int resultCount = Integer.parseInt((String)((Hashtable)resultList.get(0)).get("COUNT"));
			if(resultCount>0)
			{
				int uploadFileCount = Integer.parseInt((String)inputTable.get("uploadFile"));
				if(uploadFileCount<uploadFileList.size())
				{
					message = "����� ���������� ��ϵǾ�����, ������ �Ϻθ� ��ϵǾ����ϴ�. �����ڿ��� �����ϼ���.";
				}
				else
				{
					message = "����� ���������� ��ϵǾ����ϴ�.";
				}

				inputTable.put("func", "support_002");
			}
			else
			{
				message = "��� ��� �� ������ �߻��Ͽ����ϴ�.";
				inputTable.put("func", "support_005");
				inputTable.put("hit", "N");
			}


			moveType = "FW";
			mode = "T";
			stepUrl = "/supportServlet.mo";
		}

		/*��� ����*/
		else if(func.equals("support_010"))
		{
			String id = (String)session.getAttribute("id");
			String seq = request.getParameter("seq");
			String content = entoKo(request.getParameter("content"));
			String client = request.getRemoteAddr();

			inputTable.put("id", id);
			inputTable.put("seq", seq);
			inputTable.put("content", content);
			inputTable.put("client", client);

			SupportAddWriteBean sawb = new SupportAddWriteBean();
			sawb.setDataTable(inputTable);
			sawb.funcExecute();
			ArrayList resultList = sawb.getDataList();

			int resultCount = Integer.parseInt((String)((Hashtable)resultList.get(0)).get("COUNT"));
			if(resultCount>0)
			{
				message = "����� ���������� ��ϵǾ����ϴ�.";
			}
			else
			{
				message = "��� ��� �� ������ �߻��Ͽ����ϴ�.";
			}

			inputTable.put("func", "support_005");
			inputTable.put("hit", "N");

			moveType = "FW";
			mode = "T";
			stepUrl = "/supportServlet.mo";
		}
		/*��� ����*/
		else if(func.equals("support_011"))
		{
			//HttpSession session = request.getSession(false);

			String id = (String)session.getAttribute("id");
			String seq = request.getParameter("seq");
			String addSeq = request.getParameter("addSeq");
			String client = request.getRemoteAddr();

			inputTable.put("id",id);
			inputTable.put("addSeq",addSeq);
			inputTable.put("seq",seq);
			inputTable.put("client",client);

			SupportAddDeleteBean sadb = new SupportAddDeleteBean();
			sadb.setDataTable(inputTable);
			sadb.funcExecute();

			ArrayList resultList = sadb.getDataList();

			int resultCount = Integer.parseInt((String)((Hashtable)resultList.get(0)).get("COUNT"));
			if(resultCount>0)
			{
				message = "����� ���������� �����Ǿ����ϴ�.";
			}
			else
			{
				message = "��� ���� �� ������ �߻��Ͽ����ϴ�.";
			}

			inputTable.put("func", "support_005");
			inputTable.put("hit", "N");

			moveType = "FW";
			mode = "T";
			stepUrl = "/supportServlet.mo";
		}
	}
}


