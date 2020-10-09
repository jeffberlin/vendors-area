<%@ include file="/includes/core.jsp" %>
<div class="transfer-section">
  <form method="post" action="https://vendors-new.bmtmicro.com/servlets/Vendors.ShippingCost">
    <input type="hidden" name="NEXT_PAGE" value="https://vendors-new.bmtmicro.com/manage-shipping-schemes.jsp" />
    <input type="hidden" name="ERROR_PAGE" value="https://vendors-new.bmtmicro.com/error.jsp" />
    <input type="hidden" name="SCHEMEID" value="${param.SCHEMEID}" />
    <input type="hidden" name="ACTION" value="12" />
    <h5>Confirm Deletion of Shipping Scheme</h5>
    <p>Please confirm deletion of the&nbsp;<span class="datesran"><strong>${param.NAME}</strong></span>&nbsp;Shipping Scheme.</p>
    <p>By pressing delete you will remove this Shipping Scheme and any pricing set for it.</p>
    <p style="color: red;">Note that deleting a scheme will remove the shipping fee for any products that are currently set up to use the deleted scheme.</p>
    <span>
      <button type="submit" class="save-btn" style="margin-right: .5rem;">Delete Scheme</button>
      <button type="button" class="save-btn" onclick="closeResultFrame()">Cancel</button>
    </span>
  </form>
</div> <!-- end .transfer-section -->
