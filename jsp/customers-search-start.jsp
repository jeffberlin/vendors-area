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
    <style media="screen" type="text/css">
      #resultframe {
        height: calc(100vh - 275px);
      }
      #tableframe, #resultframe {
        min-height: 290px;
      }
      .input-search {
        width: 100%;
      }
      .save-btn {
        margin-bottom: .3rem;
      }
    </style>
    <script language="javascript" type="text/javascript">
      <!--
      function stripspaces(input) {
        input.value = input.value.replace(/\s/gi,"");
        return true;
      }

      function submitenter (myfield, e) {
        var keycode;
        if (window.event) keycode = window.event.keyCode;
        else if (e) keycode = e.which;
        else return true;
        if (keycode == 13) {
          myfield.form.submit();
          return false;
        } else {
          return true;
        }
      }

      function checkForm (form) {
        if (isBlank (form.FLT_ORDERID.value) && isBlank (form.FLT_PRODUCTNAME.value) && isBlank (form.FLT_NAME.value) && isBlank (form.FLT_ADDRESS.value) && isBlank (form.FLT_EMAIL.value))  {
          alert ("You must enter search criteria!");
          form.FLT_ORDERID.focus ();
          return (false);
        }
        return (true);
      }

      function editComments (orderid, itemnr) {
        if ((getCookieValue ("BMTMicro.Vendors.Flags") & 2) == 0) {
          alert ("You do not have permission to edit comments.");
          return (false);
        }
        document.getElementById('resultframe').style.display = "block";
        document.getElementById('tableframe').style.display = "none";
        var form = document.CommentsForm;
        form.ORDERID.value = orderid;
        form.ITEMNR.value = itemnr;
        form.submit();
        return (true);
      }

      function resendInfo (orderid, itemnr) {
        if ((getCookieValue ("BMTMicro.Vendors.Flags") & 4) == 0) {
          alert ("You do not have permission to resend information.");
          return (false);
        }
        document.getElementById('resultframe').style.display = "block";
        document.getElementById('tableframe').style.display = "none";
        var form = document.ResendInfoForm;
        form.ORDERID.value = orderid;
        form.ITEMNR.value = itemnr;
        form.submit();
        return (true);
      }

      function refund (orderid, itemnr) {
        if ((getCookieValue ("BMTMicro.Vendors.Flags") & 4) == 0) {
          alert ("You do not have permission to refund an order.");
          return (false);
        }
        document.getElementById('resultframe').style.display = "block";
        document.getElementById('tableframe').style.display = "none";
        var form = document.RefundItem;
        form.ORDERID.value = orderid;
        form.ITEMNR.value = itemnr;
        form.submit();
        return (true);
      }
      //-->
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
              <h4>Customer&nbsp;Search</h4>
              <p>Use fields below to enter search criteria.&nbsp;If email information has not changed since purchase you can resend the customer's email using the button provided.<br>You will be able to review the email before it is sent.</p>
              <div class="content-box overflow-auto">
                <div name="tableframe" id="tableframe">
                  <form method="get" name="customersearch" action="https://vendors-new.bmtmicro.com/servlets/Vendors.OrderSearch" onSubmit="return (checkForm (this));">
                    <input type="hidden" name="ROWTEMPLATEURL" value="${param.ROWTEMPLATEURL}" />
                    <input type="hidden" name="ACTION"  value="0">
                    <input type="hidden" name="NEXT_PAGE" value="https://vendors-new.bmtmicro.com/customers-search-start.jsp" />
                    <input type="hidden" name="ERROR_PAGE" value="https://vendors-new.bmtmicro.com/error.jsp" />
                    <div class="table-header">
                      <button type="submit" class="get-btn" value="Search for Customers">Search for Customers</button>
                    </div> <!-- end .table-header -->
                    <div class="row table-responsive" style="margin-left: auto; margin-right: auto;">
                      <table class="table" id="selection">
                        <thead>
                          <tr class="table-category">
                            <th scope="col" class="sort-column"></th>
                            <th scope="col" class="sort-column sortable sort text-center" title="Sort on 'Order ID'" number>
                              <a href="#" class="fdTableSortTrigger">Order&nbsp;ID</a>
                            </th>
                            <th scope="col" class="sort-column sortable sort text-center" title="Sort on 'Product Name'" text>
                              <a href="#" class="fdTableSortTrigger">Product&nbsp;Name</a>
                            </th>
                            <th scope="col" class="sort-column sortable sort text-center" title="Sort on 'Date'" date>
                              <a href="#" class="fdTableSortTrigger">Date</a>
                            </th>
                            <th scope="col" class="sort-column sortable sort text-center" title="Sort on 'Quantity'" number>
                              <a href="#" class="fdTableSortTrigger">Qty</a>
                            </th>
                            <th scope="col" class="sort-column sortable sort text-center" title="Sort on 'Vendor'" money>
                              <a href="#" class="fdTableSortTrigger">Due&nbsp;Vendor</a>
                            </th>
                            <th scope="col" class="sort-column text-center" text>
                              <a href="#" style="cursor: default;" onclick="return false;">Item&nbsp;Comments</a>
                            </th>
                            <th scope="col" class="sort-column sortable sort text-center" title="Sort on 'Company/Name'" info>
                              <a href="#" class="fdTableSortTrigger">Company/Name</a>
                            </th>
                            <th scope="col" class="sort-column sortable sort text-center" title="Sort on 'Address'" info>
                              <a href="#" class="fdTableSortTrigger">Address</a>
                            </th>
                            <th scope="col" class="sort-column sortable sort text-center" title="Sort on 'Phone'" text>
                              <a href="#" class="fdTableSortTrigger">Phone</a>
                            </th>
                            <th scope="col" class="sort-column sortable sort text-center" title="Sort on 'Email'" info>
                              <a href="#" class="fdTableSortTrigger">Email</a>
                            </th>
                          </tr>
                        </thead>
                        <tr>
                          <th style="text-align: left; color: #707070; letter-spacing: .5px; font-size: .9rem; font-weight: 300; border-bottom: 1px solid #dddddd;" colspan="12">Filter results using the fields below.</th>
                        </tr>
                        <tr id="input-tr">
                          <th></th>
                          <th number>
                            <input class="input-search" type="text" name="FLT_ORDERID" value="${param.FLT_ORDERID}" size="8" onkeydown="javascript:stripspaces(this)" placeholder="Search">
                          </th>
                          <th text>
                            <input class="input-search" type="text" name="FLT_PRODUCTNAME" value="${param.FLT_PRODUCTNAME}" size="10" placeholder="Search">
                          </th>
                          <th date></th>
                          <th number></th>
                          <th money></th>
                          <th info></th>
                          <th info>
                            <input class="input-search" type="text" name="FLT_NAME" value="${param.FLT_NAME}" size="14" placeholder="Search">
                          </th>
                          <th info>
                            <input class="input-search" type="text" name="FLT_ADDRESS" value="${param.FLT_ADDRESS}" size="14" placeholder="Search">
                          </th>
                          <th text></th>
                          <th info>
                            <input class="input-search" type="text" name="FLT_EMAIL" value="${param.FLT_EMAIL}" size="14" onkeydown="javascript:stripspaces(this)" placeholder="Search">
                          </th>
                        </tr>
                        <tbody>
                          <tr>
                            ${param.TABLEDATA}
                          </tr>
                        </tbody>
                        <tfoot>
                          <tr class="table-total">
                            <th scope="row" colspan="15">
                              <div id="pageselector">&nbsp;</div>
                            </th>
                          </tr>
                        </tfoot>
                      </table>
                    </div>
                  </form>
                  <div style="visibility:hidden;">
                    <form name="CommentsForm" action="https://vendors-new.bmtmicro.com/servlets/Vendors.OrderSearch" method="get" target="resultframe">
                      <input type="hidden" name="ORDERID" value="">
                      <input type="hidden" name="ITEMNR" value="">
                      <input type="hidden" name="ACTION"  value="1">
                      <input type="hidden" name="NEXT_PAGE" value="https://vendors-new.bmtmicro.com/customers-search-comments.html">
                      <input type="hidden" name="ERROR_PAGE" value="https://vendors-new.bmtmicro.com/error_frame.jsp" />
                    </form>
                  </div>
                  <div style="visibility:hidden;">
                    <form name="ResendInfoForm" action="https://vendors-new.bmtmicro.com/servlets/Vendors.OrderSearch" method="get" target="resultframe">
                      <input type="hidden" name="ORDERID" value="">
                      <input type="hidden" name="ITEMNR" value="">
                      <input type="hidden" name="ACTION"  value="2">
                      <input type="hidden" name="NEXT_PAGE" value="https://vendors-new.bmtmicro.com/customers-search-resend.html">
                      <input type="hidden" name="ERROR_PAGE" value="https://vendors-new.bmtmicro.com/error_frame.jsp" />
                    </form>
                  </div>
                  <div style="visibility:hidden;">
                    <form name="RefundItem" action="https://vendors-new.bmtmicro.com/servlets/Vendors.OrderSearch" method="get" target="resultframe">
                      <input type="hidden" name="ORDERID" value="">
                      <input type="hidden" name="ITEMNR" value="">
                      <input type="hidden" name="ACTION"  value="3">
                      <input type="hidden" name="NEXT_PAGE" value="https://vendors-new.bmtmicro.com/customers-search-refund.html">
                      <input type="hidden" name="ERROR_PAGE" value="https://vendors-new.bmtmicro.com/error_frame.jsp" />
                    </form>
                  </div>
                </div>
                <iframe src="" name="resultframe" id="resultframe" frameborder="0" border="0" cellspacing="0" style="border-style: none; width: 100%; padding: 0px; margin: 0px; display: none;" >
                   [Your user agent does not support frames or is currently configured not to display frames. In order to use this area, frames are required.]
                </iframe>
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
