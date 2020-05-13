<%@ include file="/includes/core.jsp" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <style media="screen" type="text/css">
      p {
        font-size: .9rem;
      }
      td[option], td[mnumber] {
        text-align: center;
      }
    </style>
    <script language="javascript" type="text/javascript">
      <!--
      function submitForm (action, target, nextpage, downloadfileid) {
        var form = document.files;
        form.ACTION.value = action;
        form.target = target;
        form.NEXT_PAGE.value = nextpage;
        form.ERROR_PAGE.value = (target == "_parent") ? "https://vendors-new.bmtmicro.com/error.jsp" : "https://vendors-new.bmtmicro.com/error_frame.js[]";
        form.DOWNLOADFILEID.value = downloadfileid;
        form.submit ();
      }

      function uploadFile () {
        if (allowChanges ("You do not have permission to upload files.")) {
          document.upload.submit ();
        }
      }

      function downloadFile (downloadfileid) {
        if (allowChanges ("You do not have permission to download files.")) {
          submitForm (1, "", "https://vendors-new.bmtmicro.com/products-manage-files-start.jsp", downloadfileid);
        }
      }

      function showDemoURL (downloadfileid) {
        submitForm (4, "resultframe", "https://vendors-new.bmtmicro.com/files_viewdemourl.html", downloadfileid);
        window.parent.document.getElementById('resultframe').style.display = "block";
        window.parent.document.getElementById('tableframe').style.display = "none";
      }

      function viewFile (downloadfileid) {
        submitForm (3, "resultframe", "https://vendors-new.bmtmicro.com/files_viewproducts.html", downloadfileid);
        window.parent.document.getElementById('resultframe').style.display = "block";
        window.parent.document.getElementById('tableframe').style.display = "none";
      }

      function deleteFile (downloadfileid) {
        if (allowChanges ("You do not have permission to delete files.")) {
          submitForm (2, "resultframe", "https://vendors-new.bmtmicro.com/files_delete.html", downloadfileid);
          window.parent.document.getElementById('resultframe').style.display = "block";
          window.parent.document.getElementById('tableframe').style.display = "none";
        }
      }

      function toggleDemo (downloadfileid) {
        submitForm (14, "", "https://vendors-new.bmtmicro.com/products-manage-files-start.jsp", downloadfileid);
      }

      function filterChanged () {
        submitForm (-1, "", "https://vendors-new.bmtmicro.com/products-manage-files-start.jsp");
      }

      function selectPage (p) {
        document.files.PAGE.value = p;
        submitForm (-1, "", "https://vendors-new.bmtmicro.com/products-manage-files-start.jsp");
      }

      function initForm (form) {
        if (${param.PAGECOUNT} > 1) {
          var s = "Pages:&nbsp;";
          for (var p = 1; p <= ${param.PAGECOUNT}; p++) {
            s += "<a href=\"javascript:selectPage(" + p + ");\">" + p  + "</a>&nbsp;&nbsp;";
          }
          document.getElementById ("pageselector").innerHTML = s;
        }
        catchEnter (form.FILTER, filterChanged);
      }
      //-->
    </script>
  </head>
  <body onload="initForm (document.files);">
    <form name="files" action="https://vendors-new.bmtmicro.com/servlets/Vendors.DownloadFiles" method="post" target="resultframe">
      <input type="hidden" name="ACTION" value="" />
      <input type="hidden" name="DOWNLOADFILEID" value="" />
      <input type="hidden" name="ROWTEMPLATEURL" value="${param.ROWTEMPLATEURL}" />
      <input type="hidden" name="ROWSPERPAGE" value="${param.ROWSPERPAGE}" />
      <input type="hidden" name="PAGE" value="${param.PAGE}" />
      <input type="hidden" name="PAGECOUNT" value="${param.PAGECOUNT}" />
      <input type="hidden" name="NEXT_PAGE" value="https://vendors-new.bmtmicro.com/products-manage-files-start.jsp" />
      <input type="hidden" name="ERROR_PAGE" value="https://vendors-new.bmtmicro.com/error_frame.jsp" />
      <div class="table-header">
        <span>
          Filter&nbsp;by&nbsp;File&nbsp;Name:
          <input type="text" name="FILTER" value="${param.FILTER}" style="margin-bottom: 1rem;" />&nbsp;
          <button type="button" name="FILTERBUTTON" value="Refresh" class="get-btn" onClick="filterChanged ();" />Apply</button>
        </span>
        <br clear="all">
        <p style="color: #ffffff; margin-bottom: .3rem;">
          Total&nbsp;number&nbsp;of&nbsp;files:&nbsp;${param.TOTALCOUNT}
        </p>
        <p style="color: #ffffff;">
          Total&nbsp;size:&nbsp;${param.TOTALSIZE}
        </p>
        <!-- <br clear="all" /> -->
        <button type="button" class="grey-btn" onclick="uploadFile ();">Upload File</button>
      </div> <!-- end .table-header -->
      <div class="row table-responsive" style="margin-left: auto; margin-right: auto;">
        <table class="table" id="selection">
          <thead>
            <tr class="table-category">
              <th scope="col" class="sort-column sortable sort text-center" title="Sort on 'File Name'" text>
                <a href="#" class="fdTableSortTrigger">File&nbsp;Name</a>
              </th>
              <th scope="col" class="sort-column sortable sort text-center" title="Sort on 'Size'"  data-sorttype="number">
                <a href="#" class="fdTableSortTrigger">Size</a>
              </th>
              <th scope="col" class="sort-column sortable sort text-center" title="Sort on 'Date'" date>
                <a href="#" class="fdTableSortTrigger">Date</a>
              </th>
              <th scope="col" class="sort-column number sortable sort text-center" data-sorttype="number" title="Sort by 'Download number'" date>
                <a href="#" class="fdTableSortTrigger">Download&nbsp;Count</a>
              </th>
              <th scope="col" class="sort-column text-center" option>
                <a href="#" style="cursor: default;" onclick="return false;">Share&nbsp;File</a>
              </th>
              <th scope="col" class="sort-column" option>
                <a href="#" style="cursor: default;" onclick="return false;"></a>
              </th>
              <th scope="col" class="sort-column" option>
                <a href="#" style="cursor: default;" onclick="return false;"></a>
              </th>
              <th scope="col" class="sort-column text-center" option>
                <a href="#" style="cursor: default;" onclick="return false;">Delete&nbsp;File</a>
              </th>
            </tr>
          </thead>
          <tbody>
            ${param.TABLEDATA}
          </tbody>
          <tfoot>
            <tr class="table-total">
              <th scope="row" colspan="8">
                <div id="pageselector">
                  &nbsp;
                </div>
              </th>
            </tr>
          </tfoot>
        </table>
      </div>
    </form>
    <form name="upload" method=post action="https://vendors-new.bmtmicro.com/servlets/CustomForms.CustomForm" target="_parent">
      <input type="hidden" name="NEXT_PAGE" value="https://vendors-new.bmtmicro.com/files_upload.jsp">
      <input type="hidden" name="ERROR_PAGE" value="https://vendors-new.bmtmicro.com/error.jsp">
    </form>
  </body>
</html>
