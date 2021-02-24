<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"  import="com.oreilly.servlet.MultipartRequest,java.io.File,java.util.Enumeration,java.sql.*"%>
<%@ include file="connection.jsp" %>


<%

String vname=(String)session.getAttribute("pname");
float price=(float)session.getAttribute("price");
int stock=(int)session.getAttribute("stock");
String description=(String)session.getAttribute("description");


String root=request.getServletContext().getRealPath("");
root=root+File.separator+"image";

MultipartRequest m = new MultipartRequest(request, root);  
 
Enumeration files=m.getFileNames();
String name=(String)files.nextElement();
String FileName=m.getFilesystemName(name);

int i=smt.executeUpdate("insert into vegetables values(0,'"+vname+"',"+price+","+stock+",'"+description+"','"+FileName+"')");
if(i>0){
%>
<script>
alert("Product Added");
window.location="AdminHome.jsp";
</script>
<%
session.removeAttribute("pname");
session.removeAttribute("price");
session.removeAttribute("stock");
session.removeAttribute("description");
}else{
	%>
	<script>
	alert("Select Different Product Name or Different ProductImage");
	window.location="AdminAddProduct.jsp";
	</script>
	<%
}
%>