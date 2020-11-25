<%@ page pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ include file="/includes/core.jsp" %>
<div class="transfer-section">
  <h5>Discount&nbsp;Codes</h5>
  <table class="table table-bordered" style="margin-bottom: 1rem; width: 50%;">
    <tbody>
      <c:forEach var="row" items="${requestScope.TABLEDATA}">
        <tr>
          <td>${row.DISCOUNTCODE}</td>
          <td align="center">${row.EXPIRATIONDATE}</td>
          <td align="right">${row.USECOUNT}</td>
        </tr>
      </c:forEach>
    </tbody>
  </table>
  <button type="button" class="save-btn" onclick="closeResultFrame()">Close</button>
</div> <!-- end .transfer-section -->
