package service;

import common.main.*;
import common.util.*;

import java.io.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;
import member.*;

public class MemberServlet extends MainServlet
{
	public void performTask(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, Exception
	{
		//ȸ������ ������ ����
		if(func.equals("member_001"))
		{
			// ���� ��� ��������
			InterestListBean ilb = new InterestListBean();
			ilb.funcExecute();
			ArrayList interestList = ilb.getDataList();

			outputTable.put("interestList", interestList);
			
			//passQ ��������
			PassQBean pqb = new PassQBean();
			pqb.funcExecute();
			ArrayList passQList = pqb.getDataList();
			outputTable.put("passQList", passQList);


			moveType = "FW";
			mode = "S";
			mainUrl = "/member/Join.jsp";
		}
		//id�ߺ��˻�
		else if(func.equals("member_002"))
		{
			String id = request.getParameter("id");

			inputTable.put("id", id);

			IdCheckBean icb = new IdCheckBean();
			icb.setDataTable(inputTable);
			icb.funcExecute();
			ArrayList checkIdList = icb.getDataList();

			outputTable.put("checkIdList", checkIdList);

			moveType = "FW";
			mode = "A";
			ajaxUrl = "/member/IdCheck.jsp";
		}
		//ȸ������
		else if(func.equals("member_003"))
		{
			String id = request.getParameter("id");
			String pass = request.getParameter("pass1");
			String name = request.getParameter("name");
			String jumin1 = request.getParameter("jumin1");
			String jumin2 = request.getParameter("jumin2");
			String home1 = request.getParameter("home1");
			String office1 = request.getParameter("office1");
			String mobile1 = request.getParameter("mobile1");
			String zipCode1 = request.getParameter("zipCode1");
			String zipCode2 = request.getParameter("zipCode2");
			String addr1 = request.getParameter("addr1");
			String addr2 = request.getParameter("addr2");
			String client = request.getRemoteAddr();
			String passQ = request.getParameter("passQ");
			String passA = request.getParameter("passA");

			String home2 = request.getParameter("home2");
			if(home2 == null || home2.length()==0)
			{
				home2 = "0000";
			}

			String home3 = request.getParameter("home3");
			if(home3 == null || home3.length()==0)
			{
				home3 = "0000";
			}

			String office2 = request.getParameter("office2");
			if(office2 == null || office2.length()==0)
			{
				office2 = "0000";
			}

			String office3 = request.getParameter("office3");
			if(office3 == null || office3.length()==0)
			{
				office3 = "0000";
			}

			String mobile2 = request.getParameter("mobile2");
			if(mobile2 == null || mobile2.length()==0)
			{
				mobile2 = "0000";
			}

			String mobile3 = request.getParameter("mobile3");
			if(mobile3 == null || mobile3.length()==0)
			{
				mobile3 = "0000";
			}

			String email = request.getParameter("email");
			if(email == null || email.length()==0)
			{
				email = "empty";
			}

			String [] interestArray = request.getParameterValues("interest");
            String interest="";
			if(interestArray == null)
			{
				interestArray = new String[1];
				interestArray[0] = "empty";
			}
            for(int i=0; i<interestArray.length; i++)
            {
                if(i>0)
                {
                    interest = interest + "^";
                }
                interest = interest + interestArray[i];
            }


			inputTable.put("id", id);
			inputTable.put("pass", pass);
			inputTable.put("name", entoKo(name));
			inputTable.put("jumin1", jumin1);
			inputTable.put("jumin2", jumin2);
			inputTable.put("home1", home1);
			inputTable.put("home2", home2);
			inputTable.put("home3", home3);
			inputTable.put("office1", office1);
			inputTable.put("office2", office2);
			inputTable.put("office3", office3);
			inputTable.put("mobile1", mobile1);
			inputTable.put("mobile2", mobile2);
			inputTable.put("mobile3", mobile3);
			inputTable.put("zipCode1", zipCode1);
			inputTable.put("zipCode2", zipCode2);
			inputTable.put("addr1", entoKo(addr1));
			inputTable.put("addr2", entoKo(addr2));
			inputTable.put("email", email);
			inputTable.put("interest", interest);
			inputTable.put("client", client);
			inputTable.put("passQ", passQ);
			inputTable.put("passA", entoKo(passA));

			JoinBean jb = new JoinBean();
			jb.setDataTable(inputTable);
			jb.funcExecute();
			ArrayList resultList = jb.getDataList();

			int resultCount = Integer.parseInt((String)((Hashtable)resultList.get(0)).get("COUNT"));
			if(resultCount>0)
			{
				message = "ȸ�� ������ ���������� �̷�������ϴ�! �α����Ͻø� ���񽺰� ����˴ϴ�.";
			}
			else
			{
				message = "ȸ�������� ���� �ʾҽ��ϴ�. �ٽ� �õ��ϰų�, �����ڿ��� �����ϼ���!";
			}
			inputTable.clear();

			moveType = "FW";
			mode = "T";
			stepUrl = "/commonServlet.mo";
		}
		//�α�������������
		else if(func.equals("member_004"))
		{
			moveType = "FW";
			mode = "S";
			mainUrl = "/member/Login.jsp";
		}
		//�α���
		else if (func.equals("member_005"))
		{
			String id = request.getParameter("id");
			String pass = request.getParameter("pw");

			inputTable.put("id", id);
			inputTable.put("pass", pass);

			LoginBean lb = new LoginBean();
			lb.setDataTable(inputTable);
			lb.funcExecute();
			ArrayList outputList = lb.getDataList();

			Hashtable userInfoTable = (Hashtable)outputList.get(0);
			int check = Integer.parseInt((String)userInfoTable.get("check"));
			if(check == 0)
			{
				String name = (String)userInfoTable.get("NAME");
				String adminYn = (String)userInfoTable.get("ADMINYN");

				session.setAttribute("loginYn", "Y");
				session.setAttribute("adminYn", adminYn);
				session.setAttribute("id", id);
				session.setAttribute("name", name);
				System.out.println("adminYn = "+ adminYn);
				if (adminYn.equals("Y"))
				{
					stepUrl = "/superManagerServlet.mo?func=superMan_001";
				}
				else
				{
					stepUrl = "/goodsServlet.mo?func=goods_001";
				}
				
			}
			else if(check == -1)
			{
				message = "��й�ȣ�� Ʋ���ϴ�. �ٽ� �Է��ϼ���!";
				stepUrl = "/memberServlet.mo?func=member_004";
			}
			else if(check == -2)
			{
				message = "��ϵ��� ���� ���̵� �Դϴ�. �ٽ� �Է��ϼ���!";
				stepUrl = "/memberServlet.mo?func=member_004";
			}

			moveType = "FW";
			mode = "T";
		}
		//�α׾ƿ�
		else if (func.equals("member_006"))
		{
			session.setAttribute("loginYn", "N");
			session.setAttribute("adminYn", null);
			session.setAttribute("id", null);
			session.setAttribute("name", null);

			moveType = "SR";
			mode = "S";
		}

		
		//�� �ֹ����� ������ �̵�.  //���⼭ ���� (my page ���Խ�)
		else if (func.equals("member_007"))
		{
			

			inputTable.put("id" ,session.getAttribute("id"));
			
			UserOrderListBean uolb = new UserOrderListBean();

			uolb.setDataTable(inputTable);
			uolb.funcExecute();
			ArrayList userOrderList = uolb.getDataList();
			outputTable.put("userOrderList",userOrderList);

			moveType = "FW";
			mode = "S";
			mainUrl = "/member/UserOrderInfo.jsp";

		}
		//ȸ������ ����������     //�ѹ��� ����
		else if (func.equals("member_014"))
		{
			String id = (String)session.getAttribute("id");

			inputTable.put("id",id);
			
			//��������Ʈ ��������
			UserInfoBean uib = new UserInfoBean();
			uib.setDataTable(inputTable);
			uib.funcExecute();
			ArrayList userInfoList = uib.getDataList();
			outputTable.put("userInfoList",userInfoList);

			// ���� ��� ��������
			InterestListBean ilb = new InterestListBean();
			ilb.funcExecute();
			ArrayList interestList = ilb.getDataList();
			outputTable.put("interestList",interestList);

			//passQ��������
			PassQBean pqb = new PassQBean();
			pqb.funcExecute();
			ArrayList passQList = pqb.getDataList();
			outputTable.put("passQList", passQList);

			moveType = "FW";
			mode = "S";
			mainUrl = "/member/UserInfo.jsp";
		}
		//�������� ����������
		else if (func.equals("member_008"))
		{
			String id = (String)session.getAttribute("id");

			inputTable.put("id", id);

			//��������Ʈ ��������
			UserInfoBean uib = new UserInfoBean();
			uib.setDataTable(inputTable);
			uib.funcExecute();
			ArrayList userInfoList = uib.getDataList();
			outputTable.put("userInfoList",userInfoList);

			// ���� ��� ��������
			InterestListBean ilb = new InterestListBean();
			ilb.funcExecute();
			ArrayList interestList = ilb.getDataList();
			outputTable.put("interestList",interestList);

			//passQ��������
			PassQBean pqb = new PassQBean();
			pqb.funcExecute();
			ArrayList passQList = pqb.getDataList();
			outputTable.put("passQList", passQList);

			moveType = "FW";
			mode = "S";
			mainUrl = "/member/Update.jsp";
		}
		//���������ϱ�
		else if (func.equals("member_009"))
		{
			String id = (String)session.getAttribute("id");
			String pass = request.getParameter("pass1");
			String home1 = request.getParameter("home1");
			String office1 = request.getParameter("office1");
			String mobile1 = request.getParameter("mobile1");
			String zipCode1 = request.getParameter("zipCode1");
			String zipCode2 = request.getParameter("zipCode2");
			String addr1 = request.getParameter("addr1");
			String addr2 = request.getParameter("addr2");
			String client = request.getRemoteAddr();
			String passQ = request.getParameter("passQ");
			String passA = request.getParameter("passA");

			String home2 = request.getParameter("home2");
			if(home2 == null || home2.length()==0)
			{
				home2 = "0000";
			}

			String home3 = request.getParameter("home3");
			if(home3 == null || home3.length()==0)
			{
				home3 = "0000";
			}

			String office2 = request.getParameter("office2");
			if(office2 == null || office2.length()==0)
			{
				office2 = "0000";
			}

			String office3 = request.getParameter("office3");
			if(office3 == null || office3.length()==0)
			{
				office3 = "0000";
			}

			String mobile2 = request.getParameter("mobile2");
			if(mobile2 == null || mobile2.length()==0)
			{
				mobile2 = "0000";
			}

			String mobile3 = request.getParameter("mobile3");
			if(mobile3 == null || mobile3.length()==0)
			{
				mobile3 = "0000";
			}

			String email = request.getParameter("email");
			if(email == null || email.length()==0)
			{
				email = "empty";
			}

			String [] interestArray = request.getParameterValues("interest");
            String interest="";
			if(interestArray == null)
			{
				interestArray = new String[1];
				interestArray[0] = "empty";
			}
			for(int i=0; i<interestArray.length; i++)
            {
                if(i>0)
                {
                    interest = interest + "^";
                }
                interest = interest + interestArray[i];
            }


			inputTable.put("id", id);
			inputTable.put("pass", pass);
			inputTable.put("home1", home1);
			inputTable.put("home2", home2);
			inputTable.put("home3", home3);
			inputTable.put("office1", office1);
			inputTable.put("office2", office2);
			inputTable.put("office3", office3);
			inputTable.put("mobile1", mobile1);
			inputTable.put("mobile2", mobile2);
			inputTable.put("mobile3", mobile3);
			inputTable.put("zipCode1", zipCode1);
			inputTable.put("zipCode2", zipCode2);
			inputTable.put("addr1", entoKo(addr1));
			inputTable.put("addr2", entoKo(addr2));
			inputTable.put("email", email);
			inputTable.put("interest", interest);
			inputTable.put("client", client);
			inputTable.put("passQ", passQ);
			inputTable.put("passA", entoKo(passA));
			
			System.out.println("id : "+id);


			UpdateBean ub = new UpdateBean();
			ub.setDataTable(inputTable);
			ub.funcExecute();
			ArrayList resultList = ub.getDataList();

			int resultCount = Integer.parseInt((String)((Hashtable)resultList.get(0)).get("COUNT"));
			
			if(resultCount>0)
			{
				message = "���������� ���� �Ǿ����ϴ�. �������ϴ�.";
			}
			else
			{
				message = "�������� ���� ������ �����Ͽ����ϴ�. �ٽ� �õ��Ͻðų� �����ڿ��� ���� �ٶ��ϴ�.";
			}
			inputTable.clear();
			moveType = "FW"; //FW�� �ϸ� String Cast Exception�� �� �ֱ׷����� ������..
			mode = "T";
			stepUrl = "/memberServlet.mo?func=member_007";
		}
		//ȸ��Ż��
		else if (func.equals("member_010"))
		{
			String id = (String)session.getAttribute("id");

			inputTable.put("id", id);

			LeaveBean lb = new LeaveBean();
			lb.setDataTable(inputTable);
			lb.funcExecute();

			ArrayList resultList = lb.getDataList();

			int resultCount = Integer.parseInt((String)((Hashtable)resultList.get(0)).get("COUNT"));

			if(resultCount>0)
			{
				message = "���������� Ż�� ó�� �Ǿ����ϴ�. �������ϴ�.";

				session.setAttribute("loginYn", "N");
				session.setAttribute("adminYn", null);
				session.setAttribute("id", null);
				session.setAttribute("name", null);
			}
			else
			{
				message = "Ż�� ó�� ���� ������ �߻��Ͽ����ϴ�. �ٽ� �õ��Ͻðų� �����ڿ��� ���� �ٶ��ϴ�.";
			}

			moveType = "FW";
			mode = "T";
			stepUrl = "/commonServlet.mo";
		}
        //idã�� ������ ����
		else if (func.equals("member_011_1"))
        {
			PassQBean pqb = new PassQBean();
			pqb.funcExecute();
			ArrayList passQList = pqb.getDataList();
			outputTable.put("passQList", passQList);

            moveType = "FW";
            mode="S";
            mainUrl = "/member/Search_Id.jsp";
        }
        //pwã�� ������ ����
		else if (func.equals("member_011_2"))
        {
			PassQBean pqb = new PassQBean();
			pqb.funcExecute();
			ArrayList passQList = pqb.getDataList();
			outputTable.put("passQList", passQList);

            moveType = "FW";
            mode="S";
            mainUrl = "/member/Search_Pw.jsp";
        }

        //ID ã�� ��� ������.
		else if (func.equals("member_012"))
        {

            String name = request.getParameter("name");
            String jumin1 = request.getParameter("jumin1");
            String jumin2 = request.getParameter("jumin2");

            System.out.println("�̸� �Ѿ�� ��" + name);
            System.out.println("�ֹ�1 �Ѿ�� ��" + jumin1);
            System.out.println("�ֹ�2 �Ѿ�� ��" + jumin2);
            inputTable.put("name", entoKo(name));
            inputTable.put("jumin1", jumin1);
            inputTable.put("jumin2", jumin2);

            SearchIdBean sib = new SearchIdBean();
            sib.setDataTable(inputTable);
            sib.funcExecute();
            ArrayList idSearchList = sib.getDataList();
            outputTable.put("idSearchList",idSearchList);

            moveType = "FW";
            mode="P";
            mainUrl = "/member/SearchId.jsp";
        }
        
        //PW ã�� ��� ������.
		else if (func.equals("member_013"))
        {
        String id = request.getParameter("id");
        String name = request.getParameter("name");
        String passQ = request.getParameter("passQ");
        String passA = request.getParameter("passA");

        inputTable.put("id", id);
        inputTable.put("name", entoKo(name));
        inputTable.put("passQ", passQ);
        inputTable.put("passA", entoKo(passA));

        SearchPwBean spb = new SearchPwBean();
        spb.setDataTable(inputTable);
        spb.funcExecute();
        System.out.println();
        ArrayList pwSearchList = spb.getDataList();
        System.out.println(pwSearchList.toString());
        outputTable.put("pwSearchList", pwSearchList);

        moveType = "FW";
        mode="P";
        mainUrl = "/member/SearchPw.jsp";
        }
		
		
		//�ֹ� ��� - ���¹�ȣ �� ��ǰ���� �޴� �������� �̵�              //���⼭ ����
		else if (func.equals("member_015"))
		{
			
			System.out.println("member 015 check");
	
			String depositYn = (String)request.getParameter("depositYn");
			String code = (String)request.getParameter("code");
			String id =(String)session.getAttribute("id");
			System.out.println("15�� �ڵ� üũ"+code);	
			System.out.println("15�� depositYn üũ"+depositYn);	
		
			outputTable.put("code",code);
			outputTable.put("id",id);
			outputTable.put("state",request.getParameter("state"));
			outputTable.put("depositYn",depositYn);
			
			if(depositYn.equals("N"))
			{
				moveType = "FW";
				mode = "S";
				mainUrl = "/member/Cancle1.jsp";
			}

			else if(depositYn.equals("Y"))
			{
				
		
				UserAccountSelectBean uasb = new UserAccountSelectBean();
				
				uasb.funcExecute();

				ArrayList bankList = uasb.getDataList();
				outputTable.put("bankList",bankList);
				

				moveType = "FW";
				mode = "S";
				mainUrl = "/member/Cancle2.jsp";
			}


		

			
		}
		
		
		// �ֹ� ���.													//���⼭ ����
		else if (func.equals("member_016"))
		{
		
			String client = request.getRemoteAddr();

			String state = (String)request.getParameter("state");
			String comment = (String)request.getParameter("comment");
			String from =(String)request.getParameter("from");
			String code=(String)request.getParameter("code");
			String depositYn = (String)request.getParameter("depositYn");

	
			if (from.equals("cancle1"))
			{
				inputTable.put("id",session.getAttribute("id"));
				inputTable.put("code",code);
				inputTable.put("comment",entoKo(comment));
				inputTable.put("client",client);

				UserOrderUpdateBean uoub = new UserOrderUpdateBean();
				uoub.setDataTable(inputTable);
				uoub.funcExecute();

				ArrayList cancleList1 = uoub.getDataList();
				outputTable.put("cancleList1",cancleList1);
			}

			else if(from.equals("cancle2"))
			{
				System.out.println("member 0164 check");
				inputTable.put("bankcode",request.getParameter("bank"));
				inputTable.put("account",request.getParameter("account"));
				inputTable.put("id",session.getAttribute("id"));
				inputTable.put("code",code);
				inputTable.put("comment",entoKo(comment));
				inputTable.put("client",client);
				inputTable.put("state",state);
				inputTable.put("depositYn",depositYn);

	
				UserTempTempBean uttb = new UserTempTempBean();
				uttb.setDataTable(inputTable);
				uttb.funcExecute();
				
				ArrayList tempList = uttb.getDataList();
				inputTable.put("tempList",tempList);


				UserReturnOrderInsertBean ruoib = new UserReturnOrderInsertBean();
				ruoib.setDataTable(inputTable);
				ruoib.funcExecute();

				ArrayList cancleList2 = ruoib.getDataList();
				outputTable.put("cancleList2",cancleList2);
			}

			
			System.out.println("member 0168 check");
			
			
			
		
		
			
			inputTable.clear();
			
			moveType = "FW"; //FW�� �ϸ� String Cast Exception�� �� �ֱ׷����� ������..
			mode = "T";
			stepUrl = "/memberServlet.mo?func=member_007";

		}
    }
}