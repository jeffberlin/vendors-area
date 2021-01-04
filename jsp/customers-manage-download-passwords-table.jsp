<%@ page pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ include file="/includes/core.jsp" %>
<form name="downloadpasswords" method="post" action="https://vendors-new.bmtmicro.com/servlets/Vendors.DownloadPassword">
  <input type="hidden" name="ACTION" />
  <input type="hidden" name="NEXT_PAGE" value="https://vendors-new.bmtmicro.com/customers-manage-download-passwords-status.jsp" />
  <input type="hidden" name="ERROR_PAGE" value="https://vendors-new.bmtmicro.com/error.jsp" />
  <span>
    <label>Product&nbsp;List:</label>
    <br>
    <select name="PRODUCTID" size=10 style="width:60%; margin-bottom: 1rem;">
      ${requestScope.PRODUCTLIST}
    </select>
  </span>
  <h5>Get&nbsp;Password&nbsp;Status</h5>
  <p>Check password status of any order generated password.</p>
  <span>
    <label>Look up status using:&nbsp;</label>
    <select name="FIELD_SEL" style="margin-bottom: 1rem;">
      <option value="0">Password:</option>
      <option value="1">Order ID:</option>
      <option value="2">Order Number:</option>
    </select>
  </span>
  <input type="text" name="PASSWORD" value="" style="margin-bottom: 1rem;" placeholder="Search"/>
  <div class="controlbuttons">
    <button id="status" type="button" class="save-btn" value="Save" onclick="getStatus (downloadpasswords);" style="margin-bottom: 1rem;">Get Status</button>
  </div>
  <h5>Send&nbsp;New&nbsp;Password</h5>
  <p>Generate a new password to any email address.</p>
  <span>
    <label>Customer&nbsp;Email:&nbsp;</label>
    <input type="text" name="EMAIL" value="" style="margin-bottom: 1rem;"/>
  </span>
  <br clear="all">
  <span>
    <input type="checkbox" name="CCEMAIL" value="${requestScope.CCEMAIL}" style="margin-bottom: 1rem;"/>&nbsp;Send copy to:&nbsp;<strong>${requestScope.CCEMAIL}</strong>
  </span>
  <div class="controlbuttons">
    <button id="password" type="button" class="save-btn" value="Save" onclick="sendPassword (downloadpasswords);">Send Password</button>
  </div>
</form>
