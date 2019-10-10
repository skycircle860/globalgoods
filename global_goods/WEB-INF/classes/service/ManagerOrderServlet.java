package service;
import java.text.SimpleDateFormat;
import common.main.*;
import common.util.*;
import order.*;

import java.io.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;

import com.oreilly.servlet.*;
import com.oreilly.servlet.multipart.*;

public class ManagerOrderServlet extends MainServlet
{
	protected MultipartRequest multi;
	protected String savePath;
	protected String saveRoot;

	public void init(ServletConfig config) throws ServletException 
	{
		super.init(config);

		try
		{	
			saveRoot = confRoot + (String)((Hashtable)confTable.get("FILE_UPLOAD")).get("GOODS");	//���μ������� ���� ���ؽ�Ʈ�� ���� �� ��Ʈ ��ο�
			System.out.println("replaceAll : "+saveRoot.replaceAll("\\\\", "/"));
			saveRoot = saveRoot.replaceAll("\\\\", "/");
			System.out.println("saveRoot : "+saveRoot);
		}	//���� �����																//Static �������̺� �ӿ��� ���� ���ε� ���� ���� ������ BBS������ ��. ��.�Խ��ǿ��� ���ε� �������� ���� ���
		catch(Exception e)
		{
			System.out.println("############### �ý��� GoodsServlet.init() Error �Դϴ�.");
			System.out.println("Exeception name : "+e);
		}
	}

	public void performTask(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, Exception
	{
			// saveRoot = "I:/00_Project/upfile";

			String today = getToday("yyyyMMdd");
			String year = today.substring(0, 4);
			String month = today.substring(4, 6);
			String day = today.substring(6, 8);

		
		if((request.getContentType()) != null && (request.getContentType()).startsWith("multipart"))
		{System.out.println("��Ƽ��Ʈ �˻籸�� ���Ȯ��");
			File dayFile = new File(saveRoot+"/"+year+"/"+month, day);
			System.out.println(dayFile);
			if(!dayFile.exists())
			{System.out.println("�������� ��� Ȯ��");
				dayFile.mkdirs();
			}
			

			savePath = saveRoot+"/"+year+"/"+month+"/"+day;	// ������ ���丮 (������)
			int sizeLimit = 1000 * 1024 * 1024; // 1000�ް����� ���� �Ѿ�� ���ܹ߻�
			System.out.println("004 move3");
			multi = new MultipartRequest(request, savePath, sizeLimit, "KSC5601", new DefaultFileRenamePolicy());
			
			
			func = multi.getParameter("func");


		}
		
		String pageNum = request.getParameter("pageNum");
		
		if(pageNum==null || pageNum.length()<=0)
		{
			pageNum = "1";
		}

		String articlePerPage = request.getParameter("articlePerPage");
		if(articlePerPage==null || articlePerPage.length()<=0)
		{
			articlePerPage = "15";
		}

		String pageType = request.getParameter("pageType");
		if(pageType==null || pageType.length()<=0)
		{
			pageType = "T";
		}

		
		
		inputTable.put("pageNum", pageNum);
		inputTable.put("articlePerPage", articlePerPage);
		inputTable.put("pageType", pageType);
	
		
		// �ֹ� ���
		if(func.equals("managerOrder_001"))
		{
			String sort = "A";

			if(request.getParameter("sort") != null)
			{
				sort = request.getParameter("sort");
			 
			}
			inputTable.put("sort",sort);
		 
			OrderListPageBean olpb = new OrderListPageBean();
			olpb.setDataTable(inputTable);
			olpb.funcExecute();
			ArrayList orderInfoList = olpb.getDataList();
			inputTable = (Hashtable)orderInfoList.get(0);
			
			inputTable.put("sort",sort);          //�ʱ�ȭ�Ǵ� inputTable�� sort�� ����ϱ� ���� 
																		//�ѹ� �� ���� �־� ��.
		 
			OrderListBean olb = new OrderListBean();
			olb.setDataTable(inputTable);
			olb.funcExecute();
			ArrayList orderList = olb.getDataList();



			outputTable.put("orderList", orderList);
			
 
			moveType = "FW";
			mode = "S";
			mainUrl = "/manager/admin/OrderList.jsp";
		}
			
		// ��ǰ���� ����
		if(func.equals("managerOrder_002"))       //���⼭ ����
		{
			System.out.println((String)request.getParameter("code"));
			
			System.out.println("state1===="+(String)request.getParameter("state"));

			inputTable.put("code",request.getParameter("code"));
			inputTable.put("state",request.getParameter("state"));


			OrderInfoListBean oilb = new OrderInfoListBean();
			oilb.setDataTable(inputTable);
			oilb.funcExecute();
			ArrayList orderInfoList = oilb.getDataList();


			outputTable.put("state",request.getParameter("state"));

			outputTable.put("orderInfoList", orderInfoList);
			

			moveType = "FW";
			mode = "S";
			mainUrl = "/manager/admin/OrderInfoList.jsp";

		}
	
		//��ǰ��� ����������

		if(func.equals("managerOrder_003"))         //���⼭ ����
		{
			
			
			System.out.println("middlecategory ===="+request.getParameter("middlecategory"));
			System.out.println("003 �̵�");
			String maincategory = "A";
			String middlecategory = "A";
		    
			if((String)request.getParameter("maincategory") !=null)
			{
				maincategory = (String)request.getParameter("maincategory");
				System.out.println("main 003 test " + maincategory);
			}

			if((String)request.getParameter("maincategory") !=null && (String)request.getParameter("middlecategory") !=null)
			{
				middlecategory= (String)request.getParameter("middlecategory");
				
				
				System.out.println("if�� ���� Ȯ��");
				System.out.println("middlecategory031===="+middlecategory);
			}
			System.out.println("middlecategory32 ===="+middlecategory);
			
			inputTable.put("maincategory",maincategory);
			inputTable.put("middlecategory",middlecategory);
			
			ItemSelectBean isb = new ItemSelectBean();
			isb.setDataTable(inputTable);
			isb.funcExecute();
			ArrayList ItemSelectList = isb.getDataList();
			
			
			SubcategorySelectBean ssb = new SubcategorySelectBean();
			ssb.setDataTable(inputTable);
			ssb.funcExecute();

			ArrayList SubSelectList = ssb.getDataList();
			
			
			outputTable.put("maincategory",maincategory);
			outputTable.put("middlecategory",middlecategory);
			outputTable.put("ItemSelectList",ItemSelectList);
			outputTable.put("SubSelectList",SubSelectList);
			


			moveType = "FW";
			mode = "S";
			mainUrl = "/manager/admin/GoodsAddInfo.jsp";
		}

		// ��ǰ���
		if(func.equals("managerOrder_004"))
		{
			System.out.println("004 move");
			
			String maincategory = (String)multi.getParameter("maincategory");
			String middlecategory =(String)multi.getParameter("middlecategory");
			String subcategory =(String)multi.getParameter("subcategory");
			String name = (String)multi.getParameter("name");
			String orgPrice = (String)multi.getParameter("orgPrice");
			String parPrice = (String)multi.getParameter("parPrice");
			String country = (String)multi.getParameter("country");
			String company = (String)multi.getParameter("company");
			String goodsComment = (String)multi.getParameter("goodsComment");
			String quantity = (String)multi.getParameter("quantity");	
			String goodsAmount = (String)multi.getParameter("goodsAmount");
			
			String id = (String)session.getAttribute("id");
			String client = request.getRemoteAddr();
			String getFileYn =  (String)multi.getParameter("getFileYn");
			
		
			System.out.println("maincategory"+maincategory);
			System.out.println("middlecategory"+middlecategory);
			System.out.println("subcategory"+subcategory);
			System.out.println("name"+name);
			System.out.println("orgPrice"+orgPrice);
			System.out.println("parPrice"+parPrice);
			System.out.println("country"+country);
			System.out.println("company"+company);
			System.out.println("goodsComment"+goodsComment);
			System.out.println("quantity"+quantity);
			System.out.println("goodsAmount"+goodsAmount);
			System.out.println("id"+id);
			System.out.println("client"+client);
			System.out.println("getFileYn"+getFileYn);
			

			System.out.println("004 �̵�");
			inputTable.put("maincategory",maincategory);
			inputTable.put("middlecategory",middlecategory);
			inputTable.put("subcategory",subcategory);
			inputTable.put("name",name);
			inputTable.put("orgPrice",orgPrice);
			inputTable.put("parPrice",parPrice);
			inputTable.put("country",country);
			inputTable.put("company",company);
			inputTable.put("goodsComment",goodsComment);
			inputTable.put("quantity",quantity);
			inputTable.put("goodsAmount",goodsAmount);

			inputTable.put("id",id);
			inputTable.put("client",client);
			inputTable.put("getFileYn",getFileYn);

			System.out.println("004 input");
			
		
			
			
			ArrayList uploadFileList = new ArrayList();

			if(getFileYn.equals("Y"))
			{
				System.out.println("004 if");
			
				Enumeration formNames=multi.getFileNames();  // form ���� �̸� ��ȯ

				while (formNames.hasMoreElements())
				{
					String formName=(String)formNames.nextElement(); // ���ε� �ϴ� ������ ���� ��� while �� ���
					String orgFileName=multi.getOriginalFileName(formName); // ���ε�� ������ �̸� ���
					String saveFileName=multi.getFilesystemName(formName); // ���ε�Ǿ� ����� ������ �̸� ���
						
					System.out.println("formName =="+formName);
					System.out.println("orgFileName =="+orgFileName);
					System.out.println("saveFileName =="+saveFileName);

					if(saveFileName!=null && saveFileName.length()>0)
					{
							System.out.println("004 IF ");	
							Hashtable tempFileTable = new Hashtable();
							tempFileTable.put("savePath", savePath);
							tempFileTable.put("orgFileName", orgFileName);
							tempFileTable.put("saveFileName", saveFileName);
							uploadFileList.add(tempFileTable);
							System.out.println("004 filelist");
				
					}
				}
				
				System.out.println("004 input2");
			
				inputTable.put("uploadFile", uploadFileList);
			}

			GoodsAddBean gab = new GoodsAddBean();
			gab.setDataTable(inputTable);
			gab.funcExecute();
			
			ArrayList resultList = gab.getDataList();

			System.out.println("004 addbean");
			
			int resultCount = Integer.parseInt((String)((Hashtable)resultList.get(0)).get("COUNT"));
			if(resultCount>0)
			{
				int uploadFileCount = Integer.parseInt((String)inputTable.get("uploadFile"));
				if(uploadFileCount<uploadFileList.size())
				{
					message = "���� ���������� ��ϵǾ�����, ������ �Ϻθ� ��ϵǾ����ϴ�. �����ڿ��� �����ϼ���.";
				}
				else
				{
					message = "���� ���������� ��ϵǾ����ϴ�.";
				}

				inputTable.put("func", "managerOrder_001");
		
			}
			else
			{
				message = "�� ����� ������ �߻��Ͽ����ϴ�.";
				inputTable.put("func", "managerOrder_002");
			}
			
			moveType = "FW";
			mode = "T";
			mainUrl = "/AdminPageMain.jsp";
		}


		//ǰ�� �߰� ���� ����������

		if(func.equals("managerOrder_005"))
		{
			System.out.println("005 �̵�");
			String maincategory = "A";
			if((String)request.getParameter("maincategory") !=null)
			{
				maincategory = (String)request.getParameter("maincategory");
				System.out.println("main 005 test " + maincategory);
			}

			inputTable.put("maincategory",maincategory);

			ItemSelectBean isb = new ItemSelectBean();
			isb.setDataTable(inputTable);
			isb.funcExecute();
			ArrayList ItemSelectList = isb.getDataList();

			System.out.println("maincategory =="+maincategory);

			outputTable.put("maincategory",maincategory);
			outputTable.put("ItemSelectList",ItemSelectList);
			System.out.println("test t ========");
			
			moveType = "FW";
			mode = "S";
			mainUrl = "/manager/admin/MiddleCategory.jsp";
		}

		//ǰ�� �߰�

		if(func.equals("managerOrder_006"))
		{
			System.out.println("006 �̵�");
			
			String maincategory= (String)request.getParameter("maincategory");
			String id = (String)session.getAttribute("id");
			String client = request.getRemoteAddr();
			String name =(String)request.getParameter("middlecategory");
			
			
			inputTable.put("id",id);
			inputTable.put("maincategory",maincategory);
			inputTable.put("name",entoKo(name));
			inputTable.put("client",client);
			

			MiddleCategoryAddBean mcab = new MiddleCategoryAddBean();
			mcab.setDataTable(inputTable);
			mcab.funcExecute();
			
			ArrayList resultList = mcab.getDataList();

			int resultCount = Integer.parseInt((String)((Hashtable)resultList.get(0)).get("COUNT"));
			if(resultCount>0)
			{
				message = "�۾��� ���������� ����Ǿ����ϴ�.";
			}
			else
			{
				message = "�۾� ������ Error�� �߻��Ͽ����ϴ�.";
			}

			stepUrl = "/managerOrderServlet.mo?func=managerOrder_005";
			moveType = "FW";
			mode = "T";
		}
		
		// ǰ�� ��� ����
		if(func.equals("managerOrder_007"))
		{
			String code = request.getParameter("code");
			String yn = request.getParameter("yn");
			String client = request.getRemoteAddr();
			String maincategory = request.getParameter("maincategory");
		


			inputTable.put("code",code);
			inputTable.put("yn",yn);
			inputTable.put("client",client);
			inputTable.put("id",session.getAttribute("id"));
			
			
			CategoryUseYnBean cuyb = new CategoryUseYnBean();
			cuyb.setDataTable(inputTable);
			cuyb.funcExecute();
			ArrayList resultList = cuyb.getDataList();

			int resultCount = Integer.parseInt((String)((Hashtable)resultList.get(0)).get("COUNT"));

			if(resultCount>0)
			{
				message="�۾��� ���������� ���� �Ǿ����ϴ�.";
			}

			else
			{
				message = "�۾� ���� �� Error�� �߻��Ͽ����ϴ�.";

			}

			stepUrl = "/managerOrderServlet.mo?func=managerOrder_005&maincategory="+maincategory;
			moveType="FW";
			mode="T";




		}
		//���� ī�װ� �߰� �������� �̵�. (�߰��� 11��)


		if(func.equals("managerOrder_008"))
		{
			System.out.println("008 �̵�");
			String maincategory = "A";         //������ �������Խ� ����ī�װ��� ���� �Ǿ����� �����Ƿ� �ӽ÷� ���� �־� ����Ʈ���
			String middlecategory="A";
			if((String)request.getParameter("maincategory") !=null)   //����ī�װ��� �����ϸ� �������� �������Ͽ� ����Ʈ���
			{
				maincategory = (String)request.getParameter("maincategory");
				System.out.println("main 005 test " + maincategory);
			}

			if((String)request.getParameter("maincategory") !=null && (String)request.getParameter("middlecategory") !=null)
			{
				if (((String)request.getParameter("middlecategory")).length() > 0)
				{
					middlecategory= (String)request.getParameter("middlecategory");
					System.out.println("middlecategory22 ===="+middlecategory);
					System.out.println("if�� ���� Ȯ��");
				}
			}

			System.out.println("middlecategory33 ===="+middlecategory);

			inputTable.put("maincategory",maincategory);
			inputTable.put("middlecategory",middlecategory);
			
			
			ItemSelectBean isb = new ItemSelectBean();
			isb.setDataTable(inputTable);
			isb.funcExecute();
			ArrayList ItemSelectList = isb.getDataList();

			System.out.println("maincategory =="+maincategory);

			SubcategorySelectBean ssb = new SubcategorySelectBean();
			ssb.setDataTable(inputTable);
			ssb.funcExecute();

			ArrayList SubSelectList = ssb.getDataList();

			outputTable.put("SubSelectList",SubSelectList);
			
			outputTable.put("middlecategory",middlecategory);
			outputTable.put("maincategory",maincategory);
			outputTable.put("ItemSelectList",ItemSelectList);
			System.out.println("test t ========");
		
			moveType = "FW";
			mode = "S";
			mainUrl = "/manager/admin/SubCategory.jsp";



		}
		
		//��ǰ��� �������� �̵�.
		if(func.equals("managerOrder_009"))
		{
			System.out.println("009 �̵�");


			ReturnOrderListPageBean rolpb = new ReturnOrderListPageBean();

			 
			rolpb.setDataTable(inputTable);
			rolpb.funcExecute();
			ArrayList ReturnInfoList = rolpb.getDataList();
			inputTable = (Hashtable)ReturnInfoList.get(0);


			ReturnOrderListBean rolb = new ReturnOrderListBean();
			rolb.setDataTable(inputTable);
			rolb.funcExecute();
			ArrayList ReturnOrderList = rolb.getDataList();
			


			outputTable.put("ReturnOrderList", ReturnOrderList);
			

			moveType = "FW";
			mode = "S";
			mainUrl = "/manager/admin/ReturnOrderList.jsp";
		}

		//��ǰ�������� ���


		if(func.equals("managerOrder_010"))   
		{
			String state = (String)request.getParameter("state");
			String cancleYn = (String)request.getParameter("cancleYn");
			String depositYn = (String)request.getParameter("depositYn");
			
			System.out.println("cancleYn ==="+cancleYn);
			

			if (state !=null)
			{
				depositYn = 	"Y";
				System.out.println("depositYn====="+depositYn);
			}
		
			if(cancleYn == null)
			{
				cancleYn ="N";
				System.out.println("cancleYn====="+cancleYn);
			}
			
		

			System.out.println("cancleYn====="+cancleYn);	
			System.out.println("10��state====="+request.getParameter("state"));
			System.out.println("code====="+request.getParameter("code"));
			System.out.println("cancleYn====="+cancleYn);
			inputTable.put("state",state);
			inputTable.put("cancleYn",cancleYn);
			
			inputTable.put("depositYn",depositYn);
			inputTable.put("code",request.getParameter("code"));
			inputTable.put("id",session.getAttribute("id"));
			inputTable.put("client",request.getRemoteAddr());
		
			System.out.println("state2====="+request.getParameter("state"));
			
			System.out.println("010 �̵�");
			OrderInfoUpdateBean oiub = new OrderInfoUpdateBean();
			oiub.setDataTable(inputTable);
			oiub.funcExecute();
			ArrayList OrderUpdateList = oiub.getDataList();


			System.out.println("cancleYn====="+cancleYn);
			outputTable.put("OrderUpdateList", OrderUpdateList);
			

			stepUrl = "/managerOrderServlet.mo?func=managerOrder_001";
			moveType = "FW";
			mode = "T";
		}
		
		//����ī�װ� �߰�.

		if(func.equals("managerOrder_011"))
		{

			System.out.println("011 �̵�");
			
			
			String maincategory= (String)request.getParameter("maincategory");
			String id = (String)session.getAttribute("id");
			String client = request.getRemoteAddr();
			String middlecategory =(String)request.getParameter("middlecategory");
			String subcategory = (String)request.getParameter("subcategory");
			
			

			inputTable.put("id",id);
			inputTable.put("subcategory",entoKo(subcategory));
			inputTable.put("maincategory",maincategory);
			inputTable.put("middlecategory",middlecategory);
			inputTable.put("client",client);
			
			System.out.println("011 �̵�3");
			SubCategoryAddBean scab = new SubCategoryAddBean();
			scab.setDataTable(inputTable);
			scab.funcExecute();
			System.out.println("011 �̵�4");
			ArrayList resultList = scab.getDataList();

			int resultCount = Integer.parseInt((String)((Hashtable)resultList.get(0)).get("COUNT"));
			if(resultCount>0)
			{
				message = "�۾��� ���������� ����Ǿ����ϴ�.";
			}
			else
			{
				message = "�۾� ������ Error�� �߻��Ͽ����ϴ�.";
			}

			stepUrl = "/managerOrderServlet.mo?func=managerOrder_008";
			moveType = "FW";
			mode = "T";

		}

     //ǰ�� ������������ �̵�
	 	if(func.equals("managerOrder_012"))
		{
			System.out.println("012 �̵�");
			String code = (String)request.getParameter("code");
			
			inputTable.put("code",code);

			MiddleInfoBean mib = new MiddleInfoBean();
			mib.setDataTable(inputTable);
			mib.funcExecute();
			ArrayList MiddleInfoList = mib.getDataList();
			outputTable.put("MiddleInfoList",MiddleInfoList);
			
			System.out.println("test t ========");
			moveType = "FW";
			mode = "S";
			mainUrl = "/manager/admin/MiddleCategoryUpdate.jsp";
		}

		 
		 //ǰ�� ����
		if(func.equals("managerOrder_013"))
		{
			
			String code = (String)request.getParameter("code");
			String client = request.getRemoteAddr();
			String id = (String)session.getAttribute("id");
			String name =(String)request.getParameter("name");
			String maincategory = (String)request.getParameter("maincategory");
			
			inputTable.put("maincategory", maincategory);
			inputTable.put("useYn",request.getParameter("yn"));
			inputTable.put("name",entoKo(name));
			inputTable.put("client",client);
			inputTable.put("id",id);
			
			inputTable.put("code",code);

			MiddleUpdateBean mub = new MiddleUpdateBean();
			mub.setDataTable(inputTable);
			mub.funcExecute();
			ArrayList resultList = mub.getDataList();
			outputTable.put("resultList",resultList);
			
			System.out.println("test t ========");
			
			stepUrl = "/managerOrderServlet.mo?func=managerOrder_005";
			moveType = "FW";
			mode = "T";
		}

		//ǰ�� �������������� �̵�
	 	if(func.equals("managerOrder_014"))
		{
			System.out.println("014 �̵�");
			String code = (String)request.getParameter("code");
			
			inputTable.put("code",code);

			MiddleInfoBean mib = new MiddleInfoBean();
			mib.setDataTable(inputTable);
			mib.funcExecute();
			ArrayList MiddleInfoList = mib.getDataList();
			outputTable.put("MiddleInfoList",MiddleInfoList);
			
			System.out.println("test t ========");
			moveType = "FW";
			mode = "S";
			mainUrl = "/manager/admin/MiddleCategoryInfo.jsp";
		}

		//ī�װ� �߰�����
	 	if(func.equals("managerOrder_015"))
		{

			String code = request.getParameter("code");
			String yn = request.getParameter("yn");
			String client = request.getRemoteAddr();
			
			inputTable.put("code",code);
			inputTable.put("yn",yn);
			inputTable.put("client",client);
			inputTable.put("id",session.getAttribute("id"));
			
			
			SubCategoryUseYnBean scuyb = new SubCategoryUseYnBean();
			scuyb.setDataTable(inputTable);
			scuyb.funcExecute();
			ArrayList resultList = scuyb.getDataList();

			int resultCount = Integer.parseInt((String)((Hashtable)resultList.get(0)).get("COUNT"));

			if(resultCount>0)
			{
				message="�۾��� ���������� ���� �Ǿ����ϴ�.";
			}

			else
			{
				message = "�۾� ���� �� Error�� �߻��Ͽ����ϴ�.";

			}

			stepUrl = "/managerOrderServlet.mo?func=managerOrder_008";
			moveType="FW";
			mode="T";

		}

		 //ī�װ� ����
		if(func.equals("managerOrder_016"))
		{
			
			String code = (String)request.getParameter("code");
			String client = request.getRemoteAddr();
			String id = (String)session.getAttribute("id");
			String name =(String)request.getParameter("name");
			String middlecategory = (String)request.getParameter("middlecategory");
			String maincategory = (String)request.getParameter("maincategory");
			
			inputTable.put("useYn",request.getParameter("yn"));
			inputTable.put("name",entoKo(name));
			inputTable.put("client",client);
			inputTable.put("id",id);
			inputTable.put("maincategory", maincategory);
			inputTable.put("middlecategory", middlecategory);
			
			inputTable.put("code",code);

			SubUpdateBean sub = new SubUpdateBean();
			sub.setDataTable(inputTable);
			sub.funcExecute();
			ArrayList resultList = sub.getDataList();
			outputTable.put("resultList",resultList);
			
			System.out.println("test t 016 ========");

			stepUrl = "/managerOrderServlet.mo?func=managerOrder_008";
			moveType = "FW";
			mode = "T";
		}

		//ī�װ� �������������� �̵�
	 	if(func.equals("managerOrder_017"))
		{
			String code = (String)request.getParameter("code");
			System.out.println("017 �̵� code : "+code);

			inputTable.put("code",code);

			SubInfoBean sib = new SubInfoBean();
			sib.setDataTable(inputTable);
			sib.funcExecute();
			ArrayList SubInfoList = sib.getDataList();
			outputTable.put("SubInfoList",SubInfoList);
			
			System.out.println("test t 017 ========");
			moveType = "FW";
			mode = "S";
			mainUrl = "/manager/admin/SubCategoryInfo.jsp";
		}
		//ī�װ� ������������ �̵�
	 	if(func.equals("managerOrder_018"))
		{
			System.out.println("018 �̵�");
			String code = (String)request.getParameter("code");
			System.out.println("018�� �Ѿ�� code : " + code);
			inputTable.put("code",code);

			SubInfoBean sib = new SubInfoBean();
			sib.setDataTable(inputTable);
			sib.funcExecute();
			ArrayList SubInfoList = sib.getDataList();
			outputTable.put("SubInfoList",SubInfoList);

			ItemSelectBean isb = new ItemSelectBean();
			isb.setDataTable(inputTable);
			isb.funcExecute();
			ArrayList ItemSelectList = isb.getDataList();
			outputTable.put("ItemSelectList",ItemSelectList);
			
			System.out.println("test t 018 ========");
			moveType = "FW";
			mode = "S";
			mainUrl = "/manager/admin/SubCategoryUpdate.jsp";
		}
		

		//��ǰ ������ ���� ���̸�� ������ ����� managerOrder_024<<<
		//��ǰ ���� ����������               /////////////////////////////////////////////////////////////////////////////////////

		if(func.equals("managerOrder_019"))
		{
				

			System.out.println("019 �̵�");
				
			String code="";
			String maincategory="A";
			String middlecategory ="A";
				
			System.out.println((String)request.getParameter("from")+"�׽�ƮƮƮƮƮƮƮƮ");
			System.out.println((String)request.getParameter("middlecategory")+"�׽�ƮƮƮƮƮƮƮƮ");
				if(request.getParameter("from") != null)  //�׽�Ʈ �Ϸ��� orderList.jsp ���� �Ķ���͸� �־� ���� �̵��߱⶧���� 
																						// �����ڸ� �־� �и���Ŵ .(multi�� Ÿ�� �������� ����)
				{
					System.out.println("019 from �̵�");
					 code = (String)request.getParameter("code");
					System.out.println("code====="+code);
				
					       //������ �������Խ� ����ī�װ��� ���� �Ǿ����� �����Ƿ� �ӽ÷� ���� �־� ����Ʈ���
					if((String)request.getParameter("maincategory") !=null)   //����ī�װ��� �����ϸ� �������� �������Ͽ� ����Ʈ���
					{
						maincategory = (String)request.getParameter("maincategory");
						System.out.println("main 005 test " + maincategory);
					}

					if((String)request.getParameter("maincategory") !=null && (String)request.getParameter("middlecategory") !=null)
					{
						middlecategory= (String)request.getParameter("middlecategory");
						
						System.out.println("middlecategory22 ===="+middlecategory);
						System.out.println("if�� ���� Ȯ��");
					}
								

				}

				else
				{
					System.out.println("019 else(multi) �̵�");

					code = (String)multi.getParameter("code");
					System.out.println("code====="+code);
				
					         //������ �������Խ� ����ī�װ��� ���� �Ǿ����� �����Ƿ� �ӽ÷� ���� �־� ����Ʈ���
					if((String)multi.getParameter("maincategory") !=null)   //����ī�װ��� �����ϸ� �������� �������Ͽ� ����Ʈ���
					{
						maincategory = (String)multi.getParameter("maincategory");
						System.out.println("main 005 test " + maincategory);
					}

					if((String)multi.getParameter("maincategory") !=null && (String)multi.getParameter("middlecategory") !=null)
					{
						middlecategory= (String)multi.getParameter("middlecategory");
						
						System.out.println("middlecategory22 ===="+middlecategory);
						System.out.println("if�� ���� Ȯ��");
					}
				}

			System.out.println("middlecategory33 ===="+middlecategory);

			inputTable.put("maincategory",maincategory);
			inputTable.put("middlecategory",middlecategory);
			
			
			ItemSelectBean isb = new ItemSelectBean();
			isb.setDataTable(inputTable);
			isb.funcExecute();
			ArrayList ItemSelectList = isb.getDataList();

			SubcategorySelectBean ssb = new SubcategorySelectBean();
			ssb.setDataTable(inputTable);
			ssb.funcExecute();

			ArrayList SubSelectList = ssb.getDataList();

			outputTable.put("maincategory",maincategory);
			outputTable.put("middlecategory",middlecategory);
			outputTable.put("SubSelectList",SubSelectList);
			outputTable.put("ItemSelectList",ItemSelectList);
			
			System.out.println("test t ========");
			
			

			inputTable.put("code",code);
			
			GoodsSelectBean gub = new GoodsSelectBean();
			gub.setDataTable(inputTable);
			gub.funcExecute();

			ArrayList GoodsInfoList = gub.getDataList();
			outputTable.put("GoodsInfoList",GoodsInfoList);
	
				
			
			
			Hashtable goodsTable = (Hashtable)GoodsInfoList.get(0);
			goodsTable.put("code",code);         //������ �޾ƿ� �ڵ带 ���� ����. �̰� �ƴϸ� GoodsSelectBean���� �����͵� ��
			ItemFileManager Ifm = new ItemFileManager();
			ArrayList fileList = Ifm.getGoodsSimleImgList(goodsTable);
			outputTable.put("fileList", fileList);
			
			
		


			moveType = "FW";
			mode = "S";
			mainUrl = "/manager/admin/GoodsUpdateInfo.jsp";
			
		}

		//��ǰ��������������
		if(func.equals("managerOrder_020"))
		{
			System.out.println((String)request.getParameter("code"));
			
			System.out.println("020state3===="+(String)request.getParameter("state"));

			inputTable.put("code",request.getParameter("code"));
			inputTable.put("state",request.getParameter("state"));


			ReturnOrderInfoListBean roilb = new ReturnOrderInfoListBean();
			roilb.setDataTable(inputTable);
			roilb.funcExecute();
			ArrayList ReturnOrderInfoList = roilb.getDataList();


			outputTable.put("state",request.getParameter("state"));

			outputTable.put("ReturnOrderInfoList", ReturnOrderInfoList);
			

			moveType = "FW";
			mode = "S";
			mainUrl = "/manager/admin/ReturnOrderInfoList.jsp";
		}

		//��ǰ����
		if(func.equals("managerOrder_021"))
		{
			System.out.println("21��state====="+request.getParameter("state"));
			System.out.println("code====="+request.getParameter("code"));


			inputTable.put("code",request.getParameter("code"));
			inputTable.put("state",request.getParameter("state"));
			inputTable.put("id",session.getAttribute("id"));
			inputTable.put("client",request.getRemoteAddr());
			//inputTable.put("state",request.getParameter("state"));
			
			System.out.println("state2====="+request.getParameter("state"));
			
			System.out.println("021 �̵�");
			ReturnOrderInfoUpdateBean roiub = new ReturnOrderInfoUpdateBean();
			roiub.setDataTable(inputTable);
			roiub.funcExecute();
			ArrayList ReturnOrderUpdateList = roiub.getDataList();

			outputTable.put("ReturnOrderUpdateList", ReturnOrderUpdateList);
			

			stepUrl = "/managerOrderServlet.mo?func=managerOrder_009";
			moveType = "FW";
			mode = "T";
		}

		//��ҹ�ǰ ����
		//��ҹ�ǰ ����                                        //���⼭ ����
		if(func.equals("managerOrder_022"))
		{
			
			
			inputTable.put("code",request.getParameter("code"));
			inputTable.put("from" , request.getParameter("from"));
			inputTable.put("id",session.getAttribute("id"));
			inputTable.put("client",request.getRemoteAddr());
			//inputTable.put("state",request.getParameter("state"));
			
			 
			OrderDeleteBean odb = new OrderDeleteBean();
			odb.setDataTable(inputTable);
			odb.funcExecute();
			ArrayList OrderDeleteList = odb.getDataList();

			outputTable.put("OrderDeleteList", OrderDeleteList);
			

			stepUrl = "/managerOrderServlet.mo?func=managerOrder_001";
			moveType = "FW";
			mode = "T";
		}
		
		
		//��ǰ ����.
		if(func.equals("managerOrder_023"))
		{
			System.out.println("023 �̵�1");
			
			String id = (String)session.getAttribute("id");
			String maincategory = (String)multi.getParameter("maincategory");
			String middlecategory =(String)multi.getParameter("middlecategory");
			String subcategory =(String)multi.getParameter("subcategory");
			String name = (String)multi.getParameter("name");
			String orgPrice = (String)multi.getParameter("orgPrice");
			String parPrice = (String)multi.getParameter("parPrice");
			String country = (String)multi.getParameter("country");
			String company = (String)multi.getParameter("company");
			String goodsComment = (String)multi.getParameter("goodsComment");
			String quantity = (String)multi.getParameter("quantity");	
			String goodsAmount = (String)multi.getParameter("goodsAmount");
			String code = (String)multi.getParameter("code");

		
			String client = request.getRemoteAddr();
			String getFileYn =  (String)multi.getParameter("getFileYn");
			
			String[] deleteFileArray = new String[0];
			ArrayList uploadFileList = new ArrayList();

			System.out.println("023 �̵�2");
			inputTable.put("code",code);
			inputTable.put("maincategory",maincategory);
			inputTable.put("middlecategory",middlecategory);
			inputTable.put("subcategory",subcategory);
			inputTable.put("name",name);
			inputTable.put("orgPrice",orgPrice);
			inputTable.put("parPrice",parPrice);
			inputTable.put("country",country);
			inputTable.put("company",company);
			inputTable.put("goodsComment",goodsComment);
			inputTable.put("quantity",quantity);
			inputTable.put("goodsAmount",goodsAmount);

			inputTable.put("id",id);
			inputTable.put("client",client);
			inputTable.put("getFileYn",getFileYn);
			System.out.println("004 input");
			
			
			
			
			if(multi.getParameterValues("deleteFile") != null)
			{
				deleteFileArray = multi.getParameterValues("deleteFile");   //���� üũ�� ��ϵ��� string �迭�� �ִ´�. 
			}

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
			inputTable.put("deleteFile", deleteFileArray);
			inputTable.put("uploadFile", uploadFileList);
			
		
			GoodsUpdateBean gudb = new GoodsUpdateBean();
			gudb.setDataTable(inputTable);
			gudb.funcExecute();

			
			ArrayList resultList = gudb.getDataList();

			System.out.println("023 addbean");
			
				
			moveType = "FW";
			mode = "T";
			mainUrl = "/AdminPageMain.jsp";
			
		}

		//��ǰ���̸��
		else if(func.equals("managerOrder_024"))
		{
			GoodsSimpleListBean gslb = new GoodsSimpleListBean();
			gslb.funcExecute();
			ArrayList ReturnGoodsSimpleList = gslb.getDataList();
		
			outputTable.put("ReturnGoodsSimpleList", ReturnGoodsSimpleList);

			moveType = "FW";
			mode = "S";
			mainUrl = "/manager/admin/goodsAdminList.jsp";
		}
		//��ǰ�������
		else if(func.equals("managerOrder_025"))
		{
			String code = request.getParameter("code");
			String disp_yn = request.getParameter("disp_yn");

			inputTable.put("code", code);
			inputTable.put("disp_yn",disp_yn);

			GoodsDeleteBean gdb = new GoodsDeleteBean();
			gdb.setDataTable(inputTable);
			gdb.funcExecute();

			outputTable.put("disp_yn",disp_yn);

		//	moveType = "FW";
		//	mode = "S";
		//	mainUrl = "/manager/admin/goodsAdminList.jsp";

			stepUrl = "/managerOrderServlet.mo?func=managerOrder_024";
			moveType = "FW";
			mode = "T";

		
		}

	}
	//performTesk();

	public String getToday(String datePattern)
	{
		Calendar cal = Calendar.getInstance();
		SimpleDateFormat formatter = new SimpleDateFormat(datePattern,  new Locale("ko","KOREA"));
		String result = formatter.format(cal.getTime());
		return result;
	}
}