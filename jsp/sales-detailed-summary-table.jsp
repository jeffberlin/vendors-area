<%@ page pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ include file="/includes/core.jsp" %>
<form name="detailedsummary" method="post" action="https://vendors-new.bmtmicro.com/servlets/Vendors.SalesDSummary">
  <input type="hidden" name="NEXT_PAGE" value="https://vendors-new.bmtmicro.com/sales-detailed-summary-table.jsp" />
  <input type="hidden" name="ERROR_PAGE" value="https://vendors-new.bmtmicro.com/error-div.jsp" />
    <div class="table-header">
      <span>From:&nbsp;<input id="DATEFROM" name="DATEFROM" value="${requestScope.DATEFROM}" onkeypress="filterKeyPress(event)" />
        <img class="calendar" alt="Click Here to Pick the date" title="Click Here to Pick the date" onclick="show_calendar (this)" />
      </span>
      <span>To:&nbsp;<input id="DATETO" name="DATETO" value="${requestScope.DATETO}" onkeypress="filterKeyPress(event)" />
        <img class="calendar" alt="Click Here to Pick the date" title="Click Here to Pick the date" onclick="show_calendar (this)" />
      </span>
      <span>
        <button type="button" class="grey-btn" value="Get New Summary" onclick="refreshReport (document.detailedsummary);">Update Summary</button>
      </span>
    </div> <!-- end .table-header -->
</form>
<table class="table" id="selection">
  <thead>
    <tr class="table-category">
      <th scope="col" class="sort-column text-center sortable sort" title="Sort on 'Product'">
        <a href="#" class="fdTableSortTrigger">Product</a>
      </th>
      <th scope="col" class="sort-column text-center sortable-numeric sort" title="Sort on 'Batch Size'">
        <a href="#" class="fdTableSortTrigger">Batch Size</a>
      </th>
      <th scope="col" class="sort-column text-center sortable-currency sort" title="Sort on 'Price'">
        <a href="#" class="fdTableSortTrigger">Price</a>
      </th>
      <th scope="col" class="sort-column text-center sortable-currency sort" title="Sort on 'Discount'">
        <a href="#" class="fdTableSortTrigger">Discount</a>
      </th>
      <th scope="col" class="sort-column text-center sortable-currency sort" title="Sort on 'To Vendor'">
        <a href="#" class="fdTableSortTrigger">To Vendor</a>
      </th>
      <th scope="col" class="sort-column text-center sortable-numeric sort" title="Sort on 'Units Sold'">
        <a href="#" class="fdTableSortTrigger">Units Sold</a>
      </th>
      <th scope="col" class="sort-column text-center sortable-currency sort" title="Sort on 'Total to Vendor'">
        <a href="#" class="fdTableSortTrigger">Total to Vendor</a>
      </th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <c:forEach var="row" items="${requestScope.TABLEDATA}">
        <tr onclick="highlightLinks(this);">
          <td text>${row.PRODUCTNAME}</td>
          <td number>${row.BATCHSIZE}</td>
          <td money>${row.BATCHPRICE}</td>
          <td money>${row.BATCHDISCOUNT}</td>
          <td money>${row.BATCHROYALTY}</td>
          <td number>${row.QUANTITY}</td>
          <td money>${row.TOTALROYALTY}</td>
        </tr>
      </c:forEach>
    </tr>
  </tbody>
  <tfoot>
    <tr class="table-total">
      <th scope="row" colspan="5">Total</th>
      <th scope="row" class="text-center" number>${requestScope.TOTALQUANTITY}</th>
      <th scope="row" class="text-right" money>${requestScope.TOTALAMOUNT}</th>
    </tr>
  </tfoot>
</table>
