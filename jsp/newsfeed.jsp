<%@ page pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ include file="/includes/core.jsp" %>
<div id="newsfeed-result">
  <c:catch var="errormsg">
    <c:import url="https://vendors-new.bmtmicro.com/servlets/Vendors.Account">
      <c:param name="SESSIONID" value="${sessionid}" />
      <c:param name="NEXT_PAGE" value="https://vendors-new.bmtmicro.com/newsfeed-result.jsp" />
      <c:param name="ERROR_PAGE" value="https://vendors-new.bmtmicro.com/error-div.jsp" />
      <c:param name="ACTION" value="9" />
    </c:import>
  </c:catch>
  <%@ include file="/includes/catch.jsp" %>
</div>
