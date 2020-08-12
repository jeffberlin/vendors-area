<%@ include file="/includes/core.jsp" %>
<div class="transfer-section">
  <form method="post" name="transfers" action="https://vendors-new.bmtmicro.com/servlets/Vendors.V2VTransfer">
    <input type="hidden" name="NEXT_PAGE" value="https://vendors-new.bmtmicro.com/sales-manage-transfers.jsp" />
    <input type="hidden" name="ERROR_PAGE" value="https://vendors-new.bmtmicro.com/error-div.jsp" />
    <input type="hidden" name="TRANSFERID" value="${param.TRANSFERID}" />
    <input type="hidden" name="ACTION" value="10" />
    <h5>Add New Affiliate Transfer</h5>
    <span>
      <label>Beneficiary Affiliate ID:</label>
      <input name="TOAFFILIATEID" maxlength="8" size="8" value="${param.TOAFFILIATEID}" title="This should be the vendor ID receiving this transfer." style="margin-bottom: .8rem;"/>
    </span>
    <c:if test = "${param.MULTICURRENCY == -1}">
      <br clear="all" />
      <span>
        <label>Currency:</label>
        <select name="CURRENCY" style="margin-bottom: .8rem;">
          <option value="" selected>All Currencies</option>
          <option value="USD">USD</option>
          <option value="GBP">GBP</option>
          <option value="EUR">EUR</option>
        </select>
      </span>
      <input type="hidden" name="CURRENCY" value="${param.CURRENCY}">
    </c:if>
    <br clear="all" />
    <span>
      <label>Amount:</label>
      <input name="AMOUNT" value="${param.AMOUNT}" size="10" title="Enter the amount in the text field. Numbers only, decimals are allowed." style="margin-bottom: .8rem;" />
    </span>
    <br clear="all">
    <span>
      <label style="vertical-align: top;">Notes:</label>
      <textarea name="NOTES" rows="5" cols="60" style="margin-bottom: .8rem;"></textarea>
    </span>
    <br clear="all" />
    <span>
      <button class="save-btn" type="button" onclick="submitAffiliateTransfer (transfers);" style="margin-right: .5rem;">Save</button>
      <button class="save-btn" type="button" onclick="closeResultFrame();">Close</button>
    </span>
  </form>
</div>
