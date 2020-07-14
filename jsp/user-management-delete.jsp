<%@ include file="/includes/core.jsp" %>
<div class="transfer-section">
  <form method="post" action="https://vendors-new.bmtmicro.com/servlets/Vendors.Users">
    <input type="hidden" name="NEXT_PAGE" value="https://vendors-new.bmtmicro.com/user-management.jsp" />
    <input type="hidden" name="ERROR_PAGE" value="https://vendors-new.bmtmicro.com/error-div.jsp" />
    <input type="hidden" name="USERID" value="${param.USERID}" />
    <input type="hidden" name="ACTION" value="12" />
    <input type="hidden" name="ROWTEMPLATEURL" value="https://vendors-new.bmtmicro.com/users_tablerow.html" />
    <div class="transfer-section">
      <h5>Manage Users</h5>
      <p>By selecting delete you will have effectively deleted this user.</p>
      <p style="color: red;"><strong>${param.NAME} will no longer be able to log in.</strong></p>
      <p>Confirm Deletion of ${param.NAME} (${param.EMAIL}).</p>
      <span>
        <button class="light-btn" style="margin-right: .3rem;">Delete User</button>
        <button type="button" class="light-btn" onclick="closeResultFrame()" >Cancel</button>
      </span>
    </div> <!-- end .transfer-section -->
  </form>
</div>
