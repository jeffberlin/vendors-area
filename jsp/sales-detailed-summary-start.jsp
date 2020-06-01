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

      td[number], td[money] {
        text-align: right;
      }

      td[money]:last-child {
        border-right: none;
      }
      .content-box {
        height:calc(100vh - 350px);
        min-height: 280px;
      }
      .table-responsive-lg {
        display: block;
        /* overflow-y: scroll; */
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
              <h4>Detailed Sales Summary</h4>
              <p>Sales are batched by number of items in order.</p>
              <div class="content-box overflow-auto">
                <form method="post" action="https://vendors-new.bmtmicro.com/servlets/Vendors.SalesDSummary" onsubmit="return (CheckDateRange(this));">
                  <div class="table-header">
                    <span>From:&nbsp;<input id="DATEFROM" name="DATEFROM" value="${param.DATEFROM}" />
                      <img src='<c:url value="/images/cal.gif"></c:url>' width="22" height="22" border="0" alt="Click Here to Pick the date" onclick="show_calendar ('DATEFROM'); return (false);" onmouseover="this.style.cursor='pointer';" />
                    </span>
                    <span>
                    To:&nbsp;<input id="DATETO" name="DATETO" value="${param.DATETO}" />
                        <img src='<c:url value="/images/cal.gif"></c:url>' width="22" height="22" border="0" alt="Click Here to Pick the date" onclick="show_calendar ('DATETO'); return (false);"  onmouseover="this.style.cursor='pointer';" />
                    </span>
                    <span>
                      <input type="hidden" name="ROWTEMPLATEURL" value="${param.ROWTEMPLATEURL}" />
                      <input type="hidden" name="NEXT_PAGE" value="https://vendors-new.bmtmicro.com/sales-detailed-summary-start.jsp" />
                      <input type="hidden" name="ERROR_PAGE" value="https://vendors-new.bmtmicro.com/error.jsp" />
                      <button class="get-btn" value="Get New Summary">Update Summary</button>
                    </span>
                  </div> <!-- end .table-header -->
                  <div class="row table-responsive-lg" style="margin-left: auto; margin-right: auto;">
                    <table class="table" id="selection">
                      <thead>
                        <tr class="table-category">
                          <th scope="col" class="sort-column text-center sortable sort" title="Sort on 'Product'">
                            <a href="#" class="fdTableSortTrigger">Product</a>
                          </th>
                          <th scope="col" class="sort-column text-center sortable-numeric sort" title="Sort on 'Batch Size'">
                            <a href="#" class="fdTableSortTrigger">Batch Size</a>
                          </th>
                          <th scope="col" class="sort-column text-center sortable-currency sort" title="Sort on 'Price'">
                            <a href="#" class="fdTableSortTrigger">Price</a>
                          </th>
                          <th scope="col" class="sort-column text-center sortable-currency sort" title="Sort on 'Discount'">
                            <a href="#" class="fdTableSortTrigger">Discount</a>
                          </th>
                          <th scope="col" class="sort-column text-center sortable-currency sort" title="Sort on 'To Vendor'">
                            <a href="#" class="fdTableSortTrigger">To Vendor</a>
                          </th>
                          <th scope="col" class="sort-column text-center sortable-numeric sort" title="Sort on 'Units Sold'">
                            <a href="#" class="fdTableSortTrigger">Units Sold</a>
                          </th>
                          <th scope="col" class="sort-column text-center sortable-currency sort" title="Sort on 'Total to Vendor'">
                            <a href="#" class="fdTableSortTrigger">Total to Vendor</a>
                          </th>
                        </tr>
                      </thead>
                      <tbody>
                        <tr>
                          ${param.TABLEDATA}
                        </tr>
                      </tbody>
                      <tfoot>
                        <tr class="table-total">
                          <th scope="row" colspan="5">Total</th>
                          <th scope="row" class="text-right" number>${param.TOTALQUANTITY}</th>
                          <th scope="row" class="text-right" money>${param.TOTALAMOUNT}</th>
                        </tr>
                      </tfoot>
                    </table>
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
</html>
