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
    <script language="javascript" type="text/javascript" src="https://vendors-new.bmtmicro.com/js/vendors.js"></script>
    <script language="javascript" type="text/javascript" src="https://secure.bmtmicro.com/Templates/util.js"></script>
    <script type="text/javascript" src="https://vendors-new.bmtmicro.com/js/main.js"></script>
    <style media="screen" type="text/css">
      ul li {
        color: #707070;
      }
      ul li, h5 {
        letter-spacing: .5px;
      }
      h5 {
        font-size: 1.15rem;
      }
      h5, a {
        color: #195a7c;
      }
      a {
        color: #efa900;
      }
      a:hover {
        transition: all .2s ease;
      }
    </style>
  </head>
  <body>
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

    <!-- Start of body content -->
    <div class="main-raised">
      <div class="container-fluid body-content" id="primary">
        <article class="section">
          <div class="row justify-content-start">
            <jsp:include page="jsp/menuSidebar.jsp" />
            <div class="col-lg-10 col-md-12 page-title">
              <h4>Affiliate&nbsp;Program</h4>
              <p>General affiliate program information.</p>
              <div class="content-box" style="padding: 1rem;">
                <p>Affiliate programs allow your product(s) to be distributed by many different people with different marketing techniques and target audiences.&nbsp;You control the percentage paid to your affiliates.</p>
                <p style="margin-bottom: .5rem;"><strong>Why do affiliate programs work for developers and vendors?</strong></p>
                <ul>
                  <li>No salaries to worry about</li>
                  <li>Affiliates only paid if sales are made</li>
                  <li>No health benefits, workers compensation expenses, no holiday or sick pay</li>
                  <li>Expands your sales team around the world</li>
                </ul>
                <p style="margin-bottom: .5rem;"><strong>Why would someone want to be an affiliate?</strong></p>
                <ul>
                  <li>Add content and value to their own website and users</li>
                  <li>2nd income </li>
                  <li>Work from home</li>
                  <li>Work at own pace</li>
                  <li>Choose what products they would like to promote</li>
                </ul>
                <p>All vendors who signed up with BMT Micro before January 1st, 2003 are eligible to participate in our
              Affiliates Program. New Vendors must contact&nbsp;<a href="mailto:vendors@bmtmicro.com">vendors@bmtmicro.com</a>&nbsp;after receiving your first payment in order to have affiliate capabilities turned on.</p>
              <p>Set up your products to allow for affiliates in Edit Products by selecting Manage Products and clicking on the ProductID.&nbsp;If you need assistance, please read our&nbsp;<a href="https://help.bmtmicro.com/vendors/affiliate-program/" target="_blank">help</a>&nbsp;section.&nbsp;Once you have done this,&nbsp;contact&nbsp;<a href="mailto:vendors@bmtmicro.com">vendors@bmtmicro.com</a>&nbsp;to make sure your order forms have been updated to look for the Affiliate Information.</p>
              <p>The following links can be used to signup or login to our affiliate program.&nbsp;Feel free to add these links to your website and let your customers become your sales team.</p>
              <h5>New&nbsp;Affiliates&nbsp;Sign&nbsp;Up</h5>
              <p><a href="https://affiliates.bmtmicro.com/NewSignup/new_affiliate-signup.html" target="_blank">https://affiliates.bmtmicro.com/NewSignup/new_affiliate-signup.html</a></p>
              <h5>Affiliate&nbsp;Login</h5>
              <p><a href="https://affiliates.bmtmicro.com/" target="_blank">https://affiliates.bmtmicro.com/</a></p>
              </div> <!-- end .content-box -->
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
