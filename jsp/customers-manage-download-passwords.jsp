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
    <script src="https://vendors.bmtmicro.com/js/vendors.js"></script>
    <script>
      function getStatus (form) {
        if (isBlank (form.PASSWORD.value)) {
          alert ("You must provide a valid search criteria!");
          form.PASSWORD.focus ();
          return (false);
        }
        form.ACTION.value = "0";
        form.NEXT_PAGE.value = "https://vendors-new.bmtmicro.com/customers-manage-download-passwords-status.jsp";
        form.submit ();
        return (true);
      }

      function sendPassword (form) {
        if (!allowResend ("You do not have permission to resend information.")) {
          return (false);
        }
        if (!isValidEmail (form.EMAIL.value)) {
          alert ("You must provide a valid email address!");
          form.EMAIL.focus ();
          return (false);
        }
        form.ACTION.value = "-1";
        form.NEXT_PAGE.value = "https://vendors-new.bmtmicro.com/downloadpasswords_sent.html";
        form.submit ();
        return (true);
      }

      function initForm (form) {
        if (form.PRODUCTID.options.length === 0) {
          disableButton ('status');
          disableButton ('password');
        } else {
          form.PRODUCTID.selectedIndex = 0;
        }
      }

      // status page
      function submitForm (form, action) {
        form.ACTION.value = action;
        submitToDiv(form, 'resultframe');
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
              <h4>Manage&nbsp;Passwords</h4>
              <p>Select a product from the list below to check the status of order generated passwords or generate new password to any email.</p>
              <div class="content-box overflow-auto d-flex flex-column">
                <form name="downloadpasswords" method="post" action="https://vendors-new.bmtmicro.com/servlets/Vendors.DownloadPassword">
                  <input type="hidden" name="ACTION" />
                  <input type="hidden" name="NEXT_PAGE" value="https://vendors-new.bmtmicro.com/customers-manage-download-passwords-status.jsp" />
                  <input type="hidden" name="ERROR_PAGE" value="https://vendors-new.bmtmicro.com/error-div.jsp" />
                  <span>
                    <label>Product&nbsp;List:</label>
                    <br>
                    <select name="PRODUCTID" size=10 style="width:60%; margin-bottom: 1rem;">
                      ${param.PRODUCTLIST}
                    </select>
                  </span>
                  <h5>Get&nbsp;Password&nbsp;Status</h5>
                  <p>Check password status of any order generated password.</p>
                  <span>
                    <label>Look up status using:&nbsp;</label>
                    <select name="FIELD_SEL" style="margin-bottom: 1rem;">
                      <option value="0">Password:</option>
                      <option value="1">Order ID:</option>
                      <option value="2">Order Number:</option>
                    </select>
                  </span>
                  <input type="text" name="PASSWORD" value=""  style="margin-bottom: 1rem;" placeholder="Search"/>
                  <div class="controlbuttons">
                    <button id="status" type="button" class="grey-btn" value="Save" onclick="getStatus (downloadpasswords);" style="margin-bottom: 1rem;">Get Status</button>
                  </div>
                  <h5>Send&nbsp;New&nbsp;Password</h5>
                  <p>Generate a new password to any email address.</p>
                  <span>
                    <label>Customer&nbsp;Email:&nbsp;</label>
                    <input type="text" name="EMAIL" value="" style="margin-bottom: 1rem;"/>
                  </span>
                  <br clear="all">
                  <span>
                    <input type="checkbox" name="CCEMAIL" value="${param.CCEMAIL}" style="margin-bottom: 1rem;"/>&nbsp;Send copy to:&nbsp;<strong>${param.CCEMAIL}</strong>
                  </span>
                  <div class="controlbuttons">
                    <button id="password" type="button" class="grey-btn" value="Save" onclick="sendPassword (downloadpasswords);">Send Password</button>
                  </div>
                </form>
                <div name="tableframe" class="overflow-auto h-100" id="tableframe"></div> <!-- end #tableframe -->
                <div name="resultframe" id="resultframe"></div> <!-- end #resultframe -->
              </div> <!-- end .content-box -->
            </div> <!-- end .col-lg-12 -->
          </div> <!-- end first .row -->
        </article>
      </div> <!-- end .container-fluid -->
      <jsp:include page="includes/footer.jsp" />
    </div> <!-- end .main-raised -->
    <%@ include file="/includes/bootstrap_bottom_scripts.html" %>
  </body>
  <script>$(document).ready(function(){ submitToDiv (document.downloadpasswords, 'tableframe'); });</script>
</html>
