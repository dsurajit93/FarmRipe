<%@ include file="HeadAdmin.jsp" %>
<%@ include file="connection.jsp" %>
<style>
.table-striped{
	margin: 3px 100px;
	width: 80%;
}
</style>
<div class="container">
    <ul class="breadcrumb">
        <li><a href="index.html"><i class="fa fa-home"></i></a></li>
        <li><a href="login.html">Admin</a></li>
        <li><a href="register.html">Sales Report</a></li>
    </ul>
</div>
<div>
<table class="table table-striped">
<tr><th>Name</th><th>Mobile</th><th>Product</th><th>Quantity</th><th>Amount</th><th>Ordered On</th><th>Shipping Address</th></tr>
<%
ResultSet rs=smt.executeQuery("select * from orders order by order_date desc");
while(rs.next()){
%>
<tr>
	<td><%=rs.getString("cname") %></td>
	<td><%=rs.getLong("mobile") %></td>
	<td><%=rs.getString("product") %></td>
	<td><%=rs.getFloat("quantity") %></td>
	<td><%=rs.getFloat("amount") %></td>
	<td><%=rs.getString("order_date") %></td>
	<td><%=rs.getString("shipping_address") %></td>
</tr>
<%} %>
</table>
</div>