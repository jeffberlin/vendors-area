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
    <script src="https://secure.bmtmicro.com/Templates/util.js"></script>
    <script src="https://vendors-new.bmtmicro.com/js/vendors.js"></script>
    <script src="https://vendors-new.bmtmicro.com/js/tablesort.js"></script>
    <script src="https://vendors-new.bmtmicro.com/js/calendar.js"></script>
    <style media="screen" type="text/css">
      td[text] {
        border-right: 1px solid #a9a9a9;
      }

      td[money] {
        text-align: right;
      }
    </style>
    <script>
      function refreshReport (form) {
        if (CheckDateRange (form)) {
          submitToDiv (form, 'tableframe');
        }
      }

      function filterKeyPress(event) {
        if (event.keyCode == 13) {
          refreshReport (document.eusummary);
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
            <jsp:include page="includes/menuSidebar.jsp" />
            <div class="col-lg-10 col-md-12 page-title">
              <h4>EU Sales Summary</h4>
              <p>Below is a summary of sales to the European Union.</p>
              <div class="content-box overflow-auto">
                <form name="eusummary" method="post" action="https://vendors-new.bmtmicro.com/servlets/Vendors.EUSalesSummary">
                  <div class="table-header">
                    <span>From:&nbsp;<input id="DATEFROM" name="DATEFROM" value="${fromDate}" onkeypress="filterKeyPress(event)" />
                      <img class="calendar" alt="Click Here to Pick the date" title="Click Here to Pick the date" onclick="show_calendar (this)" />
                    </span>
                    <span>To:&nbsp;<input id="DATETO" name="DATETO" value="${toDate}" onkeypress="filterKeyPress(event)" />
                      <img class="calendar" alt="Click Here to Pick the date" title="Click Here to Pick the date" onclick="show_calendar (this)" />
                    </span>
                    <span>
                      <input type="hidden" name="ROWTEMPLATEURL" value="https://vendors-new.bmtmicro.com/sales-eu-summary-tablerow.html" />
                      <input type="hidden" name="NEXT_PAGE" value="https://vendors-new.bmtmicro.com/sales-eu-summary-table.jsp" />
                      <input type="hidden" name="ERROR_PAGE" value="https://vendors-new.bmtmicro.com/error-div.jsp" />
                      <button type="button" class="grey-btn" value="Get New Summary" onclick="refreshReport (document.eusummary);">Update Summary</button>
                    </span>
                  </div> <!-- end .table-header -->
                </form>
                <div name="tableframe" class="h-100" id="tableframe"></div>
              </div> <!-- end .content-box -->
            </div> <!-- end .col-lg-10 -->
          </div> <!-- end first .row -->
        </article>
      </div> <!-- end .container-fluid -->
      <jsp:include page="includes/footer.jsp" />
    </div> <!-- end .main-raised -->
    <%@ include file="/includes/bootstrap_bottom_scripts.html" %>
  </body>
  <script>$(document).ready(function(){ submitToDiv (document.eusummary, 'tableframe'); });</script>
</html>
