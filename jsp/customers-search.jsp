<%@ include file="/includes/core.jsp" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
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
    <link rel="stylesheet" href="https://vendors-new.bmtmicro.com/css/table.css"/>
    <link rel="stylesheet" href="https://vendors-new.bmtmicro.com/css/addTransfer.css"/>
    <script language="javascript" type="text/javascript" src="https://secure.bmtmicro.com/Templates/util.js"></script>
    <script language="javascript" type="text/javascript" src="https://vendors-new.bmtmicro.com/js/vendors.js"></script>
    <script language="javascript" type="text/javascript" src="https://vendors-new.bmtmicro.com/js/tablesort.js"></script>
    <style media="screen" type="text/css">
      .input-search {
        width: 100%;
      }
      .save-btn {
        margin-bottom: .3rem;
      }
      td {
        padding: .4rem;
      }
      label {
        margin-bottom: 0;
      }
    </style>
    <script language="javascript" type="text/javascript">
      function stripspaces(input) {
        input.value = input.value.replace(/\s/gi,"");
        return true;
      }

      function checkForm (form) {
        if (isBlank (form.FLT_ORDERID.value) && isBlank (form.FLT_PRODUCTNAME.value) && isBlank (form.FLT_NAME.value) && isBlank (form.FLT_ADDRESS.value) && isBlank (form.FLT_EMAIL.value)) {
          alert ("You must enter search criteria!");
          form.FLT_ORDERID.focus ();
          return (false);
        }
        return (true);
      }

      function refreshReport (form) {
        if (checkForm (form)) {
          submitToDiv (form, 'tableframe');
        }
      }

      function editComments (orderid, itemnr) {
        if ((getCookieValue ("BMTMicro.Vendors.Flags") & 2) == 0) {
          alert ("You do not have permission to edit comments.");
          return (false);
        }
        var form = document.CommentsForm;
        form.ORDERID.value = orderid;
        form.ITEMNR.value = itemnr;
        submitForm (form);
        return (true);
      }

      function resendInfo (orderid, itemnr) {
        if ((getCookieValue ("BMTMicro.Vendors.Flags") & 4) == 0) {
          alert ("You do not have permission to resend information.");
          return (false);
        }
        var form = document.ResendInfoForm;
        form.ORDERID.value = orderid;
        form.ITEMNR.value = itemnr;
        submitForm (form);
        return (true);
      }

      function refund (orderid, itemnr) {
        if ((getCookieValue ("BMTMicro.Vendors.Flags") & 4) == 0) {
          alert ("You do not have permission to refund an order.");
          return (false);
        }
        var form = document.RefundItem;
        form.ORDERID.value = orderid;
        form.ITEMNR.value = itemnr;
        submitForm (form);
        return (true);
      }

      function filterKeyPress(event) {
        if (event.keyCode == 13) {
          refreshReport (document.customersearch);
          return (true);
        }
      }

      // from linked pages
      function submitForm (form) {
        submitToDiv (form, 'resultframe');
        return (true);
      }
      function validateForm (form) {
        if (!isValidEmailList (form.EMAIL.value) ) {
          alert ("You must provide a valid e-mail address for the customer.");
          form.EMAIL.focus ();
          return (false);
        }
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
              <h4>Customer&nbsp;Search</h4>
              <p>Use fields below to enter search criteria.&nbsp;If email information has not changed since purchase you can resend the customer's email using the button provided.<br>You will be able to review the email before it is sent.</p>
              <div class="content-box overflow-auto d-flex flex-column">
                <div name="tableframe" class="overflow-auto h-100" id="tableframe">
                   <jsp:include page="customers-search-table.jsp" />
                </div> <!-- end #tableframe -->
                <div name="resultframe" id="resultframe"></div> <!-- end #resultframe -->
                <div style="visibility:hidden;">
                  <form name="CommentsForm" action="https://vendors-new.bmtmicro.com/servlets/Vendors.OrderSearch" method="post" target="resultframe">
                    <input type="hidden" name="ORDERID" value="">
                    <input type="hidden" name="ITEMNR" value="">
                    <input type="hidden" name="ACTION"  value="1">
                    <input type="hidden" name="NEXT_PAGE" value="https://vendors-new.bmtmicro.com/customers-search-comments.jsp">
                    <input type="hidden" name="ERROR_PAGE" value="https://vendors-new.bmtmicro.com/error-div.jsp" />
                  </form>
                </div>
                <div style="visibility:hidden;">
                  <form name="ResendInfoForm" action="https://vendors-new.bmtmicro.com/servlets/Vendors.OrderSearch" method="post" target="resultframe">
                    <input type="hidden" name="ORDERID" value="">
                    <input type="hidden" name="ITEMNR" value="">
                    <input type="hidden" name="ACTION"  value="2">
                    <input type="hidden" name="NEXT_PAGE" value="https://vendors-new.bmtmicro.com/customers-search-resend.jsp">
                    <input type="hidden" name="ERROR_PAGE" value="https://vendors-new.bmtmicro.com/error-div.jsp" />
                  </form>
                </div>
                <div style="visibility:hidden;">
                  <form name="RefundItem" action="https://vendors-new.bmtmicro.com/servlets/Vendors.OrderSearch" method="post" target="resultframe">
                    <input type="hidden" name="ORDERID" value="">
                    <input type="hidden" name="ITEMNR" value="">
                    <input type="hidden" name="ACTION"  value="3">
                    <input type="hidden" name="NEXT_PAGE" value="https://vendors-new.bmtmicro.com/customers-search-refund.jsp">
                    <input type="hidden" name="ERROR_PAGE" value="https://vendors-new.bmtmicro.com/error-div.jsp" />
                  </form>
                </div>
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
