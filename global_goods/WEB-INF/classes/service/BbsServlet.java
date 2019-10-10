package service;

import common.main.*;
import common.util.*;
import bbs.*;

import java.io.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;

import com.oreilly.servlet.*;
import com.oreilly.servlet.multipart.*;

public class BbsServlet extends MainServlet
{
	protected MultipartRequest multi;
	protected String savePath;
	protected String bbsFileUploadPath;

	/**
	 * ��    ��	: Servlet���� �⺻������ ���� �ѹ��� �����ϴ� Method�μ� �������� Loading�� ���� 
	 * �Է� ��	: ServletConfig config
	 * ��� ��	:
	*/
	public void init(ServletConfig config) throws ServletException 
	{
		super.init(config);

		try
		{
			bbsFileUploadPath = confRoot + "/" + (String)((Hashtable)confTable.get("FILE_UPLOAD")).get("BBS");	//���μ������� ���� ���ؽ�Ʈ�� ���� �� ��Ʈ ��ο�
		}	//���� �����																//Static �������̺� �ӿ��� ���� ���ε� ���� ���� ������ BBS������ ��. ��.�Խ��ǿ��� ���ε� �������� ���� ���
		catch(Exception e)
		{
			System.out.println("############### �ý��� BbsServlet.init() Error �Դϴ�.");
		}
	}

	public void performTask(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, Exception
	{
		String code = request.getParameter("code");
		String pageNum = request.getParameter("pageNum");
		String section = request.getParameter("section");

		String word = request.getParameter("word");

		if((request.getContentType()) != null && (request.getContentType()).startsWith("multipart"))	//��Ƽ��Ʈ Ÿ���� ���ڰ� ���ڵ� ���� �ʾ� ���� ���ٿ �ַ� �̿�ȴٰ� �Ѵ�.
		{	//������Ʈ�� ����ƮŸ���� multipart�� ������ ��.
			File dayFile = new File(bbsFileUploadPath+"/"+TotalDate.getToday("yyyy/MM/dd"));	//��Ʈ��ο� ������ ���� ��ο� ���� ��¥ ������ �����Ѵ�.
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
		if((func.equals("bbs_002") || func.equals("bbs_003") || func.equals("member_005") || func.equals("member_006") || func.equals("member_007") || func.equals("member_008") || func.equals("member_009") || func.equals("member_010")) && (session==null || session.getAttribute("loginYn")==null || ((String)session.getAttribute("loginYn")).equals("N")))
		{
			mode = "T";
			moveType = "FW";
			message = "�α����� �ʿ��� �޴� �Դϴ�. �α��� �Ŀ� �õ��ϼ���.";
			stepUrl = "/servlet/service.CommonServlet";
			return;
		}

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
		

		inputTable.put("code", code);
		inputTable.put("pageNum", pageNum);
		inputTable.put("section", section);
		inputTable.put("word", entoKo(word));

		BbsInfomation bi = new BbsInfomation(code);//���⼭ ����� ������ ���� �� �޴����� �ƿ�ǲ �� ���� ���ε尡 �޶�����.
								// ��� ���� ���� ���� ���ε� ���� ����

		/** �� ���*/
		if(func.equals("bbs_001"))
		{
			BbsInfoBean bib = new BbsInfoBean();
			bib.setDataTable(inputTable);
			bib.funcExecute();
			ArrayList bbsInfoList = bib.getDataList();
			inputTable = (Hashtable)bbsInfoList.get(0);
			//��ǲ����Ʈ�� �ִ� �ڵ� ���� ���� ���� ���ϵǰ� ������ ��ġ���� ���ϵ�.

			BbsListBean blb = new BbsListBean();
			blb.setDataTable(inputTable);
			blb.funcExecute();
			ArrayList bbsList = blb.getDataList();

			outputTable.put("bbsList", bbsList);

			moveType = "FW";
			mode = "S";
			mainUrl = "/bbs/BbsList.jsp";
		}
		/** �� ���� ������ ����*/
		else if(func.equals("bbs_002"))
		{
			moveType = "FW";
			mode = "S";
			mainUrl = "/bbs/BbsWrite.jsp";
		}
		/** �۾��� */
		else if(func.equals("bbs_003"))
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
			if(bi.getFileYn())//���� ���ε带 ����� ���
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

			BbsWriteBean bwb = new BbsWriteBean();	//�� ���ʿ��� ���� ���ε� �� �� ȣ���� ���ϱ��� ���ε� ��Ŵ.
			bwb.setDataTable(inputTable);
			bwb.funcExecute(); //�̺κп��� "uploadFile"�� Ű�� �ϴ� ������ ��Ʈ���� ���ڷ� �ٲ��.
			ArrayList resultList = bwb.getDataList();

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

				inputTable.put("func", "bbs_001");
				inputTable.put("pageNum", "1");
			}
			else
			{
				message = "�� ����� ������ �߻��Ͽ����ϴ�.";
				inputTable.put("func", "bbs_002");
			}

			moveType = "FW";
			mode = "T";
			stepUrl = "/bbsServlet.mo";
		}
		/** �Խ��� �ۺ��� */
		else if(func.equals("bbs_004"))
		{
			String seq = request.getParameter("seq");
			inputTable.put("seq", seq);

			String hit = request.getParameter("hit");
			if(hit == null || hit.equals("Y"))
			{
				HitPlusBean hpb = new HitPlusBean();
				hpb.setDataTable(inputTable);
				hpb.funcExecute();
			}

			BbsViewBean bvb = new BbsViewBean();
			bvb.setDataTable(inputTable);
			bvb.funcExecute();

			ArrayList bbsList = bvb.getDataList();
			outputTable.put("bbsList", bbsList);	//�������� ȸ�� �̸����� �� ����ۿ� ������� ���� ���̺���

			if(bi.getFileYn())	//�Խ��ǿ��� ���� ���ε带 ��� �� ���	
			{
				Hashtable bbsTable = (Hashtable)bbsList.get(0);
				BbsFileManager bfm = new BbsFileManager();	//���� �Ŵ��� ��ü ����
				ArrayList fileList = bfm.getBbsFileList(bbsTable);//������ ���� ��� ���̺��� �Ѱ� ���� ����Ʈ�� ���Ϲ���.
				bbsTable.put("FILE_LIST", fileList); //���� ����Ʈ�� bbsTable�� �����
			}//���̺��� Ư���� ���߿� �־��� ������ outputTable�� �Ǿ��� �ִ� ���...

			if(bi.getAddYn())	//�Խ��ǿ��� ������ ����ϴ��� ����
			{
				BbsAddViewBean bavb = new BbsAddViewBean();
				bavb.setDataTable(inputTable);
				bavb.funcExecute();
				ArrayList bbsAddList = bavb.getDataList();
				outputTable.put("bbsAddList", bbsAddList);	//�ƿ�ǲ ���̺� ���� �Ǿ���~
			}

			moveType = "FW";
			mode = "S";
			mainUrl = "/bbs/BbsView.jsp";
		}
		/** �ۼ��� ������ ���� */
		else if(func.equals("bbs_005"))
		{
			String seq = request.getParameter("seq");

			inputTable.put("seq", seq);

			BbsViewBean bvb = new BbsViewBean();
			bvb.setDataTable(inputTable);
			bvb.funcExecute();
			ArrayList bbsList = bvb.getDataList();
			outputTable.put("bbsList", bbsList);

			if(bi.getFileYn()) //�������� ������� �� ��
			{
				Hashtable bbsTable = (Hashtable)bbsList.get(0);
				BbsFileManager bfm = new BbsFileManager();
				ArrayList fileList = bfm.getBbsFileList(bbsTable);
				bbsTable.put("FILE_LIST", fileList);
			}

			if(bi.getAddYn())
			{
				BbsAddViewBean bavb = new BbsAddViewBean();
				bavb.setDataTable(inputTable);
				bavb.funcExecute();
				ArrayList bbsAddList = bavb.getDataList();
				outputTable.put("bbsAddList", bbsAddList);
			}

			moveType = "FW";
			mode = "S";
			mainUrl = "/bbs/BbsUpdate.jsp";
		}
		/** �Խ��� �ۼ��� */
		else if(func.equals("bbs_006"))
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

			if(bi.getFileYn())
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

			BbsUpdateBean bub = new BbsUpdateBean();	//BBSWrite�� ��������� ������ ���������� �ִ�.
			bub.setDataTable(inputTable);
			bub.funcExecute();
			ArrayList resultList = bub.getDataList();

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

				inputTable.put("func", "bbs_004");
				inputTable.put("hit", "N");
			}
			else
			{
				message = "�� ������ ������ �߻��Ͽ����ϴ�.";
				inputTable.put("func", "bbs_005");
			}

			moveType = "FW";
			mode = "T";
			stepUrl = "/bbsServlet.mo";
		}
		/** �Խ��� �ۻ��� */
		else if(func.equals("bbs_007"))
		{
			String id = (String)session.getAttribute("id");
			String seq = request.getParameter("seq");
			String step = request.getParameter("step");
			String client = request.getRemoteAddr();

			inputTable.put("id", id);
			inputTable.put("seq", seq);
			inputTable.put("step", step);
			inputTable.put("client", client);

			BbsReplyCntBean brcb = new BbsReplyCntBean();
			brcb.setDataTable(inputTable);
			brcb.funcExecute();
			ArrayList bbsReplyCntList = brcb.getDataList();

			if(bbsReplyCntList.size()==0)	//����� ������ 0�̾�߸� ���� �� �ִ�.
			{
				BbsDeleteBean bdb = new BbsDeleteBean();
				bdb.setDataTable(inputTable);
				bdb.funcExecute();
				ArrayList resultList = bdb.getDataList();

				int resultCount = Integer.parseInt((String)((Hashtable)resultList.get(0)).get("COUNT"));
				if(resultCount>0)
				{
					message = "���� ���� �Ǿ����ϴ�.";
					inputTable.put("func", "bbs_001");
				}
				else
				{
					message = "�� ���� �۾� �� Error�� �߻� �Ͽ����ϴ�.";
					inputTable.put("func", "bbs_004");
					inputTable.put("hit", "N");
				}
			}
			else
			{
				message = "�ش� �ۿ��� ����� ��ϵǾ� �����Ƿ� ������ �Ұ��� �մϴ�. �����ڿ��� �����ϼ���.";
				inputTable.put("func", "bbs_004");
				inputTable.put("hit", "N");
			}

			moveType = "FW";
			mode = "T";
			stepUrl = "/bbsServlet.mo";
		}
		/** ��۾��� */
		else if(func.equals("bbs_008"))
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
			if(bi.getFileYn())	//�׳� write�� ����.
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

			BbsReplyWriteBean brwb = new BbsReplyWriteBean();
			brwb.setDataTable(inputTable);
			brwb.funcExecute();
			ArrayList resultList = brwb.getDataList();

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

				inputTable.put("func", "bbs_001");
			}
			else
			{
				message = "��� ��� �� ������ �߻��Ͽ����ϴ�.";
				inputTable.put("func", "bbs_004");
				inputTable.put("hit", "N");
			}

			moveType = "FW";
			mode = "T";
			stepUrl = "/bbsServlet.mo";
		}
		/** ��۾��� */
		else if(func.equals("bbs_009"))
		{
			String id = (String)session.getAttribute("id");
			String seq = request.getParameter("seq");
			String content = request.getParameter("content");
			String client = request.getRemoteAddr();

			inputTable.put("id", id);
			inputTable.put("seq", seq);
			inputTable.put("content", entoKo(content));
			inputTable.put("client", client);

			BbsAddWriteBean bawb = new BbsAddWriteBean();
			bawb.setDataTable(inputTable);
			bawb.funcExecute();
			ArrayList resultList = bawb.getDataList();

			int resultCount = Integer.parseInt((String)((Hashtable)resultList.get(0)).get("COUNT"));
			if(resultCount>0)
			{
				message = "����� ���������� ��ϵǾ����ϴ�.";
			}
			else
			{
				message = "��� ��� �� ������ �߻��Ͽ����ϴ�.";
			}

			inputTable.put("func", "bbs_004");
			inputTable.put("hit", "N");

			moveType = "FW";
			mode = "T";
			stepUrl = "/bbsServlet.mo";
		}
		/** �Խ��� ���� ���� */
		else if(func.equals("bbs_010"))
		{
			HttpSession session = request.getSession(false);
			String id = (String)session.getAttribute("id");
			String addSeq = request.getParameter("addSeq");
			String seq = request.getParameter("seq");
			String client = request.getRemoteAddr();

			inputTable.put("id", id);
			inputTable.put("addSeq", addSeq);
			inputTable.put("seq", seq);
			inputTable.put("client", client);

			BbsAddDeleteBean badb = new BbsAddDeleteBean();
			badb.setDataTable(inputTable);
			badb.funcExecute();
			ArrayList resultList = badb.getDataList();

			int resultCount = Integer.parseInt((String)((Hashtable)resultList.get(0)).get("COUNT"));
			if(resultCount>0)
			{
				message = "����� �����Ǿ����ϴ�.";
			}
			else
			{
				message = "��� ���� �� ������ �߻��Ͽ����ϴ�.";
			}

			inputTable.put("func", "bbs_004");
			inputTable.put("hit", "N");

			moveType = "FW";
			mode = "T";
			stepUrl = "/bbsServlet.mo";
		}
	}
}