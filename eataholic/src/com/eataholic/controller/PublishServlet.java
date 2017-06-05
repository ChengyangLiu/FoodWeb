package com.eataholic.controller;

import java.io.IOException;
import java.sql.Date;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.eataholic.model.Passage;
import com.eataholic.service.PassageOp;
import com.eataholic.service.impl.PassageOpImpl;

/**
 * Servlet implementation class PublishServlet
 */
@WebServlet("/PublishServlet")
public class PublishServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PublishServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String content=request.getParameter("content");
		HttpSession session = request.getSession();
		//check logged state
		if(session.getAttribute("connecte")==null||!((String) session.getAttribute("connecte")).equals("true")){
			response.sendRedirect("sign-in");
		}
		else{//logged
			Passage passage=new Passage();
			passage.setAuthor((String)session.getAttribute("login"));
			passage.setContent(content);
			passage.setClick(0);
			passage.setCommentNum(0);
			passage.setLikeNum(0);
			
			Timestamp datetime = new Timestamp(System.currentTimeMillis()); 
			passage.setPassageTime(datetime);
			passage.setTitle(request.getParameter("title"));
			passage.setPhoto("ceshi");
			passage.setPassageType(request.getParameter("type"));
			
			PassageOp passageOp=new PassageOpImpl();
			if(passageOp.addPassage(passage)){//success
				//to article
				response.sendRedirect("index.jsp");
			}
			else{
				//to error page
				response.sendRedirect("sign-in");
			}
		}
	}

}
