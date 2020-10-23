<%@ include file="/includes/core.jsp" %>
<div class="transfer-section">
  <form method="post" action="https://vendors-new.bmtmicro.com/servlets/Vendors.Subscriptions">
    <input type="hidden" name="ACTION" value="11" />
    <input type="hidden" name="SUBSCRIPTIONID" value="${requestScope.SUBSCRIPTIONID}">
    <input type="hidden" name="NAME" value="${requestScope.NAME}">
    <input type="hidden" name="EMAIL" value="${requestScope.EMAIL}">
    <input type="hidden" name="NEXT_PAGE" value="https://vendors-new.bmtmicro.com/customers-manage-subscriptions-cancelled.jsp">
    <input type="hidden" name="ERROR_PAGE" value="https://vendors-new.bmtmicro.com/error-div.jsp">
    <h5>Confirm Cancelation of Subscription</h5>
    <p>Please confirm cancelation of the subscription for <b>${requestScope.NAME}</b> (${requestScope.EMAIL}).</p>
    <button type="submit" class="save-btn">Confirm</button>
  </form>
</div> <!-- end .transfer-section -->
