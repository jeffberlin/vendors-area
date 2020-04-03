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
        letter-spacing: .5px;
        margin-bottom: 1rem;
      }
      ul li:last-child {
        margin-bottom: 0;
      }
    </style>
  </head>
  <body>
    <div style="visibility:hidden;">
      <form name="logout" method="post" action="https://vendors-new.bmtmicro.com/servlets/Vendors.Logout">
        <input type="hidden" name="NEXT_PAGE" value="https://vendors-new.bmtmicro.com/login.html">
        <input type="hidden" name="ERROR_PAGE" value="https://vendors.bmtmicro.com/error.jsp">
      </form>
      <form name="payoneer" method="post" action="https://vendors-new.bmtmicro.com/servlets/Vendors.Payoneer">
        <input type="hidden" name="NEXT_PAGE" value="https://vendors-new.bmtmicro.com/main.jsp">
        <input type="hidden" name="ERROR_PAGE" value="https://vendors.bmtmicro.com/error.jsp">
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
              <p>Terms&nbsp;&&nbsp;Conditions</p>
              <div class="content-box" style="padding: 1rem;">
                <ul style="padding-left: 1rem; margin-bottom: 0;">
                  <li>Any developer or vendor who has an active vendor account may use our affiliate program once they have received their first payment from BMT Micro.</li>
                  <li>There are no setup fees required to use our affiliate program.</li>
                  <li>Affiliates payments are subject to a 60 day withholding period.</li>
                  <li>BMT Micro, Inc. reserves the right to void an affiliates sales if BMT Micro, Inc. has sufficient reason to believe an affiliate is using fraudulent, illegal or deceptive means to generate sales.</li>
                  <li>BTM Micro, Inc. will pay affiliates on or about March 31st, June 30th, September 30th, and December 31st on developers behalf at no charge to the vendor or affiliate.</li>
                  <li>Scheduled affiliate payments must equal or exceed $20.00 in order to receive payment. If the amount due an affiliate is less than $20.00, the amount due is &quot;rolled over&quot; into the next quarter.</li>
                  <li>After the initial 60 day holding period and the first scheduled affiliate payout, an affiliate may request that a check be issued on a monthly basis or to receive an unscheduled payment during our monthly cycle. There is a $5.00 per month administrative fee for unscheduled monthly payments.</li>
                  <li>Developers are responsible for setting affiliate payout percentages.</li>
                  <li>Developers may change their payout percentages at any time.</li>
                  <li>All affiliate inquiries concerning payout percentages will be directed and responded to by the developer.</li>
                  <li>The developer is responsible for full refund amount on affiliate generated sales that are later refunded regardless of reason for refund.</li>
                  <li>BMT Micro, Inc. is not responsible for reporting affiliate income to the Internal Revenue Service or other tax agencies.&nbsp;BMT Micro, Inc. makes payments to affiliates on the income generated from sales of developers products on the developers behalf.</li>
                  <li>BMT Micro, Inc. reserves the right modify, change and otherwise alter these terms and conditions at any time.</li>
                </ul>
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
