<%@ page pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<div class="stats">
  <h6 class="chart-title">
  <c:if test="${requestScope.GROUPTYPE=='0'}">Units Sold from </c:if>
  <c:if test="${requestScope.GROUPTYPE=='1'}">Vendor Royalty from </c:if>
  ${requestScope.DATEFROM} to ${requestScope.DATETO}
  <c:if test="${requestScope.GROUPBY=='0'}"> by Product</c:if>
  <c:if test="${requestScope.GROUPBY=='1'}"> by Country</c:if>
  <c:if test="${requestScope.GROUPBY=='2'}"> by Affiliate</c:if>
  </h6>
  <div id="chartdiv${requestScope.DIV_ID}" style="width: 100%; height: 275px;">
    <c:if test="${empty requestScope.CHARTDATA}">
       <strong>No sales data from ${requestScope.DATEFROM} through ${requestScope.DATETO}</strong>
    </c:if>
    <c:if test="${!empty requestScope.CHARTDATA}">
       <noscript><strong>You need to enable JavaScript</strong></noscript>
    </c:if>
  </div>
  <a href="javascript:submitToDiv(document.newgraph${requestScope.DIV_ID},document.newgraph${requestScope.DIV_ID}.DIV_ID.value);" class="new-graph">Get new graph</a>
</div>
<form name="newgraph${requestScope.DIV_ID}" method="post" action="https://vendors-new.bmtmicro.com/servlets/Vendors.SalesGraph">
  <input type="hidden" name="ACTION" value="-1">
  <input type="hidden" name="DIV_ID"     value="${requestScope.DIV_ID}" />
  <input type="hidden" name="CHARTTYPE"  value="${requestScope.CHARTTYPE}" />
  <input type="hidden" name="BULLETSIZE" value="${requestScope.BULLETSIZE}" />
  <input type="hidden" name="DATEFROM"   value="${requestScope.DATEFROM}" />
  <input type="hidden" name="DATETO"     value="${requestScope.DATETO}" />
  <input type="hidden" name="GROUPBY"    value="${requestScope.GROUPBY}" />
  <input type="hidden" name="GROUPTYPE"  value="${requestScope.GROUPTYPE}" />
  <input type="hidden" name="MAXLEGENDS" value="${requestScope.MAXLEGENDS}" />
  <input type="hidden" name="FREQUENCY"  value="${requestScope.FREQUENCY}" />
  <input type="hidden" name="SELECTEDPRODUCTS" value="${requestScope.SELECTEDPRODUCTS}" />
  <input type="hidden" name="CHART_PAGE"  value="${requestScope.NEXT_PAGE}" />
  <input type="hidden" name="NEXT_PAGE" value="https://vendors-new.bmtmicro.com/charts-newdata.jsp">
  <input type="hidden" name="ERROR_PAGE" value="https://vendors-new.bmtmicro.com/error-div.jsp">
</form>
