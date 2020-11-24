<%@ page pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ include file="/includes/core.jsp" %>
<div class="transfer-section">
  <h5>Password&nbsp;Status</h5>
  <p>${requestScope.MESSAGE}</p>
  <form method="post" action="https://vendors-new.bmtmicro.com/servlets/Vendors.DownloadPassword">
    <input type="hidden" name="NEXT_PAGE" value="https://vendors-new.bmtmicro.com/customers-manage-download-passwords-status.jsp" />
    <input type="hidden" name="ERROR_PAGE" value="https://vendors-new.bmtmicro.com/error-div.jsp"/>
    <input type="hidden" name="PRODUCTID" value="${requestScope.PRODUCTID}"/>
    <input type="hidden" name="PASSWORD" value="${requestScope.PASSWORD}"/>
    <input type="hidden" name="ACTION" value="1"/>
    <div class="controlbuttons" style="margin-bottom: 1rem;">
      <button type="button" class="save-btn" onClick="submitForm (form, 1);" style="margin-right: .5rem;">Reset&nbsp;Password</button>
      <button type="button" class="save-btn" onClick="submitForm (form, 2);" style="margin-right: .5rem;">Unblock&nbsp;Password</button>
      <button type="button" class="save-btn" onClick="submitForm (form, 3);">Expire&nbsp;Password</button>
    </div>
    <p>Tip: If you find that you need to reset blocked passwords too often, you may want to consider using a more lenient Download Restriction setting
    <br>(this can be changed in the Settings section at the top of the page).</p>
  </form>
</div>
