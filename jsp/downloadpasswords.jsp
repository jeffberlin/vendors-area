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
    <link rel="stylesheet" href="https://vendors-new.bmtmicro.com/css/addPages.css"/>
    <link rel="stylesheet" href="https://vendors-new.bmtmicro.com/css/responsive.css"/>
    <script language="javascript" type="text/javascript" src="https://secure.bmtmicro.com/Templates/util.js"></script>
    <script language="javascript" type="text/javascript" src="https://vendors-new.bmtmicro.com/js/vendors.js"></script>
    <script type="text/javascript" src="https://vendors-new.bmtmicro.com/js/main.js"></script>
    <style media="screen" type="text/css">
      #resultframe, .content-box {
        height: calc(100vh - 300px);
      }
      .content-box {
        overflow-y: scroll;
        display: block;
      }
    </style>
    <script language="javascript" type="text/javascript">
      <!--
      function getStatus (form) {
        if (isBlank (form.PASSWORD.value)) {
          alert ("You must provide a valid search criteria!");
          form.PASSWORD.focus ();
          return (false);
        }
        window.parent.document.getElementById('content2').style.display = "block";
        window.parent.document.getElementById('content1').style.display = "none";
        form.ACTION.value = "0";
        form.NEXT_PAGE.value = "https://vendors-new.bmtmicro.com/downloadpasswords_status.html";
        form.submit ();
        return (true);
      }

      function sendPassword (form) {
        if (!allowResend ("You do not have permission to resend information.")) {
          return (false);
        }
        if (!isValidEmail (form.EMAIL.value)) {
          alert ("You must provide a valid email address!");
          form.EMAIL.focus ();
          return (false);
        }
        window.parent.document.getElementById('content2').style.display = "block";
        window.parent.document.getElementById('content1').style.display = "none";
        form.ACTION.value = "-1";
        form.NEXT_PAGE.value = "https://vendors-new.bmtmicro.com/downloadpasswords_sent.html";
        form.submit ();
        return (true);
      }

      function initForm (form) {
        if (form.PRODUCTID.options.length === 0) {
          disableButton ('status');
          disableButton ('password');
        } else {
          form.PRODUCTID.selectedIndex = 0;
        }
      }
      //-->
    </script>
  </head>
  <body onload="initForm (document.downloadpasswords);">
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
      <div class="container-fluid body-content">
        <article class="section">
          <div class="row justify-content-start">
            <jsp:include page="jsp/menuSidebar.jsp" />
            <div class="col-lg-10 col-md-12 page-title">
              <form name="downloadpasswords" method="post" action="https://vendors-new.bmtmicro.com/servlets/Vendors.DownloadPassword" target="resultframe">
                <input type="hidden" name="ACTION" />
                <input type="hidden" name="NEXT_PAGE" value="https://vendors-new.bmtmicro.com/downloadpasswords_status.html" />
                <input type="hidden" name="ERROR_PAGE" value="https://vendors-new.bmtmicro.com/error_frame.jsp" />
                <h4>Manage&nbsp;Passwords</h4>
                <p>Select a product from the list below to check the status of order generated passwords or generate new password to any email.</p>
                <div class="content-box" id="content1">
                  <span>
                    <label>Product&nbsp;List:</label>
                    <br>
                    <select name="PRODUCTID" size=10 style="width:60%; margin-bottom: 1rem;">
                       <%= request.getParameter ("PRODUCTLIST") %>
                    </select>
                  </span>
                  <h5>Get&nbsp;Password&nbsp;Status</h5>
                  <p>Check password status of any order generated password.</p>
                  <span>
                    <label>Look up status using:&nbsp;</label>
                    <select name="FIELD_SEL" style="margin-bottom: 1rem;">
                      <option value="0">Password:</option>
                      <option value="1">Order ID:</option>
                      <option value="2">Order Number:</option>
                    </select>
                  </span>
                  <br clear="all">
                  <input type="text" name="PASSWORD" value=""  style="margin-bottom: 1rem;" placeholder="Search"/>
                  <div class="controlbuttons">
                    <button id="status" type="button" class="grey-btn" value="Save" onclick="getStatus (downloadpasswords);" style="margin-bottom: 1rem;">Get Status</button>
                  </div>
                  <h5>Send&nbsp;New&nbsp;Password</h5>
                  <p>Generate a new password to any email address.</p>
                  <span>
                    <label>Customer&nbsp;Email:&nbsp;</label>
                    <input type="text" name="EMAIL" value="" style="margin-bottom: 1rem;"/>
                  </span>
                  <br clear="all">
                  <span>
                    <input type="checkbox" name="CCEMAIL" value="<%= request.getParameter ("CCEMAIL") %>" style="margin-bottom: 1rem;"/>&nbsp;Send copy to:&nbsp;<strong><%= request.getParameter ("CCEMAIL") %></strong>
                  </span>
                  <div class="controlbuttons">
                    <button id="password" type="button" class="grey-btn" value="Save" onclick="sendPassword (downloadpasswords);">Send Password</button>
                  </div>
                </form>
              </div> <!-- end .content-box -->
              <div class="content-box" id="content2" style="display: none;">
                <iframe src="" name="resultframe" id="resultframe" frameborder="0" border="0" cellspacing="0" style="border-style: none;width: 100%;" ></iframe>
              </div>
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
