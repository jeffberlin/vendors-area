<%@ page pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ include file="/includes/core.jsp" %>
<%@ include file="/charts-page.jsp" %>
<c:if test="${!empty requestScope.CHARTDATA}">
  <script>
    function loadChart${requestScope.DIV_ID} () {
      // SERIAL CHART
      var chartData = ${requestScope.CHARTDATA};
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
      chart.write("chartdiv${requestScope.DIV_ID}");
    }
  </script>
  <script>$(document).ready(function(){ loadChart${requestScope.DIV_ID} (); });</script>
</c:if>
