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
    <link rel="stylesheet" href="https://vendors-new.bmtmicro.com/css/tabOptions.css"/>
    <script src="https://kit.fontawesome.com/35c40e6698.js"></script>
    <script language="javascript" type="text/javascript" src="https://secure.bmtmicro.com/Templates/util.js"></script>
    <script language="javascript" type="text/javascript" src="https://vendors-new.bmtmicro.com/js/vendors.js"></script>
    <script language="javascript" type="text/javascript" src="https://vendors-new.bmtmicro.com/js/calendar.js"></script>
    <style media="screen" type="text/css">
      #expiration a:hover {
        color: #efa900;
      }
      #expiration a {
        margin-left: 20px;
        margin-bottom: 1rem;
        text-decoration: underline !important;;
      }
    </style>
    <script language="javascript" type="text/javascript">
      <!--
        function setFieldVisible (field, visible) {
          document.getElementById (field).style.display = (visible === false) ? 'none' : '';
        }

        function CheckDateRangeAndAllowBlankDates (form) {
          if (isBlank (form.DATEFROM.value)) {
            return (isBlank (form.DATETO.value) || checkDate (form.DATETO));
          }
          if (isBlank (form.DATETO.value)) {
            return (isBlank (form.DATEFROM.value) || checkDate (form.DATEFROM));
          }
          return (CheckDateRange (form));
        }

        function initForm (form){
          // Important: We need to use hidden fields to submit checkbox values, as the servlets will use default values if the
          // field is not present. (An unchecked checkbox constitutes a non-existent field).
          initField (form, "ACTIVE_CHK",     "${param.ACTIVE}");
          initField (form, "STOPORDER_CHK",  "${param.STOPORDER}");
          initField (form, "FIRSTONLY_CHK",  "${param.FIRSTONLY}");
          initField (form, "FREESHIPPING_CHK","${param.FREESHIPPING}");
          initField (form, "ROUNDING",       "${param.ROUNDING}");
          initField (form, "DISCOUNTTYPE",   "${param.DISCOUNTTYPE}");
          initField (form, "QUALIFYINGTYPE", "${param.QUALIFYINGTYPE}");
          initField (form, "CURRENCY",       "${param.CURRENCY}");
          initField (form, "SCHEMETYPE",     "${param.SCHEMETYPE}");
          if (parseInt (form.MAXUSECOUNT.value) == 0) {
            form.MAXUSECOUNT.value = "";
          }
          setFieldVisible ("expiration", ${param.SCHEMETYPE} == 0);
          setFieldVisible ("expirationdays", ${param.SCHEMETYPE} != 1);
        }

        function submitForm (form) {
          // Important: We need to use hidden fields to submit checkbox values, as the servlets will use default values if the
          // field is not present. (An unchecked checkbox constitutes a non-existent field).
          copyField (form, "ACTIVE", "ACTIVE_CHK");
          copyField (form, "STOPORDER", "STOPORDER_CHK");
          copyField (form, "FIRSTONLY", "FIRSTONLY_CHK");
          copyField (form, "FREESHIPPING", "FREESHIPPING_CHK");
          form.NAME.value = trim (form.NAME.value);

          if (isBlank (form.NAME.value)) {
            alert ("You must name the discount scheme!");
            form.NAME.focus ();
            return (false);
          }
          if ((form.NAME.value != "${param.NAME}") && ("${param.NAMELIST}".split ("\t").indexOf (form.NAME.value) != -1)) {
            alert ("A discount scheme with that name already exists!");
            form.NAME.focus ();
            return (false);
          }
          if (queryField (form, "SCHEMETYPE") == "1"){
            form.EXPIRATIONDAYS.value = "";
          } else if (!isBlank (form.EXPIRATIONDAYS.value)) {
            var days = parseInt (form.EXPIRATIONDAYS.value);
            if ((days < 1) || (days > 999)) {
              alert ("Please enter a valid number of days (1-999) or leave this field blank.");
              form.EXPIRATIONDAYS.focus ();
              return (false);
            }
          }
          if (!CheckDateRangeAndAllowBlankDates (form)) {
            return (false);
          }
          switch (parseInt (queryField (form, "DISCOUNTTYPE"))) {
            case 0: // Percent off
            case 3: // Percent off full price
            if (form.AMOUNT.value > 100) {
              alert ("Percentage out of range. (Must be between 0 and 100%)");
              form.AMOUNT.focus ();
              return (false);
            }
            break;
          }
          if (form.AMOUNT.value < 0) {
            alert ("Value out of range. (Must not be negative)");
            form.AMOUNT.focus ();
            return (false);
          }
          if (form.QUALIFYINGQUANTITY.value <= 0) {
            alert ("Value out of range. (Must not be smaller than one)");
            form.QUALIFYINGQUANTITY.focus ();
            return (false);
          }
          if (form.MAXUSECOUNT.value < 0) {
            alert ("Value out of range. (Must not be negative)");
            form.QUALIFYINGQUANTITY.focus ();
            return (false);
          }
          form.SELECTEDPRODUCTS.value = getCommaSeparatedSelectorValues (form.SELECTEDLIST);
          form.submit ();
          return (true);
        }
      //-->
    </script>
  </head>
  <body onload="initForm (document.discform);">
    <!-- Blue background header -->
    <div class="blue-bg"></div>

    <!-- Start of body content -->
    <div class="main-raised">
      <div class="container-fluid body-content">
        <article class="section">
          <div class="row justify-content-start">
            <%@ include file="/includes/menuSidebar.html" %>
            <div class="col-lg-10 col-md-12 page-title">
              <h4>Discount&nbsp;Settings</h4>
              <ul class="nav nav-tabs" id="myTab" role="tablist">
                <li class="nav-item">
                  <a class="nav-link active" id="name-tab" data-toggle="tab" href="#nameTab" role="tab" aria-controls="name" aria-selected="true">
                    Name
                  </a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" id="type-tab" data-toggle="tab" href="#type" role="tab" aria-controls="discount type" aria-selected="true">
                    Discount Type
                  </a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" id="amount-tab" data-toggle="tab" href="#amountTab" role="tab" aria-controls="amount" aria-selected="true">
                    Amount
                  </a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" id="expiration-tab" data-toggle="tab" href="#expirationSettings" role="tab" aria-controls="expiration settings" aria-selected="true">
                    Expiration
                  </a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" id="quantity-tab" data-toggle="tab" href="#quantity" role="tab" aria-controls="quantity" aria-selected="true">
                    Quantity
                  </a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" id="products-tab" data-toggle="tab" href="#products" role="tab" aria-controls="discounted products" aria-selected="true">
                    Products
                  </a>
                </li>
              </ul>
              <div class="content-box">
                <form method="post" name="discform" action="https://vendors-new.bmtmicro.com/servlets/Vendors.DiscountSchemes">
                  <input type="hidden" name="NEXT_PAGE" value="https://vendors-new.bmtmicro.com/discountsstart.html" />
                  <input type="hidden" name="ERROR_PAGE" value="https://vendors-new.bmtmicro.com/error.html" />
                  <input type="hidden" name="SCHEMEID" value="${param.SCHEMEID}" />
                  <input type="hidden" name="ACTION" value="10" />
                  <div class="tab-content" id="myTabContent">
                    <div class="tab-pane fade show active" id="nameTab" role="tabpanel" aria-labelledby="name-tab">
                      <p>Discount scheme name will not be seen by your customers.</p>
                      <span>
                        <label>Name:&nbsp;</label>
                        <input id="NAME" name="NAME" maxlength="80" value="${param.NAME}" type="text" style="margin-bottom: 2rem;">
                        &nbsp;&nbsp;
                        <input type="hidden" name="ACTIVE" value="${param.ACTIVE}" />
                        <input name="ACTIVE_CHK" value="-1" type="checkbox">&nbsp;Active
                      </span>
                      <br>
                      <button id="toDiscountType" class="save-btn" type="button">Next</button>
                    </div> <!-- end .tab-pane -->
                    <div class="tab-pane fade" id="type" role="tabpanel" aria-labelledby="type-tab">
                      <h5>Discount&nbsp;Type</h5>
                      <p>Choose&nbsp;discount&nbsp;type.</p>
                      <span>
                        <input type="radio" name="SCHEMETYPE" value="0" onclick="setFieldVisible('expiration',true); setFieldVisible('expirationdays',true);" style="margin-bottom: 1rem;">&nbsp;Codes required (customer needs to enter a discount code)
                      </span>
                      <br>
                      <div id="expiration" style="display: none;">
                        <a href="#" onclick="setFieldVisible('maxuse', true);">Limit number of uses</a>&nbsp;
                        <div id="maxuse" style="display: none;">
                          <span>
                            This code can be used
                            <input name="MAXUSECOUNT" size="3" value="${param.MAXUSECOUNT}" />&nbsp;times
                          </span>
                        </div>
                        <br>
                        <span>
                          <input type="hidden" name="STOPORDER" value="${param.STOPORDER}" />
                          <input type="checkbox" name="STOPORDER_CHK" value="-1" style="margin-bottom: 1rem; margin-top: 1rem;">&nbsp;Stop order if code cannot be used
                        </span>
                      </div>
                      <span>
                        <input type="radio" name="SCHEMETYPE" value="1" onclick="setFieldVisible('expiration',false); setFieldVisible('expirationdays',false);" style="margin-bottom: 1rem;">&nbsp;Automatic discount (no codes required, all customers will get the discount)
                      </span>
                      <br>
                      <span>
                        <input type="radio" name="SCHEMETYPE" value="2" onclick="setFieldVisible('expiration', false); setFieldVisible('expirationdays',true);" style="margin-bottom: 2rem;">&nbsp;Recurring billing (automatic discount on subscriptions)
                      </span>
                      <br>
                      <button id="backToNameTab" class="save-btn" type="button" style="margin-right: .2rem;">Previous</button>
                      <button id="toAmount" class="save-btn" type="button">Next</button>
                    </div> <!-- end .tab-pane -->
                    <div class="tab-pane fade" id="amountTab" role="tabpanel" aria-labelledby="amount-tab">
                      <h5>Amount</h5>
                      <span>
                        <label>Amount:&nbsp;</label>
                        <input id="AMOUNT" name="AMOUNT" type="text" value="${param.AMOUNT}" style="margin-bottom: 1rem;" />
                      </span>
                      <br>
                      <span>
                        <label>Method:&nbsp;</label>
                        <select name="DISCOUNTTYPE" style="margin-bottom: 1rem;">
                          <option value="0" selected="selected">Percent Off</option>
                          <option value="1">Amount Off</option>
                          <option value="2">Set New Price</option>
                          <option value="3">Percent Off Full Price</option>
                          <option value="4">Amount Off Full Price</option>
                        </select>
                      </span>
                      <br clear="all">
                      <span>
                        <label>Currency:&nbsp;</label>
                        <select name="CURRENCY" style="margin-bottom: 1rem;">
                          <option value="" selected>All Currencies</option>
                          <option value="USD">USD</option>
                          <option value="EUR">EUR</option>
                          <option value="GBP">GBP</option>
                          <option value="CAD">CAD</option>
                          <option value="AUD">AUD</option>
                        </select>
                      </span>
                      <br>
                      <span>
                        <label>Rounding:&nbsp;</label>
                        <select name="ROUNDING" style="margin-bottom: 1rem;">
                          <option value="-1.00">Round discount to nearest 1.00</option>
                          <option value="-0.50">Round discount to nearest 0.50</option>
                          <option value="-0.25">Round discount to nearest 0.25</option>
                          <option value="-0.10">Round discount to nearest 0.10</option>
                          <option value="-0.05">Round discount to nearest 0.05</option>
                          <option value="0.00" selected="selected">No Rounding</option>
                          <option value="0.05">Round price to nearest 0.05</option>
                          <option value="0.10">Round price to nearest 0.10</option>
                          <option value="0.25">Round price to nearest 0.25</option>
                          <option value="0.50">Round price to nearest 0.50</option>
                          <option value="1.00">Round price to nearest 1.00</option>
                        </select>
                      </span>
                      <br clear="all">
                      <span>
                        <input type="hidden" name="FREESHIPPING" value="${param.FREESHIPPING}" />
                        <input type="checkbox" name="FREESHIPPING_CHK" value="-1" style="margin-bottom: 2rem;">&nbsp;Free shipping
                      </span>
                      <br>
                      <button id="backToType" class="save-btn" type="button" style="margin-right: .2rem;">Previous</button>
                      <button id="toExpiration" class="save-btn" type="button">Next</button>
                    </div> <!-- end .tab-pane -->
                    <div class="tab-pane fade" id="expirationSettings" role="tabpanel" aria-labelledby="expiration-tab">
                      <h5>Expiration&nbsp;Settings</h5>
                      <p>Set date range for scheme to apply, or leave blank for no automatic expiration.</p>
                      <span>
                        <label>Date&nbsp;Start:&nbsp;</label>
                        <input id="DATEFROM" name="DATEFROM" value="${param.DATEFROM}" type="text" style="max-width: 150px; margin-bottom: 1rem;">
                        <img src='<c:url value="/images/cal.gif"></c:url>' width="16" height="16" border="0" alt="Click Here to Pick up the date" onclick="show_calendar ('DATEFROM'); return (false);" onmouseover="this.style.cursor='pointer';" style="margin-right: .5rem;"/>
                      </span>
                      <br>
                      <span>
                        <label>Date&nbsp;End:&nbsp;</label>
                        <input id="DATETO" name="DATETO" value="${param.DATETO}" type="text" style="max-width: 150px; margin-bottom: 1rem;">
                        <img src='<c:url value="/images/cal.gif"></c:url>' width="16" height="16" border="0" alt="Click Here to Pick up the date" onclick="show_calendar ('DATETO'); return (false);"  onmouseover="this.style.cursor='pointer';" />
                      </span>
                      <div id="expirationdays" style="display: none;">
                        <span>
                          Discount&nbsp;ends&nbsp;<input name="EXPIRATIONDAYS" size="3" value="${param.EXPIRATIONDAYS}" maxlength="3" style="margin-bottom: .2rem;" />&nbsp;days from date of issue.
                        </span>
                        <br clear="all">
                        <p style="font-size: .9rem; font-style: italic;">
                          The date of issue is the date when the code was manually generated, or the originating order date in case of automatically issued codes or recurring billing.
                        </p>
                      </div> <!-- end #expirationdays -->
                      <br>
                      <button id="backToAmount" class="save-btn" type="button" style="margin-right: .2rem;">Previous</button>
                      <button id="toQuantity" class="save-btn" type="button">Next</button>
                    </div> <!-- end .tab-pane -->
                    <div class="tab-pane fade" id="quantity" role="tabpanel" aria-labelledby="quantity-tab">
                      <h5>Quantity</h5>
                      <p>Set minimum quantity required before discount applied. If none, leave blank.</p>
                      <span>
                        <label>Minimum&nbsp;Quantity:&nbsp;</label>
                        <input id="QUALIFYINGQUANTITY" name="QUALIFYINGQUANTITY" value="${param.QUALIFYINGQUANTITY}" type="text" style="max-width: 75px;">
                        <select name="QUALIFYINGTYPE">
                          <option value="0">Items</option>
                          <option value="1">Amount</option>
                          <option value="2">Unique Items</option>
                        </select>
                      </span>
                      <br clear="all">
                      <p style="font-size: .9rem; font-style: italic;">
                        Discount amounts are applied to <strong>each item</strong>, not the order total. Checking the box below will limit the discount to one item in the order only. However, note that this setting has no effect on the Free shipping option. When Free shipping is enabled, all items will get free shipping regardless of this setting.
                      </p>
                      <span>
                        <input type="hidden" name="FIRSTONLY" value="${param.FIRSTONLY}" />
                        <input type="checkbox" name="FIRSTONLY_CHK" value="-1" checked style="margin-bottom: 2rem;">&nbsp;Discount allowed on one item only
                      </span>
                      <br>
                      <button id="backToExpiration" class="save-btn" type="button" style="margin-right: .2rem;">Previous</button>
                      <button id="toProducts" class="save-btn" type="button">Next</button>
                    </div> <!-- end .tab-pane -->
                    <div class="tab-pane fade" id="products" role="tabpanel" aria-labelledby="products-tab">
                      <h5>Discounted&nbsp;Products</h5>
                      <p>Select products eligible for discount under this discount scheme. Selected products are listed in the bottom text area.</p>
                      <select id="PRODUCTLIST" name="PRODUCTLIST" multiple="multiple" ondblclick="addProduct (discform);return (false);" style="min-width: 500px; margin-bottom: 1rem;">
                         ${param.PRODUCTLIST}
                      </select>
                      <br>
                      <div class="move">
                        <button style="margin-right: 5px;" type="button" name="add" value="Add&nbsp;&gt;&gt;"  onclick="addProduct (discform);">Add&nbsp;<i class="fas fa-angle-down"></i></button>
                        <button style="margin-right: 25px;" type="button" name="remove" value="&lt;&lt;&nbsp;Remove" onclick="removeProduct (discform);"><i class="fas fa-angle-up"></i>&nbsp;Remove</button>
                        <button style="margin-right: 5px;" type="button" name="addall" value="Add&nbsp;&gt;&gt;" onclick="addAllProducts (discform);">Add&nbsp;All&nbsp;<i class="fas fa-angle-down"></i></button>
                        <button type="button" name="removeall" value="&lt;&lt;&nbsp;Remove" onclick="removeAllProducts (discform);"><i class="fas fa-angle-up"></i>&nbsp;Remove&nbsp;All</button>
                      </div>
                      <select id="SELECTEDLIST" name="SELECTEDLIST" multiple="multiple" ondblclick="removeProduct (discform);return (false);" style="min-width: 500px; margin-bottom: 2rem;">
                         ${param.SELECTEDPRODUCTS}
                      </select>
                      <input type="hidden" name="SELECTEDPRODUCTS" value="" />
                      <br>
                      <button id="backToQuantity" class="save-btn" type="button" style="margin-right: .2rem;">Previous</button>
                      <button class="save-btn" type="button" onclick="return (submitForm (discform));">Save</button>
                    </div> <!-- end .tab-pane -->
                  </div> <!-- end .tab-content -->
                </form>
              </div> <!-- end .content-box -->
            </div> <!-- end .col-lg-10 -->
          </div> <!-- end .row justify-content-start -->
        </article>
      </div> <!-- end .container-fluid -->
      <%@ include file="/includes/footer.html" %>
    </div> <!-- end .main-raised -->
    <%@ include file="/includes/bootstrap_bottom_scripts.html" %>
    <script type="text/javascript">
      // Handles the 'Next'/'Previous' buttons for tabs
      // 'Next' to Discount Type
      $("#toDiscountType").click(function(){
        $("#type-tab").tab('show');
        $("#type-tab").addClass('active');
        $("#name-tab").removeClass('active');
      });
      // 'Previous' to Name
      $("#backToNameTab").click(function(){
        $("#name-tab").tab('show');
        $("#name-tab").addClass('active');
        $("#type-tab").removeClass('active');
      });
      // 'Next' to Amount
      $("#toAmount").click(function(){
        $("#amount-tab").tab('show');
        $("#amount-tab").addClass('active');
        $("#type-tab").removeClass('active');
      });
      // 'Previous' to Discount Type
      $("#backToType").click(function(){
        $("#type-tab").tab('show');
        $("#type-tab").addClass('active');
        $("#amount-tab").removeClass('active');
      });
      // 'Next' to Expiration Settings
      $("#toExpiration").click(function(){
        $("#expiration-tab").tab('show');
        $("#expiration-tab").addClass('active');
        $("#amount-tab").removeClass('active');
      });
      // 'Previous' to Amount
      $("#backToAmount").click(function(){
        $("#amount-tab").tab('show');
        $("#amount-tab").addClass('active');
        $("#expiration-tab").removeClass('active');
      });
      // 'Next' to Quantity
      $("#toQuantity").click(function(){
        $("#quantity-tab").tab('show');
        $("#quantity-tab").addClass('active');
        $("#expiration-tab").removeClass('active');
      });
      // 'Previous' to Expiration Settings
      $("#backToExpiration").click(function(){
        $("#expiration-tab").tab('show');
        $("#expiration-tab").addClass('active');
        $("#quantity-tab").removeClass('active');
      });
      // 'Next' to Discounted Products
      $("#toProducts").click(function(){
        $("#products-tab").tab('show');
        $("#products-tab").addClass('active');
        $("#quantity-tab").removeClass('active');
      });
      // 'Previous' to Expiration Settings
      $("#backToQuantity").click(function(){
        $("#quantity-tab").tab('show');
        $("#quantity-tab").addClass('active');
        $("#products-tab").removeClass('active');
      });
    </script>
  </body>
</html>