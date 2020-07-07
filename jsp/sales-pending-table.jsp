<%@ include file="/includes/core.jsp" %>
<div class="row table-responsive d-block" style="margin-left: auto; margin-right: auto;">
  <table class="table" id="selection">
    <thead>
      <tr class="table-category">
        <th scope="col" class="sort-column sortable sort text-center" title="Sort on 'Order ID'">
          <a href="#" class="fdTableSortTrigger">Order ID</a>
        </th>
        <th scope="col" class="sort-column sortable sort text-center" title="Sort on 'PO Number'">
          <a href="#" class="fdTableSortTrigger">PO Number</a>
        </th>
        <th class="sort-column sortable sort text-center" text title="Sort on 'Product Name'">
          <a href="#" class="fdTableSortTrigger">Product Name</a>
        </th>
        <th class="sort-column sortable sort text-center" date title="Sort on 'Date'">
          <a href="#" class="fdTableSortTrigger">Date</a>
        </th>
        <th class="sort-column sortable sort text-center" number title="Sort on 'Qty'">
          <a href="#" class="fdTableSortTrigger">Qty</a>
        </th>
        <th class="sort-column sortable sort text-center" money title="Sort on 'Due Vendor'">
          <a href="#" class="fdTableSortTrigger">Due Vendor</a>
        </th>
        <th class="sort-column sortable sort text-center" info title="Sort on 'Activation Code'">
          <a href="#" class="fdTableSortTrigger">Activation Code</a>
        </th>
        <th class="sort-column sortable sort text-center" info title="Sort on 'Company/Name'">
          <a href="#" class="fdTableSortTrigger">Company/Name</a>
        </th>
        <th class="sort-column sortable sort text-center" info title="Sort on 'Address'">
          <a href="#" class="fdTableSortTrigger">Address</a>
        </th>
        <th class="sort-column sortable sort text-center" info title="Sort on 'Phone'">
          <a href="#" class="fdTableSortTrigger">Phone</a>
        </th>
        <th class="sort-column sortable sort text-center" info title="Sort on 'Email'">
          <a href="#" class="fdTableSortTrigger">Email</a>
        </th>
        <th class="sort-column sortable sort text-center" info title="Sort on 'IP Address'">
          <a href="#" class="fdTableSortTrigger">IP Address</a>
        </th>
        <th class="sort-column sortable sort text-center" info title="Sort on 'Referral'">
          <a href="#" class="fdTableSortTrigger">Referral</a>
        </th>
        <th class="sort-column sortable sort text-center" info title="Sort on 'Payment Method'">
          <a href="#" class="fdTableSortTrigger">Payment Method</a>
        </th>
        <th class="sort-column sortable sort text-center" info title="Sort on 'Fulfillment Message'">
          <a href="#" class="fdTableSortTrigger">Fulfillment Message</a>
        </th>
      </tr>
    </thead>
    <tbody class="text-center">
      ${param.TABLEDATA}
    </tbody>
    <tfoot>
      <tr class="table-total">
        <th colspan="100%">
          Total Number of Units pending: ${param.TOTALQUANTITY}
          <br>
          Total Amount Due Vendor pending: ${param.TOTALAMOUNT}
        </th>
      </tr>
    </tfoot>
  </table>
</div> <!-- end .row -->
