<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
    <c:import url = "https://vendors-new.bmtmicro.com/includes/bootstrap_top_script.html" />
    <c:import url = "https://vendors-new.bmtmicro.com/includes/menu_footer_css.html" />
    <link rel="stylesheet" href="https://vendors-new.bmtmicro.com/css/style.css"/>
    <link rel="stylesheet" href="https://vendors-new.bmtmicro.com/css/table.css"/>
    <script language="javascript" type="text/javascript" src="https://secure.bmtmicro.com/Templates/util.js"></script>
    <script language="javascript" type="text/javascript" src="https://vendors-new.bmtmicro.com/js/vendors.js"></script>
    <script type="text/javascript" src="https://vendors-new.bmtmicro.com/js/vhelp.js"></script>
    <style media="screen" type="text/css">
      #resultframe {
        height: calc(100vh - 275px);
      }
    </style>
    <script language="javascript" type="text/javascript">
      <!--
      function initForm (form) {
        getVendorDateRange (form);
        form.submit ();
      }
      // -->
    </script>
  </head>
  <body onload="initForm (document.start);">
    <!-- Blue background header -->
    <div class="blue-bg"></div>

    <!-- Start of body content -->
    <div class="main-raised">
      <div class="container-fluid body-content">
        <article class="section">
          <div class="row justify-content-start">
            <c:import url = "https://vendors-new.bmtmicro.com/includes/menuSidebar.html" />
            <div class="col-lg-10 col-md-12 page-title">
              <h4>Customer&nbsp;Comments</h4>
              <p>This report displays customer comments and custom field values from your shopping cart.</p>
              <div class="content-box">
                <div>
                  <fmt:formatDate var="datenow" value="${now}" pattern="yyyy-MM-dd" />
                  <c:url value = "https://vendors-new.bmtmicro.com/servlets/Vendors.Comments" var = "commentsURL">
                    <c:param name = "SESSIONID" value = "${cookie['BMTMicro.Vendors.SessionID'].value}"/>
                    <c:param name = "DATEFROM" value="${datenow-6}" />
                    <c:param name = "DATETO" value="${datenow}" />" />
                    <c:param name = "ROWTEMPLATEURL" value="https://vendors-new.bmtmicro.com/customercomments_tablerow.html" />
                    <c:param name = "NEXT_PAGE" value="https://vendors-new.bmtmicro.com/customercomments.jsp" />
                    <c:param name = "ERROR_PAGE" value="https://vendors-new.bmtmicro.com/error.jsp" />
                  </c:url>
                  <c:import url = "${commentsURL}"/>
                </div>
                <iframe src="" name="resultframe" id="resultframe" frameborder="0" border="0" cellspacing="0" style="border-style: none;width: 100%; height: 350px; padding: 0px; margin:0px; display: none;" >
                   [Your user agent does not support frames or is currently configured not to display frames. In order to use this area, frames are required.]
                </iframe>
              </div> <!-- end .content-box -->
            </div> <!-- end .col-lg-10 col-md-12 page-title -->
          </div> <!-- end .row justify-content-start -->
        </article>
      </div> <!-- end .container-fluid -->
      <c:import url = "https://vendors-new.bmtmicro.com/includes/footer.html" />
    </div> <!-- end .main-raised -->
    <c:import url = "https://vendors-new.bmtmicro.com/includes/bootstrap_bottom_scripts.html" />
  </body>
</html>
