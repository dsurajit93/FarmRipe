<%@ include file="HeadAdmin.jsp" %>
<%@ include file="connection.jsp" %>
<%!
String vname;
float price;
int stock;
int vid;
String description;
%>
<%
vid=Integer.parseInt(request.getParameter("vid"));
ResultSet rs=smt.executeQuery("select * from vegetables where id="+vid);
if(rs.next()){
	vname=rs.getString("name");
	price=rs.getFloat("price");
	stock=rs.getInt("stock");
	description=rs.getString("description");
}
%>
<div class="container">
    <ul class="breadcrumb">
        <li><a href="index.html"><i class="fa fa-home"></i></a></li>
        <li><a href="login.html">Admin</a></li>
        <li><a href="register.html">Update Product</a></li>
    </ul>
		    <div class="row">
        <div class="col-sm-9" id="content">
            <h1>Update Product</h1>
            <form class="form-horizontal" method="post" action="AdminUpdateVegDB.jsp">
                <input type="hidden" name="vid" value="<%=vid %>">
                <fieldset id="Product">
                    <legend>Update Your Product Details</legend>
                    <div class="form-group required">
                        <label for="input-productname" class="col-sm-2 control-label">Product Name</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="input-productname" name="productname" value="<%=vname %>" readonly>
                        </div>
                    </div>
                      <div class="form-group required">
                        <label for="input-price" class="col-sm-2 control-label">New Price /KG</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="input-price" name="price" value="<%=price %>" required>
                        </div>
                    </div>
                    <div class="form-group required">
                        <label for="input-stock" class="col-sm-2 control-label">Updated Stock</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="input-stock" name="stock" value="<%=stock %>" required>
                        </div>
                    </div>
                    <div class="form-group required">
                        <label for="input-description" class="col-sm-2 control-label">Description</label>
                        <div class="col-sm-10">
                          <textarea rows="5" cols="102" class="form-control" id="input-description" name="description"  required>
                          <%=description %>
                          </textarea>
                        </div>
                    </div>
                </fieldset> 
				<div class="buttons">
			         <center>
			            <input type="Submit" class="btn btn-primary" value="Continue">
			         </center>
		       </div>
            </form>
        </div>
    </div>
</div>