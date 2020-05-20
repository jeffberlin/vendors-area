<%@ include file="/includes/core.jsp" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>BMT Micro Developers Center</title>
  </head>
  <body>
    <c:import url = "https://vendors-new.bmtmicro.com/servlets/Vendors.OrderSearch">
      <c:param name="SESSIONID" value="${sessionid}" />
      <c:param name="FLT_ORDERID" value=""/>
      <c:param name="FLT_PRODUCTNAME" value=""/>
      <c:param name="FLT_NAME" value=""/>
      <c:param name="FLT_ADDRESS" value=""/>
      <c:param name="FLT_EMAIL" value=""/>
      <c:param name="NEXT_PAGE" value="https://vendors-new.bmtmicro.com/customers-search-start.jsp"/>
      <c:param name="ROWTEMPLATEURL" value="https://vendors-new.bmtmicro.com/customers-search-tablerow.html" />
      <c:param name="ERROR_PAGE" value="https://vendors-new.bmtmicro.com/error_frame.jsp"/>
    </c:import>
  </body>
</html>
