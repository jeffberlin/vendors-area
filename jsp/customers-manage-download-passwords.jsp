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
    <link rel="stylesheet" href="https://vendors-new.bmtmicro.com/css/addPages.css"/>
    <script src="https://secure.bmtmicro.com/Templates/util.js"></script>
    <script src="https://vendors-new.bmtmicro.com/js/vendors.js"></script>
    <script>
      function getStatus (form) {
        if (isBlank (form.PASSWORD.value)) {
          alert ("You must provide a valid search criteria!");
          form.PASSWORD.focus ();
          return (false);
        }
        form.ACTION.value = "0";
        form.NEXT_PAGE.value = "https://vendors-new.bmtmicro.com/customers-manage-download-passwords-status.jsp";
        // form.submit ();
        submitToDiv(form, 'resultframe');
        // return (true);
      }

      <c:if test="${!allowResend}">
        function sendPassword (form) {
          alert ("You do not have permission to resend information.");
          return (false);
        }
      </c:if>
      <c:if test="${allowResend}">
        function sendPassword (form) {
          if (!isValidEmail (form.EMAIL.value)) {
            alert ("You must provide a valid email address!");
            form.EMAIL.focus ();
            return (false);
          }
          form.ACTION.value = "-1";
          form.NEXT_PAGE.value = "https://vendors-new.bmtmicro.com/customers-manage-download-passwords-sent.jsp";
          // form.submit ();
          // return (true);
          submitToDiv(form, 'resultframe');
        }
      </c:if>

      function initForm (form) {
        if (form.PRODUCTID.options.length === 0) {
          disableButton ('status');
          disableButton ('password');
        } else {
          form.PRODUCTID.selectedIndex = 0;
        }
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
            <div class="col-lg-10 col-md-12 page-title">
              <h4>Manage&nbsp;Passwords</h4>
              <p>Select a product from the list below to check the status of order generated passwords or generate new password to any email.</p>
              <div class="content-box overflow-auto d-flex flex-column" style="padding: 0;">
                <div name="tableframe" class="overflow-auto h-100" id="tableframe" style="padding: 1rem;">
                  <c:catch var="errormsg">
                    <c:import url="https://vendors-new.bmtmicro.com/servlets/Vendors.DownloadPassword">
                      <c:param name="SESSIONID" value="${sessionid}" />
                      <c:param name="NEXT_PAGE" value="https://vendors-new.bmtmicro.com/customers-manage-download-passwords-table.jsp" />
                      <c:param name="ERROR_PAGE" value="https://vendors-new.bmtmicro.com/error-div.jsp" />
                      <c:param name="ACTION" value="" />
                    </c:import>
                  </c:catch>
                  <%@ include file="/includes/catch.jsp" %>
                </div> <!-- end #tableframe -->
                <div name="resultframe" id="resultframe"></div> <!-- end #resultframe -->
              </div> <!-- end .content-box -->
            </div> <!-- end .col-lg-12 -->
          </div> <!-- end first .row -->
        </article>
      </div> <!-- end .container-fluid -->
      <jsp:include page="/includes/footer.jsp" />
    </div> <!-- end .main-raised -->
    <%@ include file="/includes/bootstrap_bottom_scripts.html" %>
  </body>
</html>
