<%@ include file="HeadAdmin.jsp" %>
<%@include file="connection.jsp" %>
<style>
.table-striped{
	width: 80%;
	margin-left: 100px;
}
.stock-container a{
	color: white;
}
</style>
<div class="container">
    <ul class="breadcrumb">
        <li><a href="index.html"><i class="fa fa-home"></i></a></li>
        <li><a href="login.html">Admin</a></li>
        <li><a href="register.html">Stock</a></li>
    </ul>
</div>
<div class="stock-container">
<table class="table table-striped">
<tr><th>Image</th><th>Name</th><th>Price/Kg</th><th>Stock (Kg)</th><th></th></tr>
<%
ResultSet rs=smt.executeQuery("select * from vegetables order by name");
while(rs.next()){
%>
<tr><td><img src="image/<%=rs.getString("image") %>" height="100" width="100"></td>
	<td><%=rs.getString("name") %></td>
	<td><%=rs.getFloat("price") %></td>
	<td><%=rs.getInt("stock") %></td>
	<td><a href="AdminUpdateVegetable.jsp?vid=<%=rs.getInt("id") %>" class="btn btn-dark">Update</a>
</tr>
<%
}

%>
</table>
</div>