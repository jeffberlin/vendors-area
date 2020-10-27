<%@ include file="/includes/core.jsp" %>
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
