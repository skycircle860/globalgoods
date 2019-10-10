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
			supportFileUploadPath = confRoot + "/" + (String)((Hashtable)confTable.get("FILE_UPLOAD")).get("BBS");	//메인서블릿에서 서블릿 컨텍스트를 통해 얻어낸 루트 경로에
		}	//파일 실행시																//Static 컨프테이블 속에서 파일 업로드 관련 설정 파일중 BBS설정을 얻어냄. 즉.게시판에서 업로드 했을때의 파일 경로
		catch(Exception e)
		{
			System.out.println("############### 시스템 SupportServlet.init() Error 입니다.");
		}
	}

	public void performTask(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, Exception
	{
		
		String pageNum = request.getParameter("pageNum");
		String section = request.getParameter("section");
		String word = request.getParameter("word");
	
		String code = request.getParameter("code");

		String perPage = request.getParameter("perPage");
		
		if((request.getContentType()) != null && (request.getContentType()).startsWith("multipart"))	//멀티파트 타입이 글자가 인코딩 되지 않아 파일 업다운에 주로 이용된다고 한다.
		{	//리퀘스트의 컨텐트타입이 multipart로 시작할 때.
			File dayFile = new File(supportFileUploadPath+"/"+TotalDate.getToday("yyyy/MM/dd"));	//루트경로와 합쳐진 파일 경로에 오늘 날짜 폴더를 생성한다.
			if(!dayFile.exists())
			{
				dayFile.mkdirs();//경로에 파일 없을때 폴더 생성
			}

			savePath = dayFile.getAbsolutePath();	// 저장할 디렉토리 (절대경로)
			int sizeLimit = 1000 * 1024 * 1024; // 1000메가까지 제한 넘어서면 예외발생
			multi = new MultipartRequest(request, savePath, sizeLimit, "KSC5601", new DefaultFileRenamePolicy());
						//MultipartRequest(리퀘스트 객체,저장경로,저장용량,인코딩,파일리네임정책);
			//enctype="multipart/form-data"
			//멀티 파트리퀘스트를 타고온 파라미터는 멀티파트리퀘스트 객체에서 얻어내야 하는것 같음. 저위의 그냥 리퀘스트에서 겟 한 값은 Null 로 나옴.
			func = multi.getParameter("func");

			code = multi.getParameter("code");
			pageNum = multi.getParameter("pageNum");
			section = multi.getParameter("section");
			word = multi.getParameter("word");
		}
		// 로그인 필요한 메뉴 걸러 내기
		/*	
		if((func.equals("support_003") || func.equals("support_004")|| func.equals("member_005")|| func.equals("member_006") || func.equals("member_007") || func.equals("member_008") || func.equals("member_009") || func.equals("member_010")  ) && (session==null || session.getAttribute("loginYn")==null || ((String)session.getAttribute("loginYn")).equals("N")))
		{
			mode = "T";
			moveType = "FW";
			message = "로그인이 필요한 메뉴 입니다. 로그인 후에 시도하세요.";
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

		session.setAttribute("category", "support"); //session에 key:category으로 value:support로 저장

		/** left menu 에서 '임시게시판' 클릭시  고객센터의 메인페이지 가기 */
		if(func.equals("support_001"))  							
		{	
				
			moveType = "FW";
			mode = "S";
			mainUrl = "/support/supportList.jsp";
		}
		/**  고객센터 리스트  페이지 가기*/
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
		 //고객센터 글쓰기 페이지 가기
		else if(func.equals("support_003"))
		{
			
			moveType = "FW";
			mode = "S";
			mainUrl = "/support/supportWrite.jsp";
		}
		//고객센터 글쓰기 
		else if(func.equals("support_004"))
		{
			String title = multi.getParameter("title");	//멀티파트리퀘스트
			String content = multi.getParameter("content");
			String client = request.getRemoteAddr();
			String id = (String)session.getAttribute("id");

			inputTable.put("id", id);
			inputTable.put("title", title);
			inputTable.put("content", content);
			inputTable.put("client", client);

			ArrayList uploadFileList = new ArrayList();
			if(si.getFileYn())//파일 업로드를 사용할 경우
			{
				Enumeration formNames=multi.getFileNames();  // form 변수 이름 반환
				while(formNames.hasMoreElements())
				{
					String fileFormName=(String)formNames.nextElement(); // 업로드 하는 파일이 많을 경우 while 을 사용
					String orgFileName=multi.getOriginalFileName(fileFormName); // 업로드된 파일의 이름 얻기
					String saveFileName=multi.getFilesystemName(fileFormName); // 업로드되어 저장된 파일의 이름 얻기 //디폴트리네임정책에 의한거
					if(saveFileName!=null && saveFileName.length()>0)
					{
						Hashtable tempFileTable = new Hashtable();
						tempFileTable.put("savePath", savePath);
						tempFileTable.put("orgFileName", orgFileName);
						tempFileTable.put("saveFileName", saveFileName);
						uploadFileList.add(tempFileTable);	//경로, 원래이름, 바뀐이름을 콜랙션에 넣음
					}
				}
				inputTable.put("uploadFile", uploadFileList);
			}


			SupportWriteBean swb = new SupportWriteBean();	//이 안쪽에서 파일 업로드 빈 을 호출해 파일까지 업로드 시킴.
			swb.setDataTable(inputTable);
			swb.funcExecute();

			ArrayList resultList = swb.getDataList();

			int resultCount = Integer.parseInt((String)((Hashtable)resultList.get(0)).get("COUNT"));
			if(resultCount>0)
			{
				int uploadFileCount = Integer.parseInt((String)inputTable.get("uploadFile"));
				if(uploadFileCount<uploadFileList.size())	//업로드할 파일의 숫자와 업로드 된 결과리턴 수치를 비교
				{
					message = "글은 성공적으로 등록되었지만, 파일은 일부만 등록되었습니다. 관리자에게 문의하세요.";
				}
				else
				{
					message = "글이 성공적으로 등록되었습니다.";
				}

				inputTable.put("func", "support_002");
				inputTable.put("pageNum", "1");
			}
			else
			{
				message = "글 등록중 에러가 발생하였습니다.";
				inputTable.put("func", "support_003");
			}

			moveType = "FW";
			mode = "T";
			stepUrl = "/supportServlet.mo";
		}
		//고객센터 글 보기 
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

			if(si.getFileYn())	//게시판에서 파일 업로드를 사용 할 경우	
			{
				Hashtable supportTable = (Hashtable)supportViewList.get(0);
				SupportFileManager sfm = new SupportFileManager();	//파일 매니져 객체 생성
				ArrayList fileList = sfm.getSupportFileList(supportTable);//시퀀스 값이 담긴 테이블을 넘겨 파일 리스트를 리턴받음.
				supportTable.put("FILE_LIST", fileList); //파일 리스트도 bbsTable에 담아줌
			}//테이블의 특성상 나중에 넣어준 값까지 outputTable에 실어져 있는 모양...

			if(si.getAddYn())	//게시판에서 덧글을 사용하는지 여부
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

// 공지사항 수정 페이지 가기(support_006)
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

			if(si.getFileYn()) //파일정보 들고가야함 ㅋ ㅠ
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
	/** 공지사항 글 수정 */
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
					deleteFileArray = multi.getParameterValues("deleteFile");	//이게 체크박스라서 가능한거.. 스트링 배열로 넘어옴
				}

				Enumeration formNames=multi.getFileNames();  // form 변수 이름 반환	//업로드하기위해 새로 추가된 파일들
				while(formNames.hasMoreElements())
				{
					String fileFormName=(String)formNames.nextElement(); // 업로드 하는 파일이 많을 경우 while 을 사용
					String orgFileName=multi.getOriginalFileName(fileFormName); // 업로드된 파일의 이름 얻기
					String saveFileName=multi.getFilesystemName(fileFormName); // 업로드되어 저장된 파일의 이름 얻기
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
				inputTable.put("uploadFile", uploadFileList);	//파일의 숫자는 jsp에서 정해져 넘어온다.
			}

			SupportUpdateBean sub = new SupportUpdateBean();	//BBSWrite와 비슷하지만 파일의 삭제구간이 있다.
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
					message = "글은 성공적으로 수정되었지만, 파일은 일부만 수정되었습니다. 관리자에게 문의하세요.";
				}
				else
				{
					message = "글 수정에 성공 하였습니다.";
				}

				inputTable.put("func", "support_005");
				inputTable.put("hit", "N");
			}
			else
			{
				message = "글 수정중 에러가 발생하였습니다.";
				inputTable.put("func", "support_006");
			}

			moveType = "FW";
			mode = "T";
			stepUrl = "/supportServlet.mo";
		}


		/** 공지사항 글 삭제 */
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

			/* 이 부분에 "관리자에 의해 삭제된 글입니다."*/
			//라고 표시할것

			SupportDeleteBean sdb = new SupportDeleteBean();
			sdb.setDataTable(inputTable);
			sdb.funcExecute();
			ArrayList resultList = sdb.getDataList();

			int resultCount = Integer.parseInt((String)((Hashtable)resultList.get(0)).get("COUNT"));
			
			if(resultCount>0)
			{
				message = "글이 삭제 되었습니다.";
				inputTable.put("func", "support_002");
			}
			else
			{
				message = "글 삭제 작업 중 Error가 발생 하였습니다.";
				inputTable.put("func", "support_005");
				inputTable.put("hit", "N");
			
			}

			moveType = "FW";
			mode = "T";
			stepUrl = "/supportServlet.mo";
		}
		//답글 쓰기                         *답글-리스트에서 밑에나옴  댓글-한 페이지에서 나옴 
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
			if(si.getFileYn())	//그냥 write와 동일.
			{
				Enumeration formNames=multi.getFileNames();  // form 변수 이름 반환
				while(formNames.hasMoreElements())
				{
					String fileFormName=(String)formNames.nextElement(); // 업로드 하는 파일이 많을 경우 while 을 사용
					String orgFileName=multi.getOriginalFileName(fileFormName); // 업로드된 파일의 이름 얻기
					String saveFileName=multi.getFilesystemName(fileFormName); // 업로드되어 저장된 파일의 이름 얻기
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
					message = "답글은 성공적으로 등록되었지만, 파일은 일부만 등록되었습니다. 관리자에게 문의하세요.";
				}
				else
				{
					message = "답글이 성공적으로 등록되었습니다.";
				}

				inputTable.put("func", "support_002");
			}
			else
			{
				message = "답글 등록 중 에러가 발생하였습니다.";
				inputTable.put("func", "support_005");
				inputTable.put("hit", "N");
			}


			moveType = "FW";
			mode = "T";
			stepUrl = "/supportServlet.mo";
		}

		/*댓글 쓰기*/
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
				message = "댓글이 성공적으로 등록되었습니다.";
			}
			else
			{
				message = "댓글 등록 중 에러가 발생하였습니다.";
			}

			inputTable.put("func", "support_005");
			inputTable.put("hit", "N");

			moveType = "FW";
			mode = "T";
			stepUrl = "/supportServlet.mo";
		}
		/*댓글 삭제*/
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
				message = "댓글이 성공적으로 삭제되었습니다.";
			}
			else
			{
				message = "댓글 삭제 중 에러가 발생하였습니다.";
			}

			inputTable.put("func", "support_005");
			inputTable.put("hit", "N");

			moveType = "FW";
			mode = "T";
			stepUrl = "/supportServlet.mo";
		}
	}
}


