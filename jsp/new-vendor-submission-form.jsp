<%@ include file="/includes/core.jsp" %>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Pragma" content="no-cache">
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>BMT Micro Developers Center</title>
    <%@ include file="includes/bootstrap_top_script.html" %>
    <%@ include file="includes/style_menu_footer_css.html" %>
    <link rel="stylesheet" href="https://vendors-new.bmtmicro.com/css/menuSidebar.css"/>
    <script src="https://secure.bmtmicro.com/Templates/util.js"></script>
    <script src="https://secure.bmtmicro.com/servlets/System.Util"></script>
    <script src="https://secure.bmtmicro.com/servlets/CustomForms.CustomForm"></script>
    <style media="screen" type="text/css">
      .content-box {
        padding: 1rem;
      }
      label {
        color: #707070;
      }
    </style>
    <script>
      function getControlValue (control) {
        switch (control.type) {
          case 'select-one':
          return (control.options[control.selectedIndex].value);
          default:
          return (control.value);
        }
      }

      function process(form) {
        var isUSA = (getControlValue (form.COUNTRY) == "US");
        var isCanada = (getControlValue (form.COUNTRY) == "CA");
        if (isBlank (form.NAME.value)) {
          alert('You must input a Contact Name');
          form.NAME.focus();
          return (false);
        }
        if (isBlank (form.ADDRESS1.value)) {
          alert('You must input an address for payment purposes');
          form.ADDRESS1.focus();
          return (false);
        }
        if (isBlank (form.CITY.value)) {
          alert('You must input a City');
          form.CITY.focus();
          return (false);
        }
        if (isBlank (form.ZIP.value)) {
          alert('You must input a Postal Code');
          form.ZIP.focus();
          return (false);
        }
        if (isBlank (form.COUNTRY.value)) {
          alert('You must input a Country');
          form.COUNTRY.focus();
          return (false);
        }
        if ((isUSA || isCanada) && isBlank (getControlValue (form.STATE))) {
          alert ("You must provide your state!");
          form.STATE.focus ();
          return (false);
        }
        if ((form.STATE.type == 'select-one') && !isBlank (getControlValue (form.STATE))) {
          var USStateList = "AL,AK,AR,AZ,CA,CO,CT,DE,DC,FL,GA,HI,ID,IL,IN,IA,KS,KY,LA,ME,MD,MA,MI,MN,MS,MO,MT,NE,NV,NH,NJ,NM,NY,NC,ND,OH,OK,OR,PA,PR,RI,SC,SD,TN,TX,UT,VA,VT,WA,WV,WI,WY,AE,AA,AE,AE,AE,AP";
          if (USStateList.indexOf (getControlValue (form.STATE)) != -1) {
            if (!isUSA) {
              if (!confirm ("You have selected a US state but the country is not set to USA. Press Ok to change country to USA or Cancel to correct the error.")) {
                form.COUNTRY.focus ();
                return (false);
              }
              setControlValue (form.COUNTRY, "US");
              return (verifyAddressInfo (form));
            }
          }
          var CanadaProvinceList = "AB,BC,MB,NB,NF,NT,NS,NU,ON,PE,QC,SK,YT";
          if (CanadaProvinceList.indexOf (getControlValue (form.STATE)) != -1) {
            if (!isCanada) {
              if (!confirm ("You have selected a Canadian province but the country is not set to Canada. Press Ok to change country to Canada or Cancel to correct the error.")) {
                form.COUNTRY.focus ();
                return (false);
              }
              setControlValue (form.COUNTRY, "CA");
              return (verifyAddressInfo (form));
            }
          }
        }
        if (!isValidURL (form.WEB.value)) {
          alert('Please enter a full URL starting with "http://" or "https://"');
          form.WEB.focus();
          return (false);
        }
        form.submit();
        return (true);
      }

      function MM_openBrWindow(theURL,winName,features) { //v2.0
        window.open(theURL,winName,features);
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
                <img src="https://vendors-new.bmtmicro.com/images/bmt-micro-logo-new-min.png" alt="BMT Micro, Inc. logo" height="60" style="margin-bottom: 20px;" />
                <div>
                  <a class="sidebar-group" href="https://www.bmtmicro.com/">More about our services</a>
                </div>
              </aside> <!-- end .sidebar -->
            </div> <!-- end .col-lg-2 -->
            <div class="col-lg-10 col-md-12 page-title">
              <h4>Vendor Submission Form</h4>
              <p>Please fill in your contact information below. This information is used for payment and not given to your customers.</p>
              <div class="content-box overflow-auto">
                <form name="form1" method="post" action="https://vendors-new.bmtmicro.com/servlets/Vendors.Account">
                  <input type="hidden" name="ACTION" value="11" />
                  <input type="hidden" name="NEXT_PAGE" value="https://vendors-new.bmtmicro.com/main.jsp" />
                  <input type="hidden" name="ERROR_PAGE" value="https://vendors-new.bmtmicro.com/new-vendor-error.jsp" />
                  <span>
                    <label>Vendor ID:&nbsp;</label>
                    <input name="VENDORID" type="hidden" value="${requestScope.VENDORID}" style="margin-bottom: 1rem;">
                      ${requestScope.VENDORID}
                  </span>
                  <br>
                  <span>
                    <label>Company Name:&nbsp;</label>
                    <input name="COMPANY" style="margin-bottom: 1rem;" />&nbsp;<img src="https://vendors-new.bmtmicro.com/images/questionMark.gif" alt="Question Mark" title="Name of the company who develops the product." />
                  </span>
                  <br>
                  <span>
                    <label>Contact Name:&nbsp;</label>
                    <input name="NAME" style="margin-bottom: 1rem;" />&nbsp;<img src="https://vendors-new.bmtmicro.com/images/questionMark.gif" alt="Question Mark" title="Name of the Developer or Contact person." />
                  </span>
                  <br>
                  <span>
                    <label>Company Address:&nbsp;</label>
                    <input name="ADDRESS1" style="margin-bottom: 1rem;" />&nbsp;<img title="Complete company (or individual) mailing address." src="https://vendors-new.bmtmicro.com/images/questionMark.gif" alt="Question Mark" />
                  </span>
                  <br>
                  <span>
                    <label>Address 2:&nbsp;</label>
                    <input name="ADDRESS2" style="margin-bottom: 1rem;" />
                  </span>
                  <br>
                  <span>
                    <label>City:&nbsp;</label>
                    <input name="CITY" style="margin-bottom: 1rem; margin-right: 1.5rem;" />
                  </span>
                  <span>
                    <label>State/Province:&nbsp;</label>
                    <select name="STATE" style="margin-bottom: 1rem;">
                      <c:import url="https://secure.bmtmicro.com/Templates/Import.StateOptions"/>
              	    </select>
                  </span>
                  <br>
                  <span>
                    <label>ZIP/Postal Code:&nbsp;</label>
                    <input name="ZIP" style="margin-bottom: 1rem; margin-right: 1.5rem;">
                  </span>
                  <span>
                    <label>Country:&nbsp;</label>
                    <select name="COUNTRY" style="margin-bottom: 1rem;">
                      <option value="">Select your Country</option>
                      ${requestScope.COUNTRYLIST}
                    </select>
                  </span>
                  <br>
                  <p style="font-size: .9rem;">If using "free" email address, such as Yahoo!, HotMail, etc., please supply us with an alternate email address. This address will not be given to customers.</p>
                  <span>
                    <label>Account Email:&nbsp;</label>
                    <input name="EMAIL" value="${requestScope.EMAIL}" style="margin-bottom: 1rem;" />
                  </span>
                  <br>
                  <span>
                    <label>Alternate Email:&nbsp;</label>
                    <input name="EMAIL2" style="margin-bottom: 1rem;" />&nbsp;<img title="Backup email if above unavailable." src="https://vendors-new.bmtmicro.com/images/questionMark.gif" alt="Question Mark" />
                  </span>
                  <br>
                  <span>
                    <label>Phone:&nbsp;</label>
                    <input name="PHONE" style="margin-bottom: 1rem;" />&nbsp;<img title="Your information is not given out to the customer." src="https://vendors-new.bmtmicro.com/images/questionMark.gif" alt="Question Mark" />
                  </span>
                  <br>
                  <span>
                    <label>Fax:&nbsp;</label>
                    <input name="FAX" style="margin-bottom: 1rem;" />
                  </span>
                  <br>
                  <p style="font-size: .9rem;">Your website is used to help verify your company information. If you are still working on your website, please include explanation in the Special Instructions field.</p>
                  <span>
                    <label>Wesite Address:&nbsp;</label>
                    <input name="WEB" style="margin-bottom: 1rem;" />&nbsp;<img title="Web address representing your company or products." src="https://vendors-new.bmtmicro.com/images/questionMark.gif" alt="Question Mark" />
                  </span>
                  <br>
                  <span>
                    <label><a href="https://www.bmtmicro.com/sign-up-plans/" target="_blank">Service Tier</a>:&nbsp;</label>
                    <select name="SERVICETIER" style="margin-bottom: 1rem;">
                      <option value="11" selected>Advanced Tier 9.5%&nbsp;flat rate</option>
                      <option value="12">Advanced Tier 4.9%&nbsp;+ $2</option>
                      <option value="9">Basic Tier 8.9% flat rate</option>
                      <option value="10">Basic Tier 5.9% + $1</option>
                    </select>&nbsp;<img title="Choose the service plan that best suits your needs." src="https://vendors-new.bmtmicro.com/images/questionMark.gif" alt="Question Mark" />
                  </span>
                  <br>
                  <span>
                    <label style="vertical-align: top;">Special Instructions:&nbsp;</label>
                    <textarea name="CSRCOMMENTS" style="margin-bottom: 1rem;"></textarea>&nbsp;<img title="Any information that will aid us in setting up your account." src="https://vendors-new.bmtmicro.com/images/questionMark.gif" alt="Question Mark"  style="vertical-align: top;" />
                  </span>
                  <br>
                  <span>
                    <label>Promotional Code:&nbsp;</label>
                    <input name="PROMOCODE" style="margin-bottom: 2rem;" />&nbsp;<img title="If you received a code, please enter it here." src="https://vendors-new.bmtmicro.com/images/questionMark.gif" alt="Question Mark" />
                  </span>
                  <br>
                  <button type="reset" name="reset" class="save-btn" style="margin-right: .5rem;">Reset</button>
                  <button type="button" name="button" class="save-btn" onclick="process(form)">Submit</button>
                </form>
              </div> <!-- end .content-box -->
            </div> <!-- end .col-lg-10 col-md-12 page-title  -->
          </div> <!-- end .row justify-content-start -->
        </article> <!-- end .section -->
      </div> <!-- end .container-fluid .body-content -->
      <jsp:include page="includes/footer.jsp" />
    </div> <!-- end .main-raised -->
    <%@ include file="includes/bootstrap_bottom_scripts.html" %>
  </body>
</html>
