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
    <link rel="stylesheet" href="https://vendors-new.bmtmicro.com/css/addTransfer.css"/>
    <script src="https://kit.fontawesome.com/35c40e6698.js" crossorigin="anonymous"></script>
		<script src="https://secure.bmtmicro.com/Templates/util.js"></script>
		<script src="https://vendors-new.bmtmicro.com/js/vendors.js"></script>
    <style media="screen" type="text/css">
      td[mtext] {
        text-align: left;
      }
      td[option] {
        text-align: center;
      }
      em {
        font-size: .8rem;
      }
      h6 {
        letter-spacing: .5px;
        font-size: 1.15rem;
        color: #195a7c;
      }
      #PRODUCTLIST, #SELECTEDLIST {
        margin-bottom: 1rem;
      }
    </style>
    <script>
      function submitForm (action, target, nextpage, schemeid) {
        var form = document.splits;
        form.ACTION.value = action;
        form.NEXT_PAGE.value = nextpage;
        form.ERROR_PAGE.value = "https://vendors-new.bmtmicro.com/error.jsp";
        form.SCHEMEID.value = schemeid;
        submitToDiv(form, "resultframe");
      }

      function addSplit () {
        <c:choose>
          <c:when test = "${ !allowChanges }">
            alert ("You do not have permission to add vendor splits.");
          </c:when>
          <c:when test = "${ payDay == 1 }">
            alert ("Splits cannot be added on a pay day. Please try again tomorrow.");
          </c:when>
          <c:otherwise>
            submitForm (0, "resultframe", "https://vendors-new.bmtmicro.com/products-manage-splits-add.jsp");
          </c:otherwise>
        </c:choose>
      }

      function editSplit (schemeid) {
        submitForm (1, "resultframe", "https://vendors-new.bmtmicro.com/products-manage-splits-edit.jsp", schemeid);
      }

      function deleteSplit (schemeid) {
        <c:choose>
          <c:when test = "${ !allowChanges }">
            alert ("You do not have permission to delete vendor splits.");
          </c:when>
          <c:when test = "${ payDay == 1 }">
            alert ("Splits cannot be deleted on a pay day. Please try again tomorrow.");
          </c:when>
          <c:otherwise>
            submitForm (2, "resultframe", "https://vendors-new.bmtmicro.com/products-manage-splits-delete.jsp", schemeid);
          </c:otherwise>
        </c:choose>
      }

      function viewSplit (schemeid) {
        submitForm (3, "resultframe", "https://vendors-new.bmtmicro.com/products-manage-splits-view.jsp", schemeid);
      }

      // from splits-add
      function submitSplit (form) {
        // Important: We need to use hidden fields to submit checkbox values, as the servlets will use default values if the
        // field is not present. (An unchecked checkbox constitutes a non-existent field).
        form.NAME.value = trim (form.NAME.value);
        if (isBlank (form.NAME.value)) {
          alert ("You must name the vendor split scheme!");
          form.NAME.focus ();
          return (false);
        }
        if ((form.NAME.value != "${requestScope.NAME}") && ("${requestScope.NAMELIST}".split ("\t").indexOf (form.NAME.value) != -1)) {
          alert ("A vendor split scheme with that name already exists!");
          form.NAME.focus ();
          return (false);
        }
        if ((isBlank (form.PERCENTAGE.value)) && (isBlank (form.AMOUNT.value))) {
          alert ("You must specify a percentage or a fixed amount!");
          form.PERCENTAGE.focus ();
          return (false);
        }
        if ((form.PERCENTAGE.value < 0) || (form.PERCENTAGE.value > 100)) {
          alert ("Value out of range. (Must not be negative)");
          form.PERCENTAGE.focus ();
          return (false);
        }
        if (isBlank (form.SPLITVENDORID.value)) {
          alert ("You must specify a vendor ID");
          form.SPLITVENDORID.focus ();
          return (false);
        }
        if (form.SPLITVENDORID.value < 1) {
          alert ("You must specify a valid vendor ID");
          form.SPLITVENDORID.focus ();
          return (false);
        }
        form.SELECTEDPRODUCTS.value = getCommaSeparatedSelectorValues (form.SELECTEDLIST);
        form.submit ();
        return (true);
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
              <h4>Manage&nbsp;Splits</h4>
              <p>Splits changed in the middle of the month will be applied to complete months sales.&nbsp;Splits cannot be changed on vendor paydays.</p>
							<div class="content-box d-flex flex-column">
								<div name="tableframe" class="overflow-auto h-100" id="tableframe">
									<c:catch var="errormsg">
										<c:import url="https://vendors-new.bmtmicro.com/servlets/Vendors.SplitSchemes">
											<c:param name="SESSIONID" value="${sessionid}" />
											<c:param name="NEXT_PAGE" value="https://vendors-new.bmtmicro.com/products-manage-splits-table.jsp" />
											<c:param name="ERROR_PAGE" value="https://vendors-new.bmtmicro.com/error-div.jsp" />
											<c:param name="ACTION" value="-1" />
										</c:import>
									</c:catch>
									<%@ include file="/includes/catch.jsp" %>
								</div> <!-- end #tableframe -->
								<div name="resultframe" id="resultframe" class="overflow-auto"></div>
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
			window.history.replaceState (null, null, "https://vendors-new.bmtmicro.com/products-manage-splits.jsp");
		}
    $('input[type=checkbox]').change(function(){
      $(this).prev('input[type=hidden]').val (this.checked ? -1 : 0);
    });
	</script>
</html>
