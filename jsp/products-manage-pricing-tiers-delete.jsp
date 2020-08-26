<%@ include file="/includes/core.jsp" %>
<div class="transfer-section">
  <form method="post" action="https://vendors-new.bmtmicro.com/servlets/Vendors.TieredPricing">
    <input type="hidden" name="NEXT_PAGE" value="https://vendors-new.bmtmicro.com/products-manage-pricing-tiers.jsp" />
    <input type="hidden" name="ERROR_PAGE" value="https://vendors-new.bmtmicro.com/error.jsp" />
    <input type="hidden" name="TIERID" value="${param.TIERID}" />
    <input type="hidden" name="ACTION" value="12" />
    <h5>Confirm Deletion of Tier Pricing Scheme</h5>
    <p>Please confirm deletion of the <strong>${param.NAME}</strong> pricing tier.</p>
    <p>By selecting delete you will have effectively cancelled this pricing tier. A new prcing tier will have to be created.</p>
    <button type="submit" value="Delete" class="save-btn" style="margin-right: .5rem;">Delete</button>
    <button type="button" class="save-btn" onclick="closeResultFrame()">Cancel</button>
  </form>
</div> <!-- end .transfer-section -->
