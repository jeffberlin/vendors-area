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
    <style media="screen" type="text/css">
      td[option] {
        text-align: center;
      }
    </style>
    <script>
      function submitForm (action, target, nextpage, tierid) {
        var form = document.tiers;
        form.ACTION.value = action;
        form.NEXT_PAGE.value = nextpage;
        form.TIERID.value = tierid;
        if (target == "_parent") {
					form.target = target;
					form.ERROR_PAGE.value = "https://vendors-new.bmtmicro.com/error.jsp";
					form.submit ();
				} else {
					submitToDiv (form, target);
				}
      }

      <c:if test="${ !allowChanges }">
        function addTier() {
          alert("You do not have permission to add tiers.");
        }
        function deleteTier(tierid) {
          alert("You do not have permission to delete tiers.");
        }
      </c:if>

      <c:if test="${ allowChanges }">
        function addTier() {
          submitForm (0, "_parent", "https://vendors-new.bmtmicro.com/products-manage-pricing-tiers-add.jsp");
        }
        function deleteTier(tierid) {
          submitForm (2, "resultframe", "https://vendors-new.bmtmicro.com/products-manage-pricing-tiers-delete.jsp", tierid);
        }
      </c:if>

      function showInactiveChanged () {
        setCookieValue ("BMTMicro.Vendors.Tiers.ShowInactive", queryField (document.tiers, "SHOWINACTIVE"), 1000);
        submitForm (-1, "tableframe", "https://vendors-new.bmtmicro.com/products-manage-pricing-tiers-table.jsp");
      }

      function editTier (tierid) {
        submitForm (1, "_parent", "https://vendors-new.bmtmicro.com/products-manage-pricing-tiers-edit.jsp", tierid);
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
							<h4>Manage&nbsp;Pricing&nbsp;Tiers</h4>
							<p>Edit existing pricing tiers by clicking on the tier name.</p>
							<div class="content-box d-flex flex-column">
								<div name="tableframe" class="overflow-auto h-100" id="tableframe">
									<c:catch var="errormsg">
										<c:import url="https://vendors-new.bmtmicro.com/servlets/Vendors.TieredPricing">
											<c:param name="SESSIONID" value="${sessionid}" />
											<c:param name="NEXT_PAGE" value="https://vendors-new.bmtmicro.com/products-manage-pricing-tiers-table.jsp"/>
											<c:param name="ERROR_PAGE" value="https://vendors-new.bmtmicro.com/error-div.jsp"/>
											<c:param name="ACTION" value="-1" />
											<c:param name="SHOWINACTIVE" value="${cookie['BMTMicro.Vendors.Tiers.ShowInactive'].value}" />
										</c:import>
									</c:catch>
									<%@ include file="/includes/catch.jsp" %>
								</div> <!-- end #tableframe -->
								<div name="resultframe" id="resultframe"></div>
							</div> <!-- end .content-box -->
						</div> <!-- end .col-lg-10 page-title -->
					</div> <!-- end first .row justify-content-start -->
				</article>
			</div> <!-- end .container-fluid -->
			<jsp:include page="/includes/footer.jsp" />
		</div> <!-- end .main-raised -->
		<%@ include file="/includes/bootstrap_bottom_scripts.html" %>
	</body>
	<script>
		if (window.history.replaceState) {
			window.history.replaceState (null, null, "https://vendors-new.bmtmicro.com/products-manage-pricing-tiers.jsp");
		}
    $('input[type=checkbox]').change(function(){
      $(this).prev('input[type=hidden]').val (this.checked ? -1 : 0);
    });
	</script>
</html>
