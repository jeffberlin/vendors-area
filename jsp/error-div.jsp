<%@ include file="/includes/core.jsp" %>
<div class="transfer-section">
  <h4>Error</h4>
  <p>An error has occurred.</p>
  <p>${ param.MESSAGE }
    <c:if test = "${ param.MESSAGE == null }">
      We are unable to complete your request at this time. The system may be down at this time. Please wait 60 minutes and try your report again. If you continue to have difficulties, please contact <a href="mailto:vendors@bmtmicro.com">vendors@bmtmicro.com</a> for assistance.
    </c:if>
  </p>
  <button type="button" class="save-btn" onclick="closeResultFrame()" >Close</button>
</div> <!-- end .transfer-section -->
