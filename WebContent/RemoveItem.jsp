<%@page import="java.util.*" %>
<%
int vid=Integer.parseInt(request.getParameter("vid"));
HashMap cart=(HashMap)session.getAttribute("items");
cart.remove(vid);
if(cart.isEmpty()){
	session.removeAttribute("items");
}
else
	session.setAttribute("items",cart);
response.sendRedirect("UserCart.jsp");
%>