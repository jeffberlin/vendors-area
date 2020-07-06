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
      td[text], td[number], td[money] {
        border-right: 1px solid #a9a9a9;
      }

      td[number] {
        text-align: center;
      }

      td[money] {
        text-align: right;
      }

      td[money]:last-child {
        border-right: none;
      }

      .table-responsive-lg {
        display: block;
      }
    </style>
    <script>
			function refreshReport (form) {
				if (CheckDateRange (form)) {
					submitToDiv (form, 'tableframe');
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
            <%@ include file="/includes/menuSidebar.html" %>
            <div class="col-lg-10 col-md-12 page-title">
              <h4>Detailed Sales Summary</h4>
              <p>Sales are batched by number of items in order.</p>
              <div class="content-box overflow-auto">
               <form name="detailedsummary" method="post" action="https://vendors-new.bmtmicro.com/servlets/Vendors.SalesDSummary">
                 <div class="row table-responsive-lg" style="margin-left: auto; margin-right: auto;">
                   <div class="table-header">
                     <span>From:&nbsp;<input id="DATEFROM" name="DATEFROM" value="${fromDate}" />
                       <img src='<c:url value="/images/cal.gif"></c:url>' width="22" height="22" border="0" alt="Click Here to Pick the date" onclick="show_calendar ('DATEFROM'); return (false);" onmouseover="this.style.cursor='pointer';" />
                     </span>
                     <span>To:&nbsp;<input id="DATETO" name="DATETO" value="${toDate}" />
                       <img src='<c:url value="/images/cal.gif"></c:url>' width="22" height="22" border="0" alt="Click Here to Pick the date" onclick="show_calendar ('DATETO'); return (false);" onmouseover="this.style.cursor='pointer';" />
                     </span>
                     <span>
                       <input type="hidden" name="ROWTEMPLATEURL" value="https://vendors-new.bmtmicro.com/sales-detailed-summary-tablerow.html" />
                       <input type="hidden" name="NEXT_PAGE" value="https://vendors-new.bmtmicro.com/sales-detailed-summary-table.jsp" />
                       <input type="hidden" name="ERROR_PAGE" value="https://vendors-new.bmtmicro.com/error.jsp" />
                       <button type="button" class="grey-btn" value="Get New Summary" onclick="refreshReport (document.detailedsummary);">Update Summary</button>
                     </span>
                   </div> <!-- end .table-header -->
                   <div name="tableframe" class="h-100" id="tableframe"></div>
                 </div> <!-- end .row table-responsive-lg -->
                </form>
              </div> <!-- end .content-box -->
            </div> <!-- end .col-lg-10 -->
          </div> <!-- end first .row -->
        </article>
      </div> <!-- end .container-fluid -->
      <%@ include file="/includes/footer.html" %>
    </div> <!-- end .main-raised -->
    <%@ include file="/includes/bootstrap_bottom_scripts.html" %>
  </body>
  <script>$(document).ready(function(){ submitToDiv (document.detailedsummary, 'tableframe'); });</script>
</html>
