<%@ page pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ include file="/includes/core.jsp" %>
<div class="transfer-section">
	<c:if test = "${ requestScope.USECOUNT == 0 }">
		<form method="post" action="https://vendors-new.bmtmicro.com/servlets/Vendors.DiscountSchemes">
			<input type="hidden" name="NEXT_PAGE" value="https://vendors-new.bmtmicro.com/products-discounts-schemes.jsp" />
			<input type="hidden" name="ERROR_PAGE" value="https://vendors-new.bmtmicro.com/error-div.jsp" />
			<input type="hidden" name="ACTION" value="12">
			<input type="hidden" name="SCHEMEID" value="${ requestScope.SCHEMEID }" />
			<h5>Delete Discount Scheme</h5>
			<p>Please confirm deletion of the <strong>${ requestScope.NAME }</strong> discount scheme.</p>
			<p>By selecting delete you will have effectively cancelled this discount scheme. Discount codes cannot be reused or regenerated. This will invalidate all discount codes previously generated for this scheme.<strong style="color: red;">&nbsp;Deleted schemes do not show up in the reports.&nbsp;</strong>A new discount scheme will have to be created.</p>
			<button type="submit" value="Delete" class="save-btn" style="margin-right: .5rem;">Delete</button>
			<button type="button" class="save-btn" onclick="closeResultFrame()">Cancel</button>
		</form>
	</c:if>
	<c:if test = "${ requestScope.USECOUNT != 0 }">
		<h5>Delete Discount Scheme</h5>
		<p>Unable to Delete Discount Scheme</p>
		<p>The <strong>${ requestScope.NAME }</strong> discount scheme is currently used by <strong>${ requestScope.USECOUNT }</strong> product<c:if test = "${ requestScope.USECOUNT > 1 }">s</c:if>.</p>
		<p>In order to delete this discount scheme you must disassociate the product<c:if test = "${ requestScope.USECOUNT > 1 }">s</c:if> from this scheme.</p>
	</c:if>
</div>
