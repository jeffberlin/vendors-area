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
    <script src="https://vendors-new.bmtmicro.com/js/tablesort.js"></script>
    <script src="https://vendors-new.bmtmicro.com/js/vendors.js"></script>
    <script src="https://secure.bmtmicro.com/Templates/util.js"></script>
    <style media="screen" type="text/css">
      td[option], td[text], td[date] {
        text-align: center;
      }
    </style>
		<script>
      function submitForm (action, target, nextpage, affiliateid) {
        var form = document.affiliates;
        form.ACTION.value = action;
        form.target = target;
        form.NEXT_PAGE.value = nextpage;
        form.AFFILIATEID.value = affiliateid;
        if (target == "_parent") {
					form.target = target;
					form.ERROR_PAGE.value = "https://vendors-new.bmtmicro.com/error.jsp";
					form.submit ();
				} else {
					submitToDiv (form, target);
				}
      }
			<c:if test = "${ !allowChanges }">
				function addAffiliate () {
					alert ("You do not have permission to upload files.");
				}
				function editAffiliate (affiliateid) {
					alert ("You do not have permission to download files.");
				}
				function removeAffiliate (affiliateid) {
					alert ("You do not have permission to delete files.");
				}
        function submitEdit(form) {
          alert("You do not have permission to make changes.");
        }
			</c:if>
			<c:if test = "${ allowChanges }">
				function addAffiliate (affiliateid) {
					if (isBlank (affiliateid) || isNaN (affiliateid) || (parseInt (affiliateid) < 1)) {
            alert ("Please specify an Affiliate ID!");
            document.affiliates.AFFILIATEID_ADD.focus ();
            // return false;
            window.top.location.reload();
          } else {
            submitForm (10, "_parent", "https://vendors-new.bmtmicro.com/affiliates-manage.jsp", affiliateid);
          }
				}
				function removeAffiliate (affiliateid) {
					submitForm (12, "_parent", "https://vendors-new.bmtmicro.com/affiliates-manage.jsp", affiliateid);
				}
				function editAffiliate (affiliateid) {
					submitForm (1, "resultframe", "https://vendors-new.bmtmicro.com/affiliates-manage-edit.jsp", affiliateid);
				}
        function submitEdit(form) {
          submitToDiv(form, 'resultframe');
        }
			</c:if>
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
            <jsp:include page="includes/menuSidebar.jsp" />
            <div class="col-lg-10 col-md-12 page-title">
              <h4>Manage&nbsp;Affiliates</h4>
              <p>Highlighted affiliates have joined within the last month.</p>
              <div class="content-box overflow-auto d-flex flex-column">
                <div name="tableframe" class="overflow-auto h-100" id="tableframe">
                  <form name="affiliates" action="https://vendors-new.bmtmicro.com/servlets/Vendors.Affiliates" method="post">
                    <input type="hidden" name="ACTION" value="-1" />
                    <input type="hidden" name="MAXAMOUNT" value="" />
                    <input type="hidden" name="NEXT_PAGE" value="https://vendors-new.bmtmicro.com/affiliates-manage-table.jsp">
                    <input type="hidden" name="ERROR_PAGE" value="https://vendors.bmtmicro.com/error-div.jsp">
                  </form>
                </div> <!-- end #tableframe -->
                <div name="resultframe" id="resultframe"></div>
              </div> <!-- end .content-box -->
            </div> <!-- end .col-lg-10 col-md-12 page-title -->
          </div> <!-- end .row justify-content-start -->
        </article>
      </div> <!-- end .container-fluid -->
      <jsp:include page="includes/footer.jsp" />
    </div> <!-- end .main-raised -->
    <%@ include file="/includes/bootstrap_bottom_scripts.html" %>
  </body>
  <script>
    $(document).ready(function(){ submitToDiv (document.affiliates, 'tableframe'); });
  </script>
</html>
