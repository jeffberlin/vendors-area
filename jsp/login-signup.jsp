<%@ page pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ include file="/includes/core.jsp" %>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Pragma" content="no-cache">
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>BMT Micro Developers Center</title>
    <%@ include file="/includes/bootstrap_top_script.html" %>
    <%@ include file="/includes/style_menu_footer_css.html" %>
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
      function submitForm (form) {
        var isUSA = (queryField (form, "COUNTRY") == "US");
        var isCanada = (queryField (form, "COUNTRY") == "CA");
        if (isBlank (form.NAME.value)) {
          alert ("You must provide a Contact Name.");
          form.NAME.focus ();
          return (false);
        }
        if (isBlank (form.ADDRESS1.value)) {
          alert ("You must provide an address for payment purposes.");
          form.ADDRESS1.focus ();
          return (false);
        }
        if (isBlank (form.CITY.value)) {
          alert ("You must provide an address for payment purposes. City is missing.");
          form.CITY.focus ();
          return (false);
        }
        if (isBlank (form.ZIP.value)) {
          alert ("You must provide an address for payment purposes. Postal Code is missing.");
          form.ZIP.focus ();
          return (false);
        }
        if (isBlank (form.COUNTRY.value)) {
          alert ("You must provide an address for payment purposes. Country is missing.");
          form.COUNTRY.focus ();
          return (false);
        }
        var state = queryField (form, "STATE");
        if ((isUSA || isCanada) && isBlank (state)) {
          alert ("You must provide an address for payment purposes. State/Province is missing.");
          form.STATE.focus ();
          return (false);
        }
        if (!isBlank (state)) {
          var USStateList = "AL,AK,AR,AZ,CA,CO,CT,DE,DC,FL,GA,HI,ID,IL,IN,IA,KS,KY,LA,ME,MD,MA,MI,MN,MS,MO,MT,NE,NV,NH,NJ,NM,NY,NC,ND,OH,OK,OR,PA,PR,RI,SC,SD,TN,TX,UT,VA,VT,WA,WV,WI,WY,AE,AA,AE,AE,AE,AP";
          if (USStateList.indexOf (state) != -1) {
            if (!isUSA) {
              alert ("You have selected a US state but the country is not set to USA.");
              form.STATE.focus ();
              return (false);
            }
          }
          var CanadaProvinceList = "AB,BC,MB,NB,NF,NT,NS,NU,ON,PE,QC,SK,YT";
          if (CanadaProvinceList.indexOf (state) != -1) {
            if (!isCanada) {
              alert ("You have selected a Canadian province but the country is not set to Canada.");
              form.STATE.focus ();
              return (false);
            }
          }
        }
        if (!isValidURL (form.WEB.value)) {
          alert ("Please enter a full URL starting with \"http://\" or \"https://\"");
          form.WEB.focus ();
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
            <div class="col-lg-2">
              <aside class="sidebar" role="complementary">
                <img src='<c:url value="https://vendors-new.bmtmicro.com/images/bmt-micro-logo-new-min.png"></c:url>' alt="BMT Micro, Inc. logo" height="60" style="margin-bottom: 20px;" />
                <div>
                  <a class="sidebar-group" href="https://www.bmtmicro.com/">More about our services</a>
                </div>
              </aside> <!-- end .sidebar -->
            </div> <!-- end .col-lg-2 -->
            <div class="col-lg-10 col-md-12 page-title">
              <form name="signup" method="post" action="https://vendors-new.bmtmicro.com/servlets/Vendors.Account" />
                <input type="hidden" name="VENDORID" value="${requestScope.VENDORID}">
                <input type="hidden" name="ACTION" value="11" />
                <input type="hidden" name="NEXT_PAGE" VALUE="https://vendors-new.bmtmicro.com/main.jsp">
                <input type="hidden" name="ERROR_PAGE" value="https://vendors-new.bmtmicro.com/login-error.jsp" />
                <h4>Please complete your registration (Vendor ${requestScope.VENDORID})</h4>
                <p>We need more information before we can allow you to log in. Please complete the form below.</p>
                <div class="content-box overflow-auto">
                  <span>
                    <label>Company&nbsp;Name:&nbsp;</label>
                    <input name="COMPANY" size="35" style="margin-bottom: 1rem;" />
                  </span>
                  <br clear="all">
                  <span>
                    <label>Contact&nbsp;Name:&nbsp;</label>
                    <input name="NAME" size="35" style="margin-bottom: 1rem;" />
                  </span>
                  <br clear="all">
                  <span>
                    <label>Address:&nbsp;</label>
                    <input name="ADDRESS1" size="35" placeholder="Mailing Address" style="margin-right: .3rem;" />
                    <input name="ADDRESS2" size="15" placeholder="Apt./Unit #" style="margin-bottom: 1rem;" >
                  </span>
                  <br clear="all">
                  <span>
                    <label>City:&nbsp;</label>
                    <input name="CITY" size="35" style="margin-right: 1rem;" />
                  </span>
                  <span>
                    <label>State:&nbsp;</label>
                    <select NAME="STATE" style="margin-bottom: 1rem;">
                      <c:import url="https://secure.bmtmicro.com/Templates/Import.StateOptions"/>
                    </select>
                  </span>
                  <br clear="all">
                  <span>
                    <label>ZIP/Postal Code:&nbsp;</label>
                    <input name="ZIP" size="10" style="margin-right: 1rem;" />
                  </span>
                  <span>
                    <label>Country:&nbsp;</label>
                    <select NAME="COUNTRY" style="margin-bottom: 1rem;">
                      <option value="">Select your Country</option>
                      ${requestScope.COUNTRYLIST}
                    </select>
                  </span>
                  <br clear="all">
                  <span>
                    <label>Email:&nbsp;</label>
                    <input name="EMAIL" size="35" value="${requestScope.EMAIL}" />
                    <p style="font-size: .9rem;"><em>If using "free" email address, such as Yahoo!, HotMail, etc., please supply us with an alternate email address. This address will not be given to customers.</em></p>
                  </span>
                  <span>
                    <label>Alternate Email:&nbsp;</label>
                    <input name="EMAIL2" size="35" style="margin-bottom: 1rem;" />
                  </span>
                  <br clear="all">
                  <span>
                    <label>Phone:&nbsp;</label>
                    <input name="PHONE" size="35" style="margin-bottom: 1rem;" />
                  </span>
                  <br clear="all">
                  <span>
                    <label>Fax:&nbsp;</label>
                    <input name="FAX" size="35" style="margin-bottom: 1rem;" />
                  </span>
                  <br clear="all">
                  <span>
                    <label>Website URL:&nbsp;</label>
                    <input name="WEB" size="35" placeholder="http://www.example.com" />
                    <p style="font-size: .9rem;"><em>Your website is used to help verify your company information. If you are still working on your website, please include explanation in the Special Instructions field.</em></p>
                  </span>
                  <span>
                    <label>Service Tier:&nbsp;</label>
                    <select name="SERVICETIER" style="margin-bottom: 1rem;">
                      <option value="11" selected>Advanced Tier 9.5%&nbsp;flat rate</option>
                      <option value="12">Advanced Tier 4.9%&nbsp;+ $2</option>
                      <option value="9">Basic Tier 8.9% flat rate</option>
                      <option value="10">Basic Tier 5.9% + $1</option>
                    </select>
                  </span>
                  <br clear="all">
                  <span>
                    <label>Special Instructions:&nbsp;</label>
                    <textarea name="CSRCOMMENTS" rows="8" cols="40" placeholder="Type instructions here" style="vertical-align: text-top; margin-bottom: 1rem;"></textarea>
                  </span>
                  <br clear="all">
                  <span>
                    <label>Promotional Code:&nbsp;</label>
                    <input name="PROMOCODE" size="35" style="margin-bottom: 2rem;" />
                  </span>
                  <br clear="all">
                  <button type="button" class="save-btn" onclick="submitForm (form);">Complete</button>
                </div> <!-- end .content-box -->
              </form>
            </div> <!-- end .col-lg-10 col-md-12 page-title  -->
          </div> <!-- end .row justify-content-start -->
        </article> <!-- end .section -->
      </div> <!-- end .container-fluid .body-content -->
      <jsp:include page="/includes/footer.jsp" />
    </div> <!-- end .main-raised -->
    <%@ include file="/includes/bootstrap_bottom_scripts.html" %>
  </body>
</html>
