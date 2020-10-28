<%@ include file="/includes/core.jsp" %>
<div class="transfer-section">
  <form method="post" action="https://vendors-new.bmtmicro.com/servlets/Vendors.Users">
    <input type="hidden" name="NEXT_PAGE" value="https://vendors-new.bmtmicro.com/user-management.jsp" />
    <input type="hidden" name="ERROR_PAGE" value="https://vendors-new.bmtmicro.com/error-div.jsp" />
    <input type="hidden" name="USERID" value="${requestScope.USERID}" />
    <input type="hidden" name="ACTION" value="12" />
    <div class="transfer-section">
      <h5>Manage Users</h5>
      <p>By selecting delete you will have effectively deleted this user.</p>
      <p style="color: red;"><strong>${requestScope.NAME} will no longer be able to log in.</strong></p>
      <p>Confirm Deletion of ${requestScope.NAME} (${requestScope.EMAIL}).</p>
      <span>
        <button type="button" class="save-btn" style="margin-right: .5rem;" onclick="this.form.submit()">Delete User</button>
        <button type="button" class="save-btn" onclick="closeResultFrame()" >Cancel</button>
      </span>
    </div> <!-- end .transfer-section -->
  </form>
</div>
