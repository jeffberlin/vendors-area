<%@ page pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ include file="/includes/core.jsp" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta http-equiv="Pragma" content="no-cache">
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    <%@ include file="/includes/favicon-meta.html" %>
    <title>BMT Micro Developers Center</title>
    <%@ include file="/includes/bootstrap_top_script.html" %>
    <%@ include file="/includes/style_menu_footer_css.html" %>
    <link rel="stylesheet" href="https://vendors-new.bmtmicro.com/css/table.css"/>
    <script src="https://secure.bmtmicro.com/Templates/util.js"></script>
    <script src="https://vendors-new.bmtmicro.com/js/vendors.js"></script>
    <script src="https://vendors-new.bmtmicro.com/js/tablesort.js"></script>
    <script src="https://vendors-new.bmtmicro.com/js/calendar.js"></script>
    <style media="screen" type="text/css">
      td[text], td[number], td[date], td[info], td[money], th {
        border-right: 1px solid #a9a9a9;
      }
      th:last-child {
        border-right: none;
      }
      th {
        min-width: 150px;
      }
      td[number]:first-child {
        text-align: left;
      }
      td[money] {
        text-align: right;
      }
    </style>
    <script>
      function exactMatch (form) {
        setCookieValue ("BMTMicro.Vendors.SalesDetails.ExactMatch", queryField (form, "EXACTMATCH"), 1000);
      }

      function invoice (orderid) {
        var form = document.invoice;
        form.ORDERID.value = orderid;
        form.submit();
      }

      function refreshReport (form) {
        if (CheckDateRange (form)) {
          if (form.FORMAT.selectedIndex == 0) {
            submitToDiv (form, 'tableframe');
          } else {
            form.submit ();
          }
        }
      }

      function filterKeyPress(event) {
        if (event.keyCode == 13) {
          refreshReport (document.salesdetails);
          return (true);
        }
      }
    </script>
  </head>
  <body>
    <!-- Blue background header -->
    <div class="blue-bg"></div>

    <!-- Start of body content -->
    <div class="main-raised">
      <div class="container-fluid body-content">
        <article class="section">
          <div class="row justify-content-start">
            <jsp:include page="/includes/menuSidebar.jsp" />
            <div class="col-lg-10 col-md-12 page-title">
              <h4>Sales Detail Report</h4>
              <p>Filter Details using the input fields. Fields can be added or removed using the Settings link on the left side of this page.</p>
              <div class="content-box d-flex overflow-auto">
                <div name="tableframe" id="tableframe" class="h-100">
                  <c:catch var="errormsg">
                    <c:import url="https://vendors-new.bmtmicro.com/servlets/Vendors.SalesDetails">
                      <c:param name="SESSIONID" value="${sessionid}" />
                      <c:param name="NEXT_PAGE" value="https://vendors-new.bmtmicro.com/sales-details-table.jsp"/>
                      <c:param name="ERROR_PAGE" value="https://vendors-new.bmtmicro.com/error-div.jsp"/>
                      <c:param name="DATEFROM" value="${bomDate}"/>
                      <c:param name="DATETO" value="${toDate}"/>
                      <c:param name="EXACTMATCH" value="${cookie['BMTMicro.Vendors.SalesDetails.ExactMatch'].value}" />
                      <c:param name="FORMAT" value="0" />
                    </c:import>
                  </c:catch>
                  <%@ include file="/includes/catch.jsp" %>
                </div> <!-- end #tableframe -->
              </div> <!-- end .content-box -->
            </div> <!-- end .col-lg-10 -->
          </div> <!-- end first .row -->
        </article>
      </div> <!-- end .container-fluid -->
      <jsp:include page="/includes/footer.jsp" />
    </div> <!-- end .main-raised -->
    <%@ include file="/includes/bootstrap_bottom_scripts.html" %>
  </body>
</html>
