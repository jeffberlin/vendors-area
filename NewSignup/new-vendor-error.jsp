<%@ include file="/includes/core.jsp" %>
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
    <%@ include file="includes/bootstrap_top_script.html" %>
    <%@ include file="../includes/style_menu_footer_css.html" %>
    <link rel="stylesheet" href="https://vendors-new.bmtmicro.com/css/menuSidebar.css"/>
    <script src="https://secure.bmtmicro.com/Templates/util.js"></script>
    <script src="https://secure.bmtmicro.com/servlets/System.Util"></script>
    <script src="https://secure.bmtmicro.com/servlets/CustomForms.CustomForm"></script>
  </head>
  <body>
    <!-- Blue background header -->
    <div class="blue-bg"></div>

    <!-- Start of body content -->
    <div class="main-raised">
      <div class="container-fluid body-content">
        <article class="section">
          <div class="row justify-content-start">
            <div class="col-lg-2">
              <aside class="sidebar" role="complementary">
                <img src='<c:url value="https://vendors-new.bmtmicro.com/images/bmt-micro-logo-new-min.png"></c:url>' alt="BMT Micro, Inc. logo" height="60" style="margin-bottom: 20px;" />
                <div>
                  <a href="https://vendors-new.bmtmicro.com/">Already a Vendor?</a>
                </div>
                <div>
                  <a class="sidebar-group" href="https://www.bmtmicro.com/">More about our services</a>
                </div>
              </aside> <!-- end .sidebar -->
            </div> <!-- end .col-lg-2 -->
            <div class="col-lg-10 col-md-12 page-title">
              <h4>An Error Has Occurred</h4>
              <p>${param.MESSAGE}</p>
            </div> <!-- end .col-lg-10 col-md-12 page-title  -->
          </div> <!-- end .row justify-content-start -->
        </article> <!-- end .section -->
      </div> <!-- end .container-fluid .body-content -->
      <jsp:include page="../includes/footer.jsp" />
    </div> <!-- end .main-raised -->
    <%@ include file="includes/bootstrap_bottom_scripts.html" %>
  </body>
</html>
