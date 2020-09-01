<%@ include file="/includes/core.jsp" %>
<div class="row table-responsive-lg" style="margin-left: auto; margin-right: auto;">
  <table class="table" id="selection">
    <thead>
      <tr class="table-category">
        <th scope="col" class="sort-column sortable sort text-center" title="Sort on 'Vendor ID'" number>
          <a href="#" class="fdTableSortTrigger">Split&nbsp;Vendor&nbsp;ID</a>
        </th>
        <th scope="col" class="sort-column sortable sort text-center" title="Sort on 'Name'" text>
          <a href="#" class="fdTableSortTrigger">Name</a>
        </th>
        <th scope="col" class="sort-column sortable sort text-center" title="Sort on 'Product Name'" text>
          <a href="#" class="fdTableSortTrigger">Product&nbsp;Name</a>
        </th>
        <th scope="col" class="sort-column sortable sort text-center" title="Sort on 'Units Sold'" number>
          <a href="#" class="fdTableSortTrigger">Units&nbsp;Sold</a>
        </th>
        <th scope="col" class="sort-column sortable sort text-center" title="Sort on 'Amount per Unit'" money>
          <a href="#" class="fdTableSortTrigger">Amount&nbsp;per&nbsp;Unit</a>
        </th>
        <th scope="col" class="sort-column sortable sort text-center" title="Sort on 'Total Amount'" money>
          <a href="#" class="fdTableSortTrigger">Total&nbsp;Amount</a>
        </th>
        <th scope="col" class="sort-column sortable sort text-center" title="Sort on 'Percentage/Amount'" number>
          <a href="#" class="fdTableSortTrigger">Percentage/Amount</a>
        </th>
        <th scope="col" class="sort-column sortable sort text-center" title="Sort on 'Percentage/Amount'" money>
          <a href="#" class="fdTableSortTrigger">Split</a>
        </th>
      </tr>
    </thead>
    <tr>
      <th style="text-align: left; color: #707070; letter-spacing: .5px; font-size: .9rem; font-weight: 300; border-bottom: 1px solid #dddddd;" colspan="10">Filter results using the fields below.
      </th>
    </tr>
    <tr id="input-tr">
      <th number>
        <input class="input-search" type="text" name="FLT_SPLITVENDORID" value="" placeholder="Search" size="12" onkeypress="filterKeyPress(event);">
      </th>
      <th text>
        <input class="input-search" type="text" name="FLT_NAME" value="" placeholder="Search" onkeypress="filterKeyPress(event);">
      </th>
      <th text>
        <input class="input-search" type="text" name="FLT_PRODUCTNAME" value="" placeholder="Search" onkeypress="filterKeyPress(event);">
      </th>
      <th number></th>
      <th money></th>
      <th money></th>
      <th number>
        <input class="input-search" type="text" name="FLT_PERCENTAGE" value="" placeholder="Search" size="14" onkeypress="filterKeyPress(event);">
      </th>
      <th text></th>
    </tr>
    <tbody>
      ${param.TABLEDATA}
    </tbody>
    <tfoot>
      <tr class="table-total">
        <th scope="row" colspan="3">Total</th>
        <th scope="row" class="text-center" number>${param.TOTALQUANTITY}</th>
        <th></th>
        <th scope="row" class="text-right" money>${param.TOTALVENDORROYALTY}</th>
        <th></th>
        <th scope="row" class="text-right" money>${param.TOTALSPLITROYALTY}</th>
      </tr>
    </tfoot>
  </table>
</div> <!-- end .row -->
