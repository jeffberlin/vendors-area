<%@ include file="/includes/core.jsp" %>
<div class="transfer-section">
  <form method="post" action="https://vendors-new.bmtmicro.com/servlets/Vendors.DownloadFiles">
    <input type="hidden" name="ACTION" value="13" />
    <input type="hidden" name="DOWNLOADFILEID" value="${ requestScope.DOWNLOADFILEID }" />
    <input type="hidden" name="NEXT_PAGE" value="https://vendors-new.bmtmicro.com/products-manage-files-changeassociations-result.jsp" />
    <input type="hidden" name="ERROR_PAGE" value="https://vendors-new.bmtmicro.com/error-div.jsp" />
    <label>Update all products using file <strong>${ requestScope.DOWNLOADFILENAME }</strong> to use the following file:&nbsp;</label><br>
    <select name="NEWDOWNLOADFILEID" style="margin-bottom: 1rem;">
      <option value="0">No file</option>
      <c:forEach var="row" items="${ requestScope.TABLEDATA }">
        <option value="${row.FILEID}">${row.NAME} (${row.SIZE} bytes ${row.TIME})</option>
      </c:forEach>
    </select><br>
    <button type="button" class="save-btn" onclick="submitToResultFrame()" style="margin-right: .5rem;" >Apply</button>
    <button type="button" class="save-btn" onclick="closeResultFrame()">Cancel</button>
  </form>
</div> <!-- end .transfer-section -->
