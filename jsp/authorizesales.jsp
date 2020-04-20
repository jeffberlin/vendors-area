<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:url value = "https://vendors-new.bmtmicro.com/servlets/Vendors.ImportRipOrders" var = "importRipOrdersURL">
  <c:param name = "SESSIONID" value = "${cookie['BMTMicro.Vendors.SessionID'].value}"/>
  <c:param name = "STARFILE" value="https://vendors-new.bmtmicro.com/images/star.gif"/>
  <c:param name = "BLANKFILE" value="https://vendors-new.bmtmicro.com/images/blank.gif"/>
  <c:param name = "ACTION" value = "1"/>
  <c:param name = "ACTION2" value = "5"/>
  <c:param name = "NEXT_PAGE" value = "https://vendors-new.bmtmicro.com/authorize_table.jsp"/>
  <c:param name = "ERROR_PAGE" value = "https://vendors-new.bmtmicro.com/error.jsp"/>
</c:url>
<c:import url = "${importRipOrdersURL}"/>
