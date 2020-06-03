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
      .content-box {
        max-height: calc(100vh - 275px);
        display: block;
      }
      .content-box, #tableframe {
        min-height: 290px;
      }
      td[option], td[mnumber] {
        text-align: center;
      }
    </style>
    <script language="javascript" type="text/javascript">
      function submitToDiv (form) {
        var target = '#' + $(form).attr('target');
        $.ajax({
          url: $(form).attr('action'), // the file to call
          data: $(form).serialize(), // get the form data
          type: $(form).attr('method'), // GET or POST
          success: function (data, status) {  
            $(target).html (data); //content loads here
          },
          error: function (xhr, desc, err) {
            console.log ("error");
          }
        });     
      }
      
      function submitForm (action, target, nextpage, downloadfileid) {
        var form = document.files;
        form.ACTION.value = action;
        form.target = target;
        form.NEXT_PAGE.value = nextpage;
        form.DOWNLOADFILEID.value = downloadfileid;
        submitToDiv (form);
      }

      function uploadFile () {
        if (allowChanges ("You do not have permission to upload files.")) {
          document.location.href = "https://vendors-new.bmtmicro.com/products-manage-files-upload.jsp";
        }
      }

      function downloadFile (downloadfileid) {
        if (allowChanges ("You do not have permission to download files.")) {
          submitForm (1, "tableframe", "https://vendors-new.bmtmicro.com/products-manage-files-table.jsp", downloadfileid);
        }
      }

      function showDemoURL (downloadfileid) {
        submitForm (4, "resultframe", "https://vendors-new.bmtmicro.com/products-manage-files-viewdemourl.html", downloadfileid);
        //document.getElementById('resultframe').style.display = "block";
        //document.getElementById('tableframe').style.display = "none";
      }

      function viewFile (downloadfileid) {
        submitForm (3, "resultframe", "https://vendors-new.bmtmicro.com/products-manage-files-viewproducts.jsp", downloadfileid);
        //document.getElementById('resultframe').style.display = "block";
        //document.getElementById('tableframe').style.display = "none";
      }

      function deleteFile (downloadfileid) {
        if (allowChanges ("You do not have permission to delete files.")) {
          submitForm (2, "resultframe", "https://vendors-new.bmtmicro.com/products-manage-files-delete.html", downloadfileid);
        //  document.getElementById('resultframe').style.display = "block";
        //  document.getElementById('tableframe').style.display = "none";
        }
      }

      function toggleDemo (downloadfileid) {
        submitForm (14, "tableframe", "https://vendors-new.bmtmicro.com/products-manage-files-table.jsp", downloadfileid);
      }

      function filterChanged () {
        submitForm (-1, "tableframe", "https://vendors-new.bmtmicro.com/products-manage-files-table.jsp");
      }

      function selectPage (p) {
        document.files.PAGE.value = p;
        submitForm (-1, "tableframe", "https://vendors-new.bmtmicro.com/products-manage-files-table.jsp");
      }
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
              <h4>Manage&nbsp;Files</h4>
              <p>The View Associations button only displays products and files associated for secure download file fulfillment.</p>
              <div class="content-box overflow-auto">
                <div name="tableframe" id="tableframe">
                  <c:import url = "https://vendors-new.bmtmicro.com/servlets/Vendors.DownloadFiles">
                    <c:param name="SESSIONID" value="${sessionid}" />
                    <c:param name="ACTION" value="-1" />
                    <c:param name="FILTER" value="" />
                    <c:param name="ROWSPERPAGE" value="500" />
                    <c:param name="PAGE" value="1" />
                    <c:param name="ROWTEMPLATEURL" value="https://vendors-new.bmtmicro.com/products-manage-files-tablerow.html" />
                    <c:param name="NEXT_PAGE" value="https://vendors-new.bmtmicro.com/products-manage-files-table.jsp" />
                    <c:param name="ERROR_PAGE" value="https://vendors-new.bmtmicro.com/error-table.jsp" />
                  </c:import>
                </div> <!-- end #tableframe -->
                <!-- <iframe src="" name="resultframe" id="resultframe" frameborder="0" border="0" cellspacing="0" style="border-style: none; width: 100%; padding: 0px; margin:0px; display: none; min-height: 220px;" >
                  [Your user agent does not support frames or is currently configured not to display frames. In order to use this area, frames are required.]
                </iframe> -->
              </div> <!-- end .content-box -->
              <div name="resultframe" id="resultframe"></div>
            </div>
          </div> <!-- end first .row justify-content-start -->
        </article>
      </div> <!-- end .container-fluid -->
      <%@ include file="/includes/footer.html" %>
    </div> <!-- end .main-raised -->
    <%@ include file="/includes/bootstrap_bottom_scripts.html" %>
  </body>
</html>
