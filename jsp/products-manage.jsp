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
      .email {
        color: #efa900;
        transition: all .2s ease;
      }
      .email:hover {
        color: #195a7c;
      }
    </style>
    <script>
      function submitForm (action, target, nextpage, productid) {
        var form = document.products;
        form.ACTION.value = action;
        form.target = target;
        form.NEXT_PAGE.value = nextpage;
        form.PRODUCTID.value = productid;
        if (target == "_parent") {
          form.ERROR_PAGE.value = "https://vendors-new.bmtmicro.com/error.jsp";
          form.submit ();
        } else {
          form.target = "";
          submitToDiv (form, target);
        }
      }

      <c:if test = "${ allowChanges == 0 }">
        function addNewProduct (productid) {
          alert("You are not allowed to add products.");
        }
        function addMultiple (productid) {
          alert ("You are not allowed to add products.");
        }
        function submitCustomerEmail (form) {
          alert("You do not have permission to make changes.");
        }
        function submitCustomerEmail (form) {
          alert("You do not have permission to make changes.");
        }
      </c:if>

      <c:if test = "${ allowChanges == 1 }">
        function addNewProduct (productid) {
          submitForm(0, "_parent", "https://vendors-new.bmtmicro.com/products-manage-add.jsp", productid);
        }
        function addMultiple (productid) {
          submitForm(7, "_parent", "https://vendors-new.bmtmicro.com/products-manage-add-multiple.jsp", productid);
        }
        function submitCustomerEmail (form) {
          if (checkSyntax (form)) {
            form.submit();
          }
        }
        function submitCustomerEmail (form) {
          if (checkSyntax (form)) {
            form.submit ();
          }
        }
      </c:if>

      function editProduct(productid) {
        submitForm(1, "_parent", "https://vendors-new.bmtmicro.com/products-manage-edit.jsp", productid);
      }

      function editCustomerEMail(productid) {
        submitForm(2, "resultframe", "https://vendors-new.bmtmicro.com/products-manage-edit-customer-email.jsp", productid);
      }

      function editVendorEMail(productid) {
        submitForm(3, "resultframe", "https://vendors-new.bmtmicro.com/products-manage-edit-vendor-email.jsp", productid);
      }

      function viewLink(productid) {
        submitForm(4, "resultframe", "https://vendors-new.bmtmicro.com/products-manage-view-order-link.jsp", productid);
      }

      function editDefaultCustomerEMail(productid) {
        submitForm(5, "resultframe", "https://vendors-new.bmtmicro.com/products-manage-edit-default-customer-email.jsp");
      }

      function editDefaultVendorEMail(productid) {
        submitForm(6, "resultframe", "https://vendors-new.bmtmicro.com/products-manage-edit-default-vendor-email.jsp");
      }

      function editScreenTemplate(productid) {
        submitForm(8, "resultframe", "https://vendors-new.bmtmicro.com/products-manage-edit-screen-template.jsp", productid);
      }

      function testOrder(productid) {
        <c:if test = "${ allowTestOrders == 0 }">
          alert ("You do not have permission to place test orders.");
        </c:if>
        <c:if test = "${ allowTestOrders == 1 }">
          var pin = getCookieValue("BMTMicro.Vendors.SessionID");
          var vid = getCookieValue("BMTMicro.Vendors.VendorID");
          window.open("https://secure.bmtmicro.com/cart?CID=" + vid + "&CLR=0&PRODUCTID=" + productid + "&PAYMENTMETHOD=1&CCNUMBER=pin=" + encodeURIComponent(pin), "OrderTestPopUp", "location=no,menubar=1,scrollbars=yes,width=980,height=900,resizable=yes").focus();
        </c:if>
      }

      function showInactiveChanged() {
        setCookieValue("BMTMicro.Vendors.Products.ShowInactive", queryField(document.products, "SHOWINACTIVE"), 1000);
        refreshReport ();
      }

      function addToken (div) {
        insertAtCursor (document.getElementById ("emailtemplate"), makeToken (div.title));
      }

      function makeToken (s) {
        return ((s.charAt (0) == "#") ? s : ("##" + s + "##"));
      }

      function fixTitle (div) {
        div.title = makeToken (div.title);
        return (false);
      }

      function refreshReport () {
        submitForm(-1, "tableframe", "https://vendors-new.bmtmicro.com/products-manage-table.jsp");
      }

      function selectPage(p) {
        document.products.PAGE.value = p;
        refreshReport ();
      }

      function filterKeyPress(event) {
        if (event.keyCode == 13) {
          refreshReport ();
          return (true);
        }
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
              <h4>Manage&nbsp;Products</h4>
              <p>Click Product ID below to edit product.&nbsp;If you have any questions about this area, please email&nbsp;<a href="mailto:vendors@bmtmicro.com" class="email" title="Email us">vendors@bmtmicro.com</a>.</p>
              <div class="content-box overflow-auto d-flex flex-column">
                <div name="tableframe" class="overflow-auto h-100" id="tableframe">
                  <jsp:include page="products-manage-table.jsp"/>
                </div> <!-- end #tableframe -->
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
  <script>
    $(document).ready(function(){ refreshReport (); });
    // $('input[type=checkbox]').change(function(){
    //   $(this).prev('input[type=hidden]').val (this.checked ? -1 : 0);
    // });
  </script>
</html>
