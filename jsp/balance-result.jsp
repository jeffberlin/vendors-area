<%@ include file="/includes/core.jsp" %>
<c:if test="${!empty param.BALANCE}">
  <span class="balance-text">Balance:&nbsp;</span><span class="balance-amount">${param.BALANCE}</span>
</c:if>
