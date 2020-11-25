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
		<script src="https://secure.bmtmicro.com/Templates/util.js"></script>
		<script src="https://vendors-new.bmtmicro.com/js/vendors.js"></script>
    <script src="https://vendors-new.bmtmicro.com/js/tablesort.js"></script>
    <script src="https://vendors-new.bmtmicro.com/js/calendar.js"></script>
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
		<script>
			function refreshReport (form) {
				if (!CheckDateRange (form)) {
					return (false);
				}
				if (parseInt (form.FORMAT.value) == -1) { // If printable HTML is selected we use a different row template and landing page
					form.target = "";
					form.NEXT_PAGE.value = "https://vendors-new.bmtmicro.com/sales-account-transactions-table.jsp";
					submitToDiv(form, 'tableframe');
				} else {
					form.target = "_blank"; // Open up in new window
					form.NEXT_PAGE.value = "https://vendors-new.bmtmicro.com/sales-account-transactions-print.jsp";
					form.submit ();
				}
				return (true);
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
						<jsp:include page="/includes/menuSidebar.jsp" />
						<div class="col-lg-10 col-md-12 page-title">
							<h4>Account Transactions</h4>
							<p>Vendor payments are made on the first of each month.</p>
							<div class="content-box overflow-auto d-flex flex-column">
								<div name="tableframe" class="h-100" id="tableframe">
									<c:catch var="errormsg">
										<c:import url="https://vendors-new.bmtmicro.com/servlets/Vendors.Transactions">
											<c:param name="SESSIONID" value="${sessionid}" />
											<c:param name="NEXT_PAGE" value="https://vendors-new.bmtmicro.com/sales-account-transactions-table.jsp"/>
											<c:param name="ERROR_PAGE" value="https://vendors-new.bmtmicro.com/error-div.jsp"/>
											<c:param name="DATEFROM" value="${bomDate}"/>
											<c:param name="DATETO" value="${toDate}"/>
											<c:param name="FORMAT" value="-1" />
										</c:import>
									</c:catch>
									<%@ include file="/includes/catch.jsp" %>
								</div> <!-- end #tableframe -->
							</div> <!-- end .content-box -->
						</div> <!-- end .col-lg-10 page-title -->
					</div> <!-- end first .row justify-content-start -->
				</article>
			</div> <!-- end .container-fluid -->
			<jsp:include page="/includes/footer.jsp" />
		</div> <!-- end .main-raised -->
		<%@ include file="/includes/bootstrap_bottom_scripts.html" %>
	</body>
</html>
