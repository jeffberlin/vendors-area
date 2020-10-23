<%@ include file="/includes/core.jsp" %>
<div class="row table-responsive" style="margin-left: auto; margin-right: auto;">
  <table class="table" id="selection">
    <thead>
      <tr class="table-category">
        <th scope="col" class="sort-column text-center sortable sort" title="Sort on 'Product'">
          <a href="#" class="fdTableSortTrigger">Product</a>
        </th>
        <th scope="col" class="sort-column text-center sortable sort" title="Sort on 'Total Sales'">
          <a href="#" class="fdTableSortTrigger">Total Sales</a>
        </th>
      </tr>
    </thead>
    <tbody>
      <c:forEach var="row" items="${requestScope.TABLEDATA}">
        <tr onclick="highlightLinks(this);">
          <td text>${row.COUNTRYNAME}</td>
          <td money>${row.AMOUNT}</td>
        </tr>
      </c:forEach>
    </tbody>
    <tfoot>
      <tr class="table-total">
        <th scope="row">Total</th>
        <th scope="row" class="text-right" money>${requestScope.TOTALAMOUNT}</th>
      </tr>
    </tfoot>
  </table>
</div> <!-- end .row -->
