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
    <script src="https://vendors-new.bmtmicro.com/js/calendar.js"></script>
    <style media="screen" type="text/css">
      table > tbody th, #text {
        color: #707070;
      }
      table > tbody th {
        text-align: left;
        letter-spacing: .5px;
        font-size: .9rem;
        font-weight: 300;
      }
      th {
        min-width: 200px;
      }
      td p {
        margin-bottom: 0px;
      }
    </style>
		<script>
      function showInvoice (orderid) {
        var form = document.invoice;
        form.ORDERID.value = orderid;
        form.submit();
      }
      function refreshReport (form) {
        if (CheckDateRange (form)) {
          submitToDiv (form, 'tableframe');
        }
      }
      function filterKeyPress(event) {
        if (event.keyCode == 13) {
          refreshReport (document.pendingsales);
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
							<h4>Pending Sales Report</h4>
							<p>Click on Order ID to retrieve a pdf Invoice for that pending order.</p>
							<div class="content-box overflow-auto d-flex flex-column">
								<div name="tableframe" class="h-100" id="tableframe">
									<c:catch var="errormsg">
										<c:import url="https://vendors-new.bmtmicro.com/servlets/Vendors.SalesPending">
											<c:param name="SESSIONID" value="${sessionid}" />
											<c:param name="NEXT_PAGE" value="https://vendors-new.bmtmicro.com/sales-pending-table.jsp"/>
											<c:param name="ERROR_PAGE" value="https://vendors-new.bmtmicro.com/error-div.jsp"/>
											<c:param name="DATEFROM" value="${fromDate90}"/>
											<c:param name="DATETO" value="${toDate}"/>
										</c:import>
									</c:catch>
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
