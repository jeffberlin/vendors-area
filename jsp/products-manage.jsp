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
      </c:if>

      <c:if test = "${ allowChanges == 1 }">
        function addNewProduct (productid) {
          submitForm(0, "_parent", "https://vendors-new.bmtmicro.com/products-manage-add.jsp", productid);
        }
        function addMultiple (productid) {
          submitForm(7, "_parent", "https://vendors-new.bmtmicro.com/products_add_multiple.html", productid);
        }
        function submitCustomerEmail (form) {
          if (checkSyntax (form)) {
            form.submit();
          }
        }
      </c:if>

      // function addNewProduct(productid) {
      //   <c:if test = "${ allowChanges == 0 }">
      //     alert ("You are not allowed to add products.");
      //   </c:if>
      //   <c:if test = "${ allowChanges == 1 }">
      //     submitForm(0, "_parent", "https://vendors-new.bmtmicro.com/products-manage-add.jsp", productid);
      //   </c:if>
      // }

      // function addMultiple(productid) {
      //   <c:if test = "${ allowChanges == 0 }">
      //     alert ("You are not allowed to add products.");
      //   </c:if>
      //   <c:if test = "${ allowChanges == 1 }">
      //     submitForm(7, "_parent", "https://vendors-new.bmtmicro.com/products_add_multiple.html", productid);
      //   </c:if>
      // }

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
        submitForm(4, "resultframe", "https://vendors-new.bmtmicro.com/products_vieworderlink.html", productid);
      }

      function editDefaultCustomerEMail(productid) {
        submitForm(5, "resultframe", "https://vendors-new.bmtmicro.com/products_edit_default_customeremail.html");
      }

      function editDefaultVendorEMail(productid) {
        submitForm(6, "resultframe", "https://vendors-new.bmtmicro.com/products_edit_default_vendoremail.html");
      }

      function editScreenTemplate(productid) {
        submitForm(8, "resultframe", "https://vendors-new.bmtmicro.com/products_edit_screentemplate.html", productid);
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

      function refreshReport () {
        submitForm(-1, "tableframe", "https://vendors-new.bmtmicro.com/products-manage-table.jsp");
      }

      function selectPage(p) {
        document.products.PAGE.value = p;
        refreshReport ();
      }

      // from products-manage-edit-customer-email.jsp
      function insertAtCursor (myField, myValue) {
        //IE support
        if (document.selection) {
          myField.focus();
          sel = document.selection.createRange ();
          sel.text = myValue;
        }
        //MOZILLA/NETSCAPE support
        else if (myField.selectionStart || myField.selectionStart == '0') {
          var startPos = myField.selectionStart;
          var endPos = myField.selectionEnd;
          myField.value = myField.value.substring(0, startPos) + myValue + myField.value.substring(endPos, myField.value.length);
        } else {
          myField.value += myValue;
        }
      }

      function makeToken (s) {
        return ((s.charAt (0) == "#") ? s : ("##" + s + "##"));
      }

      function addToken (div) {
        insertAtCursor (document.getElementById ("emailtemplate"), makeToken (div.title));
      }

      function fixTitle (div) {
        div.title = makeToken (div.title);
        return (false);
      }

      function showPreview (form) {
        var tgtform = document.previewform;
        tgtform.PREVIEWTEXT.value = form.CUSTOMEREMAILTEMPLATE.value;
        tgtform.submit ();
      }

      function checkSyntax (form) {
        var text = form.CUSTOMEREMAILTEMPLATE.value.toUpperCase ();
        if (text.indexOf ("#\#STDMESSAGE#\#") != -1) {
          return (true);
        }
        if ((text.indexOf ("#\#IMPORTFILE") != -1) && confirm ("If you are certain you have the correct tokens in the message, click 'OK' to continue. Otherwise, click 'Cancel' and contact us for further assistance.\n\n****IMPORTANT*****\n\nPlease note that clicking 'OK' will bypass checks that ensure the message is using the proper tokens.\n\n")) {
          return (true);
        }
        if (${param.DOWNLOADFILE} == -1) {
          if ((text.indexOf ("#\#DOWNLOADINSTRUCTIONS#\#") == -1) &&
          ((text.indexOf ("#\#PRODUCTID#\#") == -1) || (text.indexOf ("#\#DOWNLOADPASSWORD#\#") == -1))) {
            alert ("Download instructions are required. Please make sure that the message contains the #\#DOWNLOADINSTRUCTIONS#\# token.");
            return (false);
          }
        }
        if (${param.PULLKEY} == -1) {
          if (${param.KEYPARTS} == 1) {
            if ((text.indexOf ("#\#STDREGINFO#\#") == -1) && (text.indexOf ("#\#REGKEY1#\#") == -1) && (text.indexOf ("#\#REGKEYINFO#\#") == -1) && (text.indexOf ("#\#REGKEYLIST#\#") == -1)) {
              alert ("Activation Code information is required. Please make sure that the message contains the #\#STDREGINFO#\# token.");
              return (false);
            }
          } else {
            if (text.indexOf ("#\#STDREGINFO#\#") != -1) {
              alert ("This product uses multi-part keys. Because of this, the #\#STDREGINFO#\# token should not be used. Use #\#REGKEY1#\#, #\#REGKEY2#\#, #\#REGKEY3#\# and #\#REGKEY4#\# instead.");
              return (false);
            }
            if ((text.indexOf ("#\#REGKEY1#\#") != -1) || (text.indexOf ("#\#REGKEY2#\#") != -1) || (text.indexOf ("#\#REGKEY3#\#") != -1) || (text.indexOf ("#\#REGKEY4#\#") != -1))  {
              if (text.indexOf ("#\#REGKEY1#\#") == -1) {
                alert ("Please make sure that the message contains the #\#REGKEY1#\# token.");
                return (false);
              }
              if ((${param.KEYPARTS} >= 2) && (text.indexOf ("#\#REGKEY2#\#") == -1)) {
                alert ("Please make sure that the message contains the #\#REGKEY2#\# token.");
                return (false);
              }
              if ((${param.KEYPARTS} >= 3) && (text.indexOf ("#\#REGKEY3#\#") == -1)) {
                alert ("Please make sure that the message contains the #\#REGKEY3#\# token.");
                return (false);
              }
              if ((${param.KEYPARTS} >= 4) && (text.indexOf ("#\#REGKEY4#\#") == -1)) {
                alert ("Please make sure that the message contains the #\#REGKEY4#\# token.");
                return (false);
              }
            } else if ((text.indexOf ("#\#REGKEYINFO#\#") == -1) && (text.indexOf ("#\#REGKEYKLIST#\#") == -1)) {
              alert ("Activation Code information is required. Please make sure that the message contains the #\#REGKEY1#\# token.");
              return (false);
            }
          }
        }
        if (${param.GENERATEKEY} == -1) {
          if ((text.indexOf ("#\#STDREGINFO#\#") == -1) && (text.indexOf ("#\#REGKEY1#\#") == -1) && (text.indexOf ("#\#REGKEYINFO#\#") == -1) && (text.indexOf ("#\#GIFTCERTIFICATES#\#") == -1) && (text.indexOf ("#\#REGKEYLIST#\#") == -1) &&
          ("#\#KEYGENERATOR#\#".indexOf ("ticket ") != 0))  {
            alert ("Activation Code or Gift Certificate information is required. Please make sure that the message contains the #\#STDREGINFO#\# or #\#GIFTCERTIFICATES#\# token.");
            return (false);
          }
        }
        if (${param.KEYLIST} == -1) {
          if ((text.indexOf ("#\#REGKEYINFO#\#") == -1) && (text.indexOf ("#\#GIFTCERTIFICATES#\#") == -1) && (text.indexOf ("#\#REGKEYLIST#\#") == -1)) {
            alert ("This product is configured to send out more than one key. Because of this, a key list is required. Please make sure that the message contains the #\#REGKEYINFO#\# or #\#GIFTCERTIFICATES#\# token.");
            return (false);
          }
        }
        return (true);
      }

      function useDefaultChanged (form) {
        if (form.USEDEFAULTTEMPLATE.checked) {
          form.CUSTOMEREMAILTEMPLATE.value = form.DEFAULTCUSTOMEREMAILTEMPLATE.value;
        }
        form.CUSTOMEREMAILTEMPLATE.disabled = form.USEDEFAULTTEMPLATE.checked;
      }

      function initForm (form) {
        if (isBlank (form.CUSTOMEREMAILTEMPLATE.value)){
          form.CUSTOMEREMAILTEMPLATE.value = form.DEFAULTCUSTOMEREMAILTEMPLATE.value;
          form.CUSTOMEREMAILTEMPLATE.disabled = true;
          form.USEDEFAULTTEMPLATE.checked = true;
        }
      }

      // function submitCustomerEmail (form) {
      //   if (allowChanges ("You do not have permission to make changes.")) {
      //     if (checkSyntax (form)) {
      //       form.submit ();
      //     }
      //   }
      // }
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
  <script>$(document).ready(function(){ refreshReport (); });</script>
</html>
