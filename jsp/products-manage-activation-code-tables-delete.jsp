<%@ include file="/includes/core.jsp" %>
<div class="transfer-section">
  <c:if test = "${ requestScope.USECOUNT == 0 }">
    <h5>Delete Activation Code Table - ${requestScope.NAME}</h5>
    <form method="post" action="https://vendors-new.bmtmicro.com/servlets/Vendors.RegistrationKeys">
      <input type="hidden" name="ACTION" value="12" />
      <input type="hidden" name="KEYTABLEID" value="${requestScope.KEYTABLEID}" />
      <input type="hidden" name="NEXT_PAGE" value="https://vendors-new.bmtmicro.com/products-manage-activation-code-tables.jsp" />
      <input type="hidden" name="ERROR_PAGE" value="https://vendors-new.bmtmicro.com/error.jsp" />
      <p style="margin-bottom: .2rem;">Please confirm deletion of the&nbsp;<strong>${requestScope.NAME}</strong>&nbsp;table.</p>
      <p>This table is not used by any products and can be deleted.</p>
      <button type="submit" class="save-btn" style="margin-right: .5rem;">Delete</button>
      <button type="button" class="save-btn" onclick="closeResultFrame()">Cancel</button>
    </form>
  </c:if>
  <c:if test = "${ requestScope.USECOUNT != 0 }">
    <h5>Unable to Delete Registration Key Table</h5>
    <p style="margin-bottom: .2rem;">The ${requestScope.NAME} table is currently used by ${requestScope.USECOUNT} product<c:if test = "${ requestScope.USECOUNT > 1 }">s</c:if>.</p>
    <p style="margin-bottom: .2rem;">In order to delete this table you must disassociate the product<c:if test = "${ requestScope.USECOUNT > 1 }">s</c:if> from this table.</p>
    <p style="margin-bottom: .2rem;">Click View Products on the Registration Key main page to see what products are using this table.</p>
    <p>See the Help files for more information.</p>
    <button type="button" class="save-btn" onclick="closeResultFrame()">Close</button>
  </c:if>
</div> <!-- end .transfer-section -->
