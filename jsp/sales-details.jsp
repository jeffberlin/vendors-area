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
    <title>BMT Micro Developers Center</title>
    <%@ include file="/includes/bootstrap_top_script.html" %>
    <%@ include file="/includes/style_menu_footer_css.html" %>
    <link rel="stylesheet" href="https://vendors-new.bmtmicro.com/css/table.css"/>
    <script language="javascript" type="text/javascript" src="https://secure.bmtmicro.com/Templates/util.js"></script>
    <script language="javascript" type="text/javascript" src="https://vendors-new.bmtmicro.com/js/vendors.js"></script>
    <script language="javascript" type="text/javascript" src="https://vendors-new.bmtmicro.com/js/tablesort.js"></script>
    <script language="javascript" type="text/javascript" src="https://vendors-new.bmtmicro.com/js/calendar.js"></script>
    <style media="screen" type="text/css">
      .table-responsive {
        overflow-y: scroll;
        height: calc(100vh - 350px);
        display: block;
      }
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
  </head>
  <body>
    <!-- Blue background header -->
    <div class="blue-bg"></div>

    <!-- Start of body content -->
    <div class="main-raised">
      <div class="container-fluid body-content">
        <article class="section">
          <div class="row justify-content-start">
            <%@ include file="/includes/menuSidebar.html" %>
            <div class="col-lg-10 col-md-12 page-title">
              <h4>Sales Detail Report</h4>
              <p>Filter Details using the input fields. Fields can be added or removed using the Settings link under your name.</p>
              <div class="content-box overflow-auto">
                <c:import name="start" url = "https://vendors.bmtmicro.com/servlets/Vendors.SalesDetails">
                  <c:param name = "SESSIONID" value = "${sessionid}" />
                  <c:param name = "DATEFROM" value="${fromDate}" />
                  <c:param name = "DATETO" value="${toDate}" />
                  <c:param name = "EXACTMATCH" value="0" />
                  <c:param name = "ROWSPERPAGE" value="250" />
                  <c:param name = "PAGE" value="1" />
                  <c:param name = "ROWTEMPLATEURL" value="https://vendors-new.bmtmicro.com/sales-eu-summary-tablerow.html" />
                  <c:param name = "NEXT_PAGE" value="https://vendors-new.bmtmicro.com/sales-details.jsp" />
                  <c:param name = "ERROR_PAGE" value="https://vendors-new.bmtmicro.com/error.jsp" />
                </c:import>
              </div> <!-- end .content-box -->
            </div> <!-- end .col-lg-10 -->
          </div> <!-- end first .row -->
        </article>
      </div> <!-- end .container-fluid -->
      <%@ include file="/includes/footer.html" %>
    </div> <!-- end .main-raised -->
  <%@ include file="/includes/bootstrap_bottom_scripts.html" %>
  </body>
</html>
