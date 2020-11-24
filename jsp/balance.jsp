<%@ page pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ include file="/includes/core.jsp" %>
<div id="vendor-balance-result">
  <c:catch var ="errormsg">
    <c:import url="https://vendors-new.bmtmicro.com/servlets/Vendors.Balance">
      <c:param name="SESSIONID" value="${sessionid}" />
      <c:param name="NEXT_PAGE" value="https://vendors-new.bmtmicro.com/balance-result.jsp" />
      <c:param name="ERROR_PAGE" value="https://vendors-new.bmtmicro.com/error-div.jsp" />
    </c:import>
  </c:catch>
  <%@ include file="/includes/catch.jsp" %>
</div>
