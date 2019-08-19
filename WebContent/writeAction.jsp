<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="bbs.BbsDAO" %> <!-- 만든 class를 가져오는  -->
<%@ page import="java.io.PrintWriter" %> <!-- java 사용할 수 있게 해준다. -->
<% request.setCharacterEncoding("UTF-8"); %> <!-- 들어오는 데이터를 모두 UTF-8로 바꿔준다. -->
<!-- 자바 빈즈를 사용한다고 알려주는 것이다. -->
<jsp:useBean id="bbs" class="bbs.Bbs" scope="page" />
<!--login.jsp에서 name="userID" 라는 것을 받아서 user정보에 넣는다.  -->
<jsp:setProperty name="bbs" property="bbsTitle" />
<jsp:setProperty name="bbs" property="bbsContent" />

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
		}else{
			
			if(bbs.getBbsTitle()==null || bbs.getBbsContent()==null){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('안쓴거 있어')");
				script.println("history.back()");
				script.println("</script>");
				} else {
					
				BbsDAO bbsDAO = new BbsDAO();
				int result = bbsDAO.write(bbs.getBbsTitle(), userID, bbs.getBbsContent());
				if(result == -1){
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('글쓰기 실패')");
					script.println("history.back()");
					script.println("</script>");
				}else{
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("location.href='bbs.jsp'");
					script.println("</script>");
				
					}	
			}
		
		}
	%>

</body>
</html>