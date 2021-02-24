<%@page import="java.util.*" %>
<%@include file="connection.jsp" %>
<%@include file="HeadUser.jsp" %>
<style>
.table-striped{
	width: 60%;
	margin: 5px 200px;
}
</style>
<%
//System.out.println(request.getParameter("quantity"));
if(request.getParameter("quantity")!=null){
	int item=Integer.parseInt(request.getParameter("item"));
	float quantity=Float.parseFloat(request.getParameter("quantity"));
	HashMap cart;
	if(session.getAttribute("items")==null){
		cart=new HashMap();
	}else{
		cart=(HashMap)session.getAttribute("items");
	}
	cart.put(new Integer(item),new Float(quantity));
	session.setAttribute("items",cart);
}
if(session.getAttribute("items")!=null){
	HashMap cart=(HashMap)session.getAttribute("items");
	
	Set key=cart.keySet();
	Iterator ii=key.iterator();
	%>
	<table class="table table-striped">
	<tr><th colspan="2">Item</th><th>Price/KG</th><th>Quantity(in KG)</th><th>Amount</th><th></th></tr>
	<%
	while(ii.hasNext()){
		Integer item=(Integer)ii.next();
		Float quantity=(Float)cart.get(item);
		ResultSet rs=smt.executeQuery("select * from vegetables where id="+item);
		
		while(rs.next()){
		%>
		<tr>
		<td><img src="image/<%=rs.getString("image") %>" height="75" width="75"></td>
		<td><h4><%=rs.getString("name") %></h4></td>
		<td><%=rs.getFloat("price") %></td>
		<td><%=quantity %></td>
		<td><%=(quantity * rs.getFloat("price")) %></td>
		<td><a href="RemoveItem.jsp?vid=<%=item %>" class="btn btn-warning">Remove</a>
		</tr>
		<%
		}
	}
	%>
	<tr><td colspan="6" align="right">
		<a href="UserHome.jsp" class="btn btn-success"><i class="fa fa-arrow-left"></i>Continue Shopping</a>
		<a href="ShippingAddress.jsp" class="btn btn-success">Check Out<i class="fa fa-arrow-right"></i></a>
	</td></tr></table>
	<%
}else{
%>
<center>
<br><br>
<h2>Cart is Empty</h2>
</center>
<%
}
%> 