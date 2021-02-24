<%@include file="connection.jsp" %>
<%
String email=request.getParameter("email");
String password=request.getParameter("password");

ResultSet rs=smt.executeQuery("select * from admin where email='"+email+"' and password='"+password+"'");
if(rs.next()){
	session.setAttribute("email",email);
	response.sendRedirect("AdminHome.jsp");
}
else{
%>
<script>
alert("Invalid Username or Password");
window.location="AdminLogin.html";
</script>
<%
}
%>