<%@ include file="/includes/core.jsp" %>
<div class="transfer-section">
  <form method="post" action="https://vendors-new.bmtmicro.com/servlets/Vendors.SplitSchemes">
    <input type="hidden" name="NEXT_PAGE" value="https://vendors-new.bmtmicro.com/products-manage-splits.jsp" />
    <input type="hidden" name="ERROR_PAGE" value="https://vendors-new.bmtmicro.com/error.jsp" />
    <input type="hidden" name="SCHEMEID" value="${requestScope.SCHEMEID}" />
    <input type="hidden" name="ACTION" value="12" />
    <h5>Confirm Deletion of Vendor Split</h5>
    <p>Please confirm deletion of the <strong class="datesran">${requestScope.NAME}</strong> Vendor Split.</p>
    <p>By pressing delete you will have effectively cancelled this Vendor Split.</p>
    <p style="color: red;">The beneficiary will not receive royalties for any past sales during the current month or any future sales.</p>
    <button type="submit" class="save-btn" style="margin-right: .5rem;">Delete Split</button>
    <button type="button" class="save-btn" onclick="closeResultFrame()">Cancel</button>
  </form>
</div> <!-- end .transfer-section -->
