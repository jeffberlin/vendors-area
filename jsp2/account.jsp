<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" href="https://vendors-new.bmtmicro.com/css/style.css"/>
    <link rel="stylesheet" href="https://vendors-new.bmtmicro.com/css/responsive.css"/>
    <link rel="stylesheet" href="https://vendors-new.bmtmicro.com/css/addPages.css"/>
    <link rel="stylesheet" href="https://vendors-new.bmtmicro.com/css/tabOptions.css"/>
    <script language="javascript" type="text/javascript" src="https://secure.bmtmicro.com/Templates/util.js"></script>
    <script language="javascript" type="text/javascript" src="https://vendors-new.bmtmicro.com/js/vendors.js"></script>
    <script type="text/javascript" src="https://vendors-new.bmtmicro.com/js/main.js"></script>
    <style media="screen" type="text/css">
      xmp {
        margin-top: 0;
        margin-bottom: 1rem;
      }
    </style>
    <script language="javascript" type="text/javascript">
      <!--
      function getPayOutMethod (method) {
        switch (method) {
          case 1:  // check
            return ("USD Check");
          case 2: // ACH
            return ("ACH Direct Deposit");
          case 3: // PayPal
            return ("PayPal to ##PAYOUTEMAIL##");
          case 4: // Wire Transfer - Deutsche Bank
            return ("Wire Transfer - Deutsche Bank");
          case 5: // Wire Transfer - JP Morgan
            return ("Wire Transfer - JP Morgan");
          case 6: // Wire Transfer - Bank of Wilmington
            return ("Wire Transfer - First Federal");
          case 7: // PayPal eCheck
            return ("PayPal eCheck");
          case 8: // Other
            return ("Other - Special payment arrangement");
          case 9: // Payoneer
            return ("Payoneer pre-paid Mastercard");
          case 10:
            return ("Wire Transfer - Suntrust");
          case 11:
            return ("EUR Wire Transfer - Commerzbank");
          case 12: // PayPal EUR
            return ("PayPal (EUR)");
          case 13: // PayPal GBP
            return ("PayPal (GBP)");
          case 0:
            return ("No payment due yet.");
        }
        return ("Unknown");
      }

      function isPayPal (method) {
        switch (method) {
          case 3: // PayPal
          case 7: // PayPal eCheck
          case 12: // PayPal EUR
          case 13: // PayPal GBP
            return (true);
        }
        return (false);
      }

      function getPayOutMethodInfo () {
        if (##MULTICURRENCY## == 0) {
          return (getPayOutMethod (##PAYOUTMETHOD##));
        }
        return (
          "USD: " + getPayOutMethod (##PAYOUTMETHOD_USD##) + "<br>" +
          "EUR: " + getPayOutMethod (##PAYOUTMETHOD_EUR##) + "<br>" +
          "GBP: " + getPayOutMethod (##PAYOUTMETHOD_GBP##)
        );
      }

      function initForm (form) {
        // Important: We need to use hidden fields to submit checkbox values, as the servlets will use default values if the
        // field is not present. (An unchecked checkbox constitutes a non-existent field).
        initField (form, "PAYOUTFREQUENCY", "##PAYOUTFREQUENCY##");
        initField (form, "PAYOUTFREQUENCY_USD", "##PAYOUTFREQUENCY_USD##");
        initField (form, "PAYOUTFREQUENCY_EUR", "##PAYOUTFREQUENCY_EUR##");
        initField (form, "PAYOUTFREQUENCY_GBP", "##PAYOUTFREQUENCY_GBP##");
        document.getElementById ("payoutmethod").innerHTML = getPayOutMethodInfo ();
      }

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
          if ((field.value < 100.00) && !isPayPal (method)) {
            if (!confirm ("Payments under 100.00 will incur a 2.95 transaction fee.  Please consider using PayPal or setting a higher minimum payment.")){
              field.focus ();
              return (false);
            }
          }
        }
        return (true);
      }

      function submitForm (form) {
        // Important: We need to use hidden fields to submit checkbox values, as the servlets will use default values if the
        // field is not present. (An unchecked checkbox constitutes a non-existent field).
        if (##PAYDAY## == -1) {
          alert ("Changes cannot be made on a vendor pay day. Please try again tomorrow.");
          return (false);
        }
        if (!allowChanges ("You do not have permission to make changes.")) {
          return (false);
        }
        if (!(checkPayOutMinAmt (form.PAYOUTMINAMT, ##PAYOUTMETHOD##) &&
        checkPayOutMinAmt (form.PAYOUTMINAMT_USD, ##PAYOUTMETHOD_USD##) &&
        checkPayOutMinAmt (form.PAYOUTMINAMT_EUR, ##PAYOUTMETHOD_EUR##) &&
        checkPayOutMinAmt (form.PAYOUTMINAMT_GBP, ##PAYOUTMETHOD_GBP##))) {
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
        form.submit ();
        return (true);
      }
      //-->
    </script>
  </head>
  <body onload="initForm (document.account);">
    <div style="visibility:hidden;">
      <form name="logout" method="post" action="https://vendors-new.bmtmicro.com/servlets/Vendors.Logout">
        <input type="hidden" name="NEXT_PAGE" value="https://vendors-new.bmtmicro.com/login.html">
        <input type="hidden" name="ERROR_PAGE" value="https://vendors-new.bmtmicro.com/error.jsp">
      </form>
      <form name="payoneer" method="post" action="https://vendors-new.bmtmicro.com/servlets/Vendors.Payoneer">
        <input type="hidden" name="NEXT_PAGE" value="https://vendors-new.bmtmicro.com/main.html">
        <input type="hidden" name="ERROR_PAGE" value="https://vendors-new.bmtmicro.com/error.jsp">
      </form>
    </div>

    <!-- Blue background header -->
    <div class="blue-bg"></div>

    <!-- Start of body content -->
    <div class="main-raised">
      <div class="container-fluid body-content">
        <article class="section">
          <div class="row justify-content-start">
            <c:import url = "https://vendors-new.bmtmicro.com/jsp/menuSidebar.jsp" />
            <div class="col-lg-10 col-md-12 page-title">
              <h4>Account</h4>
              <ul class="nav nav-tabs" id="myTab" role="tablist">
                <li class="nav-item">
                  <a class="nav-link active" id="account-tab" data-toggle="tab" href="#accountTab" role="tab" aria-controls="account information" aria-selected="true">
                    Account Information
                  </a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" id="payment-tab" data-toggle="tab" href="#paymentTab" role="tab" aria-controls="payment method" aria-selected="true">
                    Payment Method
                  </a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" id="public-tab" data-toggle="tab" href="#publicTab" role="tab" aria-controls="public information" aria-selected="true">
                    Public Information
                  </a>
                </li>
              </ul>
              <div class="content-box">
                <form name="account" method="post" action="https://vendors-new.bmtmicro.com/servlets/Vendors.Account">
                  <input type="hidden" name="ACTION" value="11" />
                  <input type="hidden" name="NEXT_PAGE" value="https://vendors-new.bmtmicro.com/account.jsp" />
                  <input type="hidden" name="ERROR_PAGE" value="https://vendors-new.bmtmicro.com/error.jsp" />
                  <div class="tab-content" id="myTabContent">
                    <div class="tab-pane fade show active" id="accountTab" role="tabpanel" aria-labelledby="account-tab">
                      <h5>Account&nbsp;Information</h5>
                      <p>Information provided will be displayed to BMTMicro only.</p>
                      <div class="row shrinkText">
                        <div class="col-4" style="padding-right: 0; font-size: .9rem;">
                          <span>
                            <input type="hidden" name="VENDORID" value="${param.VENDORID}" />
                            <p style="margin-bottom: .2rem;">My vendor ID: ${param.VENDORID}</p>
                            <p style="margin-bottom: .2rem;"><strong>${param.COMPANY}</strong></p>
                            <p style="margin-bottom: .2rem;">${param.NAME}</p>
                            <p style="margin-bottom: .2rem;">${param.ADDRESS1}</p>
                            <p style="margin-bottom: .2rem;">${param.ADDRESS2}</p>
                            <p style="margin-bottom: .2rem;">${param.CITY}, ${param.STATE}&nbsp;${param.ZIP}</p>
                            <p>${param.COUNTRYNAME}</p>
                            <p><a href="mailto:vendors@bmtmicro.com">Email changes to BMT Micro</a></p>
                          </span>
                        </div>
                        <div class="col-4" style="padding: 0;">
                          <span>
                            <label>Primary&nbsp;Email:&nbsp;</label>
                            <input id="EMAIL" name="EMAIL" value="${param.EMAIL}" maxlength="50" size="30" style="margin-bottom: 1rem;" />
                          </span>
                          <br clear="all">
                          <span>
                            <label>Secondary&nbsp;Email:&nbsp;</label>
                            <input id="EMAIL2" name="EMAIL2" value="${param.EMAIL2}" maxlength="50" size="30" style="margin-bottom: 1rem;" />
                          </span>
                          <br clear="all">
                          <span>
                            <label>Order&nbsp;Notification&nbsp;Email:&nbsp;</label>
                            <input id="NOTIFICATIONEMAILS" name="NOTIFICATIONEMAILS" value="${param.NOTIFICATIONEMAILS}" maxlength="200" size="30" style="margin-bottom: 1rem;" />
                          </span>
                          <br clear="all">
                          <span>
                            <label>File&nbsp;sharing&nbsp;password:&nbsp;</label>
                            <input id="FILESHAREPASSWORD" name="FILESHAREPASSWORD" value="${param.FILESHAREPASSWORD}" maxlength="16" size="30" style="margin-bottom: 1rem;" />
                          </span>
                          <div class="controlbuttons">
                            <button type="button" class="grey-btn" onclick="submitForm (form);">Save</button>
                            <button type="reset" value="Reset" class="grey-btn">Reset</button>
                          </div>
                        </div>
                      </div> <!-- end .row -->
                    </div> <!-- end .tab-pane -->
                    <div class="tab-pane fade" id="paymentTab" role="tabpanel" aria-labelledby="payment-tab">
                      <h5>Payment&nbsp;Method</h5>
                      <p>Chose the payment threshold and frequency you wish to use.</p>
                      <% if ("-1".equals (request.getParameter ("MULTICURRENCY"))) { %>
                        <span>
                          <label>Minimum threshold:</label>
                          <input id="PAYOUTMINAMT" name="PAYOUTMINAMT_USD" value="${param.PAYOUTMINAMT_USD}" maxlength="10" onKeyPress="return (numbersonly (this, event, true))" />&nbsp;USD
                        </span>
                        <span>
                          <label>Frequency:</label>
                          <select type="text" name="PAYOUTFREQUENCY_USD" value="${param.PAYOUTFREQUENCY_USD}" onmousewheel="return false;" />
                          <%= ("0".equals (request.getParameter ("PAYOUTFREQUENCY_USD")) ? "<option value='0'>Twice a month</option>" : "") %>
                            <option value="1">Monthly</option>
                            <option value="2">Every 2 Months</option>
                            <option value="3">Quarterly</option>
                            <option value="4">Triannually</option>
                            <option value="6">Biannually</option>
                            <option value="12">Yearly</option>
                          </select>
                        </span>
                        <br clear="all">
                        <span>
                          <input id="PAYOUTMINAMT" name="PAYOUTMINAMT_EUR" value="${param.PAYOUTMINAMT_EUR}" maxlength="10" onKeyPress="return (numbersonly (this, event, true))" />&nbsp;EUR
                        </span>
                        <span>
                          <select type="text" name="PAYOUTFREQUENCY_EUR" value="${param.PAYOUTFREQUENCY_EUR}" onmousewheel="return false;" />
                          <%= ("0".equals (request.getParameter ("PAYOUTFREQUENCY_EUR")) ? "<option value='0'>Twice a month</option>" : "") %>
                            <option value="1">Monthly</option>
                            <option value="2">Every 2 Months</option>
                            <option value="3">Quarterly</option>
                            <option value="4">Triannually</option>
                            <option value="6">Biannually</option>
                            <option value="12">Yearly</option>
                          </select>
                        </span>
                        <br clear="all">
                        <span>
                          <input id="PAYOUTMINAMT" name="PAYOUTMINAMT_GBP" value="${param.PAYOUTMINAMT_GBP}" maxlength="10" onKeyPress="return (numbersonly (this, event, true))" />&nbsp;GBP
                        </span>
                        <span>
                          <select type="text" name="PAYOUTFREQUENCY_GBP" value="${parm.PAYOUTFREQUENCY_GBP}" onmousewheel="return false;" />
                          <%= ("0".equals (request.getParameter ("PAYOUTFREQUENCY_GBP")) ? "<option value='0'>Twice a month</option>" : "") %>
                            <option value="1">Monthly</option>
                            <option value="2">Every 2 Months</option>
                            <option value="3">Quarterly</option>
                            <option value="4">Triannually</option>
                            <option value="6">Biannually</option>
                            <option value="12">Yearly</option>
                          </select>
                        </span>
                      <% } else { %>
                        <span>
                          <label>Minimum threshold:</label>
                          <input id="PAYOUTMINAMT" name="PAYOUTMINAMT" value="${param.PAYOUTMINAMT}" maxlength="10" onKeyPress="return (numbersonly (this, event, true))" />&nbsp;<%= request.getParameter ("CURRENCY") %>
                        </span>
                        <span>
                          <label>Frequency:</label>
                          <select type="text" name="PAYOUTFREQUENCY" value="${param.PAYOUTFREQUENCY}" onmousewheel="return false;" />
                          <%= ("0".equals (request.getParameter ("PAYOUTFREQUENCY")) ? "<option value='0'>Twice a month</option>" : "") %>
                            <option value="1">Monthly</option>
                            <option value="2">Every 2 Months</option>
                            <option value="3">Quarterly</option>
                            <option value="4">Triannually</option>
                            <option value="6">Biannually</option>
                            <option value="12">Yearly</option>
                          </select>
                        </span>
                      <% } %>
                      <br clear="all">
                      <div class="controlbuttons" style="margin-bottom: 1rem;">
                        <button type="button" class="grey-btn" onclick="submitForm (form);">Save</button>
                        <button type="reset" value="Reset" class="grey-btn">Reset</button>
                      </div>
                      <span>
                        <p class="shrinkText" style="margin-bottom: .3rem;">You will be paid in via:
                          <%
                          if ("-1".equals (request.getParameter ("MULTICURRENCY")) ) {
                            out.print ("multiple currencies");
                          } else {
                            out.print (request.getParameter ("CURRENCY"));
                          }
                          %>
                        </p>
                        <div id="payoutmethod" class="shrinkText" style="padding-left: 15px; margin-bottom: 1rem;">&nbsp;</div>
                      </span>
                      <span class="shrinkText">
                        <p style="margin-bottom: .3rem;">Charges appear on customers credit card as:</p>
                        <XMP style="padding-left: 15px;">${param.FULLBILLINGDESCRIPTOR}</XMP>
                      </span>
                    </div> <!-- end .tab-pane -->
                    <div class="tab-pane fade" id="publicTab" role="tabpanel" aria-labelledby="public-tab">
                      <h5>Public&nbsp;Information</h5>
                      <p>Information provided will be displayed to customers.</p>
                      <span>
                        <label>Support&nbsp;Email:&nbsp;</label>
                        <input id="SUPPORTEMAIL" name="SUPPORTEMAIL" value="${param.SUPPORTEMAIL}" maxlength="50" size="30" style="margin-bottom: 1rem;" />
                      </span>
                      <br>
                      <span>
                        <label>Support&nbsp;URL:&nbsp;</label>
                        <input id="SUPPORTURL" name="SUPPORTURL" value="${param.SUPPORTURL}" maxlength="100" size="50" style="margin-bottom: 1rem;" />
                      </span>
                      <br>
                      <span>
                        <label>Website:&nbsp;</label>
                        <input id="WEB" name="WEB" value="${param.WEB}" maxlength="60" size="50" style="margin-bottom: 1rem;" />
                      </span>
                      <br>
                      <span>
                        <label>Phone:&nbsp;</label>
                        <input id="PHONE" name="PHONE" value="${param.PHONE}" maxlength="50" size="15" style="margin-bottom: 1rem;" />
                      </span>
                      <br>
                      <span>
                        <label>Fax:&nbsp;</label>
                        <input id="FAX" name="FAX" value="${param.FAX}" maxlength="50" size="15" style="margin-bottom: 1rem;" />
                      </span>
                      <div class="controlbuttons" style="margin-bottom: .5rem;">
                        <button type="button" class="grey-btn" onclick="submitForm (form);">Save</button>
                        <button type="reset" value="Reset" class="grey-btn">Reset</button>
                      </div>
                      <p class="shrinkText"<em>For security reasons the payment information cannot be changed on-line. Please send any updates regarding company name, contact name, payment address, payment frequency, payment currency and charge description to <a href="mailto:vendors@bmtmicro.com">vendors@bmtmicro.com</a>.</em></p>
                      <p class="shrinkText"><em>Order related settings can be managed under the Settings link in the dropdown menu associated with your name on the left.</em></p>
                    </div> <!-- end .tab-pane -->
                  </div> <!-- end .tab-content -->
                </div> <!-- end .content-box -->
              </form>
            </ul> <!-- end .col-lg-10 col-md-12 page-title -->
          </div> <!-- end .row justify-content-start -->
        </article>
      </div> <!-- end .container-fluid -->
      <c:import url = "https://vendors-new.bmtmicro.com/jsp/footer.jsp" />
    </div> <!-- end .main-raised -->

    <script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    <script type="text/javascript">
      /* Anything that gets to the document will hide the dropdown */
      $(window).click(function(){
        $(".dropright").removeClass('show');
      });
    </script>
  </body>
</html>
