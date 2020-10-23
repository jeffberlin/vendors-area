<%@ include file="/includes/core.jsp" %>
<div class="row table-responsive" style="margin-left: auto; margin-right: auto;">
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
        <input class="input-search" type="text" name="FLT_ORDERID" value="${requestScope.FLT_ORDERID}" size="10" style="min-width: 60px" placeholder="Search" onkeypress="filterKeyPress(event)">
      </th>
      <th text>
        <input class="input-search" type="text" name="FLT_PRODUCTNAME" value="${requestScope.FLT_PRODUCTNAME}" size="15" placeholder="Search" onkeypress="filterKeyPress(event)">
      </th>
      <th info>
        <input class="input-search" type="text" name="FLT_COMMENTS" value="${requestScope.FLT_COMMENTS}" size="15" placeholder="Search" onkeypress="filterKeyPress(event)">
      </th>
      <th info>
        <input class="input-search" type="text" name="FLT_HOWHEARD" value="${requestScope.FLT_HOWHEARD}" size="15" placeholder="Search" onkeypress="filterKeyPress(event)">
      </th>
      <th info>
        <input class="input-search" type="text" name="FLT_CCOM0" value="${requestScope.FLT_CCOM0}" size="15"  placeholder="Search" onkeypress="filterKeyPress(event)">
      </th>
      <th info>
        <input class="input-search" type="text" name="FLT_CCOM1" value="${requestScope.FLT_CCOM1}" size="15" placeholder="Search" onkeypress="filterKeyPress(event)">
      </th>
      <th info>
        <input class="input-search" type="text" name="FLT_CCOM2" value="${requestScope.FLT_CCOM2}" size="15" placeholder="Search" onkeypress="filterKeyPress(event)">
      </th>
      <th info>
        <input class="input-search" type="text" name="FLT_NAME" value="${requestScope.FLT_NAME}" size="15" placeholder="Search" onkeypress="filterKeyPress(event)">
      </th>
      <th info>
        <input class="input-search" type="text" name="FLT_EMAIL" value="${requestScope.FLT_EMAIL}" size="15" placeholder="Search" onkeypress="filterKeyPress(event)">
      </th>
    </tr>
    <tbody>
      <c:forEach var="row" items="${requestScope.TABLEDATA}">
        <tr onclick="highlightLinks(this)">
          <td number>${row.ORDERID}</td>
          <td text>${row.PRODUCTNAME}</td>
          <td info>${row.COMMENTS}</td>
          <td info>${row.HOWHEARD}</td>
          <td info>${row.CCOM0}</td>
          <td info>${row.CCOM1}</td>
          <td info>${row.CCOM2}</td>
          <td info><p>${row.NAME}</p></td>
          <td info><a href="mailto:${requestScope.EMAIL}">${row.EMAIL}</a></td>
        </tr>
      </c:forEach>
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
