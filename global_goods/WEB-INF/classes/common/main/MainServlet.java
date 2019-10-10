/*****************************************************************************
 * 파일이름 : MainServlet.java
 * 파일내용 : 모든 서블릿 파일에서 상속을 받아 사용하는 서블릿으로써 서블릿에서 사용한다.
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
	 * 내    용	: Servlet에서 기본적으로 먼저 한번만 수행하는 Method로서 설정파일 Loading을 수행 
	 * 입력 값	: ServletConfig config
	 * 출력 값	:
	*/
	public void init(ServletConfig config) throws ServletException 
	{
		super.init(config);

		try
		{
			sc = getServletContext();
			confRoot = sc.getRealPath("/");	//서블릿 컨텍스트에서 현제 프로젝트의 루트 경로를 얻어옴

			ReadConf rc = ReadConf.getReadConf(); //스테틱선언된 메소드를 통해 ReadConf객체 얻어옴
			confTable = rc.getConfTable();		//설정 파일들이 들어있는 테이블 얻어옴
			if(confTable == null)
			{
				System.out.println("\n\n************************** SERVICE START **************************************\n");

				rc.setReadData(confRoot);	//루트 주소를 넘겨 그곳의 conf (루트설정파일)을 읽힘
				confTable = rc.getConfTable();	//결과 반환 (각종 설정파일 정보가 테이블에 담겨있음)
			}

			contentType = (String)((Hashtable)confTable.get("CONTENT_TYPE")).get("CONTENT_TYPE");	//컨텍스트 타입 뽑음

			if(DBManager.getConnectionPool() == null)
			{
				DBManager dbm = DBManager.getDBManager();
				dbm.createPool((Hashtable)confTable.get("DB_CONF"));//DB설정파일 읽어와 연결
			}

			if(confTable == null || !confTable.containsKey("bbsInfoList"))	//bbsInfoList라는 키를 포함하지 않았다면!!!!!!
			{
				// DB에 있는 메뉴 정보 Loading
				rc.setReadDBData();	//이게 새로생긴거인듯 호출만 하면 스테틱인 confTable에 BBS 정보를 넣어줌.
			}//이렇게 이닛 함수에서 해주기때문에 게시판 정보 목록을 갱신 하려면 서버를 껏다 키거나, 게시판을 하나 새로 등록하거나
		}		//수정 혹은 제거해야 새로 갱신된다 만약 갱신 하고 싶으면 ReadConf객체를 얻어와 setReadDBData(); 를 호출해줘야 한다.
		catch(Exception e)
		{
			System.out.println("############### 시스템 MainServlet.init() Error 입니다.");
		}
	}

	/**
	 * 내용		: Get방식의 요청을 수행하는 Method로서 performPreTask()를 호출한다.
	 * 입력 값	: HttpServletRequest request, HttpServletResponse response
	 * 출력 값	:
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
	 * 내용		: Post방식의 요청을 수행하는 Method로서 performPreTask()를 호출한다.
	 * 입력 값	: HttpServletRequest request, HttpServletResponse response
	 * 출력 값	:
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
	 * 내용		: Get & Post 방식의 모든 요청을 수행하는 Method로서 실질적으로 일이 명시될
	 * 				performTask()가 수행되기 전에 먼저 수행할 일들을 명시하기 위해 한번 거치는 Method
	 * 입력 값	: HttpServletRequest req, HttpServletResponse res
	 * 출력 값	:
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

			// 로그인 필요한 메뉴 또는 관리자 메뉴 걸러 내기
			if((func.equals("managerOrder_004") || func.equals("member_008") || func.equals("member_007") || func.equals("member_009") || func.equals("member_010")) && (session==null || session.getAttribute("loginYn")==null || ((String)session.getAttribute("loginYn")).equals("N")))
			{
				mode = "T";
				moveType = "FW";
				message = "로그인이 필요한 메뉴 입니다. 로그인 후에 시도하세요.";
				stepUrl = "/commonServlet.mo";
			}
			else if((func.startsWith("superMan") || func.startsWith("manager")) && (session==null || session.getAttribute("loginYn")==null || ((String)session.getAttribute("loginYn")).equals("N") || session.getAttribute("adminYn")==null || ((String)session.getAttribute("adminYn")).equals("N")))
			{
				mode = "T";
				moveType = "FW";
				message = "관리자 메뉴 입니다. 이용 권한이 없습니다.";
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
	 * 내용		: abstract Method로서 본 Class를 상속받는 모든 Servlet에서 반드시 구현해야 하는 Method
	 * 입력 값	: HttpServletRequest req, HttpServletResponse res
	 * 출력 값	:
	 */
	public abstract void performTask(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, Exception;

	/**
	 * 내용		: 한글 처리를 위한 Method
	 * 입력 값	: String en
	 * 출력 값	: String enKo
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