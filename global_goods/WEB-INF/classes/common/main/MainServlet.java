/*****************************************************************************
 * �����̸� : MainServlet.java
 * ���ϳ��� : ��� ���� ���Ͽ��� ����� �޾� ����ϴ� �������ν� �������� ����Ѵ�.
*****************************************************************************/
package common.main;

import java.io.*;
import java.util.*;

import javax.servlet.*;
import javax.servlet.http.*;

import common.db.DBManager;
import common.conf.ReadConf;

public abstract class MainServlet extends HttpServlet
{
	private ServletContext sc;

	protected String confRoot;
	protected Hashtable confTable;

	protected String contentType;

	protected String func = "";
	protected String mode = "S";
	protected String moveType = "SR";
	protected String moveUrl = "/common/Frame.jsp";
	protected String mainUrl = "/common/Main.jsp";
	protected String stepUrl = "/commonServlet.mo";
	protected String ajaxUrl = "";

	protected String message;

	protected Hashtable inputTable;
	protected Hashtable outputTable;

	protected HttpSession session;

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
			sc = getServletContext();
			confRoot = sc.getRealPath("/");	//���� ���ؽ�Ʈ���� ���� ������Ʈ�� ��Ʈ ��θ� ����

			ReadConf rc = ReadConf.getReadConf(); //����ƽ����� �޼ҵ带 ���� ReadConf��ü ����
			confTable = rc.getConfTable();		//���� ���ϵ��� ����ִ� ���̺� ����
			if(confTable == null)
			{
				System.out.println("\n\n************************** SERVICE START **************************************\n");

				rc.setReadData(confRoot);	//��Ʈ �ּҸ� �Ѱ� �װ��� conf (��Ʈ��������)�� ����
				confTable = rc.getConfTable();	//��� ��ȯ (���� �������� ������ ���̺� �������)
			}

			contentType = (String)((Hashtable)confTable.get("CONTENT_TYPE")).get("CONTENT_TYPE");	//���ؽ�Ʈ Ÿ�� ����

			if(DBManager.getConnectionPool() == null)
			{
				DBManager dbm = DBManager.getDBManager();
				dbm.createPool((Hashtable)confTable.get("DB_CONF"));//DB�������� �о�� ����
			}

			if(confTable == null || !confTable.containsKey("bbsInfoList"))	//bbsInfoList��� Ű�� �������� �ʾҴٸ�!!!!!!
			{
				// DB�� �ִ� �޴� ���� Loading
				rc.setReadDBData();	//�̰� ���λ�����ε� ȣ�⸸ �ϸ� ����ƽ�� confTable�� BBS ������ �־���.
			}//�̷��� �̴� �Լ����� ���ֱ⶧���� �Խ��� ���� ����� ���� �Ϸ��� ������ ���� Ű�ų�, �Խ����� �ϳ� ���� ����ϰų�
		}		//���� Ȥ�� �����ؾ� ���� ���ŵȴ� ���� ���� �ϰ� ������ ReadConf��ü�� ���� setReadDBData(); �� ȣ������� �Ѵ�.
		catch(Exception e)
		{
			System.out.println("############### �ý��� MainServlet.init() Error �Դϴ�.");
		}
	}

	/**
	 * ����		: Get����� ��û�� �����ϴ� Method�μ� performPreTask()�� ȣ���Ѵ�.
	 * �Է� ��	: HttpServletRequest request, HttpServletResponse response
	 * ��� ��	:
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
	{
		try
		{
			performPreTask(request, response);
		}
		catch(Exception e)
		{
			e.printStackTrace(System.out);
		}
	}

	/**
	 * ����		: Post����� ��û�� �����ϴ� Method�μ� performPreTask()�� ȣ���Ѵ�.
	 * �Է� ��	: HttpServletRequest request, HttpServletResponse response
	 * ��� ��	:
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response )
	{
		try
		{
			performPreTask(request, response);
		}
		catch(Exception e)
		{
			e.printStackTrace(System.out);
		}
	}

	/**
	 * ����		: Get & Post ����� ��� ��û�� �����ϴ� Method�μ� ���������� ���� ��õ�
	 * 				performTask()�� ����Ǳ� ���� ���� ������ �ϵ��� ����ϱ� ���� �ѹ� ��ġ�� Method
	 * �Է� ��	: HttpServletRequest req, HttpServletResponse res
	 * ��� ��	:
	 */
	public void performPreTask(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		try
		{
			session = request.getSession(false);
			if(session==null || session.getAttribute("loginYn")==null)
			{
				session = request.getSession(true);
				session.setAttribute("loginYn", "N");
			}

			if(request.getParameter("func")!=null && (request.getParameter("func")).length()>0)
			{
				func = request.getParameter("func");
			}

			inputTable = new Hashtable();
			outputTable = new Hashtable();

			// �α��� �ʿ��� �޴� �Ǵ� ������ �޴� �ɷ� ����
			if((func.equals("managerOrder_004") || func.equals("member_008") || func.equals("member_007") || func.equals("member_009") || func.equals("member_010")) && (session==null || session.getAttribute("loginYn")==null || ((String)session.getAttribute("loginYn")).equals("N")))
			{
				mode = "T";
				moveType = "FW";
				message = "�α����� �ʿ��� �޴� �Դϴ�. �α��� �Ŀ� �õ��ϼ���.";
				stepUrl = "/commonServlet.mo";
			}
			else if((func.startsWith("superMan") || func.startsWith("manager")) && (session==null || session.getAttribute("loginYn")==null || ((String)session.getAttribute("loginYn")).equals("N") || session.getAttribute("adminYn")==null || ((String)session.getAttribute("adminYn")).equals("N")))
			{
				mode = "T";
				moveType = "FW";
				message = "������ �޴� �Դϴ�. �̿� ������ �����ϴ�.";
				stepUrl = "/commonServlet.mo";
			}
			else
			{
				performTask(request, response);
			}

			if(mode.equals("S"))
			{
				moveUrl = "/common/Frame.jsp";
			}
			else if(mode.equals("P"))
			{
				moveUrl = "/common/Popup.jsp";
			}
			else if(mode.equals("I"))
			{
				moveUrl = "/common/IFrame.jsp";
			}
			else if(mode.equals("T"))
			{
				moveUrl = "/common/Step.jsp";
			}
			else if(mode.equals("A"))
			{
				moveUrl = ajaxUrl;
			}

			if(moveType.equals("SR"))
			{
				response.sendRedirect(moveUrl);
			}
			else if(moveType.equals("FW"))
			{
				if(mode.equals("T"))
				{
					request.setAttribute("stepUrl", stepUrl);
					request.setAttribute("message", message);
				}
				else
				{
					request.setAttribute("mainUrl", mainUrl);
					request.setAttribute("outputTable", outputTable);
				}
				request.setAttribute("inputTable", inputTable);

				(sc.getRequestDispatcher(moveUrl)).forward(request, response);
			}
		}
		catch(Throwable theException)
		{
			theException.printStackTrace();
			System.out.println(theException);
		}

		func = "";
		mode = "S";
		moveType = "SR";
		message = null;
		moveUrl = "/common/Frame.jsp";
		mainUrl = "/common/Main.jsp";
		stepUrl = "/commonServlet.mo";
		ajaxUrl = "";

		inputTable = null;
		outputTable = null;
	}

	/**
	 * ����		: abstract Method�μ� �� Class�� ��ӹ޴� ��� Servlet���� �ݵ�� �����ؾ� �ϴ� Method
	 * �Է� ��	: HttpServletRequest req, HttpServletResponse res
	 * ��� ��	:
	 */
	public abstract void performTask(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, Exception;

	/**
	 * ����		: �ѱ� ó���� ���� Method
	 * �Է� ��	: String en
	 * ��� ��	: String enKo
	 */
	protected String entoKo(String en)
	{
		

		String enKo = null;
		try
		{
			if (en != null && en != "")
			{
				String charset[] = {"KSC5601","8859_1", "ascii", "UTF-8", "EUC-KR", "MS949"};

				System.out.println("Not convert charset : " + en + "<br>");
				for(int i=0; i<charset.length ; i++)
				{
					for(int j=0 ; j<charset.length ; j++)
					{
						if(i==j)
						{
							continue;
						}
						else
						{
							System.out.println(charset[i]+" : "+charset[j]+" :" + new String (en.getBytes(charset[i]),charset[j])+"<br>");
						}
					}
				}  
			}


			enKo = new String(en.getBytes("8859_1"),"KSC5601");
		}
		catch(UnsupportedEncodingException e)
		{
			System.out.println(e);
		}
		return enKo;
	}
}