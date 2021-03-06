<%@ page pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ include file="/includes/core.jsp" %>
<div class="transfer-section">
	<c:if test = "${ requestScope.USECOUNT == 0 }">
		<form method="post" action="https://vendors-new.bmtmicro.com/servlets/Vendors.DownloadFiles" >
			<input type="hidden" name="NEXT_PAGE" value="https://vendors-new.bmtmicro.com/products-manage-files.jsp" />
			<input type="hidden" name="ERROR_PAGE" value="https://vendors-new.bmtmicro.com/error-div.jsp" />
			<input type="hidden" name="ACTION" value="12" />
			<input type="hidden" name="DOWNLOADFILEID" value="${ requestScope.DOWNLOADFILEID }" />
			<h5>Confirm Deletion of Download File</h5>
			<p>Please confirm deletion of the file: <strong>${ requestScope.DOWNLOADFILENAME }</strong></p>
			<p>This file is not used by any products and can be deleted.</p>
			<button type="submit" class="save-btn" style="margin-right: .5rem;">Delete</button>
			<button type="button" class="save-btn" onclick="closeResultFrame()">Cancel</button>
		</form>
	</c:if>
	<c:if test = "${ requestScope.USECOUNT != 0 }">
		<h5>Unable to Delete Download File</h5>
		<p>The <strong>${ requestScope.DOWNLOADFILENAME }</strong> file is currently used by <strong>${ requestScope.USECOUNT }</strong> products or files.</p>
		<p style="font-size: .9rem;">In order to delete this download file you must disassociate any products or index files that are using this file.<br>
		Click the View Associations button on the Manage Files page to see what products or files are referring to this file.<br>
		See the Help files for more information.</p>
		<button type="button" class="save-btn" onclick="closeResultFrame()">Close</button>
	</c:if>
</div> <!-- end .transfer-section -->
