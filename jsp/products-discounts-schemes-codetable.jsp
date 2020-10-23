<%@ include file="/includes/core.jsp" %>
<div class="transfer-section">
  <h5>Discount&nbsp;Codes</h5>
  <table class="table table-bordered" style="margin-bottom: 1rem; width: 50%;">
    <tbody>
      ${requestScope.CODETABLE}
    </tbody>
  </table>
  <button type="button" class="save-btn" onclick="closeResultFrame()">Close</button>
</div> <!-- end .transfer-section -->
