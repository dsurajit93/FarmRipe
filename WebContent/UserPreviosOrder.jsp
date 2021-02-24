<%@include file="connection.jsp" %>
<%@include file="HeadUser.jsp" %>
<style>
.table-striped{
	width: 60%;
	margin: 5px 250px;
}
</style>
<table class="table table-striped">
<caption>Order History</caption>
<tr><th colspan="2">Item</th><th>Quantity(in kg)</th><th>Amount Payable</th><th>Order Date</th><th>Shipping Address</th></tr>
<%
long mobile=(long)session.getAttribute("mobile");
ResultSet rs=smt.executeQuery("select * from orders where mobile="+mobile+" order by order_date desc");
while(rs.next()){
%>
<tr><td><img src="image/<%=rs.getString("image") %>" height="50" width="50"></td>
	<td><%=rs.getString("product") %></td>
	<td><%=rs.getFloat("quantity") %></td>
	<td><%=rs.getFloat("amount") %></td>
	<td><%=rs.getString("order_date") %></td>
	<td><%=rs.getString("shipping_address") %></td>
</tr>
<%
}
%>
</table>