<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="bbs.BbsDAO" %> <!-- 만든 class를 가져오는  -->
<%@ page import="java.io.PrintWriter" %> <!-- java 사용할 수 있게 해준다. -->
<% request.setCharacterEncoding("UTF-8"); %> <!-- 들어오는 데이터를 모두 UTF-8로 바꿔준다. -->
<%@ page import="bbs.Bbs" %>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 게시판 웹 사이트</title>
</head>
<body>
	<%	
		String userID=null;
		if(session.getAttribute("userID") !=null){
		userID = (String) session.getAttribute("userID");
		}
		if( userID == null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인 해')");
		script.println("location.href = 'login.jsp'");
		script.println("</script>");
		}
		int bbsID = 0;
		if(request.getParameter("bbsID")!= null){
			bbsID= Integer.parseInt(request.getParameter("bbsID"));
		}
		if(bbsID == 0){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('없는 글이야')");
			script.println("location.href = 'bbs.jsp'");
			script.println("</script>");
		}
		Bbs bbs = new BbsDAO().getBbs(bbsID);
		if(!userID.equals(bbs.getUserID())){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('니꺼 아냐')");
			script.println("location.href = 'bbs.jsp'");
			script.println("</script>");
		}else{
					
				BbsDAO bbsDAO = new BbsDAO();
				int result = bbsDAO.delete(bbsID);
				if(result == -1){
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('글 삭제 실패')");
					script.println("history.back()");
					script.println("</script>");
				}else{
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("location.href='bbs.jsp'");
					script.println("</script>");
				
					}	
		
		}
	%>

</body>
</html>