<%@ page pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ include file="/includes/core.jsp" %>
<div class="transfer-section">
  <h5>Short Order Link</h5>
  <p><strong>https://secure.bmtmicro.com/SCL/${requestScope.LINKID}</strong></p>
  <c:if test="${requestScope.EXPIRATIONDATE!=''}">
    <p>This link expires on ${requestScope.EXPIRATIONDATE}.</p>
  </c:if>
  <button type="button" class="save-btn" onclick="closeResultFrame ();">Close</button>
</div> <!-- end .transfer-section -->
