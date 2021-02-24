<%@include file="connection.jsp" %>
<%
long mobile=Long.parseLong(request.getParameter("mobile"));
String password=request.getParameter("password");

ResultSet rs=smt.executeQuery("select * from user where mobile="+mobile+" and password='"+password+"'");
if(rs.next()){
	session.setAttribute("uname",rs.getString("name"));
	session.setAttribute("mobile",rs.getLong("mobile"));
	response.sendRedirect("UserHome.jsp");
}else{
%>
<script>
alert("invalid Username or Password");
window.location="UserLogin.html";
</script>
<%
}
%>