<%@ include file="/includes/core.jsp" %>
<c:if test="${param.COUNT == param.TOTAL}">
  <div class="content">
    <h6>Add Multiple Products</h6>
    <p>Processing Complete. ${param.COUNT} products were set up.</p>
    <p>${param.MESSAGE}</p>
    <form action="https://vendors-new.bmtmicro.com/products-manage.jsp" method="get" target="_parent">
      <button type="submit" class="grey-btn">Ok</button>
    </form>
  </div>
</c:if>
<c:if test="${param.COUNT != param.TOTAL}">
  <div class="content">
    <h6>Add&nbsp;Multiple&nbsp;Products</h6>
    <p style="margin-bottom: .2rem;">Please wait, adding products.</p>
    <p style="margin-bottom: .2rem;">This process can take several minutes depending on the number of products you are setting up.</p>
    <p style="margin-bottom: .2rem;"><strong>${param.COUNT} products of ${param.TOTAL} have been set up so far.</strong></p>
    <p style="color: #FF0000;">Please do not exit this window until complete as this will stop the setup process.</p>
  </div> <!-- end .content -->
  <form method="post" name="progress" action="https://vendors-new.bmtmicro.com/servlets/Vendors.Products">
    <input type="hidden" name="ACTION" value="17" />
    <input type="hidden" name="NEXT_PAGE" value="https://vendors-new.bmtmicro.com/products-manage-add-multiple-progress.jsp" />
    <input type="hidden" name="ERROR_PAGE" value="https://vendors-new.bmtmicro.com/error-div.jsp" />
  </form>
</c:if>
