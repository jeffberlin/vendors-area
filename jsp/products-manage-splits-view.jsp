<%@ include file="/includes/core.jsp" %>
<div class="transfer-section">
  <h5>View&nbsp;Vendor&nbsp;Split</h5>
  <span>
    <label>Name:&nbsp;</label>
    ${param.NAME}
  </span>
  <br>
  <span>
    <label>Percentage:&nbsp;</label>
    ${param.PERCENTAGE}
  </span>
  <br>
  <span>
    <label>Amount:&nbsp;</label>
    ${param.AMOUNT}
  </span>
  <br>
  <span>
    <label style="margin-bottom: 1rem;">
      Beneficiary&nbsp;Vendor&nbsp;ID:&nbsp;
    </label>
    ${param.SPLITVENDORID}
  </span>
  <h5>Products using this Vendor Split:</h5>
  <select name="SELECTEDLIST" style="width:60%;height: 150px; cursor: not-allowed; margin-bottom: 1rem;" multiple="multiple" disabled>
     ${param.SELECTEDPRODUCTS}
  </select>
  <br>
  <button type="button" class="save-btn" onclick="closeResultFrame()">Close</button>
</div> <!-- end .transfer-section -->
