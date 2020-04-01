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
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" href="https://vendors-new.bmtmicro.com/css/style.css"/>
    <link rel="stylesheet" href="https://vendors-new.bmtmicro.com/css/responsive.css"/>
    <link rel="stylesheet" href="https://vendors-new.bmtmicro.com/css/addPages.css"/>
    <link rel="stylesheet" href="https://vendors-new.bmtmicro.com/css/tabOptions.css"/>
    <script language="javascript" type="text/javascript" src="https://secure.bmtmicro.com/Templates/util.js"></script>
    <script language="javascript" type="text/javascript" src="https://vendors-new.bmtmicro.com/js/vendors.js"></script>
    <script type="text/javascript" src="https://vendors-new.bmtmicro.com/js/main.js"></script>
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
    <div style="visibility:hidden;">
      <form name="logout" method="post" action="https://vendors-new.bmtmicro.com/servlets/Vendors.Logout">
        <input type="hidden" name="NEXT_PAGE" value="https://vendors-new.bmtmicro.com/login.html">
        <input type="hidden" name="ERROR_PAGE" value="https://vendors-new.bmtmicro.com/error.html">
      </form>
      <form name="payoneer" method="post" action="https://vendors-new.bmtmicro.com/servlets/Vendors.Payoneer">
        <input type="hidden" name="NEXT_PAGE" value="https://vendors-new.bmtmicro.com/main.html">
        <input type="hidden" name="ERROR_PAGE" value="https://vendors-new.bmtmicro.com/error.html">
      </form>
    </div>

    <!-- Blue background header -->
    <div class="blue-bg"></div>

    <!-- Start of body content -->
    <div class="main-raised">
      <div class="container-fluid body-content">
        <article class="section">
          <div class="row justify-content-start">
            <jsp:include page="jsp/menuSidebar.jsp" />
            <div class="col-lg-10 col-md-12 page-title">
              <form name="editaccount" action="https://vendors-new.bmtmicro.com/servlets/Vendors.Account" method="post" target="editsettings">
                <input type="hidden" name="NEXT_PAGE" value="https://vendors-new.bmtmicro.com/settings_settings.html">
                <input type="hidden" name="ERROR_PAGE" value="https://vendors-new.bmtmicro.com/error.html">
                <input type="hidden" name="ACTION" value="1" />
              </form>

              <form name="editshopping" action="https://vendors-new.bmtmicro.com/servlets/Vendors.Account" method="post" target="shoppingCart">
                <input type="hidden" name="NEXT_PAGE" value="https://vendors-new.bmtmicro.com/settings_shoppingCartOptions.html">
                <input type="hidden" name="ERROR_PAGE" value="https://vendors-new.bmtmicro.com/error.html">
                <input type="hidden" name="ACTION" value="1" />
              </form>

              <form name="edittracking" action="https://vendors-new.bmtmicro.com/servlets/Vendors.Account" method="post" target="tracking">
                <input type="hidden" name="NEXT_PAGE" value="https://vendors-new.bmtmicro.com/settings_tracking.html">
                <input type="hidden" name="ERROR_PAGE" value="https://vendors-new.bmtmicro.com/error.html">
                <input type="hidden" name="ACTION" value="1" />
              </form>

              <form name="editapiToken" action="https://vendors-new.bmtmicro.com/servlets/Vendors.Account" method="post" target="apiToken">
                <input type="hidden" name="NEXT_PAGE" value="https://vendors-new.bmtmicro.com/settings_apiToken.html">
                <input type="hidden" name="ERROR_PAGE" value="https://vendors-new.bmtmicro.com/error.html">
                <input type="hidden" name="ACTION" value="1" />
              </form>

              <form name="bmtconfig" action="https://vendors-new.bmtmicro.com/servlets/Vendors.SalesDetailsConfig" method="post" target="salesdetailsconfig">
                <input type="hidden" name="NEXT_PAGE"  value="https://vendors-new.bmtmicro.com/settings_salesdetailsconfig.html" />
                <input type="hidden" name="ERROR_PAGE" value="https://vendors-new.bmtmicro.com/error.html" />
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

      <jsp:include page="jsp/footer.jsp" />
    </div> <!-- end .main-raised -->

    <script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    <script type="text/javascript">
      /* Anything that gets to the document will hide the dropdown */
      $(window).click(function(){
        $(".dropright").removeClass('show');
      });
    </script>
  </body>
</html>
