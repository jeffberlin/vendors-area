<%@ page pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ include file="/includes/core.jsp" %>
<form name="summary" method="post" action="https://vendors-new.bmtmicro.com/servlets/Vendors.SalesSummary">
	<input type="hidden" name="NEXT_PAGE" value="https://vendors-new.bmtmicro.com/sales-summary-table.jsp" />
	<input type="hidden" name="ERROR_PAGE" value="https://vendors-new.bmtmicro.com/error-div.jsp" />
	<div class="table-header">
		<span>From:&nbsp;<input id="DATEFROM" name="DATEFROM" value="${requestScope.DATEFROM}" onkeypress="filterKeyPress(event)" />
			<img class="calendar" alt="Click Here to Pick the date" title="Click Here to Pick the date" onclick="show_calendar (this)" />
		</span>
		<span>To:&nbsp;<input id="DATETO" name="DATETO" value="${requestScope.DATETO}" onkeypress="filterKeyPress(event)" />
			<img class="calendar" alt="Click Here to Pick the date" title="Click Here to Pick the date" onclick="show_calendar (this)" />
		</span>
		<span>
			<button type="button" class="grey-btn" value="Get New Summary" onclick="refreshReport (document.summary);">Update Summary</button>
		</span>
	</div> <!-- end .table-header -->
</form>
<div class="row table-responsive" style="margin-left: auto; margin-right: auto;">
  <table class="table" id="selection">
    <thead>
      <tr class="table-category">
        <th scope="col" class="sort-column text-center sortable sort" title="Sort on 'Product'">
          <a href="#" class="fdTableSortTrigger">Product</a>
        </th>
        <th scope="col" class="sort-column text-center sortable sort" title="Sort on 'Units Sold'">
          <a href="#" class="fdTableSortTrigger">Units Sold</a>
        </th>
        <th scope="col" class="sort-column text-center sortable-currency sort" title="Sort on 'Total to Vendor'">
          <a href="#" class="fdTableSortTrigger">Total to Vendor</a>
        </th>
      </tr>
    </thead>
    <tbody>
      <c:forEach var="row" items="${requestScope.TABLEDATA}">
        <tr onclick="highlightLinks(this);">
          <td text>${row.PRODUCTNAME}</td>
          <td number>${row.QUANTITY}</td>
          <td money>${row.VENDORROYALTY}</td>
        </tr>
      </c:forEach>
    </tbody>
    <tfoot>
      <tr class="table-total">
        <th scope="row">Total</th>
        <th scope="row" class="text-center" number>${requestScope.TOTALQUANTITY}</th>
        <th scope="row" class="text-right" money>${requestScope.TOTALAMOUNT}</th>
      </tr>
    </tfoot>
  </table>
</div> <!-- end .row -->
