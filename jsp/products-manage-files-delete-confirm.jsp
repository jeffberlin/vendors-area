<%@ include file="/includes/core.jsp" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <link rel="stylesheet" href="https://vendors-new.bmtmicro.com/css/addTransfer.css"/>
  </head>
  <body>
    <div class="transfer-section">
      <form method="post" action="https://vendors-new.bmtmicro.com/servlets/Vendors.DownloadFiles" target="_parent">
        <input type="hidden" name="NEXT_PAGE" value="https://vendors-new.bmtmicro.com/products-manage-files.jsp" />
        <input type="hidden" name="ERROR_PAGE" value="https://vendors-new.bmtmicro.com/error.jsp" />
        <input type="hidden" name="ACTION" value="12" />
        <input type="hidden" name="DOWNLOADFILEID" value="${param.DOWNLOADFILEID}" />
        <h5>Confirm Deletion of Download File</h5>
        <p>Please confirm deletion of the file:&nbsp;<strong>${param.DOWNLOADFILENAME}</strong></p>
        <p>This file is not used by any products and can be deleted.</p>
        <button type="submit" class="save-btn" style="margin-right: .5rem;">Delete</button>
        <button type="button" class="save-btn" onclick="document.close.submit ();">Cancel</button>
      </form>
      <form name="close" action="https://vendors-new.bmtmicro.com/products-manage-files.jsp" method="get" target="_parent">
      </form>
    </div> <!-- end .transfer-section -->
  </body>
</html>
