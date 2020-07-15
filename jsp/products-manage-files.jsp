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
    <style media="screen" type="text/css">
			td[option], td[mnumber] {
				text-align: center;
				}
    </style>
    <script language="javascript" type="text/javascript">
			function submitForm (action, target, nextpage, downloadfileid) {
				var form = document.files;
				form.ACTION.value = action;
				form.NEXT_PAGE.value = nextpage;
				form.DOWNLOADFILEID.value = downloadfileid;
				if (target == "") {
					form.submit ();
				} else {
					submitToDiv (form, target);
				}
			}
			<c:if test = "${ allowChanges == 0 }">
				function uploadFile () {
					alert ("You do not have permission to upload files.");
				}
				function downloadFile (downloadfileid) {
					alert ("You do not have permission to download files.");
				}
				function deleteFile (downloadfileid) {
					alert ("You do not have permission to delete files.");
				}
			</c:if>
			<c:if test = "${ allowChanges == 1 }">
				function uploadFile () {
					document.location.href = "https://vendors-new.bmtmicro.com/products-manage-files-upload.jsp";
				}
				function downloadFile (downloadfileid) {
					submitForm (1, "", "https://vendors-new.bmtmicro.com/products-manage-files-table.jsp", downloadfileid);
				}
				function deleteFile (downloadfileid) {
					submitForm (2, "resultframe", "https://vendors-new.bmtmicro.com/products-manage-files-delete.jsp", downloadfileid);
				}
			</c:if>
			function showDemoURL (downloadfileid) {
				submitForm (4, "resultframe", "https://vendors-new.bmtmicro.com/products-manage-files-viewdemourl.jsp", downloadfileid);
			}
			function viewFile (downloadfileid) {
				submitForm (3, "resultframe", "https://vendors-new.bmtmicro.com/products-manage-files-viewproducts.jsp", downloadfileid);
			}
			function toggleDemo (downloadfileid) {
				submitForm (14, "tableframe", "https://vendors-new.bmtmicro.com/products-manage-files-table.jsp", downloadfileid);
			}
			function filterChanged () {
				submitForm (-1, "tableframe", "https://vendors-new.bmtmicro.com/products-manage-files-table.jsp");
			}
			function selectPage (p) {
				document.files.PAGE.value = p;
				submitForm (-1, "tableframe", "https://vendors-new.bmtmicro.com/products-manage-files-table.jsp");
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
            <jsp:include page="includes/menuSidebar.jsp" />
            <div class="col-lg-10 col-md-12 page-title">
              <h4>Manage&nbsp;Files</h4>
              <p>The View Associations button only displays products and files associated for secure download file fulfillment.</p>
              <div class="content-box d-flex flex-column">
                <div name="tableframe" class="overflow-auto h-100" id="tableframe">
									<jsp:include page="./products-manage-files-table.jsp" />
								</div>
                <div name="resultframe" id="resultframe"></div>
              </div>
            </div>
          </div> <!-- end first .row justify-content-start -->
        </article>
      </div> <!-- end .container-fluid -->
      <%@ include file="/includes/footer.html" %>
    </div> <!-- end .main-raised -->
    <%@ include file="/includes/bootstrap_bottom_scripts.html" %>
  </body>
  <script>
		$(document).ready(function(){ submitToDiv (document.files, 'tableframe'); });
  </script>
</html>
