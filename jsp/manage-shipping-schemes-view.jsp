<%@ include file="/includes/core.jsp" %>
<div class="transfer-section">
  <form method="post" action="https://vendors-new.bmtmicro.com/servlets/Vendors.ShippingCost">
    <input type="hidden" name="REGIONLIST" value="${requestScope.REGIONLIST}" />
    <input type="hidden" name="SHIPPINGCOSTLIST" value="${requestScope.SHIPPINGCOSTLIST}" />
    <h5>View Shipping Scheme</h5>
    <span>
      <label>Name:&nbsp;</label>
      ${requestScope.NAME}
    </span>
    <h6>Default Shipping Costs</h6>
    <div class="item-info">
      <label>First Item:&nbsp;</label>
      <span>${requestScope.FIRSTITEM}</span>
      <label>Next Item:&nbsp;</label>
      <span>${requestScope.NEXTITEM}</span>
      <label>Ship PID:&nbsp;</label>
      <span>${requestScope.PRODUCTID}</span>
    </div>
    <h6>Region Dependent Shipping Costs</h6>
    <div class="item-info" id="regions"></div>
  </form>
  <button type="button" class="save-btn" onclick="closeResultFrame()">Close</button>
</div> <!-- end .transfer-section -->
<script>$(document).ready(function(){ viewRegions(); });</script>
