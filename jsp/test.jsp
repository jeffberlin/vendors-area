<%@ page pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ include file="/includes/core.jsp" %>
<!DOCTYPE html>
<html lang="en">
<body>

<%

//example json string ; note that employees matches the list name
String jsonString = "{  \"options\":  [ {\"name\": \"Peter\", \"value\": \"XXXX\", \"selected\": true },{ \"name\": \"Mark\", \"value\": \"YYYY\", \"selected\": false} ] }";

com.bmtmicro.shared.HTMLSelect empList = new com.fasterxml.jackson.databind.ObjectMapper().readValue(jsonString, com.bmtmicro.shared.HTMLSelect.class);
request.setAttribute("employeeList", empList.options);

%>

<c:forEach items="${employeeList}" var="employee" >
Name : ${employee.name}" </br>
Value : ${employee.value}</br>
Selected : ${employee.selected}</br>
</br>
 </c:forEach>
</body>
</html>
