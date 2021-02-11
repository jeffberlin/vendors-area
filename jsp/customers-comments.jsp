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
    <script>
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
          refreshReport (document.customercomments);
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
              <h4>Customer&nbsp;Comments</h4>
              <p>This report displays customer comments and custom field values from your shopping cart.</p>
              <div class="content-box overflow-auto d-flex flex-column">
                <form name="customercomments" action="https://vendors-new.bmtmicro.com/servlets/Vendors.Comments" method="post">
                  <input type="hidden" name="NEXT_PAGE" value="https://vendors-new.bmtmicro.com/customers-comments-table.jsp" />
                  <input type="hidden" name="ERROR_PAGE" value="https://vendors-new.bmtmicro.com/error-div.jsp" />
                  <div class="table-header">
                    <span>From:&nbsp;
                      <input id="DATEFROM" name="DATEFROM" value="${fromDate}" onkeypress="filterKeyPress(event)"/>
                      <img class="calendar" alt="Click Here to Pick the date" title="Click Here to Pick the date" onclick="show_calendar (this)" />
                    </span>
                    <span>To:&nbsp;
                      <input id="DATETO" name="DATETO" value="${toDate}" onkeypress="filterKeyPress(event)"/>
                      <img class="calendar" alt="Click Here to Pick the date" title="Click Here to Pick the date" onclick="show_calendar (this)" />
                    </span>
                    <span>
                      <select name="FORMAT">
                        <option value="0" selected="selected">HTML</option>
                        <option value="1">CSV</option>
                        <option value="2">XML</option>
                      </select>
                    </span>
                    <button type="button" class="grey-btn" onclick="refreshReport (document.customercomments);">Get&nbsp;Report</button>
                  </div> <!-- end .table-header -->
                  <div name="tableframe" id="tableframe">
                    <c:catch var="errormsg">
                      <c:import url="https://vendors-new.bmtmicro.com/servlets/Vendors.Comments">
                        <c:param name="SESSIONID" value="${sessionid}" />
                        <c:param name="NEXT_PAGE" value="https://vendors-new.bmtmicro.com/customers-comments-table.jsp"/>
                        <c:param name="ERROR_PAGE" value="https://vendors-new.bmtmicro.com/error-div.jsp"/>
                        <c:param name="DATEFROM" value="${fromDate}"/>
                        <c:param name="DATETO" value="${toDate}"/>
                        <c:param name="FORMAT" value="0" />
                      </c:import>
                    </c:catch>
                    <%@ include file="/includes/catch.jsp" %>
                  </div> <!-- end #tableframe -->
                </form>
              </div> <!-- end .content-box -->
            </div> <!-- end .col-lg-10 col-md-12 page-title -->
          </div> <!-- end .row justify-content-start -->
        </article>
      </div> <!-- end .container-fluid -->
      <jsp:include page="/includes/footer.jsp" />
    </div> <!-- end .main-raised -->
    <%@ include file="/includes/bootstrap_bottom_scripts.html" %>
  </body>
</html>
