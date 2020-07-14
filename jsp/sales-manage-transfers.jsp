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
    <link rel="stylesheet" href="https://vendors-new.bmtmicro.com/css-2/table.css"/>
    <script language="javascript" type="text/javascript" src="https://secure.bmtmicro.com/Templates/util.js"></script>
    <script language="javascript" type="text/javascript" src="https://vendors.bmtmicro.com/js/vendors.js"></script>
    <script language="javascript" type="text/javascript" src="https://vendors-new.bmtmicro.com/js/tablesort.js"></script>
    <script language="javascript" type="text/javascript" src="https://vendors-new.bmtmicro.com/js/calendar.js"></script>
    <style media="screen" type="text/css">
      #resultframe {
        height: calc(100vh - 275px);
      }
      select {
        letter-spacing: .5px;
        border: 1px solid #a9a9a9;
        border-radius: 3px;
        padding: .2rem;
        outline: none;
        background: #ffffff;
        color: #195a7c;
      }
      select:hover {
        cursor: pointer;
      }
      select:focus {
        border: 1px solid #195a7c;
      }
      th {
        min-width: 150px;
      }
      td {
        border-right: 1px solid #a9a9a9;
      }
      td[info] {
        border-right: none;
      }
      td[money] {
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
          form.NEXT_PAGE.value = "https://vendors-new.bmtmicro.com/transactions_print.html";
          form.ROWTEMPLATEURL.value = "https://vendors-new.bmtmicro.com/transactions_print_tablerow.html";
        } else {
          form.target = "";
          form.NEXT_PAGE.value = "https://vendors-new.bmtmicro.com/transactions.html";
          form.ROWTEMPLATEURL.value = "${param.ROWTEMPLATEURL}.";
        }
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
            <%@ include file="/includes/menuSidebar.html" %>
            <div class="col-lg-10 col-md-12 page-title">
              <h4>Manage&nbsp;Transfers</h4>
              <p>Transfers will be completed on vendor paydays.&nbsp;You may add or cancel transfers up until that date.</p>
              <div class="content-box">
                <iframe src="" name="tableframe" id="tableframe" frameborder="0" border="0" cellspacing="0" style="border-style: none;width: 100%; padding: 0px; margin:0px;" >
                   [Your user agent does not support frames or is currently configured not to display frames. In order to use this area, frames are required.]
                </iframe>
                <form name="transfers" method=post action="https://vendors-new.bmtmicro.com/servlets/Vendors.V2VTransfer" target="tableframe">
                   <input type="hidden" name="ACTION" value="-1" />
                   <input type="hidden" name="MAXAMOUNT" value="" />
                   <input type="hidden" name="ROWTEMPLATEURL" value="https://vendors-new.bmtmicro.com/v2v_tablerow.html" />
                   <input type="hidden" name="NEXT_PAGE" value="https://vendors-new.bmtmicro.com/v2vtransfers.html">
                   <input type="hidden" name="ERROR_PAGE" value="https://vendors-new.bmtmicro.com/error-div.jsp">
                </form>
                <iframe src="" name="resultframe" id="resultframe" frameborder="0" border="0" cellspacing="0" style="border-style: none; width: 100%; padding: 0px; margin: 10px 0px 0px 0px; display: none;">
                   [Your user agent does not support frames or is currently configured not to display frames. In order to use this area, frames are required.]
                </iframe>
              </div> <!-- end .content-box -->
            </div> <!-- end .col-lg-12 -->
          </div> <!-- end first .row -->
        </article>
      </div> <!-- end .container-fluid -->
      <%@ include file="/includes/footer.html" %>
    </div> <!-- end .main-raised -->
    <%@ include file="/includes/bootstrap_bottom_scripts.html" %>
  </body>
  <script>$(document).ready(function(){ submitToDiv (document.transfers, 'tableframe'); });</script>
</html>
