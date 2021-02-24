<%@page import="java.sql.*" %>
<%!
Connection con;
Statement smt;
public void jspInit(){
	try{
		Class.forName("com.mysql.cj.jdbc.Driver");
		con=DriverManager.getConnection("jdbc:mysql://localhost:3306/farmripe","root","12345");
		smt=con.createStatement();
	}catch(Exception ee){
		ee.printStackTrace();
	}
}
%>