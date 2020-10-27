<%@ include file="/includes/core.jsp" %>
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
