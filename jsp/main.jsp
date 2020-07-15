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
    <link rel="stylesheet" href="https://vendors-new.bmtmicro.com/css/main.css"/>
    <script language="javascript" type="text/javascript" src="https://secure.bmtmicro.com/Templates/util.js"></script>
    <script language="javascript" type="text/javascript" src="https://vendors-new.bmtmicro.com/js/vendors.js"></script>
    <script language="javascript" type="text/javascript">
      <!--
      function submitForm (form) {
        form.DATEFROM.value = fromDate ();
        form.DATETO.value = makeDate ();
        form.submit ();
      }
      function initForm () {
        submitForm (document.productpiestart);
        submitForm (document.productlinestart);
        submitForm (document.productcolumnstart);
        submitForm (document.countrylinestart);
      }
     //-->
    </script>
  </head>
  <body onload="initForm ();">
    <!-- Blue background header -->
    <div class="blue-bg"></div>

    <!-- Start of body content -->
    <div class="main-raised">
      <div class="container-fluid body-content">
        <article class="section">
          <div class="row justify-content-start">
            <jsp:include page="includes/menuSidebar.jsp" />
            <div class="col-lg-10 col-md-12">
              <div class="news-feed">
                <h4>News Feed</h4>
                <div class="col-12">
                  <jsp:include page="/newsfeed.jsp" />
                </div>
              </div> <!-- end .news-feed -->
              <div class="row charts" style="margin-bottom: 8rem;">
                <div class="royalty-chart col-xl-5 col-lg-12">
                  <iframe src="https://vendors-new.bmtmicro.com/charts.html" name="columnchart" id="columnchart" frameborder="0" border="0" cellspacing="0"></iframe>
                </div>
                <div class="circle-graph col-xl-5 col-lg-12">
                  <iframe src="https://vendors-new.bmtmicro.com/charts.html" name="piechart" id="piechart" frameborder="0" border="0" cellspacing="0"></iframe>
                </div>
                <div class="product-chart col-xl-5 col-lg-12">
                  <iframe src="https://vendors-new.bmtmicro.com/charts.html" name="linechart" id="linechart" frameborder="0" border="0" cellspacing="0"></iframe>
                </div>
                <div class="country-graph col-xl-5 col-lg-12">
                  <iframe src="https://vendors-new.bmtmicro.com/charts.html" name="linebycountry" id="linebycountry" frameborder="0" border="0" cellspacing="0"></iframe>
                </div>
              </div> <!-- end .charts/row -->
            </div> <!-- end .col-lg-10 -->
          </div> <!-- end first .row -->
        </article>
      </div> <!-- end .container-fluid -->
      <%@ include file="/includes/footer.html" %>
    </div> <!-- end .main-raised -->
    <%@ include file="/includes/bootstrap_bottom_scripts.html" %>
  </body>
</html>
