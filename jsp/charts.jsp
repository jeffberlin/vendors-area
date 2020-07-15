<%@ include file="/includes/core.jsp" %>
<div class="royalty-chart col-xl-5 col-lg-12">
  <iframe src="" name="columnchart" id="columnchart" frameborder="0" border="0" cellspacing="0"></iframe>
</div>
<div class="circle-graph col-xl-5 col-lg-12">
  <iframe src="" name="piechart" id="piechart" frameborder="0" border="0" cellspacing="0"></iframe>
</div>
<div class="product-chart col-xl-5 col-lg-12">
  <iframe src="" name="linechart" id="linechart" frameborder="0" border="0" cellspacing="0"></iframe>
</div>
<div class="country-graph col-xl-5 col-lg-12">
  <iframe src="" name="linebycountry" id="linebycountry" frameborder="0" border="0" cellspacing="0"></iframe>
</div>

<form name="productpiestart" action="https://vendors-new.bmtmicro.com/servlets/Vendors.SalesGraph" method="post" target="piechart">
  <input type="hidden" name="CHARTTYPE" value="0" />
  <input type="hidden" name="BULLETSIZE" value="0" />
  <input type="hidden" name="DATEFROM" value="${fromDate}" />
  <input type="hidden" name="DATETO" value="${toDate}" />
  <input type="hidden" name="GROUPBY" value="0" />
  <input type="hidden" name="GROUPTYPE" value="0" />
  <input type="hidden" name="MAXLEGENDS" value="5" />
  <input type="hidden" name="FREQUENCY" value="0" />
  <input type="hidden" name="SELECTEDPRODUCTS" value="" />
  <input type="hidden" name="NEXT_PAGE" value="https://vendors-new.bmtmicro.com/charts_pie.jsp" />
  <input type="hidden" name="ERROR_PAGE" value="https://vendors-new.bmtmicro.com/error.jsp" />
</form>

<form name="productlinestart" action="https://vendors-new.bmtmicro.com/servlets/Vendors.SalesGraph" method="post" target="linechart">
  <input type="hidden" name="CHARTTYPE" value="1" />
  <input type="hidden" name="BULLETSIZE" value="3" />
  <input type="hidden" name="DATEFROM" value="${fromDate}" />
  <input type="hidden" name="DATETO" value="${toDate}" />
  <input type="hidden" name="GROUPBY" value="0" />
  <input type="hidden" name="GROUPTYPE" value="0" />
  <input type="hidden" name="MAXLEGENDS" value="5" />
  <input type="hidden" name="FREQUENCY" value="1" />
  <input type="hidden" name="SELECTEDPRODUCTS" value="" />
  <input type="hidden" name="NEXT_PAGE" value="https://vendors-new.bmtmicro.com/charts_line.jsp" />
  <input type="hidden" name="ERROR_PAGE" value="https://vendors-new.bmtmicro.com/error.jsp" />
</form>

<form name="productcolumnstart" action="https://vendors-new.bmtmicro.com/servlets/Vendors.SalesGraph" method="post" target="columnchart">
  <input type="hidden" name="CHARTTYPE" value="1" />
  <input type="hidden" name="BULLETSIZE" value="0" />
  <input type="hidden" name="DATEFROM" value="${fromDate}" />
  <input type="hidden" name="DATETO" value="${toDate}" />
  <input type="hidden" name="GROUPBY" value="0" />
  <input type="hidden" name="GROUPTYPE" value="1" />
  <input type="hidden" name="MAXLEGENDS" value="5" />
  <input type="hidden" name="FREQUENCY" value="1" />
  <input type="hidden" name="SELECTEDPRODUCTS" value="" />
  <input type="hidden" name="NEXT_PAGE" value="https://vendors-new.bmtmicro.com/charts_column.jsp" />
  <input type="hidden" name="ERROR_PAGE" value="https://vendors-new.bmtmicro.com/error.jsp" />
</form>

<form name="countrylinestart" action="https://vendors-new.bmtmicro.com/servlets/Vendors.SalesGraph" method="post" target="linebycountry">
  <input type="hidden" name="CHARTTYPE" value="1" />
  <input type="hidden" name="BULLETSIZE" value="0" />
  <input type="hidden" name="DATEFROM" value="${fromDate}" />
  <input type="hidden" name="DATETO" value="${toDate}" />
  <input type="hidden" name="GROUPBY" value="1" />
  <input type="hidden" name="GROUPTYPE" value="0" />
  <input type="hidden" name="MAXLEGENDS" value="5" />
  <input type="hidden" name="FREQUENCY" value="1" />
  <input type="hidden" name="SELECTEDPRODUCTS" value="" />
  <input type="hidden" name="NEXT_PAGE" value="https://vendors-new.bmtmicro.com/charts_line.jsp" />
  <input type="hidden" name="ERROR_PAGE" value="https://vendors-new.bmtmicro.com/error.jsp" />
</form>

<script language="javascript" type="text/javascript">
  function loadCharts () {
    document.productpiestart.submit ();
    document.productlinestart.submit ();
    document.productcolumnstart.submit ();
    document.countrylinestart.submit ();
    }
</script>

<script>$(document).ready(function(){ loadCharts (); });</script>
