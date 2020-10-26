<%@ include file="/includes/core.jsp" %>
<form method="post" name="customersearch" action="https://vendors-new.bmtmicro.com/servlets/Vendors.OrderSearch">
  <input type="hidden" name="ACTION" value="0" />
  <input type="hidden" name="NEXT_PAGE" value="https://vendors-new.bmtmicro.com/customers-search-table.jsp" />
  <input type="hidden" name="ERROR_PAGE" value="https://vendors-new.bmtmicro.com/error-div.jsp" />
  <div class="table-header">
    <button type="button" class="grey-btn" value="Search for Customers" onclick="refreshReport (document.customersearch);">Search for Customers</button>
  </div> <!-- end .table-header -->
  <div class="row table-responsive" style="margin-left: auto; margin-right: auto;">
    <table class="table" id="selection">
      <thead>
        <tr class="table-category">
          <th scope="col" class="sort-column"></th>
          <th scope="col" class="sort-column sortable sort text-center" title="Sort on 'Order ID'" number>
            <a href="#" class="fdTableSortTrigger">Order&nbsp;ID</a>
          </th>
          <th scope="col" class="sort-column sortable sort text-center" title="Sort on 'Product Name'" text>
            <a href="#" class="fdTableSortTrigger">Product&nbsp;Name</a>
          </th>
          <th scope="col" class="sort-column sortable sort text-center" title="Sort on 'Date'" date>
            <a href="#" class="fdTableSortTrigger">Date</a>
          </th>
          <th scope="col" class="sort-column sortable sort text-center" title="Sort on 'Quantity'" number>
            <a href="#" class="fdTableSortTrigger">Qty</a>
          </th>
          <th scope="col" class="sort-column sortable sort text-center" title="Sort on 'Vendor'" money>
            <a href="#" class="fdTableSortTrigger">Due&nbsp;Vendor</a>
          </th>
          <th scope="col" class="sort-column text-center" text>
            <a href="#" style="cursor: default;" onclick="return false;">Item&nbsp;Comments</a>
          </th>
          <th scope="col" class="sort-column sortable sort text-center" title="Sort on 'Company/Name'" info>
            <a href="#" class="fdTableSortTrigger">Company/Name</a>
          </th>
          <th scope="col" class="sort-column sortable sort text-center" title="Sort on 'Address'" info>
            <a href="#" class="fdTableSortTrigger">Address</a>
          </th>
          <th scope="col" class="sort-column sortable sort text-center" title="Sort on 'Phone'" text>
            <a href="#" class="fdTableSortTrigger">Phone</a>
          </th>
          <th scope="col" class="sort-column sortable sort text-center" title="Sort on 'Email'" info>
            <a href="#" class="fdTableSortTrigger">Email</a>
          </th>
        </tr>
      </thead>
      <!-- <tr>
        <th style="text-align: left; color: #707070; letter-spacing: .5px; font-size: .9rem; font-weight: 300; border-bottom: 1px solid #dddddd;" colspan="12">Filter results using the fields below.</th>
      </tr> -->
      <tr id="input-tr">
        <th></th>
        <th id="input-tooltip" data-toggle="tooltip" data-placement="top" title="Filter results" number>
          <input class="input-search" type="text" name="FLT_ORDERID" value="${requestScope.FLT_ORDERID}" size="8" onkeypress="filterKeyPress(event)" onkeydown="javascript:stripspaces(this)" placeholder="Search">
        </th>
        <th id="input-tooltip" data-toggle="tooltip" data-placement="top" title="Filter results" text>
          <input class="input-search" type="text" name="FLT_PRODUCTNAME" value="${requestScope.FLT_PRODUCTNAME}" size="10" placeholder="Search" onkeypress="filterKeyPress(event)">
        </th>
        <th date></th>
        <th number></th>
        <th money></th>
        <th info></th>
        <th id="input-tooltip" data-toggle="tooltip" data-placement="top" title="Filter results" info>
          <input class="input-search" type="text" name="FLT_NAME" value="${requestScope.FLT_NAME}" size="14" placeholder="Search" onkeypress="filterKeyPress(event)">
        </th>
        <th id="input-tooltip" data-toggle="tooltip" data-placement="top" title="Filter results" info>
          <input class="input-search" type="text" name="FLT_ADDRESS" value="${requestScope.FLT_ADDRESS}" size="14" placeholder="Search" onkeypress="filterKeyPress(event)">
        </th>
        <th text></th>
        <th id="input-tooltip" data-toggle="tooltip" data-placement="top" title="Filter results" info>
          <input class="input-search" type="text" name="FLT_EMAIL" value="${requestScope.FLT_EMAIL}" size="14" onkeypress="filterKeyPress(event)" onkeydown="javascript:stripspaces(this)" placeholder="Search">
        </th>
      </tr>
      <tbody>
        <c:forEach var="row" items="${requestScope.TABLEDATA}">
          <tr onclick="highlightLinks(this)">
            <td>
              <button class="save-btn" onclick="editComments(${row.ORDERID},${row.ITEMNUMBER});return(false);">Comment</button>
              <c:choose>
                <c:when test="${row.RESENDBUTTON == -1}">
                  <button class="save-btn" onclick="resendInfo(${row.ORDERID},${row.ITEMNUMBER});return(false);">Resend</button>
                </c:when>
              </c:choose>
              <c:choose>
                <c:when test="${row.REFUNDBUTTON == -1}">
                  <br><button class="save-btn" onclick="refund(${row.ORDERID},${row.ITEMNUMBER});return(false);">Refund</button>
                </c:when>
              </c:choose>
            </td>
            <td number>${row.ORDERID}</td>
            <td text>${row.PRODUCTNAME}</td>
            <td date style="text-align: center;"><span style="white-space: nowrap;">${row.ORDERDATE}</span></td>
            <td number style="text-align: center;">${row.QUANTITY}</td>
            <td money style="text-align: right;">${row.VENDORROYALTY}</td>
            <td info><p>${row.ITEMCOMMENTS}</p></td>
            <td info style="text-align: center;"><p>${row.NAME}</p></td>
            <td info><p>${row.ADDRESS}</p></td>
            <td info style="text-align: center;">${row.PHONE}</td>
            <td info><a href="mailto:${row.EMAIL}">${row.EMAIL}</a></td>
          </tr>
        </c:forEach>
      </tbody>
      <tfoot>
        <tr class="table-total">
          <th scope="row" colspan="15">
            <div id="pageselector">&nbsp;</div>
          </th>
        </tr>
      </tfoot>
    </table>
  </div>
</form>
