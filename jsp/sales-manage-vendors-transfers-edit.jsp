<%@ include file="/includes/core.jsp" %>
<div class="transfer-section">
  <form method="post" action="https://vendors-new.bmtmicro.com/servlets/Vendors.V2VTransfer">
    <input type="hidden" name="NEXT_PAGE" value="https://vendors-new.bmtmicro.com/sales-manage-transfers.jsp" />
    <input type="hidden" name="ERROR_PAGE" value="https://vendors-new.bmtmicro.com/error-div.jsp" />
    <input type="hidden" name="TRANSFERID" value="${requestScope.TRANSFERID}" />
    <input type="hidden" name="ACTION" value="11" />
    <h5>Edit Vendor Transfer</h5>
    <span>
      <label>Beneficiary Vendor ID:&nbsp;</label>
      <input name="TOVENDORID" maxlength="8" size="8" value="${requestScope.TOVENDORID}" title="This should be the vendor ID credited with this transfer." style="margin-bottom: .8rem;" />
    </span>
    <c:choose>
      <c:when test="${requestScope.MULTICURRENCY == -1}">
        <br clear="all" />
        <span>
          <label>Currency:&nbsp;</label>
          <select name="CURRENCY" style="margin-bottom: .8rem;">
            <option value=""<c:if test="${requestScope.CURRENCY==''}"> selected</c:if>>All Currencies</option>
            <option value="USD"<c:if test="${requestScope.CURRENCY=='USD'}"> selected</c:if>>USD</option>
            <option value="GBP"<c:if test="${requestScope.CURRENCY=='GBP'}"> selected</c:if>>GBP</option>
            <option value="EUR"<c:if test="${requestScope.CURRENCY=='EUR'}"> selected</c:if>>EUR</option>
          </select>
        </span>
      </c:when>
      <c:otherwise>
        <input type="hidden" name="CURRENCY" value="${requestScope.CURRENCY}">
      </c:otherwise>
    </c:choose>
    <br clear="all" />
    <span>
      <label>Amount:&nbsp;</label>
      <input name="AMOUNT" value="${requestScope.AMOUNT}" size="10" title="Enter the amount in the text field. Numbers only, decimals are allowed." style="margin-bottom: .8rem;" />
    </span>
    <br clear="all" />
    <span>
      <label style="vertical-align: top;">Description:&nbsp;</label>
      <textarea name="NOTES" rows="5" cols="60" style="margin-bottom: .8rem;">${requestScope.NOTES}</textarea>
    </span>
    <br clear="all" />
    <span>
      <button type="button" class="save-btn" onclick="submitVendorTransfer (this.form);" style="margin-right: .5rem;">Save</button>
      <button type="button" class="save-btn" onclick="closeResultFrame();">Close</button>
    </span>
  </form>
</div>
