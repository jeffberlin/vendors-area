<%@ include file="/includes/core.jsp" %>
<div class="transfer-section">
  <form action="https://vendors-new.bmtmicro.com/servlets/Vendors.OrderSearch" method="post">
    <input type="hidden" name="ORDERID" value="${param.ORDERID}">
    <input type="hidden" name="ITEMNR" value="${param.ITEMNR}">
    <input type="hidden" name="ACTION" value="3">
    <input type="hidden" name="NEXT_PAGE" value="https://vendors-new.bmtmicro.com/customers-search-refunded.jsp">
    <input type="hidden" name="ERROR_PAGE" value="https://vendors-new.bmtmicro.com/error.jsp" />
    <h5>Initiate Refund</h5>
    <span>
      <label style="margin-bottom: .5rem;">Order ID:&nbsp;</label>${param.ORDERID}
    </span>
    <br>
    <span>
      <label style="margin-bottom: .5rem;">Customer:&nbsp;</label>${param.NAME}
    </span>
    <br>
    <span>
      <label style="margin-bottom: .5rem;">Product:&nbsp;</label>${param.PRODUCTNAME}
    </span>
    <br>
    <label style="margin-bottom: .3rem;">Please enter the reason this order is being refunded:</label>
    <p style="margin-bottom: .5rem;">
      <textarea name="COMMENTS" ROWS="5" COLS="78" placeholder="Type the reason for the refund"></textarea>
    </p>
    <button type="button" class="save-btn" onclick="submitRefund (form);" style="margin-right: .5rem;">Refund</button>
    <button type="button" class="save-btn" onclick="closeResultFrame()">Cancel</button>
  </form>
</div> <!-- end .transfer-section -->
