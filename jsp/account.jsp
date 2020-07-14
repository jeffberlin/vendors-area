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
    <link rel="stylesheet" href="https://vendors-new.bmtmicro.com/css/tabOptions.css"/>
    <script language="javascript" type="text/javascript" src="https://secure.bmtmicro.com/Templates/util.js"></script>
    <script language="javascript" type="text/javascript" src="https://vendors-new.bmtmicro.com/js/vendors.js"></script>
    <style media="screen" type="text/css">
      xmp {
        margin-top: 0;
        margin-bottom: 1rem;
      }
      .content-box {
        min-height: 476.38px !important;
      }
    </style>
    <script language="javascript" type="text/javascript">
      function checkPayOutMinAmt (field, method) {
        if (field != null) {
          if ((field.value < 0) || (field.value > 99999.99)) {
            alert ("The value must be in the range 0 - 99999.99.");
            field.focus ();
            return (false);
          }
          if ((field.value < 300.00) && (method == 5)) {
            alert ("Wire transfer payments require at least a 300.00 balance before payment can be initiated.");
            field.focus ();
            return (false);
          }
        }
        return (true);
      }

      <c:choose>
        <c:when test = "${ allowChanges == 0 }">
          function submitForm (form) {
            alert ("You do not have permission to make changes.");
            return (false);
          }
        </c:when>
        <c:when test = "${param.PAYDAY != 0}">
          function submitForm (form) {
            alert ("Changes cannot be made on a vendor pay day. Please try again tomorrow.");
            return (false);
          }
        </c:when>
        <c:otherwise>
          function submitForm (form) {
            if (!(checkPayOutMinAmt (form.PAYOUTMINAMT, ${param.PAYOUTMETHOD}) &&
            checkPayOutMinAmt (form.PAYOUTMINAMT_USD, ${param.PAYOUTMETHOD_USD}) &&
            checkPayOutMinAmt (form.PAYOUTMINAMT_EUR, ${param.PAYOUTMETHOD_EUR}) &&
            checkPayOutMinAmt (form.PAYOUTMINAMT_GBP, ${param.PAYOUTMETHOD_GBP}))) {
              return (false);
            }
            if ((form.EMAIL.value.indexOf (",") != -1) || (form.EMAIL.value.indexOf (" ") != -1)) {
              alert("The e-mail address must not contain a space or a comma (only one address is allowed here)!");
              form.EMAIL.focus ();
              return (false);
            }
            if (!isValidEmail (form.EMAIL.value)) {
              alert ("You must provide a VALID e-mail address!");
              form.EMAIL.focus ();
              return (false);
            }
            if ((form.EMAIL2.value.indexOf (",") != -1) || (form.EMAIL2.value.indexOf (" ") != -1)) {
              alert("The e-mail address must not contain a space or a comma (only one address is allowed here)!");
              form.EMAIL2.focus ();
              return (false);
            }
            if (!isBlank (form.EMAIL2.value) && !isValidEmail (form.EMAIL2.value)) {
              alert ("You must provide a VALID e-mail address!");
              form.EMAIL2.focus ();
              return (false);
            }
            if ((form.SUPPORTEMAIL.value.indexOf (",") != -1) || (form.SUPPORTEMAIL.value.indexOf (" ") != -1)) {
              alert("The e-mail address must not contain a space or a comma (only one address is allowed here)!");
              form.SUPPORTEMAIL.focus ();
              return (false);
            }
            if (!isBlank (form.SUPPORTEMAIL.value) && !isValidEmail (form.SUPPORTEMAIL.value)) {
              alert ("You must provide a VALID e-mail address!");
              form.SUPPORTEMAIL.focus ();
              return (false);
            }
            if (!isBlank(form.SUPPORTURL.value) && !isValidURL (form.SUPPORTURL.value)) {
              alert('Please enter a full URL starting with "http://" or "https://"');
              form.SUPPORTURL.focus();
              return (false);
            }
            if (form.NOTIFICATIONEMAILS.value.indexOf (",") != -1) {
              alert("Notification e-mail addresses should be separated with a space, not a comma!");
              form.NOTIFICATIONEMAILS.focus ();
              return (false);
            }
            if (!isBlank (form.NOTIFICATIONEMAILS.value) && !isValidEmailList (form.NOTIFICATIONEMAILS.value)) {
              alert ("You must provide a VALID e-mail address!");
              form.NOTIFICATIONEMAILS.focus ();
              return (false);
            }
            if (!isValidURL (form.WEB.value)) {
              alert('Please enter a full URL starting with "http://" or "https://"');
              form.WEB.focus ();
              return (false);
            }
            submitToAlert (form, 'The settings have been saved');
            return (true);
          }
        </c:otherwise>
      </c:choose>
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
            <%@ include file="/includes/menuSidebar.html" %>
            <div id="account-page" class="col-lg-10 col-md-12 page-title" id="account-page">
              <form name="account" action="https://vendors-new.bmtmicro.com/servlets/Vendors.Account" method="post">
                <input type="hidden" name = "ACTION" value = "1"/>
                <input type="hidden" name = "NEXT_PAGE" value = "https://vendors-new.bmtmicro.com/account-page.jsp"/>
                <input type="hidden" name = "ERROR_PAGE" value = "https://vendors-new.bmtmicro.com/error-div.jsp"/>
              </form>
            </div> <!-- end .col-lg-10 col-md-12 page-title -->
          </div> <!-- end .row justify-content-start -->
        </article>
      </div> <!-- end .container-fluid -->
      <%@ include file="/includes/footer.html" %>
    </div> <!-- end .main-raised -->
    <%@ include file="/includes/bootstrap_bottom_scripts.html" %>
  <body>
  <script>$(document).ready(function(){ submitToDiv (document.account, 'account-page'); });</script>
</html>
