<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
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
    <link rel="stylesheet" type="text/css" href="https://vendors-new.bmtmicro.com/css/style.css"/>
    <c:import url = "https://vendors-new.bmtmicro.com/includes/menu_footer_css.html" />
    <style media="screen" type="text/css">
      .content-box {
        padding: 1rem;
      }
    </style>
  </head>
  <body>

    <!-- Blue background header -->
    <div class="blue-bg"></div>

    <!-- Start of body content -->
    <div class="main-raised">
      <div class="container-fluid body-content">
        <article class="section">
          <div class="row justify-content-start">
            <c:import url = "https://vendors-new.bmtmicro.com/includes/menuSidebar.html" />
            <div class="col-lg-10 col-md-12 page-title">
              <h4>Error</h4>
              <p>An error has occurred.</p>
              <div class="content-box">
                <p>${ param.MESSAGE }
                  <c:if test = "${ param.MESSAGE == null }">
                    We are unable to complete your request at this time. The system may be down at this time. Please wait 60 minutes and try your report again. If you continue to have difficulties, please contact <a href="mailto:vendors@bmtmicro.com">vendors@bmtmicro.com</a> for assistance.
                  </c:if>
                </p>
              </div> <!-- end .content-box -->
            </div> <!-- end .col-lg-10 col-md-12 page-title -->
          </div> <!-- end .row justify-content-start -->
        </article>
      </div> <!-- end .container-fluid body-content -->
      <c:import url = "https://vendors-new.bmtmicro.com/includes/footer.html" />
    </div> <!-- end .main-raised -->
    <c:import url = "https://vendors-new.bmtmicro.com/includes/bootstrap_bottom_scripts.html" />
  </body>
</html>
