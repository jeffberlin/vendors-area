<%@ page pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ include file="/includes/core.jsp" %>
<c:if test="${!empty requestScope.BALANCE}">
  <span class="balance-text">Balance:&nbsp;</span><span class="balance-amount">${requestScope.BALANCE}</span>
</c:if>
