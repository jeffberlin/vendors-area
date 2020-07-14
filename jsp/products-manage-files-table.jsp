<%@ include file="/includes/core.jsp" %>
<form id="files" name="files" action="https://vendors-new.bmtmicro.com/servlets/Vendors.DownloadFiles" method="post">
  <input type="hidden" name="ACTION" value="-1" />
  <input type="hidden" name="DOWNLOADFILEID" value="" />
  <input type="hidden" name="ROWTEMPLATEURL" value="https://vendors-new.bmtmicro.com/products-manage-files-tablerow.html" />
  <input type="hidden" name="ROWSPERPAGE" value="500" />
  <input type="hidden" name="PAGE" value="${param.PAGE}" />
  <input type="hidden" name="PAGECOUNT" value="${param.PAGECOUNT}" />
  <input type="hidden" name="NEXT_PAGE" value="https://vendors-new.bmtmicro.com/products-manage-files-table.jsp" />
  <input type="hidden" name="ERROR_PAGE" value="https://vendors-new.bmtmicro.com/error-div.jsp" />
  <div class="table-header">
    <span>
      Filter&nbsp;by&nbsp;File&nbsp;Name:
      <input type="text" name="FILTER" value="${param.FILTER}"/>&nbsp;
      <script>
        catchEnter (document.files.FILTER, filterChanged);
      </script>
      <button type="button" name="FILTERBUTTON" value="Refresh" class="grey-btn" onClick="filterChanged ();">Apply</button>
    </span>
		<button type="button" class="grey-btn float-right" onclick="uploadFile ();">Upload File</button>
		<span>
			${param.TOTALCOUNT} files, ${param.TOTALSIZE}
    </span>
  </div> <!-- end .table-header -->
  <div class="row table-responsive" style="margin-left: auto; margin-right: auto;">
    <table class="table" id="selection">
      <thead>
        <tr class="table-category">
          <th scope="col" class="sort-column sortable sort text-left" title="Sort on 'File Name'" text>
            <a href="#" class="fdTableSortTrigger">File Name</a>
          </th>
          <th scope="col" class="sort-column sortable sort text-center" title="Sort on 'Size'"  data-sorttype="number">
            <a href="#" class="fdTableSortTrigger">Size</a>
          </th>
          <th scope="col" class="sort-column sortable sort text-center" title="Sort on 'Date'" date>
            <a href="#" class="fdTableSortTrigger">Date</a>
          </th>
          <th scope="col" class="sort-column number sortable sort text-center" data-sorttype="number" title="Sort by 'Download number'" date>
            <a href="#" class="fdTableSortTrigger">Download</a>
          </th>
          <th scope="col" class="sort-column text-center" option>
            <a href="#" style="cursor: default;"
              onclick="return false;">Share</a>
          </th>
          <th scope="col" class="sort-column" option>
            <a href="#" style="cursor: default;" onclick="return false;"></a>
          </th>
          <th scope="col" class="sort-column" option>
            <a href="#" style="cursor: default;" onclick="return false;"></a>
          </th>
          <th scope="col" class="sort-column text-center" option>
            <a href="#" style="cursor: default;" onclick="return false;">Delete</a>
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
              <c:if test = "${param.PAGECOUNT > 1}">
                Pages:
                <c:forEach var = "page" begin = "1" end = "${param.PAGECOUNT}">
                  &nbsp;<a href="javascript:selectPage(${page});">${page}</a>&nbsp;
                </c:forEach>
              </c:if>
            </div>
          </th>
        </tr>
      </tfoot>
    </table>
  </div>
</form>
