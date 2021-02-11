<%@ page pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ include file="/includes/core.jsp" %>
<!DOCTYPE html>
<html>
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
    <link rel="stylesheet" href="https://vendors-new.bmtmicro.com/css/style.css"/>
    <link rel="stylesheet" href="https://vendors-new.bmtmicro.com/css/login.css"/>
    <link rel="stylesheet" href="https://vendors-new.bmtmicro.com/css/responsive.css"/>
    <script>
      function submitForm (form) {
        if (form.PASSWORD.value.length < 4) {
          alert ("The password must be at least 4 characters.");
          form.PASSWORD.focus ();
          return (false);
        }
        if (form.PASSWORD.value.length > 16) {
          alert ("The password must not be more than 16 characters.");
          form.PASSWORD.focus ();
          return (false);
        }
        if (form.PASSWORDAGAIN.value != form.PASSWORD.value) {
          alert ("Your Password does not match the second Password field. Please retype your password and try again.");
          form.PASSWORD.focus ();
          return (false);
        }
        form.submit ();
        return (true);
      }
    </script>
  </head>
  <body>
    <div class="container-fluid" style="height: calc(100vh - 350px);">
      <div class="main"></div>
      <div class="content-area">
        <div class="row text-center justify-content-center" style="margin-bottom: 20px;">
          <div class="col-lg-10">
            <img src='<c:url value="https://vendors-new.bmtmicro.com/images/bmt-micro-logo-new-min.png"></c:url>' alt="BMT Micro, Inc. logo" height="70" style="margin-bottom: 20px;">
            <h5 style="color: #ffffff; letter-spacing: .5px; text-shadow: 1px 1px 3px rgba(0,0,0,0.7);">Developer's Control Panel</h5>
          </div>
        </div>
        <div class="row justify-content-center">
          <div class="box-style">
            <div class="vendor-login-box" style="background-color: rgba(255,255,255,0.3);">
              <form name="resetform" action="https://vendors-new.bmtmicro.com/servlets/Vendors.ResetPassword" method="post">
                <h4 class="text-center">Reset Password</h4>
                <div class="username">
                  <label>New Password:</label>
                  <input id="PASSWORD" name="PASSWORD" type="password" value="" maxlength="50" class="vendor-input" style="margin-bottom: 1rem;" />
                  <span>
                    <label>Re-type Password:</label>
                    <input id="PASSWORDAGAIN" name="PASSWORDAGAIN" type="password" value="" maxlength="50" class="vendor-input" />
                  </span>
                </div>
                <div class="login-btn text-center">
                  <input type="hidden" name="NEXT_PAGE" value="https://vendors-new.bmtmicro.com/login-reset-password-success.jsp">
                  <input type="hidden" name="ERROR_PAGE" value="https://vendors-new.bmtmicro.com/error.jsp">
                  <input type="hidden" name="PWRID" value="${requestScope.PWRID}">
                  <button type="button" name="SET" value="Set Password" onclick="submitForm (resetform);">Set Password</button>
                </div>
              </form>
            </div>
          </div>
        </div>
      </div>
      <footer class="footer container-fluid">
        <div class="bottom-footer-content row text-center align-items-center">
          <div class="copyright col">
            <p>BMT Micro, Inc. Copyright &copy; 1992 - {$yearNow}</p>
          </div>
        </div>
      </footer>
    </div>
    <%@ include file="/includes/bootstrap_bottom_scripts.html" %>
  </body>
</html>
