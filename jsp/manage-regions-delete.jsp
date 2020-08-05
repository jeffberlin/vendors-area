<%@ include file="/includes/core.jsp" %>
<div class="transfer-section">
  <form method="post" action="https://vendors-new.bmtmicro.com/servlets/Vendors.WorldRegions">
    <input type="hidden" name="NEXT_PAGE" value="https://vendors-new.bmtmicro.com/manage-regions.jsp" />
    <input type="hidden" name="ERROR_PAGE" value="https://vendors-new.bmtmicro.com/error-div.jsp" />
    <input type="hidden" name="REGIONID" value="${param.REGIONID}" />
    <input type="hidden" name="ACTION" value="12" />
    <h5>Confirm Deletion of Region</h5>
    <p>Please confirm deletion of the <strong class="datesran">${param.NAME}</strong> Region.</p>
    <p>By pressing delete you will remove this Region and any pricing set for it.</p>
    <p style="color: red;">Note that deleting a region will remove all region specific pricing that has been set up for the deleted region.</p>
    <button type="submit" class="save-btn" style="margin-right: .5rem;">Delete Region</button>
    <button type="button" class="save-btn" onclick="closeResultFrame()">Close</button>
  </form>
</div> <!-- end .transfer-section -->
