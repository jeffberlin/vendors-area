<%@ include file="/includes/core.jsp" %>
<div class="transfer-section">
  <form action="https://vendors-new.bmtmicro.com/servlets/Vendors.OrderSearch" method="post"  target="">
    <input type="hidden" name="ORDERID" value="${param.ORDERID}">
    <input type="hidden" name="ITEMNR"  value="${param.ITEMNR}">
    <input type="hidden" name="ACTION"  value="1">
    <input type="hidden" name="NEXT_PAGE" value="https://vendors-new.bmtmicro.com/customers-search-comments-updated.jsp">
    <input type="hidden" name="ERROR_PAGE" value="https://vendors-new.bmtmicro.com/error.jsp" />
    <h5>Edit&nbsp;Item&nbsp;Comments</h5>
    <p>
      <label>Order ID:&nbsp;</label>${param.ORDERID}
    </p>
    <p>
      <label>Customer:&nbsp;</label>${param.NAME}
    </p>
    <p>
      <label>Product:&nbsp;</label>${param.PRODUCTNAME}
    </p>
    <span>
      <textarea name="ITEMCOMMENTS" ROWS="5" COLS="78" placeholder="Type a message" style="margin-bottom: 1.2rem;">${param.ITEMCOMMENTS}</textarea>
    </span>
    <div class="controlbuttons">
      <button type="button" class="save-btn" onclick="submitForm (form);" style="margin-right: .3rem;">Save</button>
      <button type="button" class="save-btn" onclick="closeResultFrame()">Cancel</button>
    </div>
  </form>
</div> <!-- end .transfer-section -->
