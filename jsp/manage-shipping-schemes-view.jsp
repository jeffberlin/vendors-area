<%@ include file="/includes/core.jsp" %>
<div class="transfer-section">
  <form method="post" name="shipping" action="https://vendors-new.bmtmicro.com/servlets/Vendors.ShippingCost">
    <h5>View Shipping Scheme</h5>
    <span>
      <label>Name:&nbsp;</label>
      ${param.NAME}
    </span>
    <h6>Default Shipping Costs</h6>
    <span>
      <label>First Item:&nbsp;</label>
      ${param.FIRSTITEM}
      <br>
      <label>Next Item:&nbsp;</label>
      ${param.NEXTITEM}
      <br>
      <label>Ship PID:&nbsp;</label>
      ${param.PRODUCTID}
    </span>
    <br clear="all">
    <h6>Region Dependent Shipping Costs</h6>
    <div id="regions"></div>
  </form>
  <button type="button" class="save-btn" onclick="closeResultFrame()">Close</button>
</div> <!-- end .transfer-section -->
