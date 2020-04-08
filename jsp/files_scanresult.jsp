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
    <title></title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" href="https://vendors-new.bmtmicro.com/css/style.css"/>
    <link rel="stylesheet" href="https://vendors-new.bmtmicro.com/css/table.css"/>
    <link rel="stylesheet" href="https://vendors-new.bmtmicro.com/css/responsive.css"/>
    <link rel="stylesheet" href="https://vendors-new.bmtmicro.com/css/addPages.css"/>
    <script language="javascript" type="text/javascript" src="https://secure.bmtmicro.com/Templates/util.js"></script>
    <script language="javascript" type="text/javascript" src="https://vendors-new.bmtmicro.com/js/vendors.js"></script>
    <script type="text/javascript" src="https://vendors-new.bmtmicro.com/js/main.js"></script>
    <style media="screen" type="text/css">
      h6 {
        color: #195a7c;
        letter-spacing: .5px;
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
      <div class="container-fluid body-content">
        <article class="section">
          <div class="row justify-content-start">
            <jsp:include page="jsp/menuSidebar.jsp" />
            <div class="col-lg-10 col-md-12 page-title">
              <h4>File&nbsp;Upload&nbsp;Result</h4>
              <p>File Scan results are displayed below. If there is a problem with your file, please email us at&nbsp;<a href="mailto:vendors@bmtmicro.com">vendors@bmtmicro.com</a>.</p>
              <div class="content-box">
                <h6><%= request.getParameter ("FILECOUNT") %> files scanned.</h6>
                <% { String addCount = request.getParameter ("ADDCOUNT"); if ((addCount != null) && (Integer.parseInt (addCount) > 0)) { %>
                <br clear="all" /><span><%= addCount %> files added.</span>
                <% }} %>
                <br>
                <% { String updateCount = request.getParameter ("UPDATECOUNT"); if ((updateCount != null) && (Integer.parseInt (updateCount) > 0)) { %>
                <br clear="all" /><span><%= updateCount %> files updated.</span>
                <% }} %>
                <br>
                <% { String virusCount = request.getParameter ("VIRUSCOUNT"); if ((virusCount != null) && (Integer.parseInt (virusCount) > 0)) { %>
                <br clear="all" /><span><font color="red"><%= virusCount %> files do not pass the virus check. The files are put in quarantine for further examination by a customer service representative. If we find that the files check out good, we will put them on-line. Otherwise, if we find issues with the files we will contact you in order to solve the problem. Please see virus scan below for details.</font></span>
                <% }} %>
                <br>
                <% { String errorCount = request.getParameter ("ERRORCOUNT"); if ((errorCount != null) && (Integer.parseInt (errorCount) > 0)) { %>
                <br clear="all" /><span><font color="red"><%= errorCount %> files have errors. These files are rejected. Please fix the errors listed below and reupload.</font></span>
                <% }} %>
                <br clear="all">
                <span>
                  <label style="margin-bottom: .1rem;">File&nbsp;Scan&nbsp;Details:</label>
                </span>
                <br>
                <textarea style="width: 650px; height: 350px; margin-bottom: 1rem;" rows="10" cols="20" name="SCANREPORT" readonly><%= request.getParameter ("SCANREPORT") %></textarea>
                <span>
                  <form action="https://vendors-new.bmtmicro.com/filesstart.html" method="get" target="_parent">
                    <button type="submit" name="Refresh" value="submit" class="save-btn" style="margin-right: .5rem;" >Done</button>
                    <button type="button" name="Refresh" onclick="document.upload.submit ();" class="save-btn">Upload More Files</button>
                  </form>
                  <form name="upload" method=post action="https://vendors-new.bmtmicro.com/servlets/CustomForms.CustomForm" target="_parent">
                    <input type="hidden" name="NEXT_PAGE" value="https://vendors-new.bmtmicro.com/files_upload.jsp">
                    <input type="hidden" name="ERROR_PAGE" value="https://vendors-new.bmtmicro.com/error.jsp">
                  </form>
                </span>
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
  </body>
</html>
