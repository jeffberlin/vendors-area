<%@ page pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:if test="${fn:containsIgnoreCase(errormsg,'Server returned HTTP response code: 440')}">
  <c:redirect url="https://vendors-new.bmtmicro.com/"/>
</c:if>
