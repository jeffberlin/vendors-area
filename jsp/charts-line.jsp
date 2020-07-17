<%@ include file="/includes/core.jsp" %>
<jsp:include page="charts-page.jsp"/>
<c:if test="${!empty param.CHARTDATA}">
  <script language="javascript" type="text/javascript">
      function loadChart${param.DIV_ID} () {
        // SERIAL CHART
        var chartData = ${param.CHARTDATA};   
        var chart = new AmCharts.AmSerialChart();
        chart.dataProvider = chartData.data;  
        chart.categoryField = "date";
        chart.colors = [ "#0000FF" ];
        chart.marginRight = 35;
        // AXES
        // Category
        var categoryAxis = chart.categoryAxis;
        categoryAxis.gridAlpha = 0.07;
        categoryAxis.axisColor = "#DADADA";
        categoryAxis.startOnAxis = true;
        // Value
        var valueAxis = new AmCharts.ValueAxis();
        valueAxis.gridAlpha = 0.07;
        <c:if test="${param.GROUPTYPE==0}">valueAxis.title = "Units Sold";</c:if>
        <c:if test="${param.GROUPTYPE==1}">valueAxis.title = "Vendor Royalty";</c:if>
        chart.addValueAxis(valueAxis);
        // GRAPHS
        if (chartData.names.length > 1) {
          for (i = 0; i < chartData.names.length; i++) {
            var graph = new AmCharts.AmGraph();
            graph.type = "line";
            graph.title = chartData.names[i];
            graph.valueField = "value" + i;
            graph.lineThickness = 1;
            graph.lineAlpha = 1;
            chart.addGraph(graph);
            }
          var legend = new AmCharts.AmLegend();
          legend.valueText = "";
          legend.position = "bottom";
          chart.addLegend(legend);
          }
        else {
          var graph = new AmCharts.AmGraph();
          graph.type = "line";
          graph.title = chartData.names[0];
          graph.valueField = "value";
          graph.lineThickness = 4;
          graph.lineAlpha = 1;
          graph.fillAlphas = 0.1;
          chart.addGraph(graph);
          }
        // CURSOR
        var chartCursor = new AmCharts.ChartCursor();
        chartCursor.cursorAlpha = 1;
        chartCursor.cursorColor = "#869EB2";
        chart.addChartCursor(chartCursor);
        // WRITE
        chart.write("chartdiv${param.DIV_ID}");
      }
  </script>
  <script>$(document).ready(function(){ loadChart${param.DIV_ID} (); });</script>
</c:if>
