<%@ include file="/includes/core.jsp"  %>
<c:import url = "https://vendors-new.bmtmicro.com/servlets/Vendors.Account">
  <c:param name = "SESSIONID" value = "${sessionid}" />
  <c:param name = "NEXT_PAGE" value =  "https://vendors-new.bmtmicro.com/contactbmt.jsp"/>
  <c:param name = "ERROR_PAGE" value = "https://vendors-new.bmtmicro.com/error.jsp"/>
</c:import>
