<%@ include file="/includes/core.jsp" %>
<div class="transfer-section">
  <form method="post" action="https://vendors-new.bmtmicro.com/servlets/Vendors.ShippingCost">
    <h5>View Shipping Scheme</h5>
    <span>
      <label>Name:&nbsp;</label>
      ${param.NAME}
    </span>
    <h6>Default Shipping Costs</h6>
    <div class="item-info">
      <label>First Item:&nbsp;</label>
      <span>${param.FIRSTITEM}</span>
      <!-- <br> -->
      <label>Next Item:&nbsp;</label>
      <span>${param.NEXTITEM}</span>
      <!-- <br> -->
      <label>Ship PID:&nbsp;</label>
      <span>${param.PRODUCTID}</span>
    </div>
    <!-- <br clear="all"> -->
    <h6>Region Dependent Shipping Costs</h6>
    <div class="item-info" id="regions"></div>
  </form>
  <button type="button" class="save-btn" onclick="closeResultFrame()">Close</button>
</div> <!-- end .transfer-section -->
