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
    <link rel="stylesheet" href="https://vendors-new.bmtmicro.com/css/table.css"/>
    <link rel="stylesheet" href="https://vendors-new.bmtmicro.com/css/responsive.css"/>
    <script language="javascript" type="text/javascript" src="https://secure.bmtmicro.com/Templates/util.js"></script>
    <script language="javascript" type="text/javascript" src="https://vendors-new.bmtmicro.com/js/vendors.js"></script>
    <script type="text/javascript" src="https://vendors-new.bmtmicro.com/js/main.js"></script>
    <style media="screen" type="text/css">
      #resultframe {
        height: calc(100vh - 275px);
      }
    </style>
    <script language="javascript" type="text/javascript">
      <!--
      function initForm(form) {
        var showinactive = getCookieValue("BMTMicro.Vendors.Discounts.ShowInactive");
        if (showinactive != null) {
          form.SHOWINACTIVE.value = showinactive;
        }
        form.submit();
      }
      //-->
    </script>
  </head>
  <body onload="initForm (document.start);">
    <div style="visibility:hidden;">
      <form name="logout" method="post" action="https://vendors-new.bmtmicro.com/servlets/Vendors.Logout">
        <input type="hidden" name="NEXT_PAGE" value="https://vendors-new.bmtmicro.com/login.html">
        <input type="hidden" name="ERROR_PAGE" value="https://vendors-new.bmtmicro.com/error.jsp">
      </form>
      <form name="payoneer" method="post" action="https://vendors-new.bmtmicro.com/servlets/Vendors.Payoneer">
        <input type="hidden" name="NEXT_PAGE" value="https://vendors-new.bmtmicro.com/main.html">
        <input type="hidden" name="ERROR_PAGE" value="https://vendors-new.bmtmicro.com/error.jsp">
      </form>
    </div>

    <!-- Blue background header -->
    <div class="blue-bg"></div>

    <!-- Start of the body -->
    <div class="main-raised">
      <div class="container-fluid body-content">
        <article class="section">
          <div class="row justify-content-start">
            <jsp:include page="jsp/menuSidebar.jsp" />
            <div class="col-lg-10 col-md-12 page-title">
              <h4>Manage&nbsp;Discount&nbsp;Schemes</h4>
              <p>Click on Discount Scheme Name to edit discount schemes.</p>
              <div class="content-box">
                <form name="start" method=post action="https://vendors-new.bmtmicro.com/servlets/Vendors.DiscountSchemes" target="tableframe">
                  <input type="hidden" name="ACTION" value="-1" />
                  <input type="hidden" name="SHOWINACTIVE" value="0" />
                  <input type="hidden" name="ROWTEMPLATEURL" value="https://vendors-new.bmtmicro.com/discounts_tablerow.html" />
                  <input type="hidden" name="NEXT_PAGE" value="https://vendors-new.bmtmicro.com/discounts.html">
                  <input type="hidden" name="ERROR_PAGE" value="https://vendors-new.bmtmicro.com/error_frame.jsp">
                </form>
                <iframe src="" name="tableframe" id="tableframe" frameborder="0" border="0" cellspacing="0" style="border-style: none; width: 100%; padding: 0px; margin: 0px;">
                  [Your user agent does not support frames or is currently configured not to display frames. In order to use this area, frames are required.]
                </iframe>
                <iframe src="" name="resultframe" id="resultframe" frameborder="0" border="0" cellspacing="0" style="border-style: none;width: 100%; padding: 0px; margin:0px; display: none;">
                  [Your user agent does not support frames or is currently configured not to display frames. In order to use this area, frames are required.]
                </iframe>
              </div> <!-- end .content-box -->

            </div> <!-- end .col-lg-10 page-title -->
          </div> <!-- end first .row justify-content-start -->
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