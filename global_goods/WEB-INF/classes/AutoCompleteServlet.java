import java.io.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class AutoCompleteServlet extends HttpServlet
{
	private List names = new ArrayList();

	public void init(ServletConfig config) throws ServletException
	{
		names.add("Abe");
		names.add("Abel");
		names.add("Abigail");
		names.add("Abner");
		names.add("Abraham");
		names.add("Marcus");
		names.add("Marcy");
		names.add("Marge");
		names.add("Marie");
		names.add("스타크");
		names.add("스타크래프트");
		names.add("스타크래프트 치트키");
	}

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

		String prefix = entoKo(request.getParameter("names"));

		ArrayList matching = searchWords(prefix);

		if (matching.size() > 0)
		{
			PrintWriter out = response.getWriter();
			response.setContentType("text/xml");
			out.println("<response>");
			for(int i=0; i<matching.size(); i++)
			{
				String name = (String) matching.get(i);
				out.println("<name>" + name + "</name>");
			}
			out.println("</response>");
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

	public ArrayList searchWords(String prefix)
	{
		String prefix_upper = prefix.toUpperCase();
		ArrayList matches = new ArrayList();
		for(int i=0; i<names.size(); i++)
		{
			String name = (String)names.get(i);
			String name_upper_case = name.toUpperCase();

			if(name_upper_case.startsWith(prefix_upper))
			{
				matches.add(name);
			}
		}
		return matches;
	}
}