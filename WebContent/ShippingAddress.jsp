<%@page import="java.util.*" %>
<%@include file="connection.jsp" %>
<%@include file="HeadUser.jsp" %>
<style>
.panel-default{
	margin: 5px 250px;
}
.table-striped{
	width: 60%;
	margin: 5px 200px;
}
</style>
	<form action="ConfirmOrder.jsp" method="post">
        <div class="panel panel-default">
          <div class="panel-heading">
            <h4 class="panel-title">Step 1: Delivery Details <i class="fa fa-caret-down"></i></h4>
          </div>
            <div class="panel-body">
                <div class="radio">
                </div>
                <br>
                <div id="shipping-new" >
                  <div class="form-group required">
                    <label for="input-shipping-address-2" class="col-sm-2 control-label">Address 1</label>
                    <div class="col-sm-10">
                      <input type="text" class="form-control" id="input-shipping-address-2" placeholder="Address 1" value="" name="address1" required>
                    </div>
                  </div>
                  <div class="form-group">
                    <label for="input-shipping-address-2" class="col-sm-2 control-label">Address 2</label>
                    <div class="col-sm-10">
                      <input type="text" class="form-control" id="input-shipping-address-2" placeholder="Address 2" value="" name="address2" required>
                    </div>
                  </div>
                  <div class="form-group required">
                    <label for="input-shipping-city" class="col-sm-2 control-label">City</label>
                    <div class="col-sm-10">
                      <input type="text" class="form-control" id="input-shipping-city" placeholder="City" value="" name="city" required>
                    </div>
                  </div>
                  <div class="form-group required">
                    <label for="input-shipping-postcode" class="col-sm-2 control-label">Post Code</label>
                    <div class="col-sm-10">
                      <input type="text" class="form-control" id="input-shipping-postcode" placeholder="Post Code"  name="postcode" required>
                    </div>
                  </div>
                  <div class="form-group required">
                    <label for="input-shipping-country" class="col-sm-2 control-label">Country</label>
                    <div class="col-sm-10">
                     <input type="text" class="form-control" id="input-shipping-postcode" placeholder="Country"  name="country" required>
                    </div>
                  </div>
                  <div class="form-group required">
                    <label for="input-shipping-zone" class="col-sm-2 control-label">Region / State</label>
                    <div class="col-sm-10">
                      <input type="text" class="form-control" id="input-shipping-postcode" placeholder="State"  name="state" required>
                    </div>
                  </div>
                </div>
                </div>
                </div>
        <div class="panel panel-default">
          <div class="panel-heading">
            <h4 class="panel-title">Step 2: Payment Method <i class="fa fa-caret-down"></i></h4>
          </div>
        
            <div class="panel-body">
              <p>Please select the preferred payment method to use on this order.</p>
              <div class="radio">
                <label>
                  <input type="radio" checked="checked" value="cod" name="payment_method">
                  Cash On Delivery </label>
              </div>
            </div>
          </div>
      
        <div class="panel panel-default">
          <div class="panel-heading">
            <h4 class="panel-title">Step 3: Confirm Order <i class="fa fa-caret-down"></i></h4>
          </div>
        
            <div class="panel-body">
              <div class="table-responsive">
              
 <%
  if(session.getAttribute("items")!=null){
	HashMap cart=(HashMap)session.getAttribute("items");
	
	Set key=cart.keySet();
	Iterator ii=key.iterator();
	%>
	<table class="table table-striped">
	<tr><th colspan="2">Item</th><th>Unit Price</th><th>Quantity (in KG)</th><th class="text-right">Amount</th></tr>
	<%
	float total=0;
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
		<td align="right"><%=(quantity * rs.getFloat("price")) %></td>
		</tr>
		<%
		total+=(quantity * rs.getFloat("price"));
		}
	}
	%>
	<tr><td colspan="5" align="right">
	Total Amount : Rs/- <%=total %> 
	</td></tr>
	<tr><td colspan="5" align="right">
	Flat Shipping Charge : Rs/-  50 
	</td></tr>  
	<tr><td colspan="5"  class="text-right">
	Amount Payable : Rs/-  <%=(total+50) %> 
	</td></tr> 
	</table>
              <div class="buttons">
                <div class="pull-right">
                  <input type="submit" class="btn btn-primary" id="button-confirm" value="Confirm Order">
                </div>
              </div>
<%
  }
%>
</div>
</div>
</div>
</form>

