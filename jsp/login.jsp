<!-- Login page for Vendor's area -->
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta http-equiv="Pragma" content="no-cache">
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>BMT Micro Developers Center</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" href="https://vendors-new.bmtmicro.com/css/style.css" type="text/css">
    <link rel="stylesheet" href="https://vendors-new.bmtmicro.com/css/login.css" type="text/css">
    <link rel="stylesheet" href="https://vendors-new.bmtmicro.com/css/responsive.css" type="text/css">
    <style media="screen" type="text/css">
      label {
        text-align: left;
      }
    </style>
  </head>
  <body>
    <div class="container-fluid" style="height: calc(100vh - 350px);">
      <div class="main"></div>
      <div class="content-area">
        <div class="row text-center justify-content-center" style="margin-bottom: 20px;">
          <div class="col-lg-10">
            <img src="https://vendors-new.bmtmicro.com/images/bmt-micro-logo-new-min.png" alt="BMT Micro, Inc. logo" height="70" style="margin-bottom: 20px;">
            <h5 style="color: #ffffff; letter-spacing: .5px; text-shadow: 1px 1px 3px rgba(0,0,0,0.7);">Developer's Control Panel</h5>
          </div>
        </div>
        <div class="row justify-content-center">
          <div class="box-style">
            <div class="vendor-login-box" style="background-color: rgba(255,255,255,0.3);">
              <form action="https://vendors-new.bmtmicro.com/servlets/Vendors.Login" method="post">
                <h4 class="text-center">Vendor Log In</h4>
                <div class="username">
                  <label>Login:</label>
                  <input id="LOGINNAME" name="LOGINNAME" value="" maxlength="50" autocomplete="off" class="vendor-input">
                </div>
                <div class="password">
                  <label>Password:</label>
                  <input id="PASSWORD" name="PASSWORD" value="" type="password" maxlength="50" autocomplete="off" class="vendor-input">
                </div>
                <div class="forgot-password">
                  <a href="https://vendors-new.bmtmicro.com/login_lostpasswordstart.html">Forgot Password?</a>
                </div>
                <div class="login-btn text-center" style="margin-bottom: 10px;">
                  <input type="hidden" name="NEXT_PAGE" value="https://vendors-new.bmtmicro.com/main.jsp">
                  <input type="hidden" name="ERROR_PAGE" value="https://vendors-new.bmtmicro.com/login_error.jsp">
                  <input type="hidden" name="BADLOGIN_PAGE" value="https://vendors-new.bmtmicro.com/login_bad.html">
                  <input type="hidden" name="LOCKOUT_PAGE" value="https://vendors-new.bmtmicro.com/login_lockout.html">
                  <input type="hidden" name="EXPIRED_PAGE" value="https://vendors-new.bmtmicro.com/login_expired.html">
                  <input type="hidden" name="SIGNUP_PAGE" value="https://vendors-new.bmtmicro.com/login_signupstart.html">
                  <button type="submit" value="Login" autocomplete="off">Login</button>
                </div>
                <div class="signup text-center">
                  <a href="https://vendors-new.bmtmicro.com/NewSignup/new_developer-signup.html">Sign Up</a>
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

    <script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
  </body>
</html>
