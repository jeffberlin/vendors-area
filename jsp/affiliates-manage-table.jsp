<%@ include file="/includes/core.jsp" %>
<form name="affiliates" action="https://vendors-new.bmtmicro.com/servlets/Vendors.Affiliates" method="post">
	<input type="hidden" name="ACTION" value="" />
	<input type="hidden" name="AFFILIATEID" value="" />
	<input type="hidden" name="ROWTEMPLATEURL" value="https://vendors-new.bmtmicro.com/affiliates-manage-tablerow.html" />
	<input type="hidden" name="NEXT_PAGE" value="https://vendors-new.bmtmicro.com/affiliates-manage-table.jsp" />
	<input type="hidden" name="ERROR_PAGE" value="https://vendors-new.bmtmicro.com/error-div.jsp" />
	<div class="table-header">
		<span style="color: #ffffff;">
			Affiliate ID:&nbsp;
			<input type="text" name="AFFILIATEID_ADD" value=""/>
		</span>
		<button class="grey-btn" id="affiliate-btn" onclick="addAffiliate (affiliates.AFFILIATEID_ADD.value);" >Add New Affiliate</button>
	</div> <!-- end .table-header -->
	<div class="row table-responsive-lg" style="margin-left: auto; margin-right: auto;">
		<table class="table" id="selection">
			<thead>
				<tr class="table-category">
					<th scope="col" class="sort-column sortable sort text-center" title="Sort on 'Affiliate ID'" number>
						<a href="#" class="fdTableSortTrigger">Affiliate&nbsp;ID</a>
					</th>
					<th scope="col" class="sort-column sortable sort text-center" title="Sort on 'Name'" text>
						<a href="#" class="fdTableSortTrigger">Name</a>
					</th>
					<th scope="col" class="sort-column sortable sort text-center" title="Sort on 'Date Joined'" date>
						<a href="#" class="fdTableSortTrigger">Date&nbsp;Joined</a>
					</th>
					<th scope="col" class="sort-column sortable sort text-center" title="Sort on 'Affiliate Email'" text>
						<a href="#" class="fdTableSortTrigger">Affiliate&nbsp;Email</a>
					</th>
					<th scope="col" class="sort-column sortable sort text-center" title="Sort on 'Affiliate Website'" text>
						<a href="#" class="fdTableSortTrigger">Affiliate&nbsp;Website</a>
					</th>
					<th scope="col" class="sort-column text-center" option>
						<a href="#" style="cursor: default;" onclick="return false;">Remove</a>
					</th>
				</tr>
			</thead>
			<tbody>
				${param.TABLEDATA}
			</tbody>
			<tfoot>
				<tr class="table-total">
					<th scope="row" colspan="6">
						<div id="pageselector">&nbsp;</div>
					</th>
				</tr>
			</tfoot>
		</table>
	</div>
</form>
