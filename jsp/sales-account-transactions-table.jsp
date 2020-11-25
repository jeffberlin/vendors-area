<%@ page pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ include file="/includes/core.jsp" %>
<form name="transactions" action="https://vendors-new.bmtmicro.com/servlets/Vendors.Transactions" method="post">
  <input type="hidden" name="NEXT_PAGE" value="https://vendors-new.bmtmicro.com/sales-account-transactions-table.jsp" />
  <input type="hidden" name="ERROR_PAGE" value="https://vendors-new.bmtmicro.com/error-div.jsp" />
  <div class="table-header">
    <span>From:&nbsp;
      <input id="DATEFROM" name="DATEFROM" value="${requestScope.DATEFROM}" onkeypress="filterKeyPress(event)"/>&nbsp;
			<img class="calendar" alt="Click Here to Pick the date" title="Click Here to Pick the date" onclick="show_calendar (this)" />
    </span>
    <span>To:&nbsp;
      <input id="DATETO" name="DATETO" value="${requestScope.DATETO}" onkeypress="filterKeyPress(event)"/>&nbsp;
			<img class="calendar" alt="Click Here to Pick the date" title="Click Here to Pick the date" onclick="show_calendar (this)" />
    </span>
    <span>
      <select name="FORMAT">
        <option value="-1"<c:if test="${requestScope.FORMAT=='-1'}"> selected</c:if>>HTML (refresh)</option>
        <option value="0"<c:if test="${requestScope.FORMAT=='0'}"> selected</c:if>>HTML (printable)</option>
        <option value="1"<c:if test="${requestScope.FORMAT=='1'}"> selected</c:if>>CSV</option>
        <option value="2"<c:if test="${requestScope.FORMAT=='2'}"> selected</c:if>>XML</option>
        <option value="3"<c:if test="${requestScope.FORMAT=='3'}"> selected</c:if>>PDF</option>
      </select>
    </span>
    <span>
      <button type="button" class="grey-btn" value="Get Sales Summary" onclick="refreshReport (document.transactions);">Update Transactions</button>
    </span>
  </div> <!-- end .table-header -->
</form>
<div class="row table-responsive d-block" style="margin-left: auto; margin-right: auto;">
  <table class="table" id="selection">
    <thead>
      <tr class="table-category">
        <th scope="col" class="sort-column text-center sortable-date-ymd sort" date title="Sort on 'Date'">
          <a href="#" class="fdTableSortTrigger">Date</a>
        </th>
        <th scope="col" class="sort-column text-center sortable sort" title="Sort on 'Description'">
          <a href="#" class="fdTableSortTrigger">Description</a>
        </th>
        <th scope="col" class="sort-column text-center sortable-currency sort" money title="Sort on 'Amount'">
          <a href="#" class="fdTableSortTrigger">Amount</a>
        </th>
        <th scope="col" class="sort-column text-center sortable sort" info title="Sort on 'Notes'">
          <a href="#" class="fdTableSortTrigger">Notes</a>
        </th>
      </tr>
    </thead>
    <tbody>
      <c:forEach var="row" items="${requestScope.TABLEDATA}">
        <tr onclick="highlightLinks(this);" ${row.CLASS}>
          <td date>${row.TIME}</td>
          <td text>${row.DESCRIPTION}</td>
          <td money>${row.AMOUNT}</td>
          <td info>${row.NOTES}</td>
        </tr>
      </c:forEach>
    </tbody>
    <tfoot>
      <tr class="table-total">
        <th scope="row" colspan="2">Total:</th>
        <th scope="row" class="text-right">${requestScope.TOTALAMOUNT}</th>
        <th scope="row"></th>
      </tr>
    </tfoot>
  </table>
</div> <!-- end .row -->
