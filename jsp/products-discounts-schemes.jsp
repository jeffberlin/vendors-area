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
		<link rel="stylesheet" href="https://vendors-new.bmtmicro.com/css/addTransfer.css"/>
		<script language="javascript" type="text/javascript" src="https://secure.bmtmicro.com/Templates/util.js"></script>
		<script language="javascript" type="text/javascript" src="https://vendors-new.bmtmicro.com/js/vendors.js"></script>
		<style media="screen" type="text/css">
			td[option], td[mnumber] {
				text-align: center;
				}
		</style>
		<script language="javascript" type="text/javascript">
			function submitForm (action, target, nextpage, schemeid, schemetype) {
				var form = document.discounts;
				form.ACTION.value     = action;
				form.NEXT_PAGE.value  = nextpage;
				form.SCHEMEID.value   = schemeid;
				form.SCHEMETYPE.value = schemetype;
				if (target == "_parent") {
					form.target = target;
					form.ERROR_PAGE.value = "https://vendors-new.bmtmicro.com/error.jsp";
					form.submit ();
				} else {
					submitToDiv (form, target);
				}
			}
			<c:if test = "${ allowChanges == 0 }">
				function addDiscount (form) {
					alert ("You do not have permission to add new schemes.");
				}
				function editDiscount (schemeid, schemetype) {
					alert ("You do not have permission to edit schemes.");
				}
				function deleteDiscount (schemeid, schemetype) {
					alert ("You do not have permission to delete schemes.");
				}
				function generateCodes (schemeid, schemetype) {
					alert ("You do not have permission to generate codes.");
				}
			</c:if>
			<c:if test = "${ allowChanges == 1 }">
				function addDiscount (form) {
					submitForm (0, "_parent", "https://vendors-new.bmtmicro.com/products-discounts-schemes-add.jsp");
				}
				function editDiscount (schemeid, schemetype) {
					submitForm (1, "_parent", "https://vendors-new.bmtmicro.com/products-discounts-schemes-edit.jsp", schemeid, schemetype);
				}
				function deleteDiscount (schemeid, schemetype) {
					submitForm (2, "resultframe", "https://vendors-new.bmtmicro.com/products-discounts-schemes-delete.jsp", schemeid, schemetype);
				}
				function generateCodes (schemeid, schemetype) {
					submitForm (3, "resultframe", "https://vendors-new.bmtmicro.com/products-discounts-schemes-generatecodes.jsp", schemeid, schemetype);
				}
			</c:if>
			function viewCodes (schemeid, schemetype) {
				submitForm (4, "resultframe", "https://vendors-new.bmtmicro.com/products-discounts-schemes-viewcodes.jsp", schemeid, schemetype);
			}
			function showInactiveChanged () {
				setCookieValue ("BMTMicro.Vendors.Discounts.ShowInactive", queryField (document.discounts, "SHOWINACTIVE"), 1000);
				submitForm (-1, "tableframe", "https://vendors-new.bmtmicro.com/products-discounts-schemes-table.jsp");
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
							<h4>Manage&nbsp;Discount&nbsp;Schemes</h4>
							<p>Click on Discount Scheme Name to edit discount schemes.</p>
							<div class="content-box d-flex flex-column">
								<div name="tableframe" class="overflow-auto h-100" id="tableframe">
									<jsp:include page="products-discounts-schemes-table.jsp" />
								</div>
								<div name="resultframe" id="resultframe"></div>
							</div> <!-- end .content-box -->
						</div> <!-- end .col-lg-10 page-title -->
					</div> <!-- end first .row justify-content-start -->
				</article>
			</div> <!-- end .container-fluid -->
			<jsp:include page="includes/footer.jsp" />
		</div> <!-- end .main-raised -->
		<%@ include file="/includes/bootstrap_bottom_scripts.html" %>
	</body>
	<script>$(document).ready(function(){ submitToDiv (document.discounts, 'tableframe'); });</script>
</html>
