<%@ include file="/includes/core.jsp" %>
<form name="discounts" method="post" action="https://vendors-new.bmtmicro.com/servlets/Vendors.DiscountSchemes">
	<input type="hidden" name="ACTION" value="-1" />
	<input type="hidden" name="NEXT_PAGE" value="https://vendors-new.bmtmicro.com/products-discounts-schemes-table.jsp" />
	<input type="hidden" name="ERROR_PAGE" value="https://vendors-new.bmtmicro.com/error-div.jsp" />
	<input type="hidden" name="SCHEMEID" value="" />
	<input type="hidden" name="SCHEMETYPE" value="" />
	<div class="table-header">
		<input type="checkbox" name="SHOWINACTIVE" value="-1" onClick="showInactiveChanged ();"<c:if test = "${ cookie['BMTMicro.Vendors.Discounts.ShowInactive'].value == -1 }">checked</c:if> />
		<span>
			Show inactive/expired schemes
		</span>
		<button type="button" class="grey-btn" onclick="addDiscount ();">Add New Scheme</button>
	</div> <!-- end .table-header -->
	<div class="row table-responsive" style="margin-left: auto; margin-right: auto;">
		<table class="table" id="selection">
			<thead>
				<tr class="table-category">
					<th scope="col" class="sort-column text-center" text>
						<a href="#" style="cursor: default;" onclick="return false;">Name</a>
					</th>
					<th scope="col" class="sort-column text-center" number>
						<a href="#" style="cursor: default;" onclick="return false;">Use&nbsp;Count</a>
					</th>
					<th scope="col" colspan="2" class="sort-column text-center" option>
						<a href="#" style="cursor: default;" onclick="return false;"></a>
					</th>
					<th scope="col" class="sort-column text-center" option>
						<a href="#" style="cursor: default;" onclick="return false;">Delete</a>
					</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="row" items="${requestScope.TABLEDATA}">
					<tr onclick="highlightLinks (this);" ${row.CLASS}>
					  <td mtext><a href="javascript:editDiscount (${row.SCHEMEID}, ${row.SCHEMETYPE});">${row.NAME}</a></td>
					  <td mnumber>${row.USECOUNT}</td>
					  <td option><button type="button" class="save-btn" onclick="viewCodes (${row.SCHEMEID}, ${row.SCHEMETYPE});">View Code</button></td>
					  <td option><button type="button" class="save-btn" onclick="generateCodes (${row.SCHEMEID}, ${row.SCHEMETYPE});">Generate Code</button></td>
					  <td option><button type="button" class="remove" onclick="deleteDiscount (${row.SCHEMEID}, ${row.SCHEMETYPE});"></button></td>
					</tr>
				</c:forEach>
			</tbody>
			<tfoot>
				<tr class="table-total">
					<th scope="row" colspan="6">
						<div id="pageselector"></div>
					</th>
				</tr>
			</tfoot>
		</table>
	</div>
</form>
