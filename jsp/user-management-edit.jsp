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
    <link rel="stylesheet" href="https://vendors-new.bmtmicro.com/css/addTransfer.css"/>
    <script language="javascript" type="text/javascript" src="https://secure.bmtmicro.com/Templates/util.js"></script>
    <script language="javascript" type="text/javascript" src="https://secure.bmtmicro.com/Templates/upsellutil.js"></script>
    <script language="javascript" type="text/javascript" src="https://vendors-new.bmtmicro.com/js/vendors.js"></script>
    <style media="screen" type="text/css">
      .content-box {
        padding: 1rem;
        min-height: 394.59px !important;
      }
    </style>
    <script language="javascript" type="text/javascript">
      function initForm (form){
        setFieldVisible ("explanation1", (${param.FAILEDLOGINS} != 0));
        for (var i = 0; i < 32; i++) {
          var checkbox = form["FEATURE_CHK(" + i + ")"];
          if (checkbox != null) {
            checkbox.disabled = (form.FEATUREFLAGS.value == -1);     // make sure main user does not disable any feature
            checkbox.checked = ((form.FEATUREFLAGS.value & (1 << i)) != 0);
          }
        }
      }

      function submitForm (form) {
        form.LOGINNAME.value = trim (form.LOGINNAME.value);
        if (isBlank (form.LOGINNAME.value)) {
          alert ("You must include a Login Name!");
          form.LOGINNAME.focus ();
          return (false);
        }
        if ((form.LOGINNAME.value != "${param.LOGINNAME}") && ("${param.LOGINNAMELIST}".split ("\t").indexOf (form.LOGINNAME.value) != -1)) {
          alert ("This login name already exists!");
          form.NAME.focus ();
          return (false);
        }
        if (form.LOGINNAME.value.length < 4) {
          alert ("The Login Name must be at least 4 characters.");
          form.LOGINNAME.focus ();
          return (false);
        }
        if (isBlank (form.NAME.value)) {
          alert ("You must include a real name associated with this login!");
          form.NAME.focus ();
          return (false);
        }
        if (isBlank (form.PASSWORD.value)) {
          alert ("You must input a Password used to access the BMT Micro Affiliate Pages");
          form.PASSWORD.focus ();
          return (false);
        }
        if (form.PASSWORD.value.length < 4) {
          alert ("The password must be at least 4 characters.");
          form.PASSWORD.focus ();
          return (false);
        }
        if (form.PASSWORDAGAIN.value != form.PASSWORD.value) {
          alert ("Your Password does not match the second Password field. Please retype your password and try again.");
          form.PASSWORD.focus ();
          return (false);
        }
        if (isBlank (form.EMAIL.value)) {
          alert ("You must input an Email Address");
          form.EMAIL.focus ();
          return (false);
        }
        if (!isValidEmail (form.EMAIL.value)) {
          alert ("You must input a valid Email Address");
          form.EMAIL.focus ();
          return (false);
        }
        for (i = 0; i < 32; i++) {
          var checkbox = form["FEATURE_CHK(" + i + ")"];
          if (checkbox != null) {
            if (checkbox.checked) {
              form.FEATUREFLAGS.value |= (1 << i);
            } else {
              form.FEATUREFLAGS.value &= ~(1 << i);
            }
          }
        }
        form.submit ();
        return (true);
      }
    </script>
  </head>
  <body onload="initForm (document.users);">
    <!-- Blue background header -->
    <div class="blue-bg"></div>

    <!-- Start of body content -->
    <div class="main-raised">
      <div class="container-fluid body-content">
        <article class="section">
          <div class="row justify-content-start">
            <jsp:include page="includes/menuSidebar.jsp" />
            <div class="col-lg-10 col-md-12 page-title">
              <h4>Edit&nbsp;User</h4>
              <div class="content-box" id="contentBox">
                <form method="post" name="users" action="https://vendors-new.bmtmicro.com/servlets/Vendors.Users" target="_parent">
                  <input type="hidden" name="NEXT_PAGE" value="https://vendors-new.bmtmicro.com/user-management.jsp" />
                  <input type="hidden" name="ROWTEMPLATEURL" value="https://vendors-new.bmtmicro.com/user-management-ablerow.html" />
                  <input type="hidden" name="ERROR_PAGE" value="https://vendors-new.bmtmicro.com/error.jsp" />
                  <input type="hidden" name="FEATUREFLAGS" value="${param.FEATUREFLAGS}" />
                  <input type="hidden" name="ACTION" value="11" />
                  <input type="hidden" name="USERID" value="${param.USERID}" />
                  <h5>User&nbsp;Info&nbsp;-&nbsp;${param.NAME}</h5>
                  <span>
                    <label>Name:&nbsp;</label>
                    <input id="NAME" name="NAME" value="${param.NAME}" style="margin-bottom: 1rem;" size="35" />
                  </span>
                  <br>
                  <span>
                    <label>Email:&nbsp;</label>
                    <input id="EMAIL" name="EMAIL" value="${param.EMAIL}" style="margin-bottom: 1rem;" size="35" />
                  </span>
                  <br>
                  <span>
                    <label>Login&nbsp;Name:&nbsp;</label>
                    <input id="LOGINNAME" name="LOGINNAME" maxlength="20" value="${param.LOGINNAME}" style="margin-bottom: 1rem;" size="35" />
                  </span>
                  <br clear="all">
                  <span>
                    <label>Password:&nbsp;</label>
                    <input id="PASSWORD" name="PASSWORD" type="password" value="${param.PASSWORD}" maxlength="16" autocomplete="off" style="margin-bottom: 1rem;" size="35" />
                  </span>
                  <br>
                  <span>
                    <label>Re-type&nbsp;Password:&nbsp;</label>
                    <input id="PASSWORDAGAIN" name="PASSWORDAGAIN" type="password" value="${param.PASSWORD}" autocomplete="off" style="margin-bottom: 1rem;" size="35" />
                  </span>
                  <br clear="all">
                  <span>
                    <input type="checkbox" name="FEATURE_CHK(0)" disabled />&nbsp;Allow Test Orders
                  </span>
                  &nbsp;&nbsp;&nbsp;&nbsp;
                  <span>
                    <input type="checkbox" name="FEATURE_CHK(1)" disabled />&nbsp;Allow Changes
                  </span>
                  &nbsp;&nbsp;&nbsp;&nbsp;
                  <span>
                    <input type="checkbox" name="FEATURE_CHK(2)" disabled style="margin-bottom: 1.5rem;" />&nbsp;Allow Resend
                  </span>
                  <br clear="all">
                  <span id="explanation1" style="color:red;display:none;">
                    This user has failed logins.&nbsp;&nbsp;&nbsp;&nbsp;
                    <input type="checkbox" name="FAILEDLOGINS" value="0">
                    Check here to reset.
                  </span>
                  <br clear="all">
                  <span>
                    <button type="button" class="save-btn" onclick="submitForm (users);" style="margin-right: .5rem;">Save Changes</button>
                    <button type="button" class="save-btn" onclick="window.location = 'https://vendors-new.bmtmicro.com/user-management.jsp';">Cancel</button>
                  </span>
                </form>
              </div> <!-- end .content-box -->
            </div> <!-- end .col-lg-10 col-md-12 page-title -->
          </div> <!-- end .row justify-content-start -->
        </article>
      </div> <!-- end .container-fluid -->
      <%@ include file="/includes/footer.html" %>
    </div> <!-- end .main-raised -->
    <%@ include file="/includes/bootstrap_bottom_scripts.html" %>
  </body>
</html>
