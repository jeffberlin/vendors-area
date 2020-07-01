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
    <script language="javascript" type="text/javascript" src="https://vendors-new.bmtmicro.com/js/vendors.js"></script>
    <script language="javascript" type="text/javascript" src="https://vendors-new.bmtmicro.com/js/tablesort.js"></script>
    <script language="javascript" type="text/javascript" src="https://vendors-new.bmtmicro.com/js/calendar.js"></script>
    <style media="screen" type="text/css">
      .table-responsive {
        overflow-y: scroll;
        height: calc(100vh - 350px);
        display: block;
      }
      td[text], td[number], td[date], td[info], td[money], th {
        border-right: 1px solid #a9a9a9;
      }
      th:last-child {
        border-right: none;
      }
      th {
        min-width: 150px;
      }
      td[number]:first-child {
        text-align: left;
      }
      td[money] {
        text-align: right;
      }
    </style>
    <script language="javascript" type="text/javascript">
      <!--
      // from salesdetailsstart.html
      function initForm (form) {
        var exactmatch = getCookieValue ("BMTMicro.Vendors.SalesDetails.ExactMatch");
        if (exactmatch != null) {
          form.EXACTMATCH.value = exactmatch;
        }
        getVendorDateRange (form);
        form.submit ();
      }
      function initForm (form){
        initField (form, "EXACTMATCH",  "${param.EXACTMATCH}");
      }
      function exactMatch (form) {
        setCookieValue ("BMTMicro.Vendors.SalesDetails.ExactMatch", queryField (form, "EXACTMATCH"), 1000);
      }
      function invoice (orderid) {
        var form = document.invoice;
        //   window.open("", "InvoicePopUp","scrollbars=yes,menubar=1,location=no,resizable=yes").focus();
        form.ORDERID.value = orderid;
        form.submit();
      }
      function tabledata () {
        var colTypes = [ ${param.COLTYPELIST} ];
        var colTypeNames = [
          "text",   // 0 - Text
          "number", // 1 - Number
          "money",  // 2 - Amount
          "money",  // 3 - Currency
          "date",   // 4 - Date
          "info",   // 5 - EMail
          "number"  // 6 - Order ID
        ];
        var colHdrs = [ ${param.COLHDRLIST} ];
        var s = "<thead><tr class=\"table-category\">";
        for (var i = 0; i < colHdrs.length; i++) {
          s += "<th class=\"sortable sort-column text-center sort\" " + colTypeNames[colTypes[i]] + ">" + colHdrs[i] + "<\/th>";
        }
        s += "<\/tr><\/thead><tbody class=\"text-center\"><tr>";
        var colFlts = [ ${param.COLFLTLIST} ];
        for (var i = 0; i < colFlts.length; i++) {
          s += "<th " + colTypeNames[colTypes[i]] + "><input class=\"input-search\" type=\"text\" name=\"FILTER\" placeholder=\"Search\" value=\"" + colFlts[i] + "\" style=\"width: 100%\"/><\/th>";
        }
        s += "<\/tr>";
        var colData = [ ${param.COLDATALIST} ];
        for (var j = 0; j < colData.length; ) {
          s += "<tr>";
          for (var i = 0; i < colTypes.length; i++, j++) {
            var d = colData[j];
            switch (colTypes[i]) {
              case 3: // Currency
                d = "<b>" + d + "<\/b>";
              break;
              case 5: // EMail
                d = "<a href=mailto:" + d + ">" + d + "<\/a>";
              break;
              case 6:    //Order ID with invoice link
                d = "<a href=\"javascript:invoice(" + d + ");\">" + d + "<\/a>";
              break;
            }
            s += "<td " + colTypeNames[colTypes[i]] + ">" + d + "<\/td>";
          }
          s += "<\/tr>";
        }
        var colTotal = [ ${param.COLTOTALLIST} ];
        s += "<\/tbody><tfoot><tr class=\"table-total text-center\">";
        for (var i = 0; i < colTotal.length; i++) {
          s += "<td " + colTypeNames[colTypes[i]] + "><strong>" + colTotal[i] + "<\/strong><\/td>";
        }
        s += "<\/tr><\/tfoot>";
        return (s);
      }
      //-->
    </script>
  </head>
  <body onload="initForm (document.salesdetails);">
    <!-- Blue background header -->
    <div class="blue-bg"></div>

    <!-- Start of body content -->
    <div class="main-raised">
      <div class="container-fluid body-content">
        <article class="section">
          <div class="row justify-content-start">
            <%@ include file="/includes/menuSidebar.html" %>
            <div class="col-lg-10 col-md-12 page-title">
              <h4>Sales Detail Report</h4>
              <p>Filter Details using the input fields. Fields can be added or removed using the Settings link at the top right of this page.</p>
              <div class="content-box overflow-auto">
                <c:import name="start" url = "https://vendors.bmtmicro.com/servlets/Vendors.SalesDetails">
                  <c:param name = "SESSIONID" value = "${sessionid}" />
                  <c:param name = "DATEFROM" value="${fromDate}" />
                  <c:param name = "DATETO" value="${toDate}" />
                  <c:param name = "EXACTMATCH" value="0" />
                  <c:param name = "ROWSPERPAGE" value="250" />
                  <c:param name = "PAGE" value="1" />
                  <!-- File not used <c:param name = "ROWTEMPLATEURL" value="https://vendors-new.bmtmicro.com/sales-eu-summary-tablerow.html" /> -->
                  <c:param name = "NEXT_PAGE" value="https://vendors-new.bmtmicro.com/sales-details-table.jsp" />
                  <c:param name = "ERROR_PAGE" value="https://vendors-new.bmtmicro.com/error.jsp" />
                </c:import>
              </div> <!-- end .content-box -->
            </div> <!-- end .col-lg-10 -->
          </div> <!-- end first .row -->
        </article>
      </div> <!-- end .container-fluid -->
      <%@ include file="/includes/footer.html" %>
    </div> <!-- end .main-raised -->
  <%@ include file="/includes/bootstrap_bottom_scripts.html" %>
  </body>
</html>
