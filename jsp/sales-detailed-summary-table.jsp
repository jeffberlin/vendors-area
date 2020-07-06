<%@ include file="/includes/core.jsp" %>
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
      ${param.TABLEDATA}
    </tr>
  </tbody>
  <tfoot>
    <tr class="table-total">
      <th scope="row" colspan="5">Total</th>
      <th scope="row" class="text-center" number>${param.TOTALQUANTITY}</th>
      <th scope="row" class="text-right" money>${param.TOTALAMOUNT}</th>
    </tr>
  </tfoot>
</table>
