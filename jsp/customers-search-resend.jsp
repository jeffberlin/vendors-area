<%@ page pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ include file="/includes/core.jsp" %>
<form action="https://vendors-new.bmtmicro.com/servlets/Vendors.OrderSearch" method="post" onsubmit="return validateForm (document.forms[0]);">
  <input type="hidden" name="ORDERID" value="${requestScope.ORDERID}" />
  <input type="hidden" name="ITEMNR" value="${requestScope.ITEMNR}" />
  <input type="hidden" name="ACTION" value="2" />
  <input type="hidden" name="NEXT_PAGE" value="https://vendors-new.bmtmicro.com/customers-search-resent.jsp" />
  <input type="hidden" name="ERROR_PAGE" value="https://vendors-new.bmtmicro.com/error-div.jsp" />
  <h5>Resend&nbsp;Customer&nbsp;Notification&nbsp;Email</h5>
  <span>
    <input type="checkbox" name="CC" value="${requestScope.VENDORCSREMAIL}"> Send&nbsp;copy&nbsp;to&nbsp;${requestScope.VENDORCSREMAIL}
  </span>
  <br clear="all" />
  <span>
    <label>To:</label>
    <input type="TEXT" name="EMAIL" size="50" value="${requestScope.EMAIL}" style="margin-bottom: .5rem; margin-top: .5rem;">
  </span>
  <br clear="all" />
  <span>
    <label style="margin-bottom: .5rem;">Subject:</label>
    ${requestScope.SUBJECT}
  </span>
  <br>
  <span>
    <textarea name="BODY" ROWS="15" COLS="78" style="margin-bottom: .5rem;" readonly>${requestScope.MESSAGEBODY}</textarea>
  </span>
  <div class="controlbuttons">
    <button type="button" class="save-btn" style="margin-right: .5rem;" onclick="submitForm (this.form);">Resend Message</button>
    <button type="button" class="save-btn" onclick="closeResultFrame()">Cancel</button>
  </div>
</form>
