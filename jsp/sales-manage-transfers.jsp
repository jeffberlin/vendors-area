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
    <link rel="stylesheet" href="https://vendors-new.bmtmicro.com/css/addTransfer.css"/>
    <script src="https://secure.bmtmicro.com/Templates/util.js"></script>
    <script src="https://vendors-new.bmtmicro.com/js/vendors.js"></script>
    <script src="https://vendors-new.bmtmicro.com/js/tablesort.js"></script>
    <script src="https://vendors-new.bmtmicro.com/js/calendar.js"></script>
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
    <script>
      function submitTransfer (action, target, nextpage, transferid) {
        var form = document.transfers;
        form.ACTION.value = action;
        form.target = target;
        form.NEXT_PAGE.value = nextpage;
        form.TRANSFERID.value = transferid;
        if (target == "_parent") {
          form.ERROR_PAGE.value = "https://vendors-new.bmtmicro.com/error.jsp";
          form.submit ();
        } else {
          form.target = "";
          submitToDiv (form, target);
        }
      }

      function addVendorTransfer() {
        <c:choose>
          <c:when test = "${ !allowChanges }">
            alert ("You do not have permission to add vendor transfers.");
          </c:when>
          <c:when test = "${ payDay == 1 }">
            alert ("Transfers cannot be added on a pay day. Please try again tomorrow.");
          </c:when>
          <c:otherwise>
            submitTransfer (0, "resultframe", "https://vendors-new.bmtmicro.com/sales-manage-vendors-transfers-add.jsp");
          </c:otherwise>
        </c:choose>
      }

      function addAffiliateTransfer() {
        <c:choose>
          <c:when test = "${ !allowChanges }">
            alert ("You do not have permission to add affiliate transfers.");
          </c:when>
          <c:when test = "${ payDay == -1 }">
            alert ("Transfers cannot be added on a pay day. Please try again tomorrow.");
          </c:when>
          <c:otherwise>
            submitTransfer (0, "resultframe", "https://vendors-new.bmtmicro.com/sales-manage-affiliates-transfers-add.jsp");
          </c:otherwise>
        </c:choose>
      }

      function editTransfer(transferid, toaffiliateid) {
        <c:choose>
          <c:when test = "${ !allowChanges }">
            alert ("You do not have permission to edit transfers.");
          </c:when>
          <c:when test = "${ payDay == -1 }">
            alert ("Transfers cannot be edited on a pay day. Please try again tomorrow.");
          </c:when>
          <c:otherwise>
            submitTransfer (1, "resultframe", (toaffiliateid == 0) ? "https://vendors-new.bmtmicro.com/sales-manage-vendors-transfers-edit.jsp" : "https://vendors-new.bmtmicro.com/sales-manage-affiliate-transfers-edit.jsp", transferid);
          </c:otherwise>
        </c:choose>
      }

      function cancelTransfer(transferid) {
        <c:choose>
          <c:when test = "${ !allowChanges }">
            alert ("You do not have permission to cancel vendor transfers.");
          </c:when>
          <c:when test = "${ payDay == 1 }">
            alert ("Transfers cannot be cancelled on a pay day. Please try again tomorrow.");
          </c:when>
          <c:otherwise>
            submitTransfer (2, "resultframe", "https://vendors-new.bmtmicro.com/sales-manage-transfers-delete.jsp", transferid);
          </c:otherwise>
        </c:choose>
      }

      function submitVendorTransfer (form) {
        // Important: We need to use hidden fields to submit checkbox values, as the servlets will use default values if the
        // field is not present. (An unchecked checkbox constitutes a non-existent field).
        <c:choose>
          <c:when test = "${ !allowChanges }">
            alert ("You do not have permission to make vendor transfers."):
          </c:when>
          <c:when test = "${ payDay == 1 }">
            alert ("Transfers cannot be made on a vendor pay day. Please try again tomorrow.");
          </c:when>
          <c:otherwise>
            if (isBlank(form.AMOUNT.value) || !isValidDollarAmount(form.AMOUNT.value)) {
              alert ("You must specify an amount");
              form.AMOUNT.focus();
            } else if (form.AMOUNT.value <= 0) {
              alert ("Value out of range. (Must not be negative or zero)");
              form.AMOUNT.focus();
            } else if (isBlank(form.TOVENDORID.value)) {
              alert ("You must specify a vendor ID");
              form.TOVENDORID.focus();
            } else if (form.TOVENDORID.value < 1) {
              alert ("You must specify a valid vendor ID");
              form.TOVENDORID.focus();
            } else {
              form.submit ();
            }
          </c:otherwise>
        </c:choose>
      }

      function submitAffiliateTransfer (form) {
        // Important: We need to use hidden fields to submit checkbox values, as the servlets will use default values if the
        // field is not present. (An unchecked checkbox constitutes a non-existent field).
        <c:choose>
          <c:when test = "${ !allowChanges }">
            alert ("You do not have permission to make affiliate transfers."):
          </c:when>
          <c:when test = "${ payDay == 1 }">
            alert("Transfers cannot be made on a vendor pay day. Please try again tomorrow.");
          </c:when>
          <c:otherwise>
            if (isBlank (form.AMOUNT.value) || !isValidDollarAmount (form.AMOUNT.value)) {
              alert ("You must specify an amount");
              form.AMOUNT.focus();
            } else if (form.AMOUNT.value <= 0) {
              alert("Value out of range. (Must not be negative or zero)");
              form.AMOUNT.focus();
            } else if (isBlank(form.TOAFFILIATEID.value)) {
              alert("You must specify an affiliate ID");
              form.TOAFFILIATEID.focus();
            } else if (form.TOAFFILIATEID.value < 100000) {
              alert("You must specify a valid affiliate ID");
              form.TOAFFILIATEID.focus();
            } else {
              form.submit ();
            }
          </c:otherwise>
        </c:choose>
      }

      function viewTransfer(transferid) {
        submitTransfer (3, "resultframe", "https://vendors-new.bmtmicro.com/sales-manage-transfers-view.jsp", transferid);
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
                <div name="tableframe" class="overflow-auto h-100" id="tableframe">
                  <form name="transfers" method="post" action="https://vendors-new.bmtmicro.com/servlets/Vendors.V2VTransfer">
                    <input type="hidden" name="ACTION" value="-1" />
                    <input type="hidden" name="NEXT_PAGE" value="https://vendors-new.bmtmicro.com/sales-manage-transfers-table.jsp"/>
                    <input type="hidden" name="ERROR_PAGE" value="https://vendors-new.bmtmicro.com/error-div.jsp"/>
                  </form>
                </div> <!-- end #tableframe -->
                <div name="resultframe" id="resultframe"></div> <!-- end #resultframe -->
              </div> <!-- end .content-box -->
            </div> <!-- end .col-lg-10 -->
          </div> <!-- end first .row -->
        </article>
      </div> <!-- end .container-fluid -->
      <jsp:include page="includes/footer.jsp" />
    </div> <!-- end .main-raised -->
    <%@ include file="/includes/bootstrap_bottom_scripts.html" %>
  </body>
  <script>$(document).ready(function(){ submitToDiv (document.transfers, 'tableframe'); });</script>
</html>
