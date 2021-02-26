<%@ page pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ include file="/includes/core.jsp" %>
<div class="content">
  <h5>Add&nbsp;Activation&nbsp;Codes</h5>
  <form name="update" method="post" action="https://vendors.bmtmicro.com/servlets/Vendors.RegistrationKeys">
    <c:if test="${requestScope.COUNT==requestScope.TOTAL}">
      <input type="hidden" name="ACTION" value="-1" />
      <input type="hidden" name="NEXT_PAGE" value="https://vendors.bmtmicro.com/products-manage-activation-code-tables-table.jsp" />
      <input type="hidden" name="ERROR_PAGE" value="https://vendors.bmtmicro.com/error-div.jsp" />
      <p style="margin-bottom: .2rem;">Processing Complete.&nbsp;${requestScope.COUNT}&nbsp;codes were inserted into the&nbsp;${requestScope.NAME}&nbsp;table.</p>
      <button type="button" class="save-btn" onclick="closeResultFrame()">Close</button>
    </c:if>
    <c:if test="${requestScope.COUNT!=requestScope.TOTAL}">
      <input type="hidden" name="ACTION" value="13" />
      <input type="hidden" name="NEXT_PAGE" value="https://vendors.bmtmicro.com/products-manage-activation-code-tables-add-keys-progress.jsp" />
      <input type="hidden" name="ERROR_PAGE" value="https://vendors.bmtmicro.com/error-div.jsp" />
      <p style="margin-bottom: .2rem;">Please wait, adding codes...</p>
      <p style="margin-bottom: .2rem;">This process can take several minutes depending on the number of codes you are inserting.</p>
      <p style="margin-bottom: .2rem;"><strong>${requestScope.COUNT}&nbsp;codes of&nbsp;${requestScope.TOTAL}&nbsp;have been added so far.</strong></p>
      <p style="color: #FF0000;">Please do not exit this window until complete as this will stop the insertion process.</p> 
    </c:if>
  </form>
</div>
<script>
  $(document).ready(function(){ submitToDiv (document.update, <c:if test="${requestScope.COUNT==requestScope.TOTAL}">"tableframe"</c:if><c:if test="${requestScope.COUNT!=requestScope.TOTAL}">"resultframe"</c:if>) });
</script>
