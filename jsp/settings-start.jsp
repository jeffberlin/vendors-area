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
    <script language="javascript" type="text/javascript" src="https://secure.bmtmicro.com/Templates/util.js"></script>
    <script language="javascript" type="text/javascript" src="https://vendors-new.bmtmicro.com/js/vendors.js"></script>
    <style media="screen" type="text/css">
      .shrinkText {
        font-size: .9rem;
      }
    </style>
    <script type="text/javascript" language="javascript">
      <!--
      function initForm () {
        document.editaccount.submit();
        document.editshopping.submit();
        document.edittracking.submit();
        document.editapiToken.submit();
        document.bmtconfig.submit();
      }
      //-->
    </script>
    <script type="text/javascript" language="javascript">
      <!--
      function submitForm (form) {
        if (allowChanges ("You do not have permission to make changes.")) {
          form.submit ();
          return (true);
        }
        return (false);
      }
      //-->
    </script>
  </head>
  <body onload="initForm();">

    <!-- Blue background header -->
    <div class="blue-bg"></div>

    <!-- Start of body content -->
    <div class="main-raised">
      <div class="container-fluid body-content">
        <article class="section">
          <div class="row justify-content-start">
            <%@ include file="/includes/menuSidebar.html" %>
            <div class="col-lg-10 col-md-12 page-title">
              <form name="editaccount" action="https://vendors-new.bmtmicro.com/servlets/Vendors.Account" method="post" target="editsettings">
                <input type="hidden" name="NEXT_PAGE" value="https://vendors-new.bmtmicro.com/settings-settings.html">
                <input type="hidden" name="ERROR_PAGE" value="https://vendors-new.bmtmicro.com/error.jsp">
                <input type="hidden" name="ACTION" value="1" />
              </form>

              <form name="editshopping" action="https://vendors-new.bmtmicro.com/servlets/Vendors.Account" method="post" target="shoppingCart">
                <input type="hidden" name="NEXT_PAGE" value="https://vendors-new.bmtmicro.com/settings-shoppingCartOptions.html">
                <input type="hidden" name="ERROR_PAGE" value="https://vendors-new.bmtmicro.com/error.jsp">
                <input type="hidden" name="ACTION" value="1" />
              </form>

              <form name="edittracking" action="https://vendors-new.bmtmicro.com/servlets/Vendors.Account" method="post" target="tracking">
                <input type="hidden" name="NEXT_PAGE" value="https://vendors-new.bmtmicro.com/settings-tracking.html">
                <input type="hidden" name="ERROR_PAGE" value="https://vendors-new.bmtmicro.com/error.jsp">
                <input type="hidden" name="ACTION" value="1" />
              </form>

              <form name="editapiToken" action="https://vendors-new.bmtmicro.com/servlets/Vendors.Account" method="post" target="apiToken">
                <input type="hidden" name="NEXT_PAGE" value="https://vendors-new.bmtmicro.com/settings-apiToken.html">
                <input type="hidden" name="ERROR_PAGE" value="https://vendors-new.bmtmicro.com/error.jsp">
                <input type="hidden" name="ACTION" value="1" />
              </form>

              <form name="bmtconfig" action="https://vendors-new.bmtmicro.com/servlets/Vendors.SalesDetailsConfig" method="post" target="salesdetailsconfig">
                <input type="hidden" name="NEXT_PAGE"  value="https://vendors-new.bmtmicro.com/settings-salesdetailsconfig.html" />
                <input type="hidden" name="ERROR_PAGE" value="https://vendors-new.bmtmicro.com/error.jsp" />
              </form>

              <ul class="nav nav-tabs" id="myTab" role="tablist">
                <li class="nav-item">
                  <a class="nav-link active" id="settings-tab" data-toggle="tab" href="#settings" role="tab" aria-controls="settings" aria-selected="true">Settings</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" id="shoppingCartOptions-tab" data-toggle="tab" href="#shoppingCartOptions" role="tab" aria-controls="shoppingCartOptions" aria-selected="true">Shopping Cart Options</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" id="tracking-tab" data-toggle="tab" href="#tracking" role="tab" aria-controls="tracking" aria-selected="false">Tracking</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" id="apiToken-tab" data-toggle="tab" href="#apiToken" role="tab" aria-controls="apiToken" aria-selected="false">API Token</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" id="fields-tab" data-toggle="tab" href="#fields" role="tab" aria-controls="fields" aria-selected="false">Sales Details Fields</a>
                </li>
              </ul>

              <div class="content-box">
                <div class="tab-content" id="myTabContent">
                  <div class="tab-pane fade show active" id="settings" role="tabpanel" aria-labelledby="settings-tab">
                    <iframe src="" name="editsettings" id="editsettings" frameborder="0" border="0" cellspacing="0" style="border-style: none;width: 100%; height: 500px;"></iframe>
                  </div>
                  <div class="tab-pane fade" id="shoppingCartOptions" role="tabpanel" aria-labelledby="shoppingCartOptions-tab">
                    <iframe src="" name="shoppingCart" id="shoppingCart" frameborder="0" border="0" cellspacing="0" style="border-style: none;width: 100%; height: 500px;"></iframe>
                  </div>
                  <div class="tab-pane fade" id="tracking" role="tabpanel" aria-labelledby="tracking-tab">
                    <iframe src="" name="tracking" id="tracking" frameborder="0" border="0" cellspacing="0" style="border-style: none;width: 100%; height: 500px;"></iframe>
                  </div>
                  <div class="tab-pane fade" id="apiToken" role="tabpanel" aria-labelledby="apiToken-tab">
                    <iframe src="" name="apiToken" id="apiToken" frameborder="0" border="0" cellspacing="0" style="border-style: none;width: 100%; height: 500px;" ></iframe>
                  </div>
                  <div class="tab-pane fade" id="fields" role="tabpanel" aria-labelledby="fields-tab">
                    <iframe src="" name="salesdetailsconfig" id="salesdetailsconfig" frameborder="0" border="0" cellspacing="0" style="border-style: none;width: 100%; height: 500px;" ></iframe>
                  </div>
                </div>
              </div>
            </div> <!-- end .col-lg-10 col-md-12 page-title -->
          </div> <!-- end .row justify-content-start -->
        </article>
      </div> <!-- end .container-fluid -->
      <%@ include file="/includes/footer.html" %>
    </div> <!-- end .main-raised -->
    <%@ include file="/includes/bootstrap_bottom_scripts.html" %>
  </body>
</html>
