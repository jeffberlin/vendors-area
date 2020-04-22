<%@ include file="/includes/core.jsp" %>
<c:import url = "https://vendors-new.bmtmicro.com/servlets/Vendors.ImportRipOrders">
  <c:param name = "SESSIONID" value = "${sessionid}" />
  <c:param name = "STARFILE" value="https://vendors-new.bmtmicro.com/images/star.gif"/>
  <c:param name = "BLANKFILE" value="https://vendors-new.bmtmicro.com/images/blank.gif"/>
  <c:param name = "ACTION" value = "1"/>
  <c:param name = "ACTION2" value = "5"/>
  <c:param name = "NEXT_PAGE" value = "https://vendors-new.bmtmicro.com/authorize_table.jsp"/>
  <c:param name = "ERROR_PAGE" value = "https://vendors-new.bmtmicro.com/error.jsp"/>
</c:import>
