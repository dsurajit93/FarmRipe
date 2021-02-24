<%@include file="HeadUser.jsp" %>
<%@include file="connection.jsp" %>
<style>
.user-container{
	margin: 3px 100px;
}
.vegd{
	margin: 5px 10px;
	height: 500px;
	width: 500px;
	float: left;
}
#vi{
	height: 400px;
	width: 400px;
}
#hl{
	display: block;
	text-align: center;
	background-color: yellowgreen;
	color: white;
	font-weight: bold;
	font-size: 22px;
}
#description{
	margin: 10px 0px;
	text-align: justify;
}
#price{
    text-align: center;
    font-size: 30px;
    margin: 10px 0px;
}
.quantity{
	padding: 5px 50px;
}
</style>
    
<div class="user-container">
<%
int vid=Integer.parseInt(request.getParameter("vid"));
ResultSet rs=smt.executeQuery("select * from vegetables where id="+vid);
if(rs.next()){
%>
<div class="vegd">
<img src="image/<%=rs.getString("image") %>" id="vi">
</div>
<div class="vegd">
<span id="hl">DESCRIPTION</span>
<p class="description"><%=rs.getString("description") %>
<span id="hl">PRICE</span>
<p id="price"><i class="fa fa-inr"></i> <%=rs.getFloat("price") %> / KG</p>
<span id="hl">QUANTITY</span>
<div class="quantity">
<form action="UserCart.jsp" method="post">
<input type="hidden" name="item" value="<%=vid %>">
<input type="number" name="quantity" required>(in kg)<br><br>
<input type="submit" value="Add to Cart" class="btn btn-success">
</form>
</div>
</div>
<%
}
%>
</div>