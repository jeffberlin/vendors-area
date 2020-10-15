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
    <title>BMT Micro Developers Center</title>
    <%@ include file="../includes/bootstrap_top_script.html" %>
    <%@ include file="../includes/style_menu_footer_css.html" %>
    <link rel="stylesheet" href="https://vendors-new.bmtmicro.com/css/menuSidebar.css"/>
    <script src="https://secure.bmtmicro.com/Templates/util.js"></script>
    <script src="https://secure.bmtmicro.com/servlets/System.Util"></script>
    <script src="https://secure.bmtmicro.com/servlets/CustomForms.CustomForm"></script>
    <style media="screen" type="text/css">
      label {
        color: #707070;
      }
    </style>
    <script>
      function process(form) {
        form.LOGINNAME.value = trim (form.LOGINNAME.value);
        if (isBlank (form.LOGINNAME.value)) {
          alert ("You must input a Login Name");
          form.LOGINNAME.focus ();
          return (false);
        }
        if (form.LOGINNAME.value.length < 4) {
          alert ("The login name must be at least 4 characters.");
          form.LOGINNAME.focus ();
          return (false);
        }
        if (isBlank (form.EMAIL.value)) {
          alert("You must input an Email Address");
          form.EMAIL.focus();
          return false;
        }
        if (!isValidEmail (form.EMAIL.value)) {
          alert("You must input a valid Email Address");
          form.EMAIL.focus();
          return false;
        }
        if (isBlank (form.PASSWORD.value)) {
          alert ("You must input a Password used to access the BMT Micro Vendor Pages");
          form.PASSWORD.focus();
          return (false);
        }
        if (form.PASSWORD.value.length < 4) {
          alert ("The password must be at least 4 characters.");
          form.PASSWORD.focus();
          return (false);
        }
        if (form.PASSWORD2.value != form.PASSWORD.value) {
          alert ("Your Password does not match the second Password field. Please retype your password and try again.");
          form.PASSWORD.focus();
          return (false);
        }
        form.submit();
        return (true);
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
            <div class="col-lg-2">
              <aside class="sidebar" role="complementary">
                <img src='<c:url value="https://vendors-new.bmtmicro.com/images/bmt-micro-logo-new-min.png"></c:url>' alt="BMT Micro, Inc. logo" height="60" style="margin-bottom: 20px;" />
                <div>
                  <a class="sidebar-group" href="https://vendors-new.bmtmicro.com/login_lostpasswordstart.html">Lost your password?</a>
                </div>
                <div>
                  <a class="sidebar-group" href="https://www.bmtmicro.com/">More about our services</a>
                </div>
              </aside> <!-- end .sidebar -->
            </div> <!-- end .col-lg-2 -->
            <div class="col-lg-10 col-md-12 page-title">
              <form name="form1" method="post" action="https://vendors-new.bmtmicro.com/servlets/Vendors.Signup">
                <input type="hidden" name="ACTION" value="1">
                <input type="hidden" name="NEXT_PAGE" value="https://vendors-new.bmtmicro.com/NewSignup/new-vendor-submission-form.jsp" />
                <input type="hidden" name="ERROR_PAGE" value="https://vendors-new.bmtmicro.com/NewSignup/new-vendor-error.jsp" />
                <h4>Vendor Signup Form</h4>
                <p>This form is for<strong> new vendors only</strong>. If you are an existing vendor, please add any new products under your vendor account login. If you do not know how to log in, please <a href="mailto:vendors@bmtmicro.com">contact us.</a></p>
                <p>Please note that due to the increase in fraudulent products being submitted, BMT Micro is forced to delay the first royalty payment for one month. You will receive both your first and second month&#39;s payment after the end of the second month.</p>
                <p><strong>Must be at least 18 years old!</strong> By submitting this form, you are indicating that you are at least 18 years of age.</p>
                <p>Here is a copy of our basic <a href="GenericVendorAgreement.pdf" target="_blank">Vendor Agreement</a>. If your bank requires this, please sign and fax to: (910) 792-1889.</p>
                <span>
                  <label>Login Name:&nbsp;</label>
                  <input type="text" name="LOGINNAME" style="margin-bottom: 1rem;" />
                </span>
                <br>
                <span>
                  <label>Email Address:&nbsp;</label>
                  <input type="text" name="EMAIL" style="margin-bottom: 1rem;" />
                </span>
                <br>
                <span>
                  <label>Password:&nbsp;</label>
                  <input type="password" name="PASSWORD" autocomplete="off" style="margin-bottom: 1rem;" />
                </span>
                <br>
                <span>
                  <label>Confirm Password:&nbsp;</label>
                  <input type="password" name="PASSWORD2" autocomplete="off" style="margin-bottom: 2rem;" />
                </span>
                <br>
                <button type="button" name="button" class="save-btn" onclick="process(form)">Continue</button>
              </form>
            </div> <!-- end .col-lg-10 col-md-12 page-title  -->
          </div> <!-- end .row justify-content-start -->
        </article> <!-- end .section -->
      </div> <!-- end .container-fluid .body-content -->
      <jsp:include page="../includes/footer.jsp" />
    </div> <!-- end .main-raised -->
    <%@ include file="../includes/bootstrap_bottom_scripts.html" %>
  </body>
</html>
