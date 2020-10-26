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
    <script src="https://secure.bmtmicro.com/Templates/util.js"></script>
    <script src="https://vendors-new.bmtmicro.com/js/vendors.js"></script>
    <style media="screen" type="text/css">
      h6 {
        color: #195a7c;
        font-size: 1.15rem;
        letter-spacing: .5px;
      }
    </style>
    <script>
      function toggleField (field) {
        var e = document.getElementById (field);
        if (e.style.display == '') {
          e.style.display = 'none';
        } else {
          e.style.display = '';
          e.focus ();
        }
      }

      function getLineCount (value) {
        var lc = 0;
        while (value != null) {
          var i = value.indexOf ('\n');
          var line;
          if (i == -1) {
            line = value;
            value = null;
          } else {
            line = value.substring (0, i);
            value = value.substring (i + 1);
          }
          if (!isBlank (line)) {
            lc++;
          }
        }
        return (lc);
      }

      function getLine (value, number) {
        var lc = 0;
        while (value != null) {
          var i = value.indexOf ('\n');
          var line;
          if (i == -1) {
            line = value;
            value = null;
          } else {
            line = value.substring (0, i);
            value = value.substring (i + 1);
          }
          if (!isBlank (line)) {
            if (lc == number) {
              return (line);
            }
            lc++;
          }
        }
        return (null);
      }

      function conditionalToggleField (field) {
        switch (field) {
          case "downloadfile":
            if (isBlank ("${requestScope.DOWNLOADFILEID}")) {
              alert ("Template product does not specify a download file. Please choose a different template product if you wish to provide a download file list.");
              return;
            }
          break;
          case "keygenerator":
            if (isBlank ("${requestScope.KEYGENERATOR}")) {
              alert ("Template product does not specify a key generator. Please choose a different template product if you wish to provide a key generator list.");
              return;
            }
          break;
        }
        toggleField (field);
      }

      // function initForm (form) {
      //   setFieldVisible ("downloadfile", !isBlank ("${requestScope.DOWNLOADFILEID}"));
      //   setFieldVisible ("keygenerator", !isBlank ("${requestScope.KEYGENERATOR}"));
      // }

      function submitNewMultipleProduct (form) {
        if ((getCookieValue ("BMTMicro.Vendors.Flags") & 2) == 0) {
          alert ("You do not have permission to make changes.");
          return (false);
        }
        var productCount = getLineCount (form.PRODUCTNAME.value);
        if (productCount == 0) {
          alert ("You must enter at least one product name");
          form.PRODUCTNAME.focus ();
          return (false);
        }
        var lc = getLineCount (form.PRODUCTPRICE.value);
        if (lc != 0) {
          if (lc != productCount) {
            alert ("You have specified " + lc + " prices. The number of prices does not match the number of products (" + productCount + ")");
            form.PRODUCTPRICE.focus ();
            return (false);
          }
          for (var i = 0; i < lc; i++) {
            var price = getLine (form.PRODUCTPRICE.value, i);
            if (!isValidDollarAmount (price)) {
              alert ("Error on line " + (i+1) + " of product price. Value is not a valid product price.");
              form.PRODUCTPRICE.focus ();
              return (false);
            }
          }
        }
        var dlExpected = !isBlank ("${requestScope.DOWNLOADFILEID}");
        lc = getLineCount (form.DOWNLOADFILENAME.value);
        if (lc == 0) {
          if (dlExpected) {
            // setFieldVisible ("downloadfile");
            alert ("Template product specifies a download file but download files are not provided. Please choose a different template product or provide a list of download files.");
            form.DOWNLOADFILENAME.focus ();
            return (false);
          }
        } else {
          if (!dlExpected) {
            // setFieldVisible ("downloadfile");
            alert ("Template product does not specify a download file. Please choose a different template product or remove the list of download files.");
            form.DOWNLOADFILENAME.focus ();
            return (false);
          }
          if (lc != productCount) {
            // setFieldVisible ("downloadfile");
            alert ("You have specified " + lc + " download files. If specified, the number of download files must match the number of products (" + productCount + ")");
            form.DOWNLOADFILENAME.focus ();
            return (false);
          }
        }
        var kgExpected = !isBlank ("${requestScope.KEYGENERATOR}");
        lc = getLineCount (form.KEYGENERATOR.value);
        if (lc == 0) {
          if (kgExpected) {
            // setFieldVisible ("keygenerator");
            alert ("Template product specifies a code generator but code generators are not provided. Please choose a different template product or provide a list of code generators.");
            form.KEYGENERATOR.focus ();
            return (false);
          }
        } else {
          if (!kgExpected) {
            // setFieldVisible ("keygenerator");
            alert ("Template product does not specify a code generator. Please choose a different template product or remove the list of code generators.");
            form.KEYGENERATOR.focus ();
            return (false);
          }
          if (lc != productCount) {
            // setFieldVisible ("keygenerator");
            alert ("You have specified " + lc + " code geenerators. If specified, the number of code generators must match the number of products (" + productCount + ")");
            form.KEYGENERATOR.focus ();
            return (false);
          }
        }
        lc = getLineCount (form.NOTIFICATIONEMAILS.value);
        if ((lc != 0) && (lc != productCount)) {
          alert ("You have specified " + lc + " notification emails. If specified, the number of notification emails must match the number of products (" + productCount + ")");
          form.NOTIFICATIONEMAIL.focus ();
          return (false);
        }
        form.submit ();
        return (true);
      }
    </script>
    <body>
      <!-- Blue background header -->
      <div class="blue-bg"></div>

      <!-- Start of body content -->
      <div class="main-raised">
        <div class="container-fluid body-content">
          <article class="section">
            <div class="row justify-content-start">
              <jsp:include page="includes/menuSidebar.jsp"/>
              <div class="col-lg-10 col-md-12 page-title">
                <h4>Create&nbsp;Multiple&nbsp;Products</h4>
                <ul class="nav nav-tabs" id="myTab" role="tablist">
                  <li class="nav-item">
                    <a class="nav-link active" id="productInfo-tab" data-toggle="tab" href="#productInfo" role="tab" aria-controls="product info" aria-selected="true">
                      Product Info
                    </a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" id="productType-tab" data-toggle="tab" href="#productType" role="tab" aria-controls="product type" aria-selected="true">
                      Product Type
                    </a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" id="productEmails-tab" data-toggle="tab" href="#productEmails" role="tab" aria-controls="product emails" aria-selected="true">
                      Product Emails
                    </a>
                  </li>
                </ul>
                <div class="tab-box">
                  <form name="productform" method="post" action="https://vendors-new.bmtmicro.com/servlets/Vendors.Products">
                    <input type="hidden" name="PRODUCTID" value="${requestScope.PRODUCTID}" />
                    <input type="hidden" name="ACTION" value="17" />
                    <input type="hidden" name="NEXT_PAGE" value="https://vendors-new.bmtmicro.com/products-manage-add-multiple-progress.jsp" />
                    <input type="hidden" name="ERROR_PAGE" value="https://vendors-new.bmtmicro.com/error-div.jsp" />
                    <div class="tab-content" id="myTabContent">
                      <div class="tab-pane fade show active" id="productInfo" role="tabpanel" aria-labelledby="productInfo-tab">
                        <h5>Product Info</h5>
                        <p>Insert Product Information below.&nbsp;Values should be separated by a comma (",") or use new lines.</p>
                        <p>Defaults will be based on ${requestScope.PRODUCTNAME}</p>
                        <div class="row" style="margin-bottom: 1rem;">
                          <span>
                            <label>Product&nbsp;Name:</label>
                            <br>
                            <textarea name="PRODUCTNAME" rows="15" cols="70" style="margin-right: 1.5rem;"></textarea>
                          </span>
                          <span>
                            <label>Product&nbsp;Price:</label>
                            <span style="font-size: .8rem;">(Leave blank to use same price as ${requestScope.PRODUCTNAME})</span>
                            <br>
                            <textarea name="PRODUCTPRICE" rows="15" cols="70"></textarea>
                          </span>
                        </div> <!-- end .row -->
                        <button id="toProductType" class="save-btn" type="button">Next</button>
                      </div> <!-- end .tab-pane -->
                      <div class="tab-pane fade" id="productType" role="tabpanel" aria-labelledby="productType-tab">
                        <h5>Product Type</h5>
                        <p>To add download file list, keygenerator call list or separate order notification emails, click appropriate button below.</p>
                        <h6>Download&nbsp;File&nbsp;List</h6>
                        <p>If these products should be associated with download files already uploaded through the Manage Files interface, click button to add product file list.</p>
                        <button type="button" class="grey-btn" onclick="conditionalToggleField('downloadfile');" style="margin-bottom: .7rem;">Add Download File list</button>
                        <div id="downloadfile" class="toggle-section"<c:if test="${empty requestScope.DOWNLOADFILEID}">style="display: none;"</c:if>>
                          <h6>Create Multiple Products&nbsp;-&nbsp;Add Download File List</h6>
                          <p>To associated download files, add list below.&nbsp;There must be a download file for every product name above.</p>
                          <span>
                            <label>Download&nbsp;File&nbsp;Names:</label>
                            <br>
                            <textarea name="DOWNLOADFILENAME" rows="15" cols="70"></textarea>
                          </span>
                        </div> <!-- end #downloadfile -->
                        <h6>Generated&nbsp;Codes/Gift&nbsp;Certificates/Subscription Credits</h6>
                        <p>If activation code, gift certificate or subscription credit should be generated on the fly, select Add Code Generator Information.</p>
                        <button type="button" class="grey-btn" onclick="conditionalToggleField('keygenerator');" style="margin-bottom: 1rem;">Add Code Generator list</button>
                        <div id="keygenerator" class="toggle-section"<c:if test="${empty requestScope.KEYGENERATOR}">style="display: none;"</c:if>>
                          <h6>Create Product&nbsp;-&nbsp;Codes Generated On-the-Fly</h6>
                          <p>Add code generation information for these products below.&nbsp;Separate value must be added for each product name listed above.</p>
                          <span>
                            <label>Generate&nbsp;Activation&nbsp;Codes/Gift Certificate/Subscription&nbsp;Credit</label>
                            <br>
                            <textarea name="KEYGENERATOR" rows="15" cols="70"></textarea>
                          </span>
                        </div> <!-- end #keygenerator -->
                        <br>
                        <button id="backToProductInfo" class="save-btn" type="button" style="margin-right: .5rem; margin-top: 1rem;">Previous</button>
                        <button id="toProductEmails" class="save-btn" type="button">Next</button>
                      </div> <!-- end .tab-pane -->
                      <div class="tab-pane fade" id="productEmails" role="tabpanel" aria-labelledby="productEmails-tab">
                        <h5>Order&nbsp;Notifications&nbsp;Emails</h5>
                        <p>Click button below to add an additional notification email address to multiple products.</p>
                        <button type="button" class="grey-btn" onclick="toggleField('ordernotifications');" style="margin-bottom: 1rem;">Add Order Notification Email list</button>
                        <div id="ordernotifications" style="display: none;">
                          <h6>Order&nbsp;Notification&nbsp;Emails</h6>
                          <p>By default order notifications are sent via email to the notification email address listed under 'My Account'.<br />To add a different email address to all products, add list below.&nbsp;List must have same number of values as product name list above.</p>
                          <span>
                            <label>Send&nbsp;Order&nbsp;Notification to&nbsp;other&nbsp;email&nbsp;address:</label>
                            <br>
                            <textarea name="NOTIFICATIONEMAILS" rows="15" cols="70" style="margin-bottom: 1rem;"></textarea>
                          </span>
                        </div> <!-- end #ordernotifications -->
                        <p style="margin-bottom: .5rem;">Click Save button to add the new products.</p>
                        <button id="backToProductType" class="save-btn" type="button" style="margin-right: .5rem;">Previous</button>
                        <button type="button" class="save-btn" onclick="submitNewMultipleProduct (productform);">Save</button>
                      </div> <!-- end .tab-pane -->
                    </div> <!-- end .tab-content -->
                  </form>
                </div> <!-- end .tab-box -->
              </div> <!-- end .col-lg-10 col-md-12 page-title -->
            </div> <!-- end .row justify-content-start -->
          </article> <!-- end .section -->
        </div> <!-- end .container-fluid body-content -->
        <jsp:include page="includes/footer.jsp"/>
      </div> <!-- end .main-raised -->
      <%@ include file="/includes/bootstrap_bottom_scripts.html" %>
      <script>
        // Handles the 'Next'/'Previous' buttons for tabs
        // 'Next' to Product Type
        $("#toProductType").click(function(){
          $("#productType-tab").tab('show');
          $("#productType-tab").addClass('active');
          $("#productInfo-tab").removeClass('active');
        });
        // 'Previous' to Product Info
        $("#backToProductInfo").click(function(){
          $("#productInfo-tab").tab('show');
          $("#productInfo-tab").addClass('active');
          $("#productType-tab").removeClass('active');
        });
        // 'Next' to Product Emails
        $("#toProductEmails").click(function(){
          $("#productEmails-tab").tab('show');
          $("#productEmails-tab").addClass('active');
          $("#productType-tab").removeClass('active');
        });
        // 'Previous' to Product Type
        $("#backToProductType").click(function(){
          $("#productType-tab").tab('show');
          $("#productType-tab").addClass('active');
          $("#productEmail-tab").removeClass('active');
        });
      </script>
    </body>
  </html>
