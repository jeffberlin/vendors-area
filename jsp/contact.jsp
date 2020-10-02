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
    <script src="https://vendors-new.bmtmicro.com/js/vhelp.js"></script>
    <style media="screen" type="text/css">
      h6 {
        font-size: 1.15rem;
        color: #195a7c;
        letter-spacing: .5px;
      }

      .toggle-section {
        margin-bottom: 1rem;
      }
    </style>
    <script>
      function titleSelectorChanged (form) {
        var aastSubtitles = [
          [
            "Request Custom Order Forms","Payment Question","Order Form Problems","VAT","XML Question","Key Generators","Feature Suggestion"
          ],
          [
            "Sales Summary","Detailed Summary","EU Sales Summary","Sales Detail","View Statistics","Pending Sales","Customer Comments","Customer Search"
          ],
          [
            "Program Information","Terms & Conditions","Affiliate Sales","Affiliate Information","Add/Remove Affiliate","Email All Affiliates"
          ],
          [
            "Add/Edit Products","Add/Edit Pricing Tiers","Manage Files","Manage Download Passwords","Discount Schemes","Activation Codes","Place Test Order","Update Account Info"
          ],
          [
            "Please specify below..."
          ]
        ];
        var astSubtitles = aastSubtitles[form.TITLE.selectedIndex];
        form.SUBTITLE.options.length = 0;
        for (var i = 0; i < astSubtitles.length; i++) {
          form.SUBTITLE.options[i] = new Option (astSubtitles[i]);
        }
        setFieldVisible ('Other', form.TITLE.selectedIndex == 4);
      }

      function initForm (form) {
        titleSelectorChanged (form);
      }

      function submitForm (form) {
        if (isBlank (form.EMAIL.value)) {
          alert('You must input an Email Address');
          form.EMAIL.focus();
          return (false);
        }
        if (!isValidEmail (form.EMAIL.value)) {
          alert ("You must provide a VALID email address!");
          form.EMAIL.focus ();
          return (false);
        }
        form.submit ();
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
            <jsp:include page="includes/menuSidebar.jsp" />
            <div class="col-lg-10 col-md-12 page-title">
              <h4>Vendor&nbsp;Support&nbsp;Request&nbsp;Form</h4>
              <p>If you are unable to find answers to your questions in the&nbsp;<a href="https://help.bmtmicro.com/vendors/" target="_blank">FAQ/Help section</a>,&nbsp;or you have a special request,&nbsp;please contact us using the form below.</p>
              <div class="content-box overflow-auto">
                <form name="contactbmt" method="get" action="https://vendors-new.bmtmicro.com/servlets/System.EMailTemplate">
                  <input type="hidden" name="VENDORID" value="${cookie['BMTMicro.Vendors.VendorID'].value}" />
                  <input type="hidden" name="RECIPIENT" value="mdaemon@bmtmicro.com" />
                  <input type="hidden" name="SUBJECT" value="BMT Micro Vendor Support Request" />
                  <input type="hidden" name="EMAILTEMPLATE" value="https://vendors-new.bmtmicro.com/contactbmt_emailtemplate.txt" />
                  <input type="hidden" name="REDIRECT" value="0" />
                  <input type="hidden" name="NEXT_PAGE" value="https://vendors-new.bmtmicro.com/contact-sent.jsp" />
                  <input type="hidden" name="ERROR_PAGE" value="https://vendors-new.bmtmicro.com/error.jsp" />
                  <h6>Vendor&nbsp;ID:&nbsp;${cookie['BMTMicro.Vendors.VendorID'].value}</h6>
                  <span>
                    <label>Your&nbsp;name:&nbsp;</label>
                    <input type="text" name="NAME" size="35" value="${URLDecoder.decode(cookie['BMTMicro.Vendors.VendorName'].value)}" style="margin-right: .5rem;"/>
                  </span>
                  <span>
                    <label>Your&nbsp;email:&nbsp;</label>
                    <input type="text" name="EMAIL" size="35" value="${URLDecoder.decode(cookie['BMTMicro.Vendors.VendorEMail'].value)}" style="margin-bottom: 1rem;"/>
                  </span>
                  <br>
                  <span>
                    <label>Website&nbsp;(optional):&nbsp;</label>
                    <input type="text" name="URL" size="50" value="http://" style="margin-bottom: 1rem;"/>
                  </span>
                  <br>
                  <span>
                    <label>Subject:&nbsp;</label>
                    <select name="TITLE" onchange="titleSelectorChanged (contactbmt);" style="margin-bottom: 1rem;">
                      <option value="" selected="selected" disabled="disabled">Choose one</option>
                      <option value="General">General</option>
                      <option value="Reports">Reports</option>
                      <option value="Affiliate Program">Affiliate Program</option>
                      <option value="Account Management">Account Management</option>
                      <option value="Other">Other...</option>
                    </select>
                  </span>
                  <br>
                  <span>
                    <label>More&nbsp;Specific:&nbsp;</label>
                    <select name="SUBTITLE" style="margin-bottom: 1rem;"></select>
                  </span>
                  <div class="toggle-section" id="Other" style="display: none;">
                    <span>
                      <label>Other:&nbsp;</label>
                      <input type="text" name="OTHERSUBJECT" value="" size="25"/>
                    </span>
                  </div> <!-- end .toggle-section -->
                  <p style="font-size: .9rem; font-style: italic;">
                    To send a file to us, please use&nbsp;<a href="https://vendors-new.bmtmicro.com/downloadfilestart.html" target="_blank">Manage Files</a>.&nbsp;If you are having trouble with the File Upload feature, please email the file in ZIP format only (no EXE's) to&nbsp;<a href="mailto:vendors@bmtmicro.com">vendors@bmtmicro.com</a>.
                  </p>
                  <span>
                    <label>Question/Comment:</label>
                    <br>
                    <textarea name="DESCRIPTION" rows="8" cols="50" style="margin-bottom: 1rem;"></textarea>
                  </span>
                  <div class="controlbuttons" style="margin-bottom: 1rem;">
                    <button type="button" class="save-btn" onclick="submitForm (this.form);" />Send</button>
                    &nbsp;
                    <button type="reset" value="Reset" class="save-btn">Reset</button>
                  </div>
                </form>
                <h5>Contact&nbsp;BMT&nbsp;Micro</h5>
                <p>If you need to contact one of us directly,&nbsp;please use email links below.</p>
                <p>For questions regarding vendor payments and updating vendor payment information, contact our Office Manager, Jennifer Lancaster at&nbsp;<a href="mailto:jenni@bmtmicro.com">jenni@bmtmicro.com</a>.</p>
                <p>For questions regarding refunds, chargebacks and exchanges, contact us at&nbsp;<a href="mailto:refunds@bmtmicro.com">refunds@bmtmicro.com</a>.</p>
                <p style="margin-bottom: 0;">For questions regarding technical support and shopping cart customizations, contact us at&nbsp;<a href="mailto:vendors@bmtmicro.com">vendors@bmtmicro.com</a>.</p>
              </div> <!-- end .content-box -->
            </div> <!-- end .col-lg-10 col-md-12 page-title -->
          </div> <!-- end .row justify-content-start -->
        </article>
      </div> <!-- end .container-fluid -->
      <jsp:include page="includes/footer.jsp" />
    </div> <!-- end .main-raised -->
    <%@ include file="/includes/bootstrap_bottom_scripts.html" %>
  </body>
</html>
