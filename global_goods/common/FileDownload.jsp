<%@ page contentType="text/html; charset=EUC_KR" %> 
<%@ page import="java.io.*" %> 
<% 
	//���� ����� Content-Type�� �����Ѵ�. 
	response.setContentType("application/x-msdownload"); 

	String savePath = entoKo(request.getParameter("savePath"));	//����� ���ϰ��
	String saveName = entoKo(request.getParameter("saveName"));	//�ߺ�ó���������̸� (���������� �����ϴ� ���� ������ �̸�)
	String orgName = request.getParameter("orgName");		//���� ������ �̸�

	response.setHeader("Content-Disposition","attachment; filename="+orgName); //�ٿ� �޴� ������ �̸��� ���� �̸����� �������ش�.
		//Content-dispostion ���� "attachment; filename="+orgName ���� ��ü�ϰڴٴ� �ǹ�, �� �ٿ�޾��� ���� �̸��� �ٲ���
	File file = new File (savePath+"/"+saveName); 

	byte[] bytestream = new byte[(int)file.length()]; //������ ũ�⸸ŭ ����Ʈ�迭����

	FileInputStream filestream = new FileInputStream(file); //���������� ���Ե� �ּһ��� �� ���Ͽ� ���� ����.
	int i = 0, j = 0; 

	while((i = filestream.read()) != -1)	//������ ������ ����.
	{ 
		bytestream[j] = (byte)i; 
		j++; 
	}	//�޸𸮻� bytestream�迭 ���·� ������!

	OutputStream outStream = response.getOutputStream(); //�������� ��ü���� �ƿ�ǲ��Ʈ�� ��
	outStream.write(bytestream);	//������ �ƿ�ǲ ��Ʈ���� Ǯ����� -> �ٿ�ε�
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