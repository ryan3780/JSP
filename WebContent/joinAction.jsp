<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %> <!-- 만든 class를 가져오는  -->
<%@ page import="java.io.PrintWriter" %> <!-- java 사용할 수 있게 해준다. -->
<% request.setCharacterEncoding("UTF-8"); %> <!-- 들어오는 데이터를 모두 UTF-8로 바꿔준다. -->
<!-- 자바 빈즈를 사용한다고 알려주는 것이다. -->
<jsp:useBean id="user" class="user.User" scope="page" />
<!--login.jsp에서 name="userID" 라는 것을 받아서 user정보에 넣는다.  -->
<jsp:setProperty name="user" property="userID" />
<jsp:setProperty name="user" property="userPassword" />
<jsp:setProperty name="user" property="userName" />
<jsp:setProperty name="user" property="userGender" />
<jsp:setProperty name="user" property="userEmail" />
<!DOCTYPE html>
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
		if( userID != null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('이미 로그인')");
		script.println("location.href = 'main.jsp'");
		script.println("</script>");
		}
	
		if(user.getUserID()==null || user.getUserPassword() ==null || user.getUserGender()==null 
			|| user.getUserName()==null || user.getUserEmail()==null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('안쓴거 있어')");
		script.println("history.back()");
		script.println("</script>");
		} else {
			
		UserDAO userDAO = new UserDAO();
		int result = userDAO.join(user);
		if(result == -1){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('아이디 이미 존재')");
			script.println("history.back()");
			script.println("</script>");
		}else{
			session.setAttribute("userID", user.getUserID());
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("location.href='main.jap'");
			script.println("</script>");
		
			}
		}
	%>

</body>
</html>