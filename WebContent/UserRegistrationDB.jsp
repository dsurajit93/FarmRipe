<%@ include file="connection.jsp" %>

<%
String name=request.getParameter("name");
String email=request.getParameter("email");
long mobile=Long.parseLong(request.getParameter("mobile"));
String password=request.getParameter("password");

int i=smt.executeUpdate("insert into user values('"+name+"','"+email+"',"+mobile+",'"+password+"')");
if(i==1){
%>
<script>
alert("Registered Successfully\n Login to continue");
window.location="UserLogin.html";
</script>
<%
}else{
	%>
	<script>
	alert("Alredy Have an account. Use Different Mobile Number and email");
	window.location="UserRegistration.html";
	</script>
	<%	
}
%>