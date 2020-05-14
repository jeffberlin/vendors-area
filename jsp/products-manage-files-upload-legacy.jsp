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
    <style media="screen">
      .file:hover {
        cursor: pointer;
      }
    </style>
    <script language="javascript" type="text/javascript">
      <!--
      function addFilenameField () {
        var ni = document.getElementById ('filenameDiv');
        var numi = document.getElementById ('fieldCount');
        var num = numi.value + 1;
        numi.value = num;
        var divIdName = "my"+num+"Div";var newdiv = document.createElement('div');newdiv.setAttribute("id",divIdName);
        newdiv.innerHTML = "<span><label>Filename:</label><input type=\"file\" name=\"file\" size=\"50\" /></span><br clear=\"all\" />";
        ni.appendChild (newdiv);
      }
      //-->
    </script>
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
              <form enctype="multipart/form-data" method="post" action="https://vendors-new.bmtmicro.com/servlets/Vendors.FileUploadLegacy">
                <input type="hidden" name="NEXT_PAGE" value="https://vendors-new.bmtmicro.com/products-manage-files-scanresult.jsp" />
                <input type="hidden" name="ERROR_PAGE" value="https://vendors-new.bmtmicro.com/error.jsp" />
                <h4>Upload&nbsp;File(s)</h4>
                <div class="content-box">
                  <span>
                    <label>Filename:&nbsp;</label>
                    <input type="file" name="file" class="file" style="margin-bottom: 1rem;" />
                  </span>
                  <br clear="all">
                  <span>
                    <div id="filenameDiv"></div>
                  </span>
                  <br clear="all">
                  <span>
                    <p><a href="javascript:addFilenameField();">Click here to add another file...</a></p>
                  </span>
                  <button class="save-btn" type="submit">Upload File(s)</button>
                </div> <!-- end .content-box -->
              </form>
            </div> <!-- end .col-lg-10 col-md-12 page-title -->
          </div> <!-- end .row justify-content-start -->
        </article>
      </div> <!-- end .container-fluid -->
      <%@ include file="/includes/footer.html" %>
    </div> <!-- end .main-raised -->
    <%@ include file="/includes/bootstrap_bottom_scripts.html" %>
  </body>
</html>
