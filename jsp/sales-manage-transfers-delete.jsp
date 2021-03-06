<%@ page pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ include file="/includes/core.jsp" %>
<div class="transfer-section">
  <form method="post" action="https://vendors-new.bmtmicro.com/servlets/Vendors.V2VTransfer" target="_parent">
    <input type="hidden" name="NEXT_PAGE" value="https://vendors-new.bmtmicro.com/sales-manage-transfers.jsp" />
    <input type="hidden" name="ERROR_PAGE" value="https://vendors-new.bmtmicro.com/error.jsp" />
    <input type="hidden" name="TRANSFERID" value="${requestScope.TRANSFERID}" />
    <input type="hidden" name="ACTION" value="12" />
    <h5>Confirm Cancelation of Transfer</h5>
    <p>Please confirm cancelation of this Transfer.</p>
    <p>By pressing cancel you will have effectively cancelled this Transfer.</p>
    <p style="font-weight: bold; color: red; font-size: .8rem;">The beneficiary will not receive any funds for this transaction.</p>
    <button type="submit" class="save-btn" onclick="this.form.submit ()" style="margin-right: .5rem;">Cancel Transfer</button>
    <button type="button" class="save-btn" onclick="closeResultFrame()">Close</button>
  </form>
</div> <!-- end .transfer-section -->
