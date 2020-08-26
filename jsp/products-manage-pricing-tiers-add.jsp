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
		<script src="https://secure.bmtmicro.com/Templates/util.js"></script>
		<script src="https://vendors-new.bmtmicro.com/js/vendors.js"></script>
    <script>
      function addQualifyingProduct (form) {
        moveSelectedListItems (form.QUALIFYINGSELECTEDLIST, form.QUALIFYINGPRODUCTLIST);
      }

      function removeQualifyingProduct (form) {
        moveSelectedListItems (form.QUALIFYINGPRODUCTLIST, form.QUALIFYINGSELECTEDLIST);
      }

      function addAllQualifyingProducts (form) {
        moveAllListItems (form.QUALIFYINGSELECTEDLIST, form.QUALIFYINGPRODUCTLIST);
      }

      function removeAllQualifyingProducts (form) {
        moveAllListItems (form.QUALIFYINGPRODUCTLIST, form.QUALIFYINGSELECTEDLIST);
      }

      function addDiscountProduct (form) {
        moveSelectedListItems (form.DISCOUNTSELECTEDLIST, form.DISCOUNTPRODUCTLIST);
      }

      function removeDiscountProduct (form) {
        moveSelectedListItems (form.DISCOUNTPRODUCTLIST, form.DISCOUNTSELECTEDLIST);
      }

      function addAllDiscountProducts (form) {
        moveAllListItems (form.DISCOUNTSELECTEDLIST, form.DISCOUNTPRODUCTLIST);
      }

      function removeAllDiscountProducts (form) {
        moveAllListItems (form.DISCOUNTPRODUCTLIST, form.DISCOUNTSELECTEDLIST);
      }

      // function initForm (form){
        // Important: We need to use hidden fields to submit checkbox values, as the servlets will use default values if the
        // field is not present. (An unchecked checkbox constitutes a non-existent field).
        // initField (form, "ACTIVE_CHK",     "##ACTIVE##");
        // initField (form, "SHOWINCART_CHK", "##SHOWINCART##");
        // initField (form, "ROUNDING",       "##ROUNDING##");
        // initField (form, "DISCOUNTTYPE",   "##DISCOUNTTYPE##");
        // initField (form, "QUALIFYINGTYPE", "##QUALIFYINGTYPE##");
        // initField (form, "APPLYTYPE",      "##APPLYTYPE##");
        // initField (form, "CURRENCY",       "##CURRENCY##");
        // initField (form, "RUNLEVEL",       "##RUNLEVEL##");
        // initField (form, "APPLYORDER",     "##APPLYORDER##");
      // }

      function submitForm (form) {
        // Important: We need to use hidden fields to submit checkbox values, as the servlets will use default values if the
        // field is not present. (An unchecked checkbox constitutes a non-existent field).
        // copyField (form, "ACTIVE",     "ACTIVE_CHK");
        // copyField (form, "SHOWINCART", "SHOWINCART_CHK");
        form.NAME.value = trim (form.NAME.value);

        if (isBlank (form.NAME.value)) {
          alert ("You must name the pricing tier!");
          form.NAME.focus ();
          return (false);
        }
        if ((form.NAME.value != "${param.NAME}") && ("${param.NAMELIST}".split ("\t").indexOf (form.NAME.value) != -1)) {
          alert ("A pricing tier with that name already exists!");
          form.NAME.focus ();
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
        form.QUALIFYINGPRODUCTS.value = getCommaSeparatedSelectorValues (form.QUALIFYINGSELECTEDLIST);
        form.DISCOUNTPRODUCTS.value   = getCommaSeparatedSelectorValues (form.DISCOUNTSELECTEDLIST);
        form.submit ();
        return (true);
      }
    </script>
  </head>
  <body>
    <!-- Blue background header -->
    <div class="blue-bg"></div>
    <!-- Start of the body -->
    <div class="main-raised">
      <div class="container-fluid body-content">
        <article class="section">
          <div class="row justify-content-start">
            <jsp:include page="includes/menuSidebar.jsp" />
            <div class="col-lg-10 col-md-12 page-title">
              <h4>Tiers&nbsp;Settings</h4>
              <ul class="nav nav-tabs" id="myTab" role="tablist">
                <li class="nav-item">
                  <a class="nav-link active" id="basic-tab" data-toggle="tab" href="#basicTab" role="tab" aria-controls="basic information" aria-selected="true">
                    Basic Info
                  </a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" id="amount-tab" data-toggle="tab" href="#amountTab" role="tab" aria-controls="amount" aria-selected="true">
                    Amount
                  </a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" id="quantity-tab" data-toggle="tab" href="#quantityTab" role="tab" aria-controls="quantity" aria-selected="true">
                    Quantity
                  </a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" id="qualifying-tab" data-toggle="tab" href="#qualifyingTab" role="tab" aria-controls="qualifying products" aria-selected="true">
                    Qualifying Products
                  </a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" id="discounted-tab" data-toggle="tab" href="#discountedTab" role="tab" aria-controls="discounted products" aria-selected="true">
                    Discounted Products
                  </a>
                </li>
              </ul>
              <div class="tab-box">
                <form method="post" name="tierform" action="https://vendors-new.bmtmicro.com/servlets/Vendors.TieredPricing">
                  <input type="hidden" name="NEXT_PAGE" value="https://vendors-new.bmtmicro.com/products-manage-pricing-tiers.jsp" />
                  <input type="hidden" name="ERROR_PAGE" value="https://vendors-new.bmtmicro.com/error.jsp" />
                  <input type="hidden" name="TIERID" value="${param.TIERID}" />
                  <input type="hidden" name="ACTION" value="10" />
                  <div class="tab-content" id="myTabContent">
                    <div class="tab-pane fade show active" id="basicTab" role="tabpanel" aria-labelledby="basic-tab">
                      <h5>Basic Information</h5>
                      <p>Enter primary tier settings in fields below.</p>
                      <span>
                        <label>Name:&nbsp;</label>
                        <input type="text" id="NAME" name="NAME" maxlength="80" value="${param.NAME}" style="margin-bottom: 2rem;"/>
                        &nbsp;&nbsp;
                        <input type="hidden" name="ACTIVE" value="${param.ACTIVE}" />
                        <input type="checkbox"<c:if test="${param.ACTIVE!=0}"> checked</c:if>/>&nbsp;Active
                        &nbsp;&nbsp;
                        <input type="hidden" name="SHOWINCART" value="${param.SHOWINCART}" />
                        <input type="checkbox"<c:if test="${param.SHOWINCART!=0}"> checked</c:if>/>&nbsp;Show in Cart
                      </span>
                      <br>
                      <button id="toAmount" class="save-btn" type="button">Next</button>
                    </div> <!-- end .tab-pane -->
                    <div class="tab-pane fade" id="amountTab" role="tabpanel" aria-labelledby="amount-tab">
                      <h5>Amount</h5>
                      <p>Set amount or percentage off of full or discounted price.</p>
                      <span>
                        <label>Amount:&nbsp;</label>
                        <input id="AMOUNT" name="AMOUNT" type="text" value="${param.AMOUNT}" style="margin-bottom: 1rem;"/>
                      </span>
                      <br>
                      <span>
                        <label>Method:&nbsp;</label>
                        <select name="DISCOUNTTYPE" style="margin-bottom: 1rem;">
                          <option value="0"<c:if test="${param.DISCOUNTTYPE=='0'}"> selected</c:if>>Percent Off</option>
                          <option value="1"<c:if test="${param.DISCOUNTTYPE=='1'}"> selected</c:if>>Amount Off</option>
                          <option value="2"<c:if test="${param.DISCOUNTTYPE=='2'}"> selected</c:if>>Set New Price</option>
                          <option value="3"<c:if test="${param.DISCOUNTTYPE=='3'}"> selected</c:if>>Percent Off Full Price</option>
                          <option value="4"<c:if test="${param.DISCOUNTTYPE=='4'}"> selected</c:if>>Amount Off Full Price</option>
                        </select>
                      </span>
                      <br clear="all">
                      <span>
                        <label>Currency:&nbsp;</label>
                        <select name="CURRENCY" style="margin-bottom: 1rem;">
                          <option value=""<c:if test="${param.CURRENCY==''}"> selected</c:if>>All Currencies</option>
                          <option value="USD"<c:if test="${param.CURRENCY=='USD'}"> selected</c:if>>USD</option>
                          <option value="EUR"<c:if test="${param.CURRENCY=='EUR'}"> selected</c:if>>EUR</option>
                          <option value="GBP"<c:if test="${param.CURRENCY=='GBP'}"> selected</c:if>>GBP</option>
                          <option value="CAD"<c:if test="${param.CURRENCY=='CAD'}"> selected</c:if>>CAD</option>
                          <option value="AUD"<c:if test="${param.CURRENCY=='AUD'}"> selected</c:if>>AUD</option>
                        </select>
                      </span>
                      <br>
                      <span>
                        <label>Rounding:&nbsp;</label>
                        <select name="ROUNDING">
                          <option value="-1.00"<c:if test="${param.ROUNDING=='-1.00'}"> selected</c:if>>Round discount</option>
                          <option value="1.00"<c:if test="${param.ROUNDING=='1.00'}"> selected</c:if>>Round price</option>
                          <option value="0.00"<c:if test="${param.ROUNDING=='0.00'}"> selected</c:if>>No Rounding</option>
                        </select>
                        &nbsp;to nearest&nbsp;
                        <select name="ROUNDING" style="margin-bottom: 2rem;">
                          <option value="0.05"<c:if test="${param.ROUNDING=='0.05'}"> selected</c:if>>0.05</option>
                          <option value="0.10"<c:if test="${param.ROUNDING=='0.10'}"> selected</c:if>>0.10</option>
                          <option value="0.25"<c:if test="${param.ROUNDING=='0.25'}"> selected</c:if>>0.25</option>
                          <option value="0.50"<c:if test="${param.ROUNDING=='0.50'}"> selected</c:if>>0.50</option>
                          <option value="1.00"<c:if test="${param.ROUNDING=='1.00'}"> selected</c:if>>1.00</option>
                        </select>
                      </span>
                      <br>
                      <button id="backToBasic" class="save-btn" type="button" style="margin-right: .2rem;">Previous</button>
                      <button id="toQuantity" class="save-btn" type="button">Next</button>
                    </div> <!-- end .tab-pane -->
                    <div class="tab-pane fade" id="quantityTab" role="tabpanel" aria-labelledby="quantity-tab">
                      <h5>Quantity</h5>
                      <p>To apply to all but 1 enter -1 in the discounted quantity field.</p>
                      <span>
                        <label>Minimum&nbsp;purchase:&nbsp;</label>
                        <input type="text" id="QUALIFYINGQUANTITY" name="QUALIFYINGQUANTITY" value="${param.QUALIFYINGQUANTITY}"  style="max-width: 75px; margin-bottom: 1rem;" />
                        <select name="QUALIFYINGTYPE">
                          <option value="0"<c:if test="${param.QUALIFYINGTYPE=='0'}"> selected</c:if>>Items</option>
                          <option value="1"<c:if test="${param.QUALIFYINGTYPE=='1'}"> selected</c:if>>Amount</option>
                          <option value="2"<c:if test="${param.QUALIFYINGTYPE=='2'}"> selected</c:if>>Unique Items</option>
                        </select>
                      </span>
                      <br>
                      <span>
                        <label>Discounted&nbsp;Quantity:&nbsp;</label>
                        <input type="text" id="DISCOUNTQUANTITY" name="DISCOUNTQUANTITY" value="${param.DISCOUNTQUANTITY}" style="margin-bottom: 1rem;"/>
                        <select name="APPLYTYPE">
                          <option value="0"<c:if test="${param.APPLYTYPE=='0'}"> selected</c:if>>Items</option>
                          <option value="2"<c:if test="${param.APPLYTYPE=='2'}"> selected</c:if>>Unique Items</option>
                        </select>
                      </span>
                      <br>
                      <span>
                        <label>Apply&nbsp;Order:&nbsp;</label>
                        <select name="APPLYORDER" style="margin-bottom: 1rem;">
                          <option value="0"<c:if test="${param.APPLYORDER=='0'}"> selected</c:if>>By Row Number</option>
                          <option value="1"<c:if test="${param.APPLYORDER=='1'}"> selected</c:if>>By Lowest Price</option>
                          <option value="2"<c:if test="${param.APPLYORDER=='2'}"> selected</c:if>>By Highest Price</option>
                        </select>
                      </span>
                      <br>
                      <span>
                        <label>Tier&nbsp;Level:&nbsp;</label>
                        <select name="RUNLEVEL" style="margin-bottom: 2rem;">
                          <option value="0"<c:if test="${param.RUNLEVEL=='0'}"> selected</c:if>>0</option>
                          <option value="1"<c:if test="${param.RUNLEVEL=='1'}"> selected</c:if>>1</option>
                          <option value="2"<c:if test="${param.RUNLEVEL=='2'}"> selected</c:if>>2</option>
                          <option value="3"<c:if test="${param.RUNLEVEL=='3'}"> selected</c:if>>3</option>
                          <option value="4"<c:if test="${param.RUNLEVEL=='4'}"> selected</c:if>>4</option>
                        </select>
                      </span>
                      <br>
                      <button id="backToAmount" class="save-btn" type="button" style="margin-right: .2rem;">Previous</button>
                      <button id="toQualifying" class="save-btn" type="button">Next</button>
                    </div> <!-- end .tab-pane -->
                    <div class="tab-pane fade" id="qualifyingTab" role="tabpanel" aria-labelledby="qualifying-tab">
                      <h5>Qualifying&nbsp;products</h5>
                      <p>Choose Qualifying products necessary to apply this tier.</p>
                      <select id="PRODUCTLIST" name="QUALIFYINGPRODUCTLIST" multiple="multiple" ondblclick="addQualifyingProduct(tierform);return (false);"  style="min-width: 500px; height: 100px; margin-bottom: 1rem;">
                         ${param.QUALIFYINGPRODUCTLIST}
                      </select>
                      <br>
                      <div class="move">
                        <button style="margin-right: 5px;" name="Add" value="Add&nbsp;&gt;&gt;" onclick="addQualifyingProduct(tierform);return (false);">Add&nbsp;<i class="fas fa-angle-down"></i></button>
                        <button style="margin-right: 25px;" name="Remove" value="&lt;&lt;&nbsp;Remove" onclick="removeQualifyingProduct(tierform);return (false);"><i class="fas fa-angle-up"></i>&nbsp;Remove</button>
                        <button style="margin-right: 5px;" name="Add" value="Add&nbsp;&gt;&gt;" onclick="addAllQualifyingProducts(tierform);return (false);">Add&nbsp;All&nbsp;<i class="fas fa-angle-down"></i></button>
                        <button name="Remove" value="&lt;&lt;&nbsp;Remove" onclick="removeAllQualifyingProducts(tierform);return (false);"><i class="fas fa-angle-up"></i>&nbsp;Remove&nbsp;All</button>
                      </div> <!-- end .move -->
                      <select id="SELECTEDLIST" name="QUALIFYINGSELECTEDLIST" multiple="multiple" ondblclick="removeQualifyingProduct (tierform);return (false);" style="min-width: 500px; height: 100px; margin-bottom: 2rem;" >
                         ${param.QUALIFYINGPRODUCTS}
                      </select>
                      <input type="hidden" name="QUALIFYINGPRODUCTS" />
                      <br>
                      <button id="backToQuantity" class="save-btn" type="button" style="margin-right: .2rem;">Previous</button>
                      <button id="toDiscounted" class="save-btn" type="button">Next</button>
                    </div> <!-- end .tab-pane -->
                    <div class="tab-pane fade" id="discountedTab" role="tabpanel" aria-labelledby="discounted-tab">
                      <h5>Discounted&nbsp;Products</h5>
                      <p>Choose Products to which discount will be applied.</p>
                      <select id="PRODUCTLIST" name="DISCOUNTPRODUCTLIST" multiple="multiple" ondblclick="addDiscountProduct(tierform);return (false);" style="min-width: 500px; height: 100px; margin-bottom: 1rem;" >
                         ${param.DISCOUNTPRODUCTLIST}
                      </select>
                      <div class="move">
                        <button style="margin-right: 5px;" name="Add" value="Add&nbsp;&gt;&gt;" onclick="addDiscountProduct (tierform);return (false);">Add&nbsp;<i class="fas fa-angle-down"></i></button>
                        <button style="margin-right: 25px;" name="Remove" value="&lt;&lt;&nbsp;Remove" onclick="removeDiscountProduct (tierform);return (false);"><i class="fas fa-angle-up"></i>&nbsp;Remove</button>
                        <button style="margin-right: 5px;" name="Add" value="Add&nbsp;&gt;&gt;" onclick="addAllDiscountProducts (tierform);return (false);">Add&nbsp;All&nbsp;<i class="fas fa-angle-down"></i></button>
                        <button name="Remove" value="&lt;&lt;&nbsp;Remove" onclick="removeAllDiscountProducts (tierform);return (false);"><i class="fas fa-angle-up"></i>&nbsp;Remove&nbsp;All</button>
                      </div>
                      <select id="SELECTEDLIST" name="DISCOUNTSELECTEDLIST" multiple="multiple" ondblclick="removeDiscountProduct (tierform);return (false);" style="min-width: 500px; height: 100px; margin-bottom: 2rem;">
                         ${param.DISCOUNTPRODUCTS}
                      </select>
                      <input type="hidden" name="DISCOUNTPRODUCTS" />
                      <div class="controlbuttons">
                        <button id="backToQualifying" class="save-btn" type="button" style="margin-right: .2rem;">Previous</button>
                        <button class="save-btn" type="button" onclick="submitForm (tierform);" value="Save" style="margin-right: .5rem;">Save</button>
                        <button class="save-btn" type="reset" onclick="history.back ();" value="Reset">Reset</button>
                      </div>
                    </div> <!-- end .tab-pane -->
                  </div> <!-- end .tab-content -->
                </div> <!-- end .tab-box -->
              </form>
            </div> <!-- end .col-lg-10 -->
          </div> <!-- end first .row justify-content-start -->
        </article>
      </div> <!-- end .container-fluid -->
      <jsp:include page="includes/footer.jsp" />
    </div> <!-- end .main-raised -->
    <%@ include file="/includes/bootstrap_bottom_scripts.html" %>
    <script>
      // Handles the 'Next'/'Previous' buttons for tabs
      // 'Next' to Amount
      $("#toAmount").click(function(){
        $("#amount-tab").tab('show');
        $("#amount-tab").addClass('active');
        $("#basic-tab").removeClass('active');
      });
      // 'Previous' to Basic
      $("#backToBasic").click(function(){
        $("#basic-tab").tab('show');
        $("#basic-tab").addClass('active');
        $("#amount-tab").removeClass('active');
      });
      // 'Next' to Quantity
      $("#toQuantity").click(function(){
        $("#quantity-tab").tab('show');
        $("#quantity-tab").addClass('active');
        $("#amount-tab").removeClass('active');
      });
      // 'Previous' to Amount
      $("#backToAmount").click(function(){
        $("#amount-tab").tab('show');
        $("#amount-tab").addClass('active');
        $("#quantity-tab").removeClass('active');
      });
      // 'Next' to Qualifying Products
      $("#toQualifying").click(function(){
        $("#qualifying-tab").tab('show');
        $("#qualifying-tab").addClass('active');
        $("#quantity-tab").removeClass('active');
      });
      // 'Previous' to Quantity
      $("#backToQuantity").click(function(){
        $("#quantity-tab").tab('show');
        $("#quantity-tab").addClass('active');
        $("#qualifying-tab").removeClass('active');
      });
      // 'Next' to Discounted Products
      $("#toDiscounted").click(function(){
        $("#discounted-tab").tab('show');
        $("#discounted-tab").addClass('active');
        $("#qualifying-tab").removeClass('active');
      });
      // 'Previous' to Qualifying Products
      $("#backToQualifying").click(function(){
        $("#qualifying-tab").tab('show');
        $("#qualifying-tab").addClass('active');
        $("#discounted-tab").removeClass('active');
      });
      $('input[type=checkbox]').change(function(){
        $(this).prev('input[type=hidden]').val (this.checked ? -1 : 0);
      });
    </script>
  </body>
</html>
