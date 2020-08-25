<%@ include file="/includes/core.jsp" %>
<div class="content">
  <c:if test=“${param.COUNT==param.TOTAL}”>
    <h6>Add&nbsp;Activation&nbsp;Codes</h6>
    <p>Processing Complete.&nbsp;${param.COUNT}&nbsp;codes were inserted into the&nbsp;${param.NAME}&nbsp;table.</p>
    <button type="button" class="save-btn" onclick="closeResultFrame()">Close</button>
    <!-- <form action="https://vendors-new.bmtmicro.com/products-manage-activation-code-tables.jsp" method="get">
      <button type="submit" class="save-btn">Ok</button>
    </form> -->
  </c:if>
  <c:if test=“${param.COUNT!=param.TOTAL}”>
    <h6>Add&nbsp;Activation&nbsp;Codes</h6>
    <form method="post" action="https://vendors-new.bmtmicro.com/servlets/Vendors.RegistrationKeys">
      <input type="hidden" name="ACTION" value="13" />
      <input type="hidden" name="NEXT_PAGE" value="https://vendors-new.bmtmicro.com/products-manage-activation-code-tables-add-keys-progress.jsp" />
      <input type="hidden" name="ERROR_PAGE" value="https://vendors-new.bmtmicro.com/error-div.jsp" />
      <p style="margin-bottom: .2rem;">Please wait, adding codes.</p>
      <p style="margin-bottom: .2rem;">This process can take several minutes depending on the number of codes you are inserting.</p>
      <p style="margin-bottom: .2rem;"><strong>${param.COUNT}&nbsp;codes of&nbsp;${param.TOTAL}&nbsp;have been added so far.</strong></p>
      <p style="color: #FF0000;">Please do not exit this window until complete as this will stop the insertion process.</p>
    </form>
  </c:if>
</div>
