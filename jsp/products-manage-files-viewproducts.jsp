<%@ include file="/includes/core.jsp" %>
<div class="transfer-section">
	<form method="post" action="https://vendors-new.bmtmicro.com/servlets/Vendors.DownloadFiles">
		<input type="hidden" name="ACTION" value="-1" />
		<input type="hidden" name="DOWNLOADFILEID" value="${ requestScope.DOWNLOADFILEID }" />
		<input type="hidden" name="DOWNLOADFILENAME" value="${ requestScope.DOWNLOADFILENAME }" />
		<input type="hidden" name="NEXT_PAGE" value="https://vendors-new.bmtmicro.com/products-manage-files-changeassociations.jsp" />
		<input type="hidden" name="ERROR_PAGE" value="https://vendors-new.bmtmicro.com/error-div.jsp" />
		<c:if test="${requestScope.PRODUCTCOUNT==0 && requestScope.FILECOUNT==0}">
			<p>The file <strong>${ requestScope.DOWNLOADFILENAME }</strong> is currently not used.</p>
		</c:if>
		<c:if test="${requestScope.PRODUCTCOUNT!=0 || requestScope.FILECOUNT!=0}">
			<p>The following products and files are currently using the <strong>${ requestScope.DOWNLOADFILENAME }</strong> file.</p>
			<table class="table" style="margin-bottom: 1rem; width: 70%; border: 1px solid #a9a9a9;">
				<c:if test = "${requestScope.PRODUCTCOUNT!=0}">
					<thead>
						<tr class="table-category">
						<th class="result-th sort-column">Product&nbsp;ID</th>
						<th class="result-th sort-column">Product&nbsp;Name</th>
						<tr>
					<thead>
					<c:forEach var="row" items="${requestScope.PRODUCTTABLEDATA}">
						<tr class="table-category">
							<td class="result-th sort-column">${row.PRODUCTID}</td>
							<td class="result-th sort-column">${row.PRODUCTNAME}</td>
						</tr>
					</c:forEach>
				</c:if>
				<c:if test = "${requestScope.FILECOUNT!=0}">
					<thead>
						<tr class="table-category">
							<th class="result-th sort-column">Vendor&nbsp;ID</th>
							<th class="result-th sort-column">File&nbsp;Name</th>
						<tr>
					<thead>
					<c:forEach var="row" items="${requestScope.FILETABLEDATA}">
						<tr class="table-category">
							<td class="result-th sort-column">${row.VENDORID}</td>
							<td class="result-th sort-column">${row.FILENAME}</td>
						</tr>
					</c:forEach>
				</c:if>
			</table>
			<button type="button" class="save-btn" onclick="submitToResultFrame (this.form);" style="margin-right: .4rem;">Change file association for the associated products</button>
		</c:if>
		<button type="button" class="save-btn" onclick="closeResultFrame()">Close</button>
	</form>
</div> <!-- end .transfer-section -->
