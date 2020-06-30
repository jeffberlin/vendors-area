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
    <script language="javascript" type="text/javascript" src="https://vendors-new.bmtmicro.com/js/vendors.js"></script>
    <script language="javascript" type="text/javascript" src="https://secure.bmtmicro.com/Templates/util.js"></script>
    <style media="screen" type="text/css">
      .content-box {
        min-height: 585px !important;
      }
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
    <!-- Blue background header -->
    <div class="blue-bg"></div>

    <!-- Start of body content -->
    <div class="main-raised">
      <div class="container-fluid body-content" id="primary">
        <article class="section">
          <div class="row justify-content-start">
            <%@ include file="/includes/menuSidebar.html" %>
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
      <%@ include file="/includes/footer.html" %>
    </div> <!-- end .main-raised -->
    <%@ include file="/includes/bootstrap_bottom_scripts.html" %>
  </body>
</html>
