<%@include file="HeadUser.jsp" %>
<%@include file="connection.jsp" %>
<style>

.user-container{
	margin: 3px 100px;
}
.veg{
	margin: 8px;
	height: 240px;
	width: 200px;
	//border: 2px solid black;
	float: left;
}
#vi{
	height: 150px;
	width: 200px;
}
#vn,#vp,#vs{
	display:block;
	text-align:center;
	padding: 3px;
}
#vn{
	background-color: yellowgreen;
	color: white;
}
#vp{
	background-color:greenyellow;
}
#vs{
    background-color: aliceblue;    
}
#vs a{
	padding: 3px 80px;
}
</style>
<div class="user-container">
<%
ResultSet rs=smt.executeQuery("select * from vegetables");
while(rs.next()){
%>
<div class="veg">
<img src="image/<%=rs.getString("image") %>" id="vi">
<span id="vn"><%=rs.getString("name") %></span>
<span id="vp"><i class="fa fa-inr"></i> <%=rs.getFloat("price") %></span>
<span id="vs">
<%
	if(rs.getInt("stock")>0){
		%>
		<a href="VegDetails.jsp?vid=<%=rs.getInt("id") %>">Buy</a>
		<%
	}else{
		out.print("Out of Stock");
	}
%>
</span>
</div>
<%
}
%>
</div>

<%!
public void jspDestroy(){
	try{
		con.close();
	}
	catch(Exception ee){
		ee.printStackTrace();
	}
}
%>