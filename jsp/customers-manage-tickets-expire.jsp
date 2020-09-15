<%@ include file="/includes/core.jsp" %>
<div class="transfer-section">
  <form method="post" action="https://vendors-new.bmtmicro.com/servlets/Vendors.Tickets">
    <input type="hidden" name="ACTION" value="11" />
    <input type="hidden" name="TICKETID" value="${param.TICKETID}">
    <input type="hidden" name="NAME" value="${param.NAME}">
    <input type="hidden" name="EMAIL" value="${param.EMAIL}">
    <input type="hidden" name="NEXT_PAGE" value="https://vendors-new.bmtmicro.com/customers-manage-tickets-expired.jsp">
    <input type="hidden" name="ERROR_PAGE" value="https://vendors-new.bmtmicro.com/error-div.jsp">
    <h5>Confirm&nbsp;Expiration&nbsp;of&nbsp;Ticket</h5>
    <p>Please confirm expiration of the ticket for&nbsp;<strong>${param.NAME}</strong>&nbsp;(${param.EMAIL}).</p>
    <button type="submit" class="save-btn" style="margin-right: .5rem;">Confirm</button>
    <button type="button" class="save-btn" onclick="closeResultFrame()">Cancel</button>
  </form>
</div> <!-- end .transfer-section -->
