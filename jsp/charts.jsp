<%@ include file="/includes/core.jsp" %>

<div name="columnchart" id="columnchart" class="royalty-chart overflow-auto col-xl-5 col-lg-12"></div>
<div name="piechart" id="piechart" class="circle-graph overflow-auto col-xl-5 col-lg-12"></div>
<div name="linechart" id="linechart" class="product-chart overflow-auto  col-xl-5 col-lg-12"></div>
<div name="linebycountry" id="linebycountry"  class="country-graph overflow-auto col-xl-5 col-lg-12"></div>

<form name="productcolumn" action="https://vendors-new.bmtmicro.com/servlets/Vendors.SalesGraph" method="post">
  <input type="hidden" name="DIV_ID" value="columnchart" />
  <input type="hidden" name="CHARTTYPE" value="1" />
  <input type="hidden" name="BULLETSIZE" value="0" />
  <input type="hidden" name="DATEFROM" value="${fromDate}" />
  <input type="hidden" name="DATETO" value="${toDate}" />
  <input type="hidden" name="GROUPBY" value="0" />
  <input type="hidden" name="GROUPTYPE" value="1" />
  <input type="hidden" name="MAXLEGENDS" value="5" />
  <input type="hidden" name="FREQUENCY" value="1" />
  <input type="hidden" name="SELECTEDPRODUCTS" value="" />
  <input type="hidden" name="NEXT_PAGE" value="https://vendors-new.bmtmicro.com/charts-column.jsp" />
  <input type="hidden" name="ERROR_PAGE" value="https://vendors-new.bmtmicro.com/error-div.jsp" />
</form>
                                     
<form name="productpie" action="https://vendors-new.bmtmicro.com/servlets/Vendors.SalesGraph" method="post">
  <input type="hidden" name="DIV_ID" value="piechart" />
  <input type="hidden" name="CHARTTYPE" value="0" />
  <input type="hidden" name="BULLETSIZE" value="0" />
  <input type="hidden" name="DATEFROM" value="${fromDate}" />
  <input type="hidden" name="DATETO" value="${toDate}" />
  <input type="hidden" name="GROUPBY" value="0" />
  <input type="hidden" name="GROUPTYPE" value="0" />
  <input type="hidden" name="MAXLEGENDS" value="5" />
  <input type="hidden" name="FREQUENCY" value="0" />
  <input type="hidden" name="SELECTEDPRODUCTS" value="" />
  <input type="hidden" name="NEXT_PAGE" value="https://vendors-new.bmtmicro.com/charts-pie.jsp" />
  <input type="hidden" name="ERROR_PAGE" value="https://vendors-new.bmtmicro.com/error-div.jsp" />
</form>

<form name="productline" action="https://vendors-new.bmtmicro.com/servlets/Vendors.SalesGraph" method="post">
  <input type="hidden" name="DIV_ID" value="linechart" />
  <input type="hidden" name="CHARTTYPE" value="1" />
  <input type="hidden" name="BULLETSIZE" value="3" />
  <input type="hidden" name="DATEFROM" value="${fromDate}" />
  <input type="hidden" name="DATETO" value="${toDate}" />
  <input type="hidden" name="GROUPBY" value="0" />
  <input type="hidden" name="GROUPTYPE" value="0" />
  <input type="hidden" name="MAXLEGENDS" value="5" />
  <input type="hidden" name="FREQUENCY" value="1" />
  <input type="hidden" name="SELECTEDPRODUCTS" value="" />
  <input type="hidden" name="NEXT_PAGE" value="https://vendors-new.bmtmicro.com/charts-line.jsp" />
  <input type="hidden" name="ERROR_PAGE" value="https://vendors-new.bmtmicro.com/error-div.jsp" />
</form>

<form name="countryline" action="https://vendors-new.bmtmicro.com/servlets/Vendors.SalesGraph" method="post">
  <input type="hidden" name="DIV_ID" value="linebycountry" />
  <input type="hidden" name="CHARTTYPE" value="1" />
  <input type="hidden" name="BULLETSIZE" value="0" />
  <input type="hidden" name="DATEFROM" value="${fromDate}" />
  <input type="hidden" name="DATETO" value="${toDate}" />
  <input type="hidden" name="GROUPBY" value="1" />
  <input type="hidden" name="GROUPTYPE" value="0" />
  <input type="hidden" name="MAXLEGENDS" value="5" />
  <input type="hidden" name="FREQUENCY" value="1" />
  <input type="hidden" name="SELECTEDPRODUCTS" value="" />
  <input type="hidden" name="NEXT_PAGE" value="https://vendors-new.bmtmicro.com/charts-line.jsp" />
  <input type="hidden" name="ERROR_PAGE" value="https://vendors-new.bmtmicro.com/error-div.jsp" />
</form>

<script type="text/javascript" src="https://vendors-new.bmtmicro.com/amcharts.js"></script>
<script language="javascript" type="text/javascript">
  function loadChart (form) {
     submitToDiv (form, form.DIV_ID.value);
     }
  AmCharts.ready (function () {
     loadChart (document.productcolumn);
     loadChart (document.productpie);
     loadChart (document.productline);
     loadChart (document.countryline);
     });
</script>
