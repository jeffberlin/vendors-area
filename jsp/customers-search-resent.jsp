<%@ page pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ include file="/includes/core.jsp" %>
<div class="transfer-section">
  <h5>Customer Email Resent</h5>
  <p>The customer&#39;s product information email has successfully been resent.</p>
  <c:if test="${!empty requestScope.CC}"><br clear='all'><p>A copy of this email has also been sent to: ${requestScope.CC}.</p></c:if>
  <button type="button" class="save-btn" onclick="closeResultFrame()">Cancel</button>
</div> <!-- end .transfer-section -->
