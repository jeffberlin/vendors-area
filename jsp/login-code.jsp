<%@ page pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<!-- Login page for Vendor's area -->
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
    <link rel="stylesheet" href="https://vendors-new.bmtmicro.com/css/style.css"/>
    <link rel="stylesheet" href="https://vendors-new.bmtmicro.com/css/login.css"/>
    <link rel="stylesheet" href="https://vendors-new.bmtmicro.com/css/responsive.css"/>
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
              <form action="https://vendors-new.bmtmicro.com/servlets/Vendors.Login" method="post">
                <h4 class="text-center">Vendor Log In</h4>
                <p>
                  Check your e-mail for a single use login code.
                  <br>
                  Please enter it below.
                </p>
                <div class="username">
                  <label>Login Code:</label>
                  <input id="LOGINCODE" name="LOGINCODE" value="" maxlength="15" autocomplete="off" class="vendor-input" style="margin-bottom: 1rem;" />
                  <span>
                    <label>This device is trusted:</label>
                    <input type="checkbox" name="TRUSTEDDEVICE" value="-1" style="margin-bottom: .2rem;" />
                  </span>
                  <p style="font-size: .8rem;">If this computer, tablet, phone, is trusted and password protected from public use, you may check the checkbox above to avoid repeatedly having to enter a new code.</p>
                </div>
                <div class="login-btn text-center" style="margin-bottom: 0;">
                  <input type="hidden" name="NEXT_PAGE" value="https://vendors-new.bmtmicro.com/main.jsp" />
                  <input type="hidden" name="ERROR_PAGE" value="https://vendors-new.bmtmicro.com/login-error.jsp" />
                  <input type="hidden" name="LOGINCODE_PAGE" value="https://vendors-new.bmtmicro.com/login-code.jsp" />
                  <input type="hidden" name="BADLOGIN_PAGE" value="https://vendors-new.bmtmicro.com/login-bad.jsp" />
                  <input type="hidden" name="LOCKOUT_PAGE" value="https://vendors-new.bmtmicro.com/login-lockout.jsp" />
                  <input type="hidden" name="EXPIRED_PAGE" value="https://vendors-new.bmtmicro.com/login-expired.jsp" />
                  <input type="hidden" name="SIGNUP_PAGE" VALUE="https://vendors-new.bmtmicro.com/new-developer-signup.jsp" />
                  <button type="submit" value="Login" autocomplete="off">Login</button>
                </div>
              </form>
            </div>
          </div>
        </div>
      </div>
      <footer class="footer container-fluid">
        <div class="bottom-footer-content row text-center align-items-center">
          <div class="copyright col">
            <p>BMT Micro, Inc. Copyright &copy; 1992 - <script type="text/JavaScript"> document.write(new Date().getFullYear()); </script></p>
          </div>
        </div>
      </footer>
    </div>
    <%@ include file="/includes/bootstrap_bottom_scripts.html" %>
  </body>
</html>
