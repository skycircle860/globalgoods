package service;

import common.main.*;
import common.util.*;

import java.io.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;
import goods.*;
import member.*;
import common.util.*;

public class GoodsServlet extends MainServlet
{
	public void performTask(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, Exception
	{
		String alignSelect = "";
		if (request.getParameter("alignSelect") != null && ((String)request.getParameter("alignSelect")).length() != 0)
		{
			alignSelect = (String)request.getParameter("alignSelect");
		}

		String middleCategory = "";
		if (request.getParameter("middleCategory")!= null && ((String)request.getParameter("middleCategory")).length() != 0)
		{
			middleCategory = (String)request.getParameter("middleCategory");
		}

		String section = "";
		if (request.getParameter("section")!= null && ((String)request.getParameter("section")).length() != 0)
		{
			section = (String)request.getParameter("section");
		}

		String goodsWord = "";
		if (request.getParameter("goodsWord")!= null && ((String)request.getParameter("goodsWord")).length() != 0)
		{
			goodsWord = entoKo((String)request.getParameter("goodsWord"));
		}

		String subcode="";
		if (request.getParameter("subcode")!= null && ((String)request.getParameter("subcode")).length() != 0)
		{
			subcode = (String)request.getParameter("subcode");
		}
		String from = "";
		if (request.getParameter("from") != null && ((String)request.getParameter("from")).length() != 0)
		{
			from = (String)request.getParameter("from");
		}
		String goodsHit = "";
		if (request.getParameter("goodsHit") != null && ((String)request.getParameter("goodsHit")).length() != 0)
		{
			goodsHit = (String)request.getParameter("goodsHit");
		}
		
		//레프트메뉴가 반응하는 세션
		session.setAttribute("category", "middle_category");

		inputTable.put("middleCategory",middleCategory);	
		inputTable.put("alignSelect",alignSelect);
		inputTable.put("section",section);
		inputTable.put("goodsWord",goodsWord);

		inputTable.put("subcode",subcode);
		
		inputTable.put("from",from);
		inputTable.put("goodsHit",goodsHit);

System.out.println(func);
		//상품 리스트페이지 가기
		if(func.equals("goods_001"))
		{
			
			//준교형 리스트
			GoodsListBean glb = new GoodsListBean();
			glb.setDataTable(inputTable);
			glb.funcExecute();
			ArrayList goodsList = glb.getDataList();
			outputTable.put("goodsList",goodsList);
	

			//혜리스트
			SuperMiddleCategoryListBean smcb = new SuperMiddleCategoryListBean();
			smcb.setDataTable(inputTable);
			smcb.funcExecute();
			ArrayList superMiddlecategoryList = smcb.getDataList();
			outputTable.put("superMiddlecategoryList", superMiddlecategoryList);
			
			moveType = "FW";
			mode = "S";
			mainUrl = "/goods/GoodsList.jsp";
		}
		//상품 상세페이지 가기
		else if (func.equals("goods_002"))
		{
			String code = (String)request.getParameter("code");
			inputTable.put("code",code);

			if (goodsHit.length()!= 0 && goodsHit.equals("Y"))
			{
				GoodsHitPlusBean ghpb = new GoodsHitPlusBean();
				ghpb.setDataTable(inputTable);
				ghpb.funcExecute();
			}
			

			GoodsViewBean gvb = new GoodsViewBean();
			gvb.setDataTable(inputTable);
			gvb.funcExecute();

			ArrayList goodsList = gvb.getDataList();
			outputTable.put("goodsList",goodsList);

			moveType = "FW";
			mode = "S";
			mainUrl = "/goods/GoodsView.jsp";
		}
		//상품 구매페이지 가기
		else if (func.equals("goods_003"))
		{
			String[] codes = request.getParameterValues("checkItem");
			ArrayList goodsBuyList = new ArrayList();

			String id = (String)session.getAttribute("id");

			for(int i=0; i<codes.length; i++)
			{
				Hashtable goodsBuyTable = new Hashtable();
				String amountNcode = (String)codes[i];
				System.out.println("goods_003 amountNcode : "+amountNcode);
				String amount = "";
				String code = "";

				int index = 0;
				int endIndex = amountNcode.length();
				//체크되어 넘어온 체크코드를 amount와 code로 분류하는 과정
				if (amountNcode.indexOf("E") > -1)
				{
					index = amountNcode.indexOf("E");
					amount = amountNcode.substring(0,index);
					System.out.println("goods_003 amount : "+amount);
					code = amountNcode.substring(index,endIndex);

					goodsBuyTable.put("code",code);
					goodsBuyTable.put("amount",amount);
					goodsBuyList.add(goodsBuyTable);
				}
				else if (amountNcode.indexOf("F") > -1)
				{
					index = amountNcode.indexOf("F");
					amount = amountNcode.substring(0,index);
					code = amountNcode.substring(index,endIndex);
					goodsBuyTable.put("code",code);
					goodsBuyTable.put("amount",amount);
					goodsBuyList.add(goodsBuyTable);
				}
			}
			inputTable.put("goodsBuyList",goodsBuyList);
			inputTable.put("id",id);

			//장바구니에서 체크되어 넘어온 코드의 CHE_YN와 CODE_AMOUNT의 수량을 바꿔준다.
			GoodsBuyUpdateBean gbub = new GoodsBuyUpdateBean();
			gbub.setDataTable(inputTable);
			gbub.funcExecute();

			//장바구니의 해당아이디와 CHK_Y 인 값을 불러온다.
			ShoppingCartBuyBean scbb = new ShoppingCartBuyBean();
			scbb.setDataTable(inputTable);
			scbb.funcExecute();

			ArrayList shoppingCartList = scbb.getDataList();

			//장바구니 CHK_YN의 값을 다시 N으로 돌린다.
			GoodsBuyUpdateBean2 gbub2 = new GoodsBuyUpdateBean2();
			gbub2.setDataTable(inputTable);
			gbub2.funcExecute();

			//은행정보를 불러온다.
			BankInfoBean bib = new BankInfoBean();
			bib.funcExecute();

			ArrayList bankList = bib.getDataList();

			//주소에 쓸 이름과 주소 정보를 가져온다.
			UserInfoBean uib = new UserInfoBean();
			uib.setDataTable(inputTable);
			uib.funcExecute();

			ArrayList userInfoList = uib.getDataList();

			outputTable.put("shoppingCartList",shoppingCartList);
			outputTable.put("userInfoList", userInfoList);
			outputTable.put("bankList",bankList);

			moveType = "FW";
			mode = "S";
			mainUrl = "/goods/GoodsBuy.jsp";
		}
		//장바구니에 담기
		else if (func.equals("goods_004"))
		{
			String id = (String)session.getAttribute("id");
			String code = (String)request.getParameter("code");
			String amount = (String)request.getParameter("amount");
			String client = request.getRemoteAddr();

			inputTable.put("id",id);
			inputTable.put("code",code);
			inputTable.put("amount",amount);
			inputTable.put("client",client);
			
			System.out.println(inputTable);
			//상품이 추가되어있는지 확인
			GoodsCartSearchBean gcsb = new GoodsCartSearchBean();

			System.out.println("GoodsCartSearchBean");
			gcsb.setDataTable(inputTable);
			gcsb.funcExecute();
			ArrayList goodsList = gcsb.getDataList();

			if (goodsList.size() > 0)
			{
				message = "이미 상품이 등록되어 있습니다.";

				moveType = "FW";
				mode = "T";
				stepUrl = "/goodsServlet.mo?func=goods_002&code="+code;
			}
			else
			{
				GoodsCartAddBean gclb = new GoodsCartAddBean();
				System.out.println("GoodsCartAddBean");
				gclb.setDataTable(inputTable);
				gclb.funcExecute();

				ArrayList goodsCartList = gclb.getDataList();
				int resultCount = Integer.parseInt((String)((Hashtable)goodsCartList.get(0)).get("COUNT"));
				if(resultCount>0)
				{
					message = "장바구니에 추가되었습니다.";
				}
				else
				{
					message = "추가 되지 않았습니다. 다시 시도하거나, 관리자에게 문의하세요!";
				}

				moveType = "FW";
				mode = "T";
				stepUrl = "/goodsServlet.mo?func=goods_002&code="+code;
			}
		}
		//장바구니 페이지가기
		else if (func.equals("goods_005"))
		{
			String id = (String)session.getAttribute("id");

			inputTable.put("id",id);

			GoodsCartListBean gclb = new GoodsCartListBean();
			gclb.setDataTable(inputTable);
			gclb.funcExecute();

			ArrayList shoppingCartList = gclb.getDataList();

			outputTable.put("shoppingCartList",shoppingCartList);
			/*
			for (int i = 0;i<shoppingCartList.size() ;i++ )
			{
				System.out.println("하아아아아아아\n"+shoppingCartList.get(i));
			}*/
			moveType = "FW";
			mode = "S";
			mainUrl = "/goods/ShoppingCart.jsp";
		}
		//장바구니 아이템 삭제
		else if (func.equals("goods_006"))
		{
			String id = (String)session.getAttribute("id");
			String code = (String)request.getParameter("code");
		
			inputTable.put("id", id);
			inputTable.put("code", code);

			GoodsCartDeleteBean gcdb = new GoodsCartDeleteBean();
			gcdb.setDataTable(inputTable);
			gcdb.funcExecute();
			ArrayList deleteList = gcdb.getDataList();

			if(deleteList.size() == 0)
			{
				message = "장바구니에서 물품이 제거되지 않았습니다.";
			}
			else
			{
				message = "장바구니에서 물품이 성공적으로 제거되었습니다";
			}


			moveType = "FW";
			mode = "T";
			stepUrl = "/goodsServlet.mo?func=goods_005";
		}
		//sub_category 리스트 보이기
		else if (func.equals("goods_007"))
		{	
			String subname = "";
			if (request.getParameter("subname")!=null && ((String)request.getParameter("subname")).length() != 0)
			{
				subname = entoKo((String)request.getParameter("subname"));
			}

			System.out.println("goodsServlet subcode : "+subcode+" subname : "+subname);
			inputTable.put("subname", subname);
			//혜리스트- top메뉴 클릭시 레프트메뉴에 sub_category 리스트 뿌리기
			SuperMiddleCategoryListBean smcb = new SuperMiddleCategoryListBean();
			smcb.setDataTable(inputTable);
			smcb.funcExecute();
			ArrayList superMiddlecategoryList = smcb.getDataList();
			outputTable.put("superMiddlecategoryList", superMiddlecategoryList);
			
			//혜리스트- 레프트메뉴(sub_category) 클릭시 메인 화면에 해당하는 상품 뿌리기
			SubCategoryGoodsListBean scglb = new SubCategoryGoodsListBean();
			scglb.setDataTable(inputTable);
			scglb.funcExecute();
			ArrayList subcategorygoodsList = scglb.getDataList();
			outputTable.put("subcategorygoodsList",subcategorygoodsList);
						
			moveType = "FW";
			mode = "S";
			mainUrl = "/goods/SubCategoryGoodsList.jsp";

		}
		//관심상품 추가
		else if (func.equals("goods_CDH001"))
		{
			String id = (String)session.getAttribute("id");
			String code = (String)request.getParameter("code");
			String client = request.getRemoteAddr();

			inputTable.put("id",id);
			inputTable.put("code",code);
			inputTable.put("client",client);
			
			System.out.println(inputTable);
			//관심상품이 추가되어있는지 확인
			GoodsInterestSearchBean gisb = new GoodsInterestSearchBean();

			System.out.println("GoodsInterestSearchBean");
			gisb.setDataTable(inputTable);
			gisb.funcExecute();
			ArrayList goodsList = gisb.getDataList();

			if (goodsList.size() > 0)
			{
				message = "이미 관심상품으로 등록되어 있습니다.";

				moveType = "FW";
				mode = "T";
				stepUrl = "/goodsServlet.mo?func=goods_001";
			}
			else
			{
				GoodsInterestAddBean giab = new GoodsInterestAddBean();
				System.out.println("GoodsInterestAddBean");
				giab.setDataTable(inputTable);
				giab.funcExecute();

				ArrayList goodsInterestList = giab.getDataList();
				int resultCount = Integer.parseInt((String)((Hashtable)goodsInterestList.get(0)).get("COUNT"));
				if(resultCount>0)
				{
					message = "관심상품에 추가되었습니다.";
				}
				else
				{
					message = "추가 되지 않았습니다. 다시 시도하거나, 관리자에게 문의하세요!";
				}

				moveType = "FW";
				mode = "T";
				stepUrl = "/goodsServlet.mo?func=goods_001";
			}
		}
		//관심상품 페이지가기
		else if (func.equals("goods_CDH002"))
		{
			String id = (String)session.getAttribute("id");

			inputTable.put("id",id);
			System.out.println("관심상품 리스트 전");
			GoodsInterestListBean gilb = new GoodsInterestListBean();
			gilb.setDataTable(inputTable);
			gilb.funcExecute();
			System.out.println("관심상품 리스트 후");
			ArrayList shoppingInterestList = gilb.getDataList();
			System.out.println("관심상품 리스트 outputTable에 담기 전");
			outputTable.put("shoppingInterestList", shoppingInterestList);
			/*
			for (int i = 0;i<shoppingInterestList.size() ;i++ )
			{
				System.out.println("하아아아아아아\n"+shoppingInterestList.get(i));
			}*/
			System.out.println("관심상품 리스트 outputTable에 담은 후");
			moveType = "FW";
			mode = "S";
			mainUrl = "/goods/ShoppingInterest.jsp";
		}
		//관심상품 삭제
		else if (func.equals("goods_CDH003"))
		{
			String id = (String)session.getAttribute("id");
			String code = (String)request.getParameter("code");
		
			inputTable.put("id", id);
			inputTable.put("code", code);

			GoodsInterestDeleteBean gidb = new GoodsInterestDeleteBean();
			gidb.setDataTable(inputTable);
			gidb.funcExecute();
			ArrayList deleteList = gidb.getDataList();

			if(deleteList.size() == 0)
			{
				message = "관심상품에서 물품이 제거되지 않았습니다.";
			}
			else
			{
				message = "관심상품에서 물품이 성공적으로 제거되었습니다";
			}


			moveType = "FW";
			mode = "T";
			stepUrl = "/goodsServlet.mo?func=goods_CDH002";
		}
		//이미지 디테일뷰
		else if (func.equals("goods_kww001"))
		{
			String imgSrc = (String)request.getParameter("imgSrc");
			String imgName = (String)request.getParameter("imgName");
			String name = entoKo((String)request.getParameter("name"));
			System.out.println(imgSrc+imgName);
			inputTable.put("imgSrc",imgSrc);
			inputTable.put("imgName",imgName);
			inputTable.put("name", name);

			moveType = "FW";
			mode = "P";
			mainUrl = "/goods/GoodsDetailImg.jsp";
		}
		//상품 구매하기
		else if (func.equals("goods_008"))
		{
			String [] codes = request.getParameterValues("checkItem");

			ArrayList goodsBuyList = new ArrayList();

			String id = (String)session.getAttribute("id");
			String orderName = request.getParameter("name");
			String client = request.getRemoteAddr();
			String selectInventory = request.getParameter("whereInven"); //배송비 여부

			for(int i=0; i<codes.length; i++)
			{
				Hashtable goodsBuyTable = new Hashtable();
				String amountNcode = (String)codes[i];
				String amount = "";
				String code = "";

				int index = 0;
				int endIndex = amountNcode.length();
				//체크되어 넘어온 체크코드를 amount와 code로 분류하는 과정
				if (amountNcode.indexOf("E") > -1)
				{
					index = amountNcode.indexOf("E");
					amount = amountNcode.substring(0,index);
					code = amountNcode.substring(index,endIndex);

					goodsBuyTable.put("code",code);
					goodsBuyTable.put("amount",amount);
					goodsBuyList.add(goodsBuyTable);
				}
				else if (amountNcode.indexOf("F") > -1)
				{
					index = amountNcode.indexOf("F");
					amount = amountNcode.substring(0,index);
					code = amountNcode.substring(index,endIndex);
					goodsBuyTable.put("code",code);
					goodsBuyTable.put("amount",amount);
					goodsBuyList.add(goodsBuyTable);
				}
			}
			String selectAddr = request.getParameter("whereAddr"); //주소지 선택여부
			String selectApproval = request.getParameter("whereCash"); //결재방법 여부

			String name = request.getParameter("name");
			String zipCode1 = request.getParameter("zipCode1");
			String zipCode2 = request.getParameter("zipCode2");
			String addr1 = request.getParameter("addr1");
			String addr2 = request.getParameter("addr2");
			String home1 = request.getParameter("home1");
			String home2 = request.getParameter("home2");
			String home3 = request.getParameter("home3");
			String mobile1 = request.getParameter("mobile1");
			String mobile2 = request.getParameter("mobile2");
			String mobile3 = request.getParameter("mobile3");
			String office1 = request.getParameter("office1");
			String office2 = request.getParameter("office2");
			String office3 = request.getParameter("office3");
			String comment = request.getParameter("comment");

			inputTable.put("id",id);
			inputTable.put("name",entoKo(name));
			inputTable.put("client", client);
			inputTable.put("zipCode1", zipCode1);
			inputTable.put("zipCode2", zipCode2);
			inputTable.put("addr1", entoKo(addr1));
			inputTable.put("addr2", entoKo(addr2));
			inputTable.put("home1", home1);
			inputTable.put("home2", home2);
			inputTable.put("home3", home3);
			inputTable.put("mobile1", mobile1);
			inputTable.put("mobile2", mobile2);
			inputTable.put("mobile3", mobile3);
			inputTable.put("office1", office1);
			inputTable.put("office2", office2);
			inputTable.put("office3", office3);
			inputTable.put("comment",entoKo(comment));

			inputTable.put("goodsBuyList",goodsBuyList);
			inputTable.put("selectAddr", selectAddr);
			inputTable.put("selectApproval", selectApproval);
			inputTable.put("selectInventory",selectInventory);

			//ORDER_LIST에 상품 추가
			GoodsBuyBean gbb = new GoodsBuyBean();
			gbb.setDataTable(inputTable);
			gbb.funcExecute();

			ArrayList gcl = gbb.getDataList();
			Hashtable gcTable = (Hashtable)gcl.get(0);
			String count = (String)gcTable.get("COUNT");
			int resultCount = Integer.parseInt(count);

			if(resultCount>0)
			{
				message = "구매가 완료 되었습니다. \n주문 조회는 마이페이지에서 하실 수 있습니다.";
				System.out.println(message);
			}
			else
			{
				message = "구매실패! 다시 시도하거나, 관리자에게 문의하세요!";
			}
//정준교 추가
			//ShoppingCart에서 구매한 상품 제거
			ShoppingCartUseUpdate scuu = new ShoppingCartUseUpdate();
			scuu.setDataTable(inputTable);
			scuu.funcExecute();

			inputTable = new Hashtable();
			moveType = "FW";
			mode = "T";
			stepUrl = "/goodsServlet.mo?func=goods_001";
		}
		//카드정보 확인하기
		else if (func.equals("goods_009"))
		{
			String id = (String)session.getAttribute("id");
			String cn1 = request.getParameter("cn1");
			String cn2 = request.getParameter("cn2");
			String cn3 = request.getParameter("cn3");
			String cn4 = request.getParameter("cn4");
			String month = request.getParameter("card_end_month");
			String year = request.getParameter("card_end_year");
			String pass = request.getParameter("card_pw");
			String jumin1 = request.getParameter("card_jumin1");
			String jumin2 = request.getParameter("card_jumin2");
			year = year.substring(2,4);

			inputTable.put("id",id);
			inputTable.put("cn1", cn1);
			inputTable.put("cn2", cn2);
			inputTable.put("cn3", cn3);
			inputTable.put("cn4", cn4);
			inputTable.put("month", month);
			inputTable.put("year", year);
			inputTable.put("pass", pass);
			inputTable.put("jumin1",jumin1);
			inputTable.put("jumin2",jumin2);

			CompareToCard cc = new CompareToCard();
			cc.setDataTable(inputTable);
			cc.funcExecute();
			ArrayList cardList = cc.getDataList();

			outputTable.put("cardList",cardList);

			moveType = "FW";
			mode = "A";
			ajaxUrl = "/goods/CardCheck.jsp";
		}
		//즉시구매하기
		else if (func.equals("goods_010"))
		{
			String id = (String)session.getAttribute("id");
			
			String amount = request.getParameter("amount");
			String code = request.getParameter("code");

			inputTable.put("id",id);
			inputTable.put("amount", amount);
			inputTable.put("code", code);

			GoodsLetsBuySelect glbs = new GoodsLetsBuySelect();
			glbs.setDataTable(inputTable);
			glbs.funcExecute();
			ArrayList tempList = glbs.getDataList();

			Hashtable tempTable = (Hashtable)tempList.get(0);

			tempTable.put("GOODS_AMOUNT",amount);

			ArrayList shoppingCartList = new ArrayList();
			ArrayList goodsList2 = new ArrayList();

			shoppingCartList.add(tempTable);

			
			goodsList2.add(shoppingCartList);

			//주소에 쓸 이름과 주소 정보를 가져온다.
			UserInfoBean uib = new UserInfoBean();
			uib.setDataTable(inputTable);
			uib.funcExecute();

			ArrayList userInfoList = uib.getDataList();

			outputTable.put("userInfoList", userInfoList);
			outputTable.put("shoppingCartList",goodsList2);

			moveType = "FW";
			mode = "S";
			mainUrl = "/goods/GoodsBuy.jsp";
		}
	}
}