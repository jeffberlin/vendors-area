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
      th {
        min-width: 150px;
      }
      td[info] {
        border-right: none;
      }
      td[money] {
        text-align: right;
      }
    </style>
		<script language="javascript" type="text/javascript">
			function submitForm (form) {
				if (!CheckDateRange (form)) {
					return (false);
				}
				if (parseInt (form.FORMAT.value) == 0) { // If printable HTML is selected we use a different row template and landing page
					form.target = "_blank"; // Open up in new window
					form.NEXT_PAGE.value = "https://vendors-new.bmtmicro.com/sales-account-transactions-print.jsp";
					form.ROWTEMPLATEURL.value = "https://vendors-new.bmtmicro.com/sales-account-transactions-print-tablerow.html";
				} else {
					form.target = "";
					form.NEXT_PAGE.value = "https://vendors-new.bmtmicro.com/sales-account-transactions-table.jsp";
					form.ROWTEMPLATEURL.value = "${param.ROWTEMPLATEURL}";
				}
				form.submit ();
				return (true);
			}
      function refreshReport (form) {
				if (CheckDateRange (form)) {
					submitToDiv (form, 'tableframe');
				}
      }
      function filterKeyPress(event) {
        if (event.keyCode == 13) {
          refreshReport (document.transactions);
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
              <h4>Account Transactions</h4>
              <p>Vendor payments are made on the first of each month.</p>
							<div class="content-box overflow-auto d-flex flex-column">
                <form name="transactions" action="https://vendors-new.bmtmicro.com/servlets/Vendors.Transactions" method="post">
                  <input type="hidden" name="ROWTEMPLATEURL" value="https://vendors-new.bmtmicro.com/sales-account-transactions-tablerow.html" />
                  <input type="hidden" name="NEXT_PAGE" value="https://vendors-new.bmtmicro.com/sales-account-transactions-table.jsp" />
                  <input type="hidden" name="ERROR_PAGE" value="https://vendors-new.bmtmicro.com/error-div.jsp" />
                  <div class="table-header">
                    <span>From:&nbsp;
                      <input id="DATEFROM" name="DATEFROM" value="${bomDate}" onkeypress="filterKeyPress(event)"/>&nbsp;
                      <img src='<c:url value="/images/cal.gif"></c:url>' width="16" height="16" border="0" alt="Click Here to Pick up the date" onclick="show_calendar ('DATEFROM'); return (false);" onmouseover="this.style.cursor='pointer';" />
                    </span>
                    <span>To:&nbsp;
                      <input id="DATETO" name="DATETO" value="${toDate}" onkeypress="filterKeyPress(event)"/>&nbsp;
                      <img src='<c:url value="/images/cal.gif"></c:url>' width="16" height="16" border="0" alt="Click Here to Pick up the date" onclick="show_calendar ('DATETO'); return (false);" onmouseover="this.style.cursor='pointer';" />
                    </span>
                    <span>
                      <select name="FORMAT">
                        <option value="-1" selected="selected">HTML (refresh)</option>
                        <option value="0">HTML (printable)</option>
                        <option value="1">CSV</option>
                        <option value="2">XML</option>
                        <option value="3">PDF</option>
                      </select>
                    </span>
                    <span>
                      <button type="button" class="grey-btn" value="Get Sales Summary" onclick="refreshReport (document.transactions);">Update Transactions</button>
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
	<script>$(document).ready(function(){ submitToDiv (document.transactions, 'tableframe'); });</script>
</html>
