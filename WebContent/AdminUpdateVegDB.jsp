<%@ include file="connection.jsp" %>
<%
int vid=Integer.parseInt(request.getParameter("vid"));
float price=Float.parseFloat(request.getParameter("price"));
int stock=Integer.parseInt(request.getParameter("stock"));
String description=request.getParameter("description");
int i=smt.executeUpdate("update vegetables set price="+price+", stock="+stock+", description='"+description+"'   where id="+vid);
if(i==1){
%>
<script>
alert("Product Updated");
window.location="AdminStock.jsp";
</script>
<%
}else{
	%>
	<script>
	alert("Something Wrong !! Try Again");
	window.location="AdminStock.jsp";
	</script>
	<%	
}
%>