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
    <link rel="stylesheet" href="https://vendors-new.bmtmicro.com/css/responsive.css"/>
    <link rel="stylesheet" href="https://vendors-new.bmtmicro.com/css/tabOptions.css"/>
    <link rel="stylesheet" href="https://vendors-new.bmtmicro.com/css/notification.css"/>
    <script language="javascript" type="text/javascript" src="https://secure.bmtmicro.com/Templates/util.js"></script>
    <script language="javascript" type="text/javascript" src="https://vendors.bmtmicro.com/js/vendors.js"></script>
    <script type="text/javascript" src="https://vendors-new.bmtmicro.com/js/main.js"></script>
    <script src="https://kit.fontawesome.com/35c40e6698.js"></script>
    <style media="screen" type="text/css">
      .email-link {
        color: #195a7c;
      }
      .email-link:hover {
        transition: ease .2s;
        color: #efa900;
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
              <h4>Upload&nbsp;Files</h4>
              <ul class="nav nav-tabs" id="myTab" role="tablist">
                <li class="nav-item">
                  <a class="nav-link active" id="upload-tab" data-toggle="tab" href="#uploadTab" role="tab" aria-controls="upload files" aria-selected="true">
                    Upload
                  </a>
                </li>
                <li class="nav-item">
                  <a class="nav-link notifcation" id="result-tab" data-toggle="tab" href="#resultTab" role="tab" aria-controls="scan result" aria-selected="true">
                    Scan Result
                    <i class="fas fa-circle" id="circle" style="display: none;"></i>
                  </a>
                </li>
              </ul>
              <div class="content-box" style="padding: 1rem;">
                <div class="tab-content" id="myTabContent">
                  <div class="tab-pane fade show active" id="uploadTab" role="tabpanel" aria-labelledby="upload-tab">
                    <iframe src="https://vendors-new.bmtmicro.com/files_uploader236R.html" name="uploader" id="uploader" frameborder="0" border="0" cellspacing="0" style="border-style: none;width: 100%;height: 350px;padding: 0px; margin: 0px; background: #FFFFFF;" >
                     [Your user agent does not support frames or is currently configured not to display frames. In order to use this area, frames are required.]
                    </iframe>
                  </div> <!-- /.tab-pane fade show active #uploadtTab -->
                  <div class="tab-pane fade" id="resultTab">
                    <h5 style="color: #efa900; letter-spacing: .5px;">File&nbsp;Upload&nbsp;Result</h5>
                    <p>File Scan results are displayed below. If there is a problem with your file, please email us at <a href="mailto:vendors@bmtmicro.com" class="email-link">vendors@bmtmicro.com</a>.</p>
                    <iframe src="" name="resultframe" id="resultframe" frameborder="0" border="0" cellspacing="0" style="border-style: none; width: 100%; height: 500px; padding: 0px; margin: 0px; background: #FFFFFF;" >
                       [Your user agent does not support frames or is currently configured not to display frames. In order to use this area, frames are required.]
                    </iframe>
                  </div><!-- /.tab-pane fade #uploadtTab -->
                </div> <!-- /.tab-content #myTabContent -->
              </div> <!-- end .content-box -->
            </div> <!-- end .page-title -->
          </div> <!-- end .row justify-content-start -->
        </article> <!-- end .section -->
      </div> <!-- end .container-fluid -->
      <jsp:include page="jsp/footer.jsp" />
    </div> <!-- end .main-raised -->

    <script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    <script type="text/javascript">
      $('#result-tab').click(function () {
        $('#circle').css('display', 'none');
      });
    </script>
  </body>
</html>
