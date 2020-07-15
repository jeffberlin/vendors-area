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
        text-align: center;
      }
    </style>
		<script language="javascript" type="text/javascript">
			function consolidateByChanged (form) {
				setCookieValue ("BMTMicro.Vendors.Statistics.ConsolidateBy", queryField (form, "CONSOLIDATEBY"), 1000);
			}

			function directionChanged (form) {
				setCookieValue ("BMTMicro.Vendors.Statistics.Direction", queryField (form, "DIRECTION"), 1000);
			}

			function refreshReport (form) {
				if (CheckDateRange (form)) {
					if (form.CONSOLIDATEBY.value == 0) {
						submitToDiv (form, 'tableframe');
					}
					if (form.DIRECTION.value == 1) {
						submitToDiv (form, 'tableframe');
					}
					submitToDiv (form, 'tableframe');
				}
			}

			function filterKeyPress(event) {
        if (event.keyCode == 13) {
          refreshReport (document.statistics);
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
              <h4>View Statistics</h4>
              <p>Select field to display occurrences.</p>
							<div class="content-box overflow-auto d-flex flex-column">
                <form name="statistics" action="https://vendors-new.bmtmicro.com/servlets/Vendors.Statistics" method="post">
                  <!-- <input type="hidden" name="CONSOLIDATEBY" value="0" /> -->
                  <!-- <input type="hidden" name="DIRECTION" value="1" /> -->
									<div class="table-header">
								    <span>From:&nbsp;<input id="DATEFROM" name="DATEFROM" value="${fromDate}" onkeypress="filterKeyPress(event)" />
								      <img src='<c:url value="/images/cal.gif"></c:url>' width="22" height="22" border="0" alt="Click Here to Pick the date" onclick="show_calendar ('DATEFROM'); return (false);" onmouseover="this.style.cursor='pointer';" />
								    </span>
								    <span>To:&nbsp;
								      <input id="DATETO" name="DATETO" value="${toDate}" style="margin-bottom: 1rem;" onkeypress="filterKeyPress(event)" />
								      <img src='<c:url value="/images/cal.gif"></c:url>' width="22" height="22" border="0" alt="Click Here to Pick the date" onclick="show_calendar ('DATETO'); return (false);"  onmouseover="this.style.cursor='pointer';" />
								    </span>
								    <br>
								    <span>Consolidate By:&nbsp;
								      <select name="CONSOLIDATEBY"<c:if test="${cookie['BMTMicro.Vendors.SalesDetails.ConsolidateBy'].value==1}"> selected</c:if> onchange="consolidateByChanged (statistics);">
								        <option value="0">Product Name</option>
								        <option value="1">Product ID</option>
								        <option value="2">Payment Date</option>
								        <option value="3">Number of Items Ordered</option>
								        <option value="4">Price of Item Ordered</option>
								        <option value="5">Payment Method</option>
								        <option value="6">Country</option>
								        <option value="7">Comments</option>
								        <option value="8">Howheard</option>
								        <option value="9">Vendor specific info 1</option>
								        <option value="10">Vendor specific info 2</option>
								        <option value="11">Vendor specific info 3</option>
								      </select>
								    </span>
								    <span>
								      <select name="DIRECTION"<c:if test="${cookie['BMTMicro.Vendors.SalesDetails.Direction'].value==0}"> selected</c:if> onchange="directionChanged (statistics);">
								        <option value="0">Ascending order</option>
								        <option value="1">Descending order</option>
								      </select>
								    </span>
								    <span>
											<input type="hidden" name="ROWTEMPLATEURL" value="https://vendors-new.bmtmicro.com/sales-view-statistics-tablerow.html" />
								      <input type="hidden" name="NEXT_PAGE" value="https://vendors-new.bmtmicro.com/sales-view-statistics-table.jsp" />
								      <input type="hidden" name="ERROR_PAGE" value="https://vendors-new.bmtmicro.com/error-div.jsp" />
								      <button type="button" class="grey-btn" value="Get Sales Summary" onclick="refreshReport (document.statistics);">Get Statistics</button>
								    </span>
								  </div> <!-- end .table-header -->
                </form>
                <div name="tableframe" class="h-100" id="tableframe"></div>
							</div> <!-- end .content-box -->
						</div> <!-- end .col-lg-10 page-title -->
					</div> <!-- end first .row justify-content-start -->
				</article>
			</div> <!-- end .container-fluid -->
			<%@ include file="/includes/footer.html" %>
		</div> <!-- end .main-raised -->
		<%@ include file="/includes/bootstrap_bottom_scripts.html" %>
	</body>
	<script>$(document).ready(function(){ submitToDiv (document.statistics, 'tableframe'); });</script>
</html>
