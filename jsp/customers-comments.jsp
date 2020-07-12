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
      #resultframe, .content-box {
        height: calc(100vh - 275px);
        min-height: 290px;
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
              <h4>Customer&nbsp;Comments</h4>
              <p>This report displays customer comments and custom field values from your shopping cart.</p>
              <div class="content-box">
                <form name="customercomments" action="https://vendors-new.bmtmicro.com/servlets/Vendors.Comments" method="post" onsubmit="return (CheckDateRange (this));">
                  <input type="hidden" name="SESSIONID" value="${sessionid}" />
                  <input type="hidden" name="ROWTEMPLATEURL" value="https://vendors-new.bmtmicro.com/customers-comments-tablerow.html" />
                  <input type="hidden" name="NEXT_PAGE" value="https://vendors-new.bmtmicro.com/customers-comments-start.jsp" />
                  <input type="hidden" name="ERROR_PAGE" value="https://vendors-new.bmtmicro.com/error.jsp" />
                  <div class="table-header">
                    <span>From:&nbsp;<input id="DATEFROM" name="DATEFROM" value="${fromDate}" />
                      <img src='<c:url value="/images/cal.gif"></c:url>' width="22" height="22" border="0" alt="Click Here to Pick the date" onclick="show_calendar ('DATEFROM'); return (false);" onmouseover="this.style.cursor='pointer';" />
                    </span>
                    <span>To:&nbsp;<input id="DATETO" name="DATETO" value="${toDate}"  style="margin-bottom: 1rem;"/>
                      <img src='<c:url value="/images/cal.gif"></c:url>' width="22" height="22" border="0" alt="Click Here to Pick the date" onclick="show_calendar ('DATETO'); return (false);" onmouseover="this.style.cursor='pointer';" />
                    </span>
                    <span>
                      <input type="hidden" name="ROWTEMPLATEURL" value="${param.ROWTEMPLATEURL}" />
                      <input type="hidden" name="NEXT_PAGE" value="https://vendors-new.bmtmicro.com/customers-comments-start.jsp" />
                      <input type="hidden" name="ERROR_PAGE" value="https://vendors-new.bmtmicro.com/error.jsp" />
                      <select name="FORMAT">
                        <option value="0" selected="selected">HTML</option>
                        <option value="1">CSV</option>
                        <option value="2">XML</option>
                      </select>
                    </span>
                    <button class="get-btn" value="Get Report" />Get&nbsp;Report</button>
                  </div> <!-- end .table-header -->
                </form>
                <div name="tableframe" class="h-100" id="tableframe"></div> <!-- end #tableframe -->
                  <c:import url = "https://vendors-new.bmtmicro.com/servlets/Vendors.Comments">
                    <c:param name = "SESSIONID" value = "${sessionid}" />
                    <c:param name = "DATEFROM" value="${fromDate}" />
                    <c:param name = "DATETO" value="${toDate}" />
                    <c:param name = "ROWTEMPLATEURL" value="https://vendors-new.bmtmicro.com/customers-comments-tablerow.html" />
                    <c:param name = "NEXT_PAGE" value="https://vendors-new.bmtmicro.com/customers-comments-start.jsp" />
                    <c:param name = "ERROR_PAGE" value="https://vendors-new.bmtmicro.com/error.jsp" />
                  </c:import>
                <iframe src="" name="resultframe" id="resultframe" frameborder="0" border="0" cellspacing="0" style="border-style: none;width: 100%; height: 350px; padding: 0px; margin:0px; display: none;" >
                   [Your user agent does not support frames or is currently configured not to display frames. In order to use this area, frames are required.]
                </iframe>
              </div> <!-- end .content-box -->
            </div> <!-- end .col-lg-10 col-md-12 page-title -->
          </div> <!-- end .row justify-content-start -->
        </article>
      </div> <!-- end .container-fluid -->
      <%@ include file="/includes/footer.html" %>
    </div> <!-- end .main-raised -->
    <%@ include file="/includes/bootstrap_bottom_scripts.html" %>
  </body>
  <script>$(document).ready(function(){ submitToDiv (document.customercomments, 'tableframe'); });</script>
</html>
