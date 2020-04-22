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
    <script language="javascript" type="text/javascript" src="https://vendors-new.bmtmicro.com/js/vendors.js"></script>
    <script language="javascript" type="text/javascript" src="https://secure.bmtmicro.com/Templates/util.js"></script>
    <script language="javascript" type="text/javascript" src="https://vendors-new.bmtmicro.com/js/tablesort.js"></script>
    <script language="javascript" type="text/javascript" src="https://vendors-new.bmtmicro.com/js/calendar.js"></script>
    <style media="screen" type="text/css">
      .content-box {
        height:calc(100vh - 275px);
        overflow-y: scroll;
        display: block;
      }
    </style>
    <script language="javascript" type="text/javascript">
      <!--
      function initForm (form) {
        initField (form, "REPORTTYPE", "${param.REPORTTYPE}");
      }
      function reportTypeChanged (form) {
        setCookieValue ("BMTMicro.Vendors.AffiliateSales.ReportType", queryField (form, "REPORTTYPE"), 1000);
      }
      function submitForm (form){
        if (!CheckDateRange (form)) {
          return (false);
        }
        form.submit();
        return (true);
      }
      //-->
    </script>
  </head>
  <body onload="initForm (document.affiliatesales);">

    <!-- Blue background header -->
    <div class="blue-bg"></div>

    <!-- Start of body content -->
    <div class="main-raised">
      <div class="container-fluid body-content">
        <article class="section">
          <div class="row justify-content-start">
            <%@ include file="/includes/menuSidebar.html" %>
            <div class="col-lg-10 col-md-12 page-title">
              <h4>Affiliate&nbsp;Sales&nbsp;Report</h4>
              <div class="content-box" style="min-height: 350px;">
                <form name="affiliatesales" action="https://vendors-new.bmtmicro.com/servlets/Vendors.AffiliateReports" method="post">
                  <div class="table-header">
                    <span>
                      From:&nbsp;
                      <input id="DATEFROM" name="DATEFROM" value="${param.DATEFROM}" />
                      <img src="https://vendors-new.bmtmicro.com/images/cal.gif" width="22" height="22" border="0" alt="Click Here to Pick the date" onclick="show_calendar ('DATEFROM'); return (false);" onmouseover="this.style.cursor='pointer';" />
                    </span>
                    <span>
                      To:&nbsp;
                      <input id="DATETO" name="DATETO" value="${param.DATETO}" style="margin-bottom: 1rem;" />
                      <img src="https://vendors-new.bmtmicro.com/images/cal.gif" width="22" height="22" border="0" alt="Click Here to Pick the date" onclick="show_calendar ('DATETO'); return (false);" onmouseover="this.style.cursor='pointer';" />
                    </span>
                    <span>
                      By:&nbsp;
                      <select name="REPORTTYPE" onchange="reportTypeChanged (affiliatesales);">
                        <option  value="0" >Product </option>
                        <option value="1">Affiliate</option>
                        <option value="2">Product & Affiliate</option>
                      </select>
                    </span>
                    <input type="hidden" name="ROWHEADERTEMPLATEURL" value="${param.ROWHEADERTEMPLATEURL}" />
                    <input type="hidden" name="ROWTEMPLATEURL" value="${param.ROWTEMPLATEURL}" />
                    <input type="hidden" name="NEXT_PAGE" value="https://vendors-new.bmtmicro.com/affiliatesales.jsp" />
                    <input type="hidden" name="ERROR_PAGE" value="https://vendors-new.bmtmicro.com/error.jsp" />
                    <button type="button" class="get-btn" onclick="submitForm (affiliatesales);" value="Get Affiliate Sales">Get Affiliate Sales</button>
                  </div> <!-- end .table-header -->
                  <div class="row table-responsive-lg" style="margin-left: auto; margin-right: auto;">
                    <table class="table" id="selection">
                      <thead>
                        <tr class="table-category">
                          <th scope="col" class="sort-column sortable sort text-center" title="Sort on 'ID'" number>
                            <a href="#" class="fdTableSortTrigger">ID</a>
                          </th>
                          <th scope="col" class="sort-column sortable sort text-center" title="Sort on 'Name'" text>
                            <a href="#" class="fdTableSortTrigger">Name</a>
                          </th>
                          <th scope="col" class="sort-column sortable sort text-center" title="Sort on 'Units Sold'" number>
                            <a href="#" class="fdTableSortTrigger">Units&nbsp;Sold</a>
                          </th>
                          <th scope="col" class="sort-column sortable sort text-center" title="Sort on 'Gross Sales'" money>
                            <a href="#" class="fdTableSortTrigger">Gross&nbsp;Sales</a>
                          </th>
                          <th scope="col" class="sort-column sortable sort text-center" title="Sort on 'to Affiliate'" money>
                            <a href="#" class="fdTableSortTrigger">to&nbsp;Affiliate</a>
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
                          <th scope="row" colspan="5">
                            <div id="pageselector">&nbsp;</div>
                          </th>
                        </tr>
                      </tfoot>
                    </table>
                  </div>
                </form>
              </div> <!-- end .content-box -->
            </div> <!-- end .col-lg-10 col-md-12 page-title -->
          </div> <!-- end .row justify-content-start -->
        </article>
      </div> <!-- end .container-fluid -->
      <%@ include file="/includes/footer.html" %>
    </div> <!-- end .main-raised -->
    <%@ include file="/includes/bootstrap_bottom_scripts.html" %>
  </body>
</html>
