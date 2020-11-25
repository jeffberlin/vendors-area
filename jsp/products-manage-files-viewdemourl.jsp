<%@ page pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ include file="/includes/core.jsp" %>
<div class="transfer-section">
  <p>The download link URL for file <strong>${ requestScope.NAME }</strong>:</p>
  <p>${ requestScope.DEMOURL }</p>
  <button type="button" class="save-btn" onclick="closeResultFrame()">Close</button>
</div> <!-- end .transfer-section -->
