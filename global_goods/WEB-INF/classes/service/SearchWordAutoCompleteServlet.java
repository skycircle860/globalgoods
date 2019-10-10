package service;

import java.io.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;

import search.*;

public class SearchWordAutoCompleteServlet extends HttpServlet
{
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		executeService(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		executeService(request, response);
	}

	protected void executeService(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		response.setCharacterEncoding("utf-8");

		String sw = entoKo(request.getParameter("sw"));

		Hashtable inputTable = new Hashtable();
		inputTable.put("sw", sw);

		SearchWordsBean swb = new SearchWordsBean();
		swb.setDataTable(inputTable);

		try
		{
			swb.funcExecute();
		}
		catch (Exception ex)
		{
			ex.printStackTrace();
		}

		ArrayList wordList = swb.getDataList();

		if (wordList.size() > 0)
		{
			PrintWriter out = response.getWriter();
			response.setContentType("text/xml");
			response.setHeader("Cache-Control", "no-cache");
			out.println("<WORDSLIST>");

			for(int i=0; i<wordList.size(); i++)
			{
				Hashtable wordTable = (Hashtable)wordList.get(i);
				String word = (String)wordTable.get("WORD");
				String count = (String)wordTable.get("COUNT");
				out.println("<WORD>");
				out.println("<NAME>" + word + "</NAME>");
				out.println("<COUNT>" + count + "</COUNT>");
				out.println("</WORD>");
			}
			out.println("</WORDSLIST>");
			out.close();
		}
		else
		{
			response.setStatus(HttpServletResponse.SC_NO_CONTENT);
		}
	}

	protected String entoKo(String en)
	{
		String enKo = null;
		try
		{
			enKo = new String(en.getBytes("8859_1"),"KSC5601");
		}
		catch(UnsupportedEncodingException e)
		{
			System.out.println(e);
		}

		return enKo;
	}
}