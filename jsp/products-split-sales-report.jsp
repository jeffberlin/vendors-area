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
    <style media="screen">
      td[number] {
        text-align: center;
      }
      td[money] {
        text-align: right;
      }
    </style>
    <script>
      function refreshReport (form) {
        if (!CheckDateRange(form)) {
          return(false)
        }
        if (parseInt (form.FORMAT.value) == 0) {
          form.target = "_blank";
          form.NEXT_PAGE.value = "https://vendors-new.bmtmicro.com/products-split-sales-report-print.jsp";
          form.ERROR_PAGE.value = "https://vendors-new.bmtmicro.com/products-split-sales-report-print-tablerow.html";
          form.submit();
        } else {
          form.target = "";
          form.NEXT_PAGE.value = "https://vendors-new.bmtmicro.com/products-split-sales-report-table.jsp";
          form.ERROR_PAGE.value = "${param.ROWTEMPLATEURL}";
          submitToDiv(form, 'tableframe')
        }
        return(true)
      }

      function filterKeyPress(event) {
        if (event.keyCode == 13) {
          refreshReport (document.splitsalesreport);
          return (true);
        }
      }
    </script>
  </head>
  <body>
    <!-- Blue background header -->
		<div class="blue-bg"></div>
		<!-- Start of the body -->
		<div class="main-raised">
			<div class="container-fluid body-content">
				<article class="section">
					<div class="row justify-content-start">
						<jsp:include page="includes/menuSidebar.jsp" />
						<div class="col-lg-10 col-md-12 page-title">
              <h4>Split&nbsp;Sales&nbsp;Report</h4>
              <p>Report should be run based on the Account Transactions dates.</p>
							<div class="content-box overflow-auto d-flex flex-column">
                <form name="splitsalesreport" action="https://vendors-new.bmtmicro.com/servlets/Vendors.SplitSalesReport" method="post">
                  <input type="hidden" name="ROWTEMPLATEURL" value="https://vendors-new.bmtmicro.com/products-split-sales-report-tablerow.html" />
                  <input type="hidden" name="NEXT_PAGE" value="https://vendors-new.bmtmicro.com/products-split-sales-report-table.jsp" />
                  <input type="hidden" name="ERROR_PAGE" value="https://vendors-new.bmtmicro.com/error-div.jsp" />
                  <div class="table-header">
                    <span>
                      From:&nbsp;
                      <input id="DATEFROM" name="DATEFROM" value="${bomDate}" onkeypress="filterKeyPress(event)"/>&nbsp;
											<img class="calendar" alt="Click Here to Pick the date" title="Click Here to Pick the date" onclick="show_calendar (this)" />
                    </span>
                    <span>
                      To:&nbsp;
                      <input id="DATETO" name="DATETO" value="${toDate}" onkeypress="filterKeyPress(event)"/>&nbsp;
											<img class="calendar" alt="Click Here to Pick the date" title="Click Here to Pick the date" onclick="show_calendar (this)" />
                    </span>
                    <span>
                      <select name="FORMAT">
                        <option value="-1"<c:if test="${param.FORMAT=='-1'}"> selected</c:if>>HTML (refresh)</option>
                        <option value="0"<c:if test="${param.FORMAT=='0'}"> selected</c:if>>HTML (printable)</option>
                        <option value="1"<c:if test="${param.FORMAT=='1'}"> selected</c:if>>CSV</option>
                        <option value="2"<c:if test="${param.FORMAT=='2'}"> selected</c:if>>XML</option>
                        <option value="3"<c:if test="${param.FORMAT=='3'}"> selected</c:if>>PDF</option>
                      </select>
                    </span>
                    <span>
                      <button type="button" class="grey-btn" value="Get Split Sales Summary" onclick="refreshReport (document.splitsalesreport);">Get Split Sales Summary</button>
                    </span>
                  </div> <!-- end .table-header -->
                </form>
								<div name="tableframe" class="h-100" id="tableframe"></div>
							</div> <!-- end .content-box -->
						</div> <!-- end .col-lg-10 page-title -->
					</div> <!-- end first .row justify-content-start -->
				</article>
			</div> <!-- end .container-fluid -->
			<jsp:include page="includes/footer.jsp" />
		</div> <!-- end .main-raised -->
		<%@ include file="/includes/bootstrap_bottom_scripts.html" %>
  </body>
  <script>
    $(document).ready(function(){ submitToDiv (document.splitsalesreport, 'tableframe'); });
  </script>
</html>
