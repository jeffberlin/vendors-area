<%@ page pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ include file="/includes/core.jsp" %>
<%@ include file="/charts-page.jsp" %>
<c:if test="${!empty requestScope.CHARTDATA}">
  <script>
    function loadChart${requestScope.DIV_ID} () {
      // PIE CHART
      var chartData = ${requestScope.CHARTDATA};
      var chart = new AmCharts.AmPieChart();
      chart.dataProvider = chartData.data;
      chart.titleField = "title";
      chart.valueField = "value";
      chart.outlineColor = "#FFFFFF";
      chart.outlineAlpha = 0.8;
      chart.outlineThickness = 0;
      chart.labelRadius = 15;
      //chart.labelText = "[[percents]]%";
      //chart.labelText = "[[value]]";
      chart.labelText = "";
      chart.depth3D = 5;
      chart.angle = 40;

      // LEGEND
      var legend = new AmCharts.AmLegend();
      legend.align = "left";
      legend.position = "right";
      legend.markerType = "square";
      legend.valueText = "";
      legend.fontSize = 8;
      chart.addLegend(legend);

      // WRITE
      chart.write("chartdiv${requestScope.DIV_ID}");
    }
  </script>
  <script>$(document).ready(function(){ loadChart${requestScope.DIV_ID} (); });</script>
</c:if>
