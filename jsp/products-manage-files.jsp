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
    <link rel="stylesheet" href="https://vendors-new.bmtmicro.com/css/table.css"/>
    <script language="javascript" type="text/javascript" src="https://secure.bmtmicro.com/Templates/util.js"></script>
    <script language="javascript" type="text/javascript" src="https://vendors-new.bmtmicro.com/js/vendors.js"></script>
    <style media="screen" type="text/css">
      .content-box, #tableframe {
        height: calc(100vh - 275px);
        min-height: 290px;
        overflow-y: scroll;
        display: block;
      }
    </style>
  </head>
  <body>

    <!-- Blue background header -->
    <div class="blue-bg"></div>

    <!-- Start of body content -->
    <div class="main-raised">
      <div class="container-fluid body-content">
        <article class="section">
          <div class="row justify-content-start">
            <%@ include file="/includes/menuSidebar.html" %>
            <div class="col-lg-10 col-md-12 page-title">
              <h4>Manage&nbsp;Files</h4>
              <p>The View Associations button only displays products and files associated for secure download file fulfillment.</p>
              <div class="content-box">
                <div name="tableframe" id="tableframe">
                  <c:import url = "https://vendors-new.bmtmicro.com/servlets/Vendors.DownloadFiles">
                    <c:param name="SESSIONID" value="${sessionid}" />
                    <c:param name="ACTION" value="-1" />
                    <c:param name="FILTER" value="" />
                    <c:param name="ROWSPERPAGE" value="500" />
                    <c:param name="PAGE" value="1" />
                    <c:param name="ROWTEMPLATEURL" value="https://vendors-new.bmtmicro.com/products-manage-files-tablerow.html" />
                    <c:param name="NEXT_PAGE" value="https://vendors-new.bmtmicro.com/products-manage-files-start.jsp" />
                    <c:param name="ERROR_PAGE" value="https://vendors-new.bmtmicro.com/error_frame.jsp" />
                  </c:import>
                </div> <!-- end #tableframe -->
                <iframe src="" name="resultframe" id="resultframe" frameborder="0" border="0" cellspacing="0" style="border-style: none; width: 100%; padding: 0px; margin:0px; display: none; min-height: 220px;" >
                   [Your user agent does not support frames or is currently configured not to display frames. In order to use this area, frames are required.]
                </iframe>
              </div> <!-- end .content-box -->
            </div>
          </div> <!-- end first .row justify-content-start -->
        </article>
      </div> <!-- end .container-fluid -->
      <%@ include file="/includes/footer.html" %>
    </div> <!-- end .main-raised -->
    <%@ include file="/includes/bootstrap_bottom_scripts.html" %>
  </body>
</html>
