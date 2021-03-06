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
    <script src="https://vendors-new.bmtmicro.com/js/vendors.js"></script>
    <script src="https://vendors-new.bmtmicro.com/js/vhelp.js"></script>
    <script src="https://vendors-new.bmtmicro.com/js/tablesort.js"></script>
    <script src="https://secure.bmtmicro.com/Templates/util.js"></script>
    <script>
	    function doAction(action, target) {
	    	var form = document.orderlistform;
	      form.ACTION.value = action;
	      form.target = target;
        if (target == "_parent") {
          form.ERROR_PAGE.value = "https://vendors-new.bmtmicro.com/error.jsp";
          form.submit ();
        } else {
          form.target = "";
          submitToDiv (form, target);
        }
	    }
	    function showDetails(ctrl) {
	      var row = GetIndexOfElement (ctrl);
	      window.open("", "detailsPopUp","location=no,menubar=1,width=680,height=550,resizable=yes").focus();
	      document.bmtconfig.ORDERID.value = GetIndexedField (document.orderlistform.ORDERID,row).value;
	      document.bmtconfig.submit();
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
            <div id="account-page" class="col-lg-10 col-md-12 page-title">
            	<h4>${requestScope.TITLE}</h4>
              <div class="content-box overflow-auto d-flex flex-column">
                <div name="tableframe" class="overflow-auto h-100" id="tableframe">
                  <c:catch var="errormsg">
                    <c:import url="https://vendors-new.bmtmicro.com/servlets/Vendors.ImportRipOrders">
	                    <c:param name="SESSIONID" value="${sessionid}" />
		                  <c:param name="STARFILE" value="https://vendors-new.bmtmicro.com/images/star.gif" />
		                  <c:param name="BLANKFILE" value="https://vendors-new.bmtmicro.com/images/blank.gif" />
		                  <c:param name="ACTION" value="1" />
											<c:param name="ACTION2" value="13" />
		                  <c:param name="NEXT_PAGE" value="https://vendors-new.bmtmicro.com/rip-import-table.jsp" />
		                  <c:param name="DONE_PAGE" value="https://vendors-new.bmtmicro.com/rip-import-no-more-orders.jsp" />
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