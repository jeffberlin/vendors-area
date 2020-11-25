<%@ page pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ include file="/includes/core.jsp" %>
<c:catch var="errormsg">
  <c:import url="https://vendors-new.bmtmicro.com/servlets/Vendors.Account">
    <c:param name="SESSIONID" value="${sessionid}" />
    <c:param name="NEXT_PAGE" value="https://vendors-new.bmtmicro.com/new-vendor-submission-form.jsp" />
    <c:param name="ERROR_PAGE" value="https://vendors-new.bmtmicro.com/new-vendor-error.jsp" />
    <c:param name="ACTION" value="1" />
  </c:import>
</c:catch>
<%@ include file="/includes/catch.jsp" %>
