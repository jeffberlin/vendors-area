<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:url value = "https://vendors-new.bmtmicro.com/servlets/Vendors.Affiliates" var = "affiliateInfoURL">
  <c:param name = "SESSIONID" value = "${cookie['BMTMicro.Vendors.SessionID'].value}"/>
  <c:param name = "ACTION" value = "-1"/>
  <c:param name = "MAXAMOUNT" value = ""/>
  <c:param name = "ROWTEMPLATEURL" value = "https://vendors-new.bmtmicro.com/affiliateinfo_tablerow.html"/>
  <c:param name = "NEXT_PAGE" value = "https://vendors-new.bmtmicro.com/affiliateinfostart2.jsp"/>
  <c:param name = "ERROR_PAGE" value = "https://vendors-new.bmtmicro.com/error_frame.jsp"/>
</c:url>
<c:import url = "${affiliateInfoURL}"/>
