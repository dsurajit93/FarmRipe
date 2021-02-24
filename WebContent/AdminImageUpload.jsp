<%@ include file="HeadAdmin.jsp" %>
<%
session.setAttribute("pname",request.getParameter("productname"));
session.setAttribute("price",Float.parseFloat(request.getParameter("price")));
session.setAttribute("stock",Integer.parseInt(request.getParameter("stock")));
session.setAttribute("description",request.getParameter("description"));
%>
<div class="container">
    <ul class="breadcrumb">
        <li><a href="index.html"><i class="fa fa-home"></i></a></li>
        <li><a href="login.html">Admin</a></li>
        <li><a href="register.html">Add Product Image</a></li>
    </ul>
		    <div class="row">
        <div class="col-sm-9" id="content">
            <h1>Add Image</h1>
                     <form class="form-horizontal" enctype="multipart/form-data" method="post" action="AdminAddProductDB.jsp">
                    <div class="form-group required">
                        <label for="input-image" class="col-sm-2 control-label">Image</label>
                        <div class="col-sm-10">
                            <input type="file" class="form-control" id="input-image"  name="image"  required>
                        </div>
                    </div>
                </fieldset> 
				<div class="buttons">
			         <center>
			            <input type="Submit" class="btn btn-primary" value="Upload">
			         </center>
		       </div>
            </form>
            
        </div>
    </div>
</div>