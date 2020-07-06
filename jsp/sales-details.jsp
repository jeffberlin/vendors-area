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
    <script language="javascript" type="text/javascript">
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
            <%@ include file="/includes/menuSidebar.html" %>
            <div class="col-lg-10 col-md-12 page-title">
              <h4>Sales Detail Report</h4>
              <p>Filter Details using the input fields. Fields can be added or removed using the Settings link on the left side of this page.</p>
              <div class="content-box overflow-auto">
                <form name="salesdetails" action="https://vendors-new.bmtmicro.com/servlets/Vendors.SalesDetails" method="post">
                  <div class="table-header">
                    <span>From:&nbsp;
                      <input id="DATEFROM" name="DATEFROM" value="${fromDate}" onkeypress="filterKeyPress(event)"/>&nbsp;
                      <img src='<c:url value="/images/cal.gif"></c:url>' width="16" height="16" border="0" alt="Click Here to Pick up the date" onclick="show_calendar ('DATEFROM'); return (false);" onmouseover="this.style.cursor='pointer';" />
                    </span>
                    <span>To:&nbsp;
                      <input id="DATETO" name="DATETO" value="${toDate}" style="margin-bottom: 1rem;" onkeypress="filterKeyPress(event)"/>&nbsp;
                      <img src='<c:url value="/images/cal.gif"></c:url>' width="16" height="16" border="0" alt="Click Here to Pick up the date" onclick="show_calendar ('DATETO'); return (false);"  onmouseover="this.style.cursor='pointer';" />
                    </span>
                    <!-- <br> -->
                    <span>
                      <input type="checkbox" name="EXACTMATCH" value="-1"<c:if test="${cookie['BMTMicro.Vendors.SalesDetails.ExactMatch'].value==-1}"> checked</c:if>
                          onclick="exactMatch(salesdetails);" title="Check for exact matches"  >&nbsp;Use exact match when filtering
                      <input type="hidden" name="ROWSPERPAGE" value="250" />
                      <input type="hidden" name="NEXT_PAGE" value="https://vendors-new.bmtmicro.com/sales-details-table.jsp" />
                      <input type="hidden" name="ERROR_PAGE" value="https://vendors-new.bmtmicro.com/error.jsp" />
                    </span>
                    <span>
                      <select name="FORMAT">
                        <option value="0" selected="selected">HTML</option>
                        <option value="1">CSV</option>
                        <option value="2">XML</option>
                        <option value="3">PDF</option>
                      </select>
                    </span>
                    <span>
                      <button class="grey-btn" type="button" value="Get Report" onclick="refreshReport (document.salesdetails);">Get Sales Details</button>
                    </span>
                  </div> <!-- end .table-header -->
                  <div name="tableframe" class="overflow-auto h-100" id="tableframe"></div> <!-- end #tableframe -->
                </form>
                <div style="visibility:hidden;">
                  <form name="invoice" action="https://vendors-new.bmtmicro.com/servlets/Vendors.Invoice" method="post" target="_blank">
                    <input name="ORDERID" type="hidden" value="0">
                    <input name="VENDORID" type="hidden" value="${param.VENDORID}">
                  </form>
                </div>
              </div> <!-- end .content-box -->
            </div> <!-- end .col-lg-10 -->
          </div> <!-- end first .row -->
        </article>
      </div> <!-- end .container-fluid -->
      <%@ include file="/includes/footer.html" %>
    </div> <!-- end .main-raised -->
    <%@ include file="/includes/bootstrap_bottom_scripts.html" %>
    <script>$(document).ready(function(){ submitToDiv (document.salesdetails, 'tableframe'); });</script>
  </body>
</html>
