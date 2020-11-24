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
    <title>BMT Micro Developers Center</title>
    <%@ include file="/includes/bootstrap_top_script.html" %>
    <%@ include file="/includes/style_menu_footer_css.html" %>
    <link rel="stylesheet" href="https://vendors-new.bmtmicro.com/css/table.css"/>
    <script src="https://vendors-new.bmtmicro.com/js/vendors.js"></script>
    <script src="https://secure.bmtmicro.com/Templates/util.js"></script>
    <script src="https://vendors-new.bmtmicro.com/js/tablesort.js"></script>
    <style media="screen" type="text/css">
      .content-box {
        min-height: 290px;
        overflow-y: scroll;
      }
    </style>
    <script>
      function reportTypeChanged (form) {
        setCookieValue ("BMTMicro.Vendors.AffiliateSales.ReportType", queryField (form, "REPORTTYPE"), 1000);
        refreshReport (document.affiliatesales);
      }
      function filterKeyPress(event) {
        if (event.keyCode == 13) {
          refreshReport (document.affiliatesales);
          return (true);
        }
      }
      function refreshReport (form){
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
            <jsp:include page="/includes/menuSidebar.jsp" />
            <div class="col-lg-10 col-md-12 page-title">
              <h4>Affiliate&nbsp;Sales&nbsp;Report</h4>
              <div class="content-box overflow-auto d-block" style="min-height: 350px;">
                <form name="affiliatesales" action="https://vendors-new.bmtmicro.com/servlets/Vendors.AffiliateReports" method="post">
                  <div class="table-header">
                    <span>
                      From:&nbsp;
                      <input id="DATEFROM" name="DATEFROM" value="${fromDate}" onkeypress="filterKeyPress(event)" />
                      <img class="calendar" alt="Click Here to Pick the date" title="Click Here to Pick the date" onclick="show_calendar (this)" />
                    </span>
                    <span>
                      To:&nbsp;
                      <input id="DATETO" name="DATETO" value="${toDate}" onkeypress="filterKeyPress(event)" />
                      <img class="calendar" alt="Click Here to Pick the date" title="Click Here to Pick the date" onclick="show_calendar (this)" />
                    </span>
                    <span>
                      By:&nbsp;
                      <select name="REPORTTYPE" onchange="reportTypeChanged (affiliatesales);">
                        <option value="0"<c:if test="${cookie['BMTMicro.Vendors.AffiliateSales.ReportType'].value==0}"> selected</c:if>>Product</option>
                        <option value="1"<c:if test="${cookie['BMTMicro.Vendors.AffiliateSales.ReportType'].value==1}"> selected</c:if>>Affiliate</option>
                        <option value="2"<c:if test="${cookie['BMTMicro.Vendors.AffiliateSales.ReportType'].value==2}"> selected</c:if>>Product & Affiliate</option>
                      </select>
                    </span>
                    <input type="hidden" name="NEXT_PAGE" value="https://vendors-new.bmtmicro.com/affiliates-sales-table.jsp" />
                    <input type="hidden" name="ERROR_PAGE" value="https://vendors-new.bmtmicro.com/error-div.jsp" />
                    <button type="button" class="grey-btn" onclick="refreshReport (affiliatesales);" value="Get Affiliate Sales">Get Affiliate Sales</button>
                  </div> <!-- end .table-header -->
                </form>
                <div name="tableframe" class="h-100" id="tableframe">
                  <c:catch var="errormsg">
                    <c:import url="https://vendors-new.bmtmicro.com/servlets/Vendors.AffiliateReports">
                      <c:param name="SESSIONID" value="${sessionid}" />
                      <c:param name="NEXT_PAGE" value="https://vendors-new.bmtmicro.com/affiliates-sales-table.jsp" />
                      <c:param name="ERROR_PAGE" value="https://vendors-new.bmtmicro.com/error-div.jsp" />
                      <c:param name="DATEFROM" value="${fromDate}" />
                      <c:param name="DATETO" value="${toDate}" />
                      <c:param name="REPORTTYPE" value="${cookie['BMTMicro.Vendors.AffiliateSales.ReportType'].value}" />
                    </c:import>
                  </c:catch>
                  <%@ include file="/includes/catch.jsp" %>
                </div> <!-- end #tableframe -->
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
