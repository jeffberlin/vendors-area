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
    <link rel="stylesheet" href="https://vendors-new.bmtmicro.com/css/table.css"/>
    <script language="javascript" type="text/javascript" src="https://secure.bmtmicro.com/Templates/util.js"></script>
    <script language="javascript" type="text/javascript" src="https://vendors.bmtmicro.com/js/vendors.js"></script>
    <script language="javascript" type="text/javascript" src="https://vendors-new.bmtmicro.com/js/tablesort.js"></script>
    <script language="javascript" type="text/javascript" src="https://vendors-new.bmtmicro.com/js/calendar.js"></script>
    <style media="screen" type="text/css">
      th {
        min-width: 150px;
      }
      td[info] {
        border-right: none;
      }
      td[money] {
        text-align: right;
      }
      td[option] {
        text-align: center;
      }
    </style>
    <script language="javascript" type="text/javascript">
      function submitForm(form) {
        if (!CheckDateRange(form)) {
          return (false);
        }
        if (parseInt(form.FORMAT.value) == 0) {
          // If printable HTMl is selected we use a different row template and landing page
          form.target = "_ blank"; // Open up in a new window
          form.NEXT_PAGE.value = "https://vendors-new.bmtmicro.com/sales-account-transactions-print.jsp";
          form.ROWTEMPLATEURL.value = "https://vendors-new.bmtmicro.com/sales-account-transactions-print-tablerow.html";
        } else {
          form.target = "";
          form.NEXT_PAGE.value = "https://vendors-new.bmtmicro.com/sales-account-transactions.jsp";
          form.ROWTEMPLATEURL.value = "${param.ROWTEMPLATEURL}.";
        }
        submitToDiv(form, 'tableframe');
        return (true);
      }

      // from linked pages
      function submitForm(action, target, nextpage, transferid) {
        var form = document.splits;
        form.ACTION.value = action;
        form.target = target;
        form.NEXT_PAGE.value = nextpage;
        form.ERROR_PAGE.value = (target == "_parent") ? "https://vendors-new.bmtmicro.com/error.jsp" : "https://vendors-new.bmtmicro.com/error-div.jsp";
        form.TRANSFERID.value = transferid;
        if (target == "") {
					form.submit ();
				} else {
					submitToDiv (form, target);
				}
      }
      <c:if test = "{ ${param.PAYDAY} == -1 }">
        function addVendorTransfer() {
          alert ("Transfers cannot be added on a pay day. Please try again tomorrow.");
          return;
        }
        function addAffiliateTransfer() {
          alert ("Transfers cannot be added on a pay day. Please try again tomorrow.");
          return;
        }
        function cancelTransfer(transferid) {
          alert ("Transfers cannot be deleted on a pay day. Please try again tomorrow.");
          return;
        }
        function submitForm(form) {
          alert("Transfers cannot be made on a vendor pay day. Please try again tomorrow.");
          return (false);
        }
      </c:if>

      function addVendorTransfer() {
        if (allowChanges("You do not have permission to add vendor transfers.")) {
          submitForm (0, "resultframe", "https://vendors-new.bmtmicro.com/v2v_add.html");
        }
      }

      function addAffiliateTransfer() {
        if (allowChanges("You do not have permission to add affiliate transfers.")) {
          submitForm (0, "resultframe", "https://vendors-new.bmtmicro.com/v2a_add.html");
        }
      }

      function editTransfer(transferid, toaffiliateid) {
        submitForm (1, "resultframe", (toaffiliateid == 0) ? "https://vendors-new.bmtmicro.com/sales-manage-vendors-transfers-edit.jsp" : "https://vendors-new.bmtmicro.com/v2a_edit.html", transferid);
      }

      function cancelTransfer(transferid) {
        if (allowChanges("You do not have permission to cancel vendor transfers.")) {
          submitForm (2, "resultframe", "https://vendors-new.bmtmicro.com/sales-manage-transfers-delete.jsp", transferid);
        }
      }

      function viewTransfer(transferid) {
        submitForm (3, "resultframe", "https://vendors-new.bmtmicro.com/sales-manage-transfers-view.jsp", transferid);
      }

      // from v2v_add.html
      function initForm(form) {
        // Important: We need to use hidden fields to submit checkbox values, as the servlets will use default values if the
        // field is not present. (An unchecked checkbox constitutes a non-existent field).
        initField(form, "CURRENCY", "${param.CURRENCY}");
      }

      function submitForm(form) {
        // Important: We need to use hidden fields to submit checkbox values, as the servlets will use default values if the
        // field is not present. (An unchecked checkbox constitutes a non-existent field).
        //if (##PAYDAY## == -1) {
          // alert("Transfers cannot be made on a vendor pay day. Please try again tomorrow.");
          // return (false);
        //}
        if (!allowChanges("You do not have permission to make vendor transfers.")) {
          return (false);
        }
        if (isBlank(form.AMOUNT.value) || !isValidDollarAmount(form.AMOUNT.value)) {
          alert("You must specify an amount");
          form.AMOUNT.focus();
          return (false);
        }
        if (form.AMOUNT.value <= 0) {
          alert("Value out of range. (Must not be negative or zero)");
          form.AMOUNT.focus();
          return (false);
        }
        if (isBlank(form.TOVENDORID.value)) {
          alert("You must specify a vendor ID");
          form.TOVENDORID.focus();
          return (false);
        }
        if (form.TOVENDORID.value < 1) {
          alert("You must specify a valid vendor ID");
          form.TOVENDORID.focus();
          return (false);
        }
        // form.SELECTEDPRODUCTS.value = getCommaSeparatedSelectorValues(form.SELECTEDLIST);
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
            <jsp:include page="includes/menuSidebar.jsp" />
            <div class="col-lg-10 col-md-12 page-title">
              <h4>Manage&nbsp;Transfers</h4>
              <p>Transfers will be completed on vendor paydays.&nbsp;You may add or cancel transfers up until that date.</p>
              <div class="content-box overflow-auto d-flex flex-column">
                <div name="tableframe" class="overflow-auto h-100" id="tableframe"></div> <!-- end #tableframe -->
                <form name="transfers" method=post action="https://vendors-new.bmtmicro.com/servlets/Vendors.V2VTransfer">
                   <input type="hidden" name="ACTION" value="-1" />
                   <input type="hidden" name="MAXAMOUNT" value="" />
                   <input type="hidden" name="ROWTEMPLATEURL" value="https://vendors-new.bmtmicro.com/sales-manage-transfers-tablerow.html" />
                   <input type="hidden" name="NEXT_PAGE" value="https://vendors-new.bmtmicro.com/sales-manage-transfers-table.jsp">
                   <input type="hidden" name="ERROR_PAGE" value="https://vendors-new.bmtmicro.com/error-div.jsp">
                </form>
                <div name="resultframe" id="resultframe"></div> <!-- end #resultframe -->
              </div> <!-- end .content-box -->
            </div> <!-- end .col-lg-12 -->
          </div> <!-- end first .row -->
        </article>
      </div> <!-- end .container-fluid -->
      <jsp:include page="includes/footer.jsp" />
    </div> <!-- end .main-raised -->
    <%@ include file="/includes/bootstrap_bottom_scripts.html" %>
  </body>
  <script>$(document).ready(function(){ submitToDiv (document.transfers, 'tableframe'); });</script>
</html>
