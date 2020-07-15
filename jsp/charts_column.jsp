<%@ include file="/includes/core.jsp" %>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title></title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="https://vendors-new.bmtmicro.com/css/style.css">
    <link rel="stylesheet" type="text/css" href="https://vendors-new.bmtmicro.com/css/main.css">
  </head>
  <body style="background-color:#FFFFFF">
    <div class="stats">
      <h6 class="chart-title">
      <c:if test="${param.GROUPTYPE==0}">Units Sold from </c:if>
      <c:if test="${param.GROUPTYPE==1}">Vendor Royalty from </c:if>
       ${param.DATEFROM} through ${param.DATETO}
      <c:if test="${param.GROUPBY==0}"> by Product</c:if>
      <c:if test="${param.GROUPBY==1}"> by Country</c:if>
      <c:if test="${param.GROUPBY==2}"> by Affiliate</c:if>
      </h6>
      <div id="chartdiv" style="width: 100%; height: 285px;">
        <c:if test="${empty param.CHARTDATA}">
           <strong>No sales data from ${param.DATEFROM} through ${param.DATETO}</strong>
        </c:if>
        <c:if test="${!empty param.CHARTDATA}">
           <noscript><strong>You need to enable JavaScript</strong></noscript>
        </c:if>
      </div>
      </br>
      <a href="javascript:document.newgraph.submit();" class="new-graph">Get new graph</a>
    </div>

    <form name="newgraph" method="post" action="https://vendors-new.bmtmicro.com/servlets/Vendors.SalesGraph">
      <input type="hidden" name="ACTION" value="-1">
      <input type="hidden" name="CHARTTYPE"  value="${param.CHARTTYPE}" />
      <input type="hidden" name="BULLETSIZE" value="${param.BULLETSIZE}" />
      <input type="hidden" name="DATEFROM"   value="${param.DATEFROM}" />
      <input type="hidden" name="DATETO"     value="${param.DATETO}" />
      <input type="hidden" name="GROUPBY"    value="${param.GROUPBY}" />
      <input type="hidden" name="GROUPTYPE"  value="${param.GROUPTYPE}" />
      <input type="hidden" name="MAXLEGENDS" value="${param.MAXLEGENDS}" />
      <input type="hidden" name="FREQUENCY"  value="${param.FREQUENCY}" />
      <input type="hidden" name="SELECTEDPRODUCTS" value="${param.SELECTEDPRODUCTS}" />
      <input type="hidden" name="CHARTPAGE"  value="${param.NEXT_PAGE}" />
      <input type="hidden" name="NEXT_PAGE"  value="https://vendors-new.bmtmicro.com/charts_newdata.html">
      <input type="hidden" name="ERROR_PAGE" value="https://vendors-new.bmtmicro.com/error.jsp">
    </form>

    <c:if test="${!empty param.CHARTDATA}">
      <script type="text/javascript" src="https://vendors-new.bmtmicro.com/amcharts.js"></script>
      <script language="javascript" type="text/javascript">
        AmCharts.ready(function () {
          // SERIAL CHART
          var chartData = ${param.CHARTDATA};
          var chart = new AmCharts.AmSerialChart();
          chart.dataProvider = chartData.data;
          chart.categoryField = "date";
          // this single line makes the chart a bar chart,
          // try to set it to false - your bars will turn to columns
          chart.rotate = false;
          // the following two lines makes chart 3D
          chart.depth3D = 20;
          chart.angle = 30;
          chart.fontSize = 8;
          // AXES
          // Category
          var categoryAxis = chart.categoryAxis;
          categoryAxis.gridPosition = "start";
          categoryAxis.axisColor = "#DADADA";
          categoryAxis.fillAlpha = 1;
          categoryAxis.gridAlpha = 0;
          categoryAxis.fillColor = "#FAFAFA";
          // value
          var valueAxis = new AmCharts.ValueAxis();
          valueAxis.axisColor = "#DADADA";
          valueAxis.title = chartData.names[0];
          valueAxis.gridAlpha = 0.1;
          chart.addValueAxis(valueAxis);
          // GRAPH
          var graph = new AmCharts.AmGraph();
          graph.title = "Royalty";
          graph.valueField = "value";
          graph.type = "column";
          graph.balloonText = chartData.names[0] + " for [[category]] is [[value]]";
          graph.lineAlpha = 0;
          graph.fillColors = "#2256AA";
          graph.fillAlphas = 1;
          chart.addGraph(graph);
          // WRITE
          chart.write("chartdiv");
        });
      </script>
    </c:if>

  </body>
</html>
