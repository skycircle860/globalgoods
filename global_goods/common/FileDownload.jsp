<%@ page contentType="text/html; charset=EUC_KR" %> 
<%@ page import="java.io.*" %> 
<% 
	//응답 헤더의 Content-Type을 세팅한다. 
	response.setContentType("application/x-msdownload"); 

	String savePath = entoKo(request.getParameter("savePath"));	//저장된 파일경로
	String saveName = entoKo(request.getParameter("saveName"));	//중복처리된파일이름 (서버폴더에 존제하는 실제 파일의 이름)
	String orgName = request.getParameter("orgName");		//원본 파일의 이름

	response.setHeader("Content-Disposition","attachment; filename="+orgName); //다운 받는 파일의 이름을 원래 이름으로 설정해준다.
		//Content-dispostion 값을 "attachment; filename="+orgName 으로 대체하겠다는 의미, 즉 다운받아질 파일 이름을 바꿔줌
	File file = new File (savePath+"/"+saveName); 

	byte[] bytestream = new byte[(int)file.length()]; //파일의 크기만큼 바이트배열생성

	FileInputStream filestream = new FileInputStream(file); //파일정보에 포함된 주소상의 실 파일에 빨대 꼽음.
	int i = 0, j = 0; 

	while((i = filestream.read()) != -1)	//파일의 끝까지 읽음.
	{ 
		bytestream[j] = (byte)i; 
		j++; 
	}	//메모리상에 bytestream배열 형태로 떠있음!

	OutputStream outStream = response.getOutputStream(); //리스폰스 객체에서 아웃풋스트림 얻어냄
	outStream.write(bytestream);	//파일을 아웃풋 스트림에 풀어버림 -> 다운로드
	outStream.close();
	filestream.close();
	outStream = null;
	filestream = null;
%>

<%!
	public String entoKo(String en){
		String korCharSet = null;
		try
		{
			korCharSet = new String(en.getBytes("8859_1"),"KSC5601");
		}
		catch(UnsupportedEncodingException uee)
		{
			System.out.println(uee);
		}
		return korCharSet;
	}
%>