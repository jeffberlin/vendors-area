<%@ include file="/includes/core.jsp" %>
<div class="transfer-section">
	<form method="post" action="https://vendors-new.bmtmicro.com/servlets/Vendors.DownloadFiles">
		<input type="hidden" name="ACTION" value="-1" />
		<input type="hidden" name="DOWNLOADFILEID" value="${ requestScope.DOWNLOADFILEID }" />
		<input type="hidden" name="DOWNLOADFILENAME" value="${ requestScope.DOWNLOADFILENAME }" />
		<input type="hidden" name="NEXT_PAGE" value="https://vendors-new.bmtmicro.com/products-manage-files-changeassociations.jsp" />
		<input type="hidden" name="ERROR_PAGE" value="https://vendors-new.bmtmicro.com/error-div.jsp" />
		<c:if test = "${ requestScope.PRODUCTCOUNT == 0 }">
			<p>The file <strong>${ requestScope.DOWNLOADFILENAME }</strong> is currently not used.</p>
		</c:if>
		<c:if test = "${ requestScope.PRODUCTCOUNT != 0 }">
			<p>The following products and files are currently using the <strong>${ requestScope.DOWNLOADFILENAME }</strong> file.</p>
			<table class="table" style="margin-bottom: 1rem; width: 70%; border: 1px solid #a9a9a9;">
				<thead>
					<tr class="table-category">
						<th class="result-th sort-column">Product&nbsp;ID</th>
						<th class="result-th sort-column">Product&nbsp;Name</th>
						${ requestScope.PRODUCTTABLEDATA }
						<c:if test = "${ requestScope.FILECOUNT > 0 }">
							<td>Vendor&nbsp;ID</td>
							<td>File&nbsp;Name</td>
						</c:if>
						<c:forEach var="row" items="${ requestScope.FILETABLEDATA }">
							<option value="${row.FILEID}">${row.NAME} (${row.SIZE} bytes ${row.TIME})</option>
						</c:forEach>
					</tr>
				</thead>
			</table>
			<button type="button" class="save-btn" onclick="submitToResultFrame (this.form);" style="margin-right: .4rem;">Change file association for the associated products</button>
		</c:if>
		<button type="button" class="save-btn" onclick="closeResultFrame()">Close</button>
	</form>
</div> <!-- end .transfer-section -->
