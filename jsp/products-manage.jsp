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
    <script src="https://secure.bmtmicro.com/Templates/util.js"></script>
    <script src="https://vendors.bmtmicro.com/js/vendors.js"></script>
    <script src="https://vendors-new.bmtmicro.com/js/tablesort.js"></script>
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
      function submitForm(action, target, nextpage, productid) {
        var form = document.products;
        form.ACTION.value = action;
        form.target = target;
        form.NEXT_PAGE.value = nextpage;
        form.ERROR_PAGE.value = (target == "_parent") ? "https://vendors-new.bmtmicro.com/error.jsp" : "https://vendors-new.bmtmicro.com/error-div.jsp";
        form.PRODUCTID.value = productid;
        submitToDiv(form, target);
      }

      function addProduct(productid) {
        if (allowChanges("You are not allowed to add products.")) {
          submitForm(0, "_parent", "https://vendors-new.bmtmicro.com/products-manage-add.jsp", productid);
        }
      }

      function editProduct(productid) {
        submitForm(1, "_parent", "https://vendors-new.bmtmicro.com/products-manage-edit.jsp", productid);
      }

      function editCustomerEMail(productid) {
        submitForm(2, "resultframe", "https://vendors-new.bmtmicro.com/products_edit_customeremail.html", productid);
      }

      function editVendorEMail(productid) {
        submitForm(3, "resultframe", "https://vendors-new.bmtmicro.com/products_edit_vendoremail.html", productid);
      }

      function viewLink(productid) {
        submitForm(4, "resultframe", "https://vendors-new.bmtmicro.com/products_vieworderlink.html", productid);
      }

      function editDefaultCustomerEMail(productid) {
        submitForm(5, "resultframe", "https://vendors-new.bmtmicro.com/products_edit_default_customeremail.html");
      }

      function editDefaultVendorEMail(productid) {
        submitForm(6, "resultframe", "https://vendors-new.bmtmicro.com/products_edit_default_vendoremail.html");
      }

      function addMultiple(productid) {
        if (allowChanges("You are not allowed to add products.")) {
          submitForm(7, "_parent", "https://vendors-new.bmtmicro.com/products_add_multiple.html", productid);
        }
      }

      function editScreenTemplate(productid) {
        submitForm(8, "resultframe", "https://vendors-new.bmtmicro.com/products_edit_screentemplate.html", productid);
      }

      function testOrder(productid) {
        if (allowTestOrders("You do not have permission to place test orders.")) {
          var pin = getCookieValue("BMTMicro.Vendors.SessionID");
          var vid = getCookieValue("BMTMicro.Vendors.VendorID");
          window.open("https://secure.bmtmicro.com/cart?CID=" + vid + "&CLR=0&PRODUCTID=" + productid + "&PAYMENTMETHOD=1&CCNUMBER=pin=" + encodeURIComponent(pin), "OrderTestPopUp", "location=no,menubar=1,scrollbars=yes,width=980,height=900,resizable=yes").focus();
        }
      }

      function showInactiveChanged() {
        setCookieValue("BMTMicro.Vendors.Products.ShowInactive", queryField(document.products, "SHOWINACTIVE"), 1000);
        submitForm(-1, "", "https://vendors-new.bmtmicro.com/products-manage.jsp");
      }

      function filterChanged() {
        submitForm(-1, "", "https://vendors-new.bmtmicro.com/products-manage.jsp");
      }

      function selectPage(p) {
        document.products.PAGE.value = p;
        submitForm(-1, "", "https://vendors-new.bmtmicro.com/products-manage.jsp");
      }

      function initForm(form) {
        initField(form, "SHOWINACTIVE", "${param.SHOWINACTIVE}");
        initField(form, "FILTER", "${param.FILTER}");
        if (${param.PAGECOUNT} > 1) {
          var s = "Pages:&nbsp;";
          for (var p = 1; p <= ${param.PAGECOUNT}; p++) {
            s += "<a href=\"javascript:selectPage(" + p + ");\">" + p  + "</a>&nbsp;&nbsp;";
          }
          document.getElementById("pageselector").innerHTML = s;
        }
        catchEnter(form.FILTER, filterChanged);
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
                  <!-- <jsp:include page="products-manage-table.jsp"/> -->
                </div> <!-- end #tableframe -->
                <form name="products" method="post" action="https://vendors-new.bmtmicro.com/servlets/Vendors.Products">
                  <input type="hidden" name="ACTION" value="-1" />
                  <input type="hidden" name="SHOWINACTIVE" value="0" />
                  <input type="hidden" name="ROWSPERPAGE" value="500" />
                  <input type="hidden" name="PAGE" value="1" />
                  <input type="hidden" name="ROWTEMPLATEURL" value="https://vendors-new.bmtmicro.com/products-manage-tablerow.html" />
                  <input type="hidden" name="NEXT_PAGE" value="https://vendors-new.bmtmicro.com/products-manage-table.jsp">
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
  <script>$(document).ready(function(){ submitToDiv (document.products, 'tableframe'); });</script>
</html>
