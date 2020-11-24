<%@ page pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ include file="/includes/core.jsp" %>
<div class="transfer-section">
  <form method="post" action="https://vendors-new.bmtmicro.com/servlets/Vendors.Tickets">
    <input type="hidden" name="ACTION" value="12" />
    <input type="hidden" name="TICKETID" value="${requestScope.TICKETID}" />
    <input type="hidden" name="NAME" value="${requestScope.NAME}" />
    <input type="hidden" name="EMAIL" value="${requestScope.EMAIL}" />
    <input type="hidden" name="NEXT_PAGE" value="https://vendors-new.bmtmicro.com/customers-manage-tickets-added.jsp" />
    <input type="hidden" name="ERROR_PAGE" value="https://vendors-new.bmtmicro.com/error-div.jsp" />
    <h5>Add&nbsp;Tickets&nbsp;for&nbsp;${requestScope.NAME}</h5>
    <span>
      Number of tickets to generate:&nbsp;
      <input type="text" name="COUNT" value="1" style="margin-bottom: 1rem;"/>
    </span>
    <br>
    <p>Please confirm cancelation of the subscription for&nbsp;<strong>${requestScope.NAME}</strong>&nbsp;(${requestScope.EMAIL}).</p>
    <button type="button" class="save-btn" style="margin-right: .5rem;" onclick="submitForm (this.form);">Confirm</button>
    <button type="button" class="save-btn" onclick="closeResultFrame();">Cancel</button>
  </form>
</div> <!-- end .transfer-section -->
