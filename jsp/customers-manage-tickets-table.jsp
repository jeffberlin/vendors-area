<%@ include file="/includes/core.jsp" %>
<form name="tickets" action="https://vendors-new.bmtmicro.com/servlets/Vendors.Tickets" method="post">
  <input type="hidden" name="NEXT_PAGE" value="https://vendors-new.bmtmicro.com/customers-manage-tickets-table.jsp" />
  <input type="hidden" name="ERROR_PAGE" value="https://vendors-new.bmtmicro.com/error-div.jsp" />
  <input type="hidden" name="ROWTEMPLATEURL" value="${param.ROWTEMPLATEURL}" />
  <input type="hidden" name="ROWSPERPAGE" value="${param.ROWSPERPAGE}" />
  <input type="hidden" name="PAGE" value="${param.PAGE}" />
  <input type="hidden" name="PAGECOUNT" value="${param.PAGECOUNT}" />
  <input type="hidden" name="ACTION" value="" />
  <input type="hidden" name="TICKETID" value="" />
  <div class="table-header">
    <input type="checkbox" name="SHOWDETAILS" value="-1" onClick="showDetailsChanged ();"<c:if test = "${ cookie['BMTMicro.Vendors.Tickets.ShowDetails'].value == -1 }">checked</c:if> />
    <span>
      Show details
    </span>
    <button type="button" class="grey-btn" onclick="refreshReport ();">Show Tickets</button>
  </div> <!-- end .table-header -->
  <div class="row table-responsive" style="margin-left: auto; margin-right: auto;">
    <table class="table"id="selection">
      <thead>
        <tr class="table-category">
          <th scope="col" class="sort-column sortable sort text-center" title="Sort on 'Email'" info>
            <a href="#" class="fdTableSortTrigger">Email</a>
          </th>
          <th scope="col" class="sort-column sortable sort text-center" title="Sort on 'Company/Name'" text>
            <a href="#" class="fdTableSortTrigger">Company/Name</a>
          </th>
          <th scope="col" class="sort-column sortable sort text-center" title="Sort on 'Product Name'" text>
            <a href="#" class="fdTableSortTrigger">Product&nbsp;Name</a>
          </th>
          <c:if test = "${param.SHOWDETAILS != -1}">
            <th scope="col" class="sort-column sortable sort text-center" title="Sort on 'Granted'" number>
              <a href="#" class="fdTableSortTrigger">Granted</a>
            </th>
            <th scope="col" class="sort-column sortable sort text-center" title="Sort on 'Redeemed'" number>
              <a href="#" class="fdTableSortTrigger">Redeemed</a>
            </th>
            <th scope="col" class="sort-column sortable sort text-center" title="Sort on 'Available'" number>
              <a href="#" class="fdTableSortTrigger">Available</a>
            </th>
          </c:if>
          <c:if test = "${param.SHOWDETAILS == -1}">
            <th scope="col" class="sort-column sortable sort text-center" title="Sort on 'Order ID'" number>
              <a href="#" class="fdTableSortTrigger">Order ID</a>
            </th>
            <th scope="col" class="sort-column sortable sort text-center" title="Sort on 'Expires'" date>
              <a href="#" class="fdTableSortTrigger">Expires</a>
            </th>
            <th scope="col" class="sort-column sortable sort text-center" title="Sort on 'Status'" text>
              <a href="#" class="fdTableSortTrigger">Status</a>
            </th>
            <th scope="col" class="sort-column sortable sort text-center" title="Sort on 'Status'" option></th>
          </c:if>
        </tr>
      </thead>
      <tr>
        <th style="text-align: left; color: #707070; letter-spacing: .5px; font-size: .9rem; font-weight: 300; border-bottom: 1px solid #dddddd;" colspan="10">
          Filter results using the fields below or leave all fields blank to retrieve all tickets.
        </th>
      </tr>
      <tr id="input-tr">
        <th info>
          <input class="input-search" type="text" name="FLT_EMAIL" value="" size="20" placeholder="Search" onkeypress="filterKeyPress(event);">
        </th>
        <th text>
           <input class="input-search" type="text" name="FLT_NAME" value="" size="20" placeholder="Search" onkeypress="filterKeyPress(event);">
        </th>
        <th text>
           <input class="input-search" type="text" name="FLT_PRODUCTNAME" value="" size="20" placeholder="Search" onkeypress="filterKeyPress(event);">
        </th>
        <c:if test = "${param.SHOWDETAILS != -1}">
          <th number></th>
          <th number></th>
          <th number></th>
        </c:if>
        <c:if test = "${param.SHOWDETAILS == -1}">
          <th number></th>
          <th date></th>
          <th text></th>
          <th option></th>
        </c:if>
      </tr>
      <tbody>
        <tr>
          ${param.TABLEDATA}
        </tr>
      </tbody>
      <tfoot>
        <tr class="table-total">
          <th scope="row" colspan="10">
            <div id="pageselector">
              <c:if test = "${param.PAGECOUNT > 1}">
                Pages:
                <c:forEach var = "page" begin = "1" end = "${param.PAGECOUNT}">
                  &nbsp;<a href="javascript:selectPage(${page});">${page}</a>&nbsp;
                </c:forEach>
              </c:if>
            </div>
          </th>
        </tr>
      </tfoot>
    </table>
  </form>
