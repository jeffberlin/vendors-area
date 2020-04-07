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
    <link rel="stylesheet" href="https://vendors-new.bmtmicro.com/css/addPages.css"/>
    <link rel="stylesheet" href="https://vendors-new.bmtmicro.com/css/table.css"/>
    <link rel="stylesheet" href="https://vendors-new.bmtmicro.com/css/responsive.css"/>
    <script language="javascript" type="text/javascript" src="https://vendors-new.bmtmicro.com/js/vendors.js"></script>
    <script language="javascript" type="text/javascript" src="https://secure.bmtmicro.com/Templates/util.js"></script>
    <script type="text/javascript" src="https://vendors-new.bmtmicro.com/js/main.js"></script>
    <style media="screen" type="text/css">
      .text-area {
        padding: 1rem;
      }
      textarea {
        width: 100%;
        font-size: .9rem;
        margin-bottom: 1rem;
      }
    </style>
    <script language="javascript" type="text/javascript">
      <!--
      function submitForm (form) {
        if ((getCookieValue ("BMTMicro.Vendors.Flags") & 4) == 0) {
          alert ("You do not have permission to send.");
          return (false);
        }
        if (!isBlank (form.CC.value) && !isValidEmail (form.CC.value)) {
          alert ("The CC: address is not a valid e-mail address!")
          form.CC.focus ();
          return (false);
        }
        if (isBlank (form.SUBJECT.value)) {
          alert ("You must provide a subject");
          form.SUBJECT.focus ();
          return (false);
        }
        if (isBlank (form.BODY.value)) {
          alert ("The message contains no text");
          form.BODY.focus ();
          return (false);
        }
        form.submit ();
        return (true);
      }
      //-->
    </script>
  </head>
  <body>
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
            <div class="col-lg-10 col-md-12 page-title">
              <form accept-charset="UTF-8" method="post" action="https://vendors-new.bmtmicro.com/servlets/Vendors.EMailAffiliates">
                <input type="hidden" name="NEXT_PAGE"  value="https://vendors-new.bmtmicro.com/emailaffiliates_sent.jsp" />
                <input type="hidden" name="ERROR_PAGE" value="https://vendors-new.bmtmicro.com/error.jsp" />
                <h4>Email&nbsp;All&nbsp;Affiliates</h4>
                <p>Use this form to email all your affiliates.&nbsp;Individual affiliates can be emailed under Manage Affiliates.</p>
                <div class="content-box" style="padding: 0;">
                  <div class="table-header">
                    <span>
                      From&nbsp;Name:&nbsp;
                      <input name="FROMNAME" size="35" style="margin-bottom: 1rem;" />
                    </span>
                    <br>
                    <span>
                      CC:&nbsp;
                      <input name="CC" size="35" style="margin-bottom: 1rem;" />
                    </span>
                    <br>
                    <span>
                      Subject:&nbsp;
                      <input name="SUBJECT" size="35" />
                    </span>
                  </div> <!-- end .table-header -->
                  <div class="row justify-content-center">
                    <div class="text-area col-lg-8">
                      <textarea id="BODY" name="BODY" rows="25" placeholder="Type your message"></textarea>
                      <div class="text-right">
                        <button class="save-btn" type="button" name="Save" onclick="submitForm (form);">Send</button>
                      </div>
                    </div> <!-- end .text-area -->
                  </div> <!-- end .row -->
                </div> <!-- end .content-box -->
              </form>
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
