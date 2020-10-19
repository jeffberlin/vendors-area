<%@ include file="/includes/core.jsp" %>
<div class="row table-responsive" style="margin-left: auto; margin-right: auto; overflow-x: inherit;">
  <table class="table" id="selection">
    <thead>
      <tr class="table-category text-center" id="center-th">
        <th scope="col" class="sort-column sortable sort" title="Sort on 'Order ID'" number>
          <a href="#" class="fdTableSortTrigger">Order&nbsp;ID</a>
        </th>
        <th scope="col" class="sort-column sortable sort" title="Sort on 'Product Name'" text>
          <a href="#" class="fdTableSortTrigger">Product&nbsp;Name</a>
        </th>
        <th scope="col" class="sort-column" info>
          <a href="#" style="cursor: default;" onclick="return false;">Comments</a>
        </th>
        <th scope="col" class="sort-column sortable sort" title="Sort on 'How Heard'" info>
          <a href="#" class="fdTableSortTrigger">How&nbsp;Heard</a>
        </th>
        <th scope="col" class="sort-column sortable sort" title="Sort on 'Custom 1'" info>
          <a href="#" class="fdTableSortTrigger">Custom&nbsp;1</a>
        </th>
        <th scope="col" class="sort-column sortable sort" title="Sort on 'Custom 2'" info>
          <a href="#" class="fdTableSortTrigger">Custom&nbsp;2</a>
        </th>
        <th scope="col" class="sort-column sortable sort" title="Sort on 'Custom 3'" info>
          <a href="#" class="fdTableSortTrigger">Custom&nbsp;3</a>
        </th>
        <th scope="col" class="sort-column sortable sort" title="Sort on 'Company/Name'" info>
          <a href="#" class="fdTableSortTrigger">Company/Name</a>
        </th>
        <th scope="col" class="sort-column sortable sort" title="Sort on 'Email Address'" info>
          <a href="#" class="fdTableSortTrigger">Email&nbsp;Address</a>
        </th>
      </tr>
    </thead>
    <!-- <tr>
      <th style="text-align: left; color: #707070; letter-spacing: .5px; font-size: .9rem; font-weight: 300; border-bottom: 1px solid #dddddd;" colspan="10">Filter results using the fields below.</th>
    </tr> -->
    <tr id="input-tr">
      <th number>
        <input class="input-search" type="text" name="FLT_ORDERID" value="${param.FLT_ORDERID}" size="10" style="min-width: 60px" placeholder="Search">
      </th>
      <th text>
        <input class="input-search" type="text" name="FLT_PRODUCTNAME" value="${param.FLT_PRODUCTNAME}" size="15"  placeholder="Search">
      </th>
      <th info>
        <input class="input-search" type="text" name="FLT_COMMENTS" value="${param.FLT_COMMENTS}" size="15"  placeholder="Search">
      </th>
      <th info>
        <input class="input-search" type="text" name="FLT_HOWHEARD" value="${param.FLT_HOWHEARD}" size="15"  placeholder="Search">
      </th>
      <th info>
        <input class="input-search" type="text" name="FLT_CCOM0" value="${param.FLT_CCOM0}" size="15"  placeholder="Search">
      </th>
      <th info>
        <input class="input-search" type="text" name="FLT_CCOM1" value="${param.FLT_CCOM1}" size="15"  placeholder="Search">
      </th>
      <th info>
        <input class="input-search" type="text" name="FLT_CCOM2" value="${param.FLT_CCOM2}" size="15"  placeholder="Search">
      </th>
      <th info>
        <input class="input-search" type="text" name="FLT_NAME" value="${param.FLT_NAME}" size="15"  placeholder="Search">
      </th>
      <th info>
        <input class="input-search" type="text" name="FLT_EMAIL" value="${param.FLT_EMAIL}" size="15"  placeholder="Search">
      </th>
    </tr>
    <tbody>
      <tr>
        ${param.TABLEDATA}
      </tr>
    </tbody>
    <tfoot>
      <tr class="table-total">
        <th scope="row" colspan="10">
          <div id="pageselector">&nbsp;</div>
        </th>
      </tr>
    </tfoot>
  </table>
</div>
