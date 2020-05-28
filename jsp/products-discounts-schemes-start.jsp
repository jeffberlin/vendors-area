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
    <style media="screen" type="text/css">
      #resultframe {
        height: calc(100vh - 275px);
      }
      #tableframe, #resultframe {
        min-height: 290px;
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
    <!-- Blue background header -->
    <div class="blue-bg"></div>

    <!-- Start of the body -->
    <div class="main-raised">
      <div class="container-fluid body-content">
        <article class="section">
          <div class="row justify-content-start">
            <%@ include file="/includes/menuSidebar.html" %>
            <div class="col-lg-10 col-md-12 page-title">
              <h4>Manage&nbsp;Discount&nbsp;Schemes</h4>
              <p>Click on Discount Scheme Name to edit discount schemes.</p>
              <div class="content-box">
                <div name="tableframe" id="tableframe">
                  <c:import url = "https://vendors-new.bmtmicro.com/servlets/Vendors.DiscountSchemes">
                    <c:param name = "SESSIONID" value = "${sessionid}" />
                    <c:param name = "ACTION" value = "-1" />
                    <c:param name = "SHOWINACTIVE" value = "0" />
                    <c:param name = "ROWTEMPLATEURL" value = "https://vendors-new.bmtmicro.com/products-discounts-schemes-tablerow.html" />
                    <c:param name = "NEXT_PAGE" value = "https://vendors-new.bmtmicro.com/products-discounts-schemes-start-2.jsp" />
                    <c:param name = "ERROR_PAGE" value = "https://vendors-new.bmtmicro.com/error_frame.jsp" />
                  </c:import>
                  <!-- <form name="start" method=post action="https://vendors-new.bmtmicro.com/servlets/Vendors.DiscountSchemes" target="tableframe">
                    <input type="hidden" name="ACTION" value="-1" />
                    <input type="hidden" name="SHOWINACTIVE" value="0" />
                    <input type="hidden" name="ROWTEMPLATEURL" value="https://vendors-new.bmtmicro.com/products-discounts-schemes-tablerow.html" />
                    <input type="hidden" name="NEXT_PAGE" value="https://vendors-new.bmtmicro.com/products-discounts-schemes-start-2.jsp">
                    <input type="hidden" name="ERROR_PAGE" value="https://vendors-new.bmtmicro.com/error_frame.jsp">
                  </form> -->
                </div>
                <!-- <iframe src="" name="tableframe" id="tableframe" frameborder="0" border="0" cellspacing="0" style="border-style: none; width: 100%; padding: 0px; margin: 0px;">
                  [Your user agent does not support frames or is currently configured not to display frames. In order to use this area, frames are required.]
                </iframe> -->
                <iframe src="" name="resultframe" id="resultframe" frameborder="0" border="0" cellspacing="0" style="border-style: none;width: 100%; padding: 0px; margin:0px; display: none;">
                  [Your user agent does not support frames or is currently configured not to display frames. In order to use this area, frames are required.]
                </iframe>
              </div> <!-- end .content-box -->
            </div> <!-- end .col-lg-10 page-title -->
          </div> <!-- end first .row justify-content-start -->
        </article>
      </div> <!-- end .container-fluid -->
      <%@ include file="/includes/footer.html" %>
    </div> <!-- end .main-raised -->
    <%@ include file="/includes/bootstrap_bottom_scripts.html" %>
  </body>
</html>
