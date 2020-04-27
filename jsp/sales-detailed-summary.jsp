<%@ include file="/includes/core.jsp" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>BMT Micro Developers Center</title>
  </head>
  <body>
    <c:import url = "https://vendors-new.bmtmicro.com/servlets/Vendors.SalesDSummary">
      <c:param name = "SESSIONID" value = "${sessionid}" />
      <c:param name = "DATEFROM" value="${fromDate}" />
      <c:param name = "DATETO" value="${toDate}" />
      <c:param name = "ROWTEMPLATEURL" value="https://vendors-new.bmtmicro.com/sales-detailed-summary-tablerow.html" />
      <c:param name = "NEXT_PAGE" value="https://vendors-new.bmtmicro.com/sales-detailed-summary-start.jsp" />
      <c:param name = "ERROR_PAGE" value="https://vendors-new.bmtmicro.com/error.jsp" />
    </c:import>
  </body>
</html>
