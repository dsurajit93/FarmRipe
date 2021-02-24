<%@include file="connection.jsp" %>
<%@include file="HeadUser.jsp" %>
<style>
.table-striped{
	width: 40%;
	margin: 5px 300px;
}
</style>
<%
String vname=request.getParameter("key");
ResultSet rs=smt.executeQuery("select * from vegetables where name like '%"+vname+"%'");
%>
<table class="table table-striped">
<%
while(rs.next()){
%>
	<tr><td><img src="image/<%=rs.getString("image") %>" height="150" width="150"></td>
		<td><%=rs.getString("name") %></td>
		<td>Rs <%=rs.getFloat("price") %> / KG</td>
		<td><a href="VegDetails.jsp?vid=<%=rs.getInt("id") %>" class="btn btn-success">Buy</a></td>
	</tr>
<%
}
%>
</table>
