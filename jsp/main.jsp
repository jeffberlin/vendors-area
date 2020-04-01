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
    <link rel="stylesheet" href="https://vendors-new.bmtmicro.com/css/main.css"/>
    <link rel="stylesheet" href="https://vendors-new.bmtmicro.com/css/responsive.css"/>
    <script language="javascript" type="text/javascript" src="https://secure.bmtmicro.com/Templates/util.js"></script>
    <script language="javascript" type="text/javascript" src="https://vendors-new.bmtmicro.com/js/vendors.js"></script>
    <script type="text/javascript" src="https://vendors-new.bmtmicro.com/js/vhelp.js"></script>
    <script type="text/javascript" src="https://vendors-new.bmtmicro.com/js/main.js"></script>
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
    <div id="fb-root"></div>
    <script>
      (function(d, s, id) {
        var js, fjs = d.getElementsByTagName(s)[0];
        if (d.getElementById(id)) return;
        js = d.createElement(s); js.id = id;
        js.src = "//connect.facebook.net/en_US/all.js#xfbml=1";
        fjs.parentNode.insertBefore(js, fjs);
      }(document, 'script', 'facebook-jssdk'));
    </script>
    <div style="visibility:hidden;">
      <form name="logout" method="post" action="https://vendors-new.bmtmicro.com/servlets/Vendors.Logout">
        <input type="hidden" name="NEXT_PAGE" value="https://vendors-new.bmtmicro.com/login.html">
        <input type="hidden" name="ERROR_PAGE" value="https://vendors.bmtmicro.com/error.html">
      </form>
      <form name="payoneer" method="post" action="https://vendors-new.bmtmicro.com/servlets/Vendors.Payoneer">
        <input type="hidden" name="NEXT_PAGE" value="https://vendors-new.bmtmicro.com/main.html">
        <input type="hidden" name="ERROR_PAGE" value="https://vendors.bmtmicro.com/error.html">
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
            <div class="col-lg-10 col-md-12">
              <div class="news-feed">
                <h4>News Feed</h4>
                <div class="col-12" style="padding: 0;">
                  <iframe src="https://vendors-new.bmtmicro.com/tweetstart.html" name="ceotweet" id="ceotweet" frameBorder="0" scrolling="no"></iframe>
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

      <jsp:include page="jsp/footer.jsp" />

    </div> <!-- end .main-raised -->

    <script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    <script type="text/javascript">
      /* Anything that clicks the document will hide the dropdown */
      $(window).click(function(){
        $(".dropright").removeClass('show');
      });
    </script>
  </body>
</html>
