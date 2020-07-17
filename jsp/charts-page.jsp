<%@ include file="/includes/core.jsp" %>
<div class="stats">
  <h6 class="chart-title">
  <c:if test="${param.GROUPTYPE==0}">Units Sold from </c:if>
  <c:if test="${param.GROUPTYPE==1}">Vendor Royalty from </c:if>
   ${param.DATEFROM} to ${param.DATETO} 
  <c:if test="${param.GROUPBY==0}"> by Product</c:if>
  <c:if test="${param.GROUPBY==1}"> by Country</c:if>
  <c:if test="${param.GROUPBY==2}"> by Affiliate</c:if>
  </h6>
  <div id="chartdiv${param.DIV_ID}" style="width: 100%; height: 275px;">
    <c:if test="${empty param.CHARTDATA}">
       <strong>No sales data from ${param.DATEFROM} through ${param.DATETO}</strong>
    </c:if>
    <c:if test="${!empty param.CHARTDATA}">
       <noscript><strong>You need to enable JavaScript</strong></noscript>
    </c:if>
  </div>    
  <a href="javascript:submitToDiv(document.newgraph${param.DIV_ID},document.newgraph${param.DIV_ID}.DIV_ID.value);" class="new-graph">Get new graph</a>
</div>                                 

<form name="newgraph${param.DIV_ID}" method="post" action="https://vendors-new.bmtmicro.com/servlets/Vendors.SalesGraph">
  <input type="hidden" name="ACTION" value="-1">
  <input type="hidden" name="DIV_ID"     value="${param.DIV_ID}" />
  <input type="hidden" name="CHARTTYPE"  value="${param.CHARTTYPE}" />
  <input type="hidden" name="BULLETSIZE" value="${param.BULLETSIZE}" />
  <input type="hidden" name="DATEFROM"   value="${param.DATEFROM}" />
  <input type="hidden" name="DATETO"     value="${param.DATETO}" />
  <input type="hidden" name="GROUPBY"    value="${param.GROUPBY}" />
  <input type="hidden" name="GROUPTYPE"  value="${param.GROUPTYPE}" />
  <input type="hidden" name="MAXLEGENDS" value="${param.MAXLEGENDS}" />
  <input type="hidden" name="FREQUENCY"  value="${param.FREQUENCY}" />
  <input type="hidden" name="SELECTEDPRODUCTS" value="${param.SELECTEDPRODUCTS}" />
  <input type="hidden" name="CHART_PAGE"  value="${param.NEXT_PAGE}" />
  <input type="hidden" name="NEXT_PAGE" value="https://vendors-new.bmtmicro.com/charts-newdata.jsp">
  <input type="hidden" name="ERROR_PAGE" value="https://vendors-new.bmtmicro.com/error-div.jsp">
</form>

