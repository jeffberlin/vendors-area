<%@ include file="/includes/core.jsp" %>
<div class="transfer-section">
	<form name="files" method="post" action="https://vendors-new.bmtmicro.com/servlets/Vendors.DownloadFiles" target="resultframe">
		<input type="hidden" name="ACTION" value="-1" />
		<input type="hidden" name="DOWNLOADFILEID" value="##DOWNLOADFILEID##" />
		<input type="hidden" name="DOWNLOADFILENAME" value="##DOWNLOADFILENAME##" />
		<input type="hidden" name="ROWTEMPLATEURL" value="https://vendors-new.bmtmicro.com/products-manage-files-changeassociations-tablerow.html" />
		<input type="hidden" name="NEXT_PAGE" value="https://vendors-new.bmtmicro.com/products-manage-files-changeassociations.html" />
		<input type="hidden" name="ERROR_PAGE" value="https://vendors-new.bmtmicro.com/error_frame.jsp" />
		<p>The following products and files are currently using the <strong>##DOWNLOADFILENAME##</strong>&nbsp;file.</p>
		<table class="table" style="margin-bottom: 1rem; width: 70%; border: 1px solid #a9a9a9;">
			<thead>
				##SELECT(PRODUCTCOUNT,0,,"<tr class="table-category text-center"><th class="result-th sort-column">Product&nbsp;ID</th><th class="result-th sort-column">Product&nbsp;Name</th>")##
					##PRODUCTTABLEDATA##
					##SELECT(FILECOUNT,0,,"<td>Vendor&nbsp;ID</td><td>File&nbsp;Name</td>")##
					##FILETABLEDATA##
				</tr>
			</thead>
		</table>
	</form>
	<form action="https://vendors-new.bmtmicro.com/products-manage-files.jsp" method="get" target="_parent">
		##SELECT(PRODUCTCOUNT,0,,"<button type="button" class="light-btn" onclick="document.files.submit ();" style="margin-right: .4rem;">Change file association for the associated products</button>")##
		<button type="button" class="light-btn" onclick="closeDiv()">Close</button>
	</form>
	<script language="javascript" type="text/javascript">
		function closeDiv() {
			document.getElementById('resultframe').style.display = "none";
		}
	</script>
</div> <!-- end .transfer-section -->
