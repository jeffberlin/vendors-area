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
      .table-responsive-lg {
        overflow-y: scroll;
        display: block;
        height: calc(100vh - 375px);
      }
      select {
        letter-spacing: .5px;
        border: 1px solid #a9a9a9;
        border-radius: 3px;
        padding: .2rem;
        outline: none;
        background: #ffffff;
        color: #195a7c;
      }
      select:hover {
        cursor: pointer;
      }
      select:focus {
        border: 1px solid #195a7c;
      }
      td[text] {
        border-right: 1px solid #a9a9a9;
      }
      td[number] {
        text-align: right;
      }
    </style>
		<script language="javascript" type="text/javascript">
      function initForm (form) {
        var consolidateby = getCookieValue ("BMTMicro.Vendors.Statistics.ConsolidateBy");
        var direction     = getCookieValue ("BMTMicro.Vendors.Statistics.Direction");
        if (consolidateby != null) {
          form.CONSOLIDATEBY.value = consolidateby;
        }
        if (direction != null) {
          form.DIRECTION.value = direction;
        }
        getVendorDateRange (form);
        form.submit ();
      }
		</script>
	</head>
	<body  onload="initForm (document.start);">
		<!-- Blue background header -->
		<div class="blue-bg"></div>
		<!-- Start of the body -->
		<div class="main-raised">
			<div class="container-fluid body-content">
				<article class="section">
					<div class="row justify-content-start">
						<%@ include file="/includes/menuSidebar.html" %>
						<div class="col-lg-10 col-md-12 page-title">
              <h4>View Statistics</h4>
              <p>Select field to display occurrences.</p>
							<div class="content-box d-flex flex-column">
								<div name="tableframe" class="overflow-auto h-100" id="tableframe">
                  <form name="start" action="https://vendors.bmtmicro.com/servlets/Vendors.Statistics" method="post">
                    <input type="hidden" name="DATEFROM" value="${fromDate}" />
                    <input type="hidden" name="DATETO" value="${toDate}" />
                    <input type="hidden" name="CONSOLIDATEBY" value="0" />
                    <input type="hidden" name="DIRECTION" value="1" />
                    <input type="hidden" name="ROWTEMPLATEURL" value="https://vendors-new.bmtmicro.com/sales-view-statistics-tablerow.html" />
                    <input type="hidden" name="NEXT_PAGE" value="https://vendors-new.bmtmicro.com/sales-view-statistics-table.jsp" />
                    <input type="hidden" name="ERROR_PAGE" value="https://vendors-new.bmtmicro.com/error.jsp" />
                  </form>
                </div>
								<div name="resultframe" id="resultframe"></div>
							</div> <!-- end .content-box -->
						</div> <!-- end .col-lg-10 page-title -->
					</div> <!-- end first .row justify-content-start -->
				</article>
			</div> <!-- end .container-fluid -->
			<%@ include file="/includes/footer.html" %>
		</div> <!-- end .main-raised -->
		<%@ include file="/includes/bootstrap_bottom_scripts.html" %>
	</body>
	<script>$(document).ready(function(){ submitToDiv (document.discounts, 'tableframe'); });</script>
</html>
