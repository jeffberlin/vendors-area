<%@ include file="/includes/core.jsp" %>
<div class="transfer-section">
  <h5>Short Order Link</h5>
  <p><strong>https://secure.bmtmicro.com/SCL/${param.LINKID}</strong></p>
  <!--##SELECT(EXPIRATIONDATE,"","","<p>This link expires on %%EXPIRATIONDATE%%.</p>")##-->
  <c:if test="${param.EXPIRATIONDATE!=''}">
    <p>This link expires on ${param.EXPIRATIONDATE}.</p>
  </c:if>
  <button type="button" class="save-btn" onclick="closeResultFrame ();">Close</button>
</div> <!-- end .transfer-section -->
