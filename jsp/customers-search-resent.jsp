<%@ include file="/includes/core.jsp" %>
<div class="transfer-section">
  <h5>Customer Email Resent</h5>
  <p>The customer\'s product information email has successfully been resent.</p>
  <c:if test="${!empty param.CC}"><br clear='all'><p>A copy of this email has also been sent to: ${param.CC}.</p></c:if>
  <button type="button" class="save-btn" onclick="closeResultFrame()">Cancel</button>
</div> <!-- end .transfer-section -->
