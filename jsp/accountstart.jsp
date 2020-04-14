<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:url value = "https://vendors-new.bmtmicro.com/servlets/Vendors.Account" var = "accountURL">
  <c:param name = "SESSIONID" value = "${cookie['BMTMicro.Vendors.SessionID'].value}"/>
  <c:param name = "ACTION" value = "1"/>
  <c:param name = "NEXT_PAGE" value = "https://vendors-new.bmtmicro.com/account.jsp"/>
  <c:param name = "ERROR_PAGE" value = "https://vendors-new.bmtmicro.com/error.jsp"/>
</c:url>
<c:import url = "${accountURL}"/>
