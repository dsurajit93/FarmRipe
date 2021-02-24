<%@ include file="HeadAdmin.jsp" %>

<div class="container">
    <ul class="breadcrumb">
        <li><a href="index.html"><i class="fa fa-home"></i></a></li>
        <li><a href="login.html">Admin</a></li>
        <li><a href="register.html">Add Product</a></li>
    </ul>
		    <div class="row">
        <div class="col-sm-9" id="content">
            <h1>Add Product</h1>
            <form class="form-horizontal" method="post" action="AdminImageUpload.jsp">
                <fieldset id="Product">
                    <legend>Your Product Details</legend>
                    <div class="form-group required">
                        <label for="input-productname" class="col-sm-2 control-label">Product Name</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="input-productname" placeholder="Product Name" name="productname" required>
                        </div>
                    </div>
                      <div class="form-group required">
                        <label for="input-price" class="col-sm-2 control-label">Price /KG</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="input-price" placeholder="Price" name="price"  required>
                        </div>
                    </div>
                    <div class="form-group required">
                        <label for="input-stock" class="col-sm-2 control-label">No. of Stock</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="input-stock" placeholder="Stock" name="stock"  required>
                        </div>
                    </div>
                    <div class="form-group required">
                        <label for="input-description" class="col-sm-2 control-label">Description</label>
                        <div class="col-sm-10">
                          <textarea rows="5" cols="102" class="form-control" id="input-description" placeholder="Description" name="description"  required></textarea>
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