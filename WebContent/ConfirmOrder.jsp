<%@page import="java.util.*,java.text.*" %>
<%@include file="connection.jsp" %>
<%
PreparedStatement ps=con.prepareStatement("insert into orders values(0,?,?,?,?,?,?,?,?)");
PreparedStatement ps1=con.prepareStatement("update vegetables set stock= stock-? where id=?");
String address=request.getParameter("address1");
address+=", "+request.getParameter("address2");
address+=", "+request.getParameter("city");
address+=", "+request.getParameter("state");
address+=", "+request.getParameter("country");
address+=", "+request.getParameter("postcode");

//out.println(address);
String name=(String)session.getAttribute("uname");
long mobile=(long)session.getAttribute("mobile");
java.util.Date dd=new java.util.Date();
DateFormat df = new SimpleDateFormat("dd/MM/yyyy");
String today = df.format(dd);
if(session.getAttribute("items")!=null){
	HashMap cart=(HashMap)session.getAttribute("items");
	
	Set key=cart.keySet();
	Iterator ii=key.iterator();
	String pname="";
	String image="";
	float amount=0;
	while(ii.hasNext()){
		Integer item=(Integer)ii.next();
		Float quantity=(Float)cart.get(item);
		
		ResultSet rs=smt.executeQuery("select * from vegetables where id="+item);
		
		if(rs.next()){
		pname=rs.getString("name");
		image=rs.getString("image");
		amount=quantity * rs.getFloat("price");
		}
		ps.setString(1,name);
		ps.setLong(2,mobile);
		ps.setString(3,today);
		ps.setString(4,address);
		ps.setString(5,pname);
		ps.setString(6,image);
		ps.setFloat(7,quantity);
		ps.setFloat(8,amount);
		ps.addBatch();
		ps1.setFloat(1,quantity);
		ps1.setInt(2,item);
		ps1.addBatch();
	}
	int []res=ps.executeBatch();
	ps1.executeBatch();
	if(cart.size()==res.length){
		session.removeAttribute("items");
	%>
	<script>
	alert("Order Placed");
	window.location="UserPreviosOrder.jsp";
	</script>
	<%
	}else{
		%>
		<script>
		alert("Something Wrong");
		window.location="ShippingAddress.jsp";
		</script>
		<%	
	}
}
%>