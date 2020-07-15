<%@ include file="/includes/core.jsp" %>
<div class="transfer-section">
  <h5>View&nbsp;Transfer&nbsp;(Transfer#&nbsp;${param.TRANSFERID})</h5>
  <span>
    <label>Description:&nbsp;</label>
    <strong>${param.DESCRIPTION}</strong>
  </span>
  <br>
  <span>
    <label>Amount:&nbsp;</label>
    <strong>${param.AMOUNT}</strong>
  </span>
  <br>
  <span>
    <label style="margin-bottom: 1rem;">Notes:&nbsp;</label>
    <strong>${param.NOTES}.</strong>
  </span>
  <br>
  <button type="button" class="save-btn" onclick="closeResultFrame()">Close</button>
</div> <!-- end .transfer-section -->
