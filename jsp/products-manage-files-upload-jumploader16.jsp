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
    <title></title>
    <%@ include file="/includes/bootstrap_top_script.html" %>
    <%@ include file="/includes/style_menu_footer_css.html" %>
    <link rel="stylesheet" href="https://vendors-new.bmtmicro.com/css/table.css"/>
    <link rel="stylesheet" href="https://vendors-new.bmtmicro.com/css/addPages.css"/>
    <script language="javascript" type="text/javascript" src="https://secure.bmtmicro.com/Templates/util.js"></script>
    <script language="javascript" type="text/javascript" src="https://vendors-new.bmtmicro.com/js/vendors.js"></script>
  </head>
  <body onload="initForm (document.uploadresult);" onresize="sizeChanged ();">

    <!-- Blue background header -->
    <div class="blue-bg"></div>

    <!-- Start of body content -->
    <div class="main-raised">
      <div class="container-fluid body-content">
        <article class="section">
          <div class="row justify-content-start">
            <jsp:include page="includes/menuSidebar.jsp" />
            <div class="col-lg-10 col-md-12 page-title">
              <div class="content-box">
                <div id="uploader" name="uploader" style="height:480px">
                  <applet name="FileUploader" code="jmaster.jumploader.app.JumpLoaderApplet.class" archive="https://vendors-new.bmtmicro.com/jumploader_z.jar" width="100%" height="100%" mayscript>
                    <param name="vc_mainViewLogoEnabled" value="false" />
                    <param name="vc_useThumbs" value="false"/>
                    <param name="vc_uploadListViewName" value="_compact" />
                    <param name="uc_uploadUrl" value="https://vendors-new.bmtmicro.com/servlets/Vendors.FileUpload" />
                    <param name="uc_resumeCheckUrl" value="https://vendors-new.bmtmicro.com/servlets/Vendors.FileUpload" />
                    <param name="uc_partitionLength" value="16777216" />
                    <param name="uc_autoRetryCount" value="10" />
                    <param name="uc_autoRetryDelays" value="1,5,20,60,120" />
                    <param name="ac_fireUploaderStatusChanged" value="true" />
                    <param name="uc_httpUploaderClassName" value="jmaster.util.http.SocketHttpUploader" />
                  </applet>
                </div> <!-- end #uploader -->
                <form name="uploadresult" method="post" action="https://vendors-new.bmtmicro.com/servlets/Vendors.FileUpload">
                  <input type="hidden" name="NEXT_PAGE" value="https://vendors-new.bmtmicro.com/products-manage-files-scanresult.jsp" />
                  <input type="hidden" name="ERROR_PAGE" value="https://vendors-new.bmtmicro.com/error.jsp" />
                  <span style="vertical-align:middle;">
                    <input type="checkbox" name="PRESERVEFILETIME" value="-1" onclick="preserveFileTimeChanged (uploadresult);" />&nbsp;Preserve original time &amp; date of uploaded files
                  </span>
                </form>
              </div> <!-- end .content-box -->
            </div> <!-- end .col-lg-10 col-md-12 page-title -->
          </div> <!-- end .row justify-content-start -->
        </article>
      </div> <!-- end .contaier-fluid -->
      <jsp:include page="includes/footer.jsp" />
    </div> <!-- end .main-raised -->
    <%@ include file="/includes/bootstrap_bottom_scripts.html" %>
  </body>
</html>
