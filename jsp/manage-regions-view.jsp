<%@ include file="/includes/core.jsp" %>
<div class="transfer-section">
  <h5>View Region</h5>
  <span>
    <label>Name:&nbsp;</label>
    <strong style="margin-bottom: 1rem;">${param.NAME}</strong>
  </span>
  <h6>Countries in this Region:</h6>
  <select name="SELECTEDLIST" style="width:45%; height: 150px; margin-bottom: 1rem;" multiple="multiple" disabled>
     ${param.SELECTEDCOUNTRIES}
  </select>
  <br>
  <button type="button" class="save-btn" onclick="closeResultFrame()">Close</button>
</div> <!-- end .transfer-section -->
