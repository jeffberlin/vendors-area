<%@ include file="/includes/core.jsp" %>
<div class="row table-responsive-lg" style="margin-left: auto; margin-right: auto;">
  <table class="table" id="selection">
    <thead>
      <tr class="table-category">
        <th scope="col" class="sort-column sortable sort text-center" title="Sort on 'ID'" number>
          <a href="#" class="fdTableSortTrigger">ID</a>
        </th>
        <th scope="col" class="sort-column sortable sort text-center" title="Sort on 'Name'" text>
          <a href="#" class="fdTableSortTrigger">Name</a>
        </th>
        <th scope="col" class="sort-column sortable sort text-center" title="Sort on 'Units Sold'" number>
          <a href="#" class="fdTableSortTrigger">Units&nbsp;Sold</a>
        </th>
        <th scope="col" class="sort-column sortable sort text-center" title="Sort on 'Gross Sales'" money>
          <a href="#" class="fdTableSortTrigger">Gross&nbsp;Sales</a>
        </th>
        <th scope="col" class="sort-column sortable sort text-center" title="Sort on 'to Affiliate'" money>
          <a href="#" class="fdTableSortTrigger">to&nbsp;Affiliate</a>
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
        <th scope="row" colspan="5">
          <div id="pageselector">&nbsp;</div>
        </th>
      </tr>
    </tfoot>
  </table>
</div>
