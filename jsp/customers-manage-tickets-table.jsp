<%@ include file="/includes/core.jsp" %>
<form name="tickets" action="https://vendors-new.bmtmicro.com/servlets/Vendors.Tickets" method="post">
  <input type="hidden" name="NEXT_PAGE" value="https://vendors-new.bmtmicro.com/customers-manage-tickets-table.jsp" />
  <input type="hidden" name="ERROR_PAGE" value="https://vendors-new.bmtmicro.com/error-div.jsp" />
  <input type="hidden" name="ROWSPERPAGE" value="${requestScope.ROWSPERPAGE}" />
  <input type="hidden" name="PAGE" value="${requestScope.PAGE}" />
  <input type="hidden" name="PAGECOUNT" value="${requestScope.PAGECOUNT}" />
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
          <c:choose>
            <c:when test = "${requestScope.SHOWDETAILS == -1}">
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
            </c:when>
            <c:otherwise>
              <th scope="col" class="sort-column sortable sort text-center" title="Sort on 'Granted'" number>
                <a href="#" class="fdTableSortTrigger">Granted</a>
              </th>
              <th scope="col" class="sort-column sortable sort text-center" title="Sort on 'Redeemed'" number>
                <a href="#" class="fdTableSortTrigger">Redeemed</a>
              </th>
              <th scope="col" class="sort-column sortable sort text-center" title="Sort on 'Available'" number>
                <a href="#" class="fdTableSortTrigger">Available</a>
              </th>
            </c:otherwise>
          </c:choose>
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
        <c:choose>
          <c:when test = "${requestScope.SHOWDETAILS == -1}">
            <th number></th>
            <th date></th>
            <th text></th>
            <th option></th>
          </c:when>
          <c:otherwise>
            <th number></th>
            <th number></th>
            <th number></th>
          </c:otherwise>
        </c:choose>
      </tr>
      <tbody>
        <c:forEach var="row" items="${requestScope.TABLEDATA}">
          <tr onclick="highlightLinks (this);">
            <td text><a href="mailto:${row.EMAIL}">${row.EMAIL}</a></td>
            <td text>${row.NAME}</td>
            <td info>${row.PRODUCTNAME}</td>
            <c:choose>
              <c:when test = "${requestScope.SHOWDETAILS == -1}">
                <td number class="text-center">${row.GRANTORDERID}</td>
                <td date class="text-center">${row.EXPIRATIONDATE}</td>
                <td text class="text-center">
                  <c:choose>
                    <c:when test="${row.STATUS=='2'}">
                      <font color="red">Expired</font>
                    </c:when>
                    <c:when test="${row.STATUS=='1'}">
                      ${row.REDEEMORDERID}
                    </c:when>
                    <c:otherwise>
                      <font color="green">Available</font>
                    </c:otherwise>
                  </c:choose>
                </td>
                <td class="text-center">
                  <c:choose>
                    <c:when test="${row.STATUS=='2'}">
                      <button class="save-btn" type="button" value="Expire" onclick="expireTicket (${row.TICKETID});">Expire</button>
                    </c:when>
                    <c:otherwise>
                      <button class="save-btn" type="button" value="Grant" onclick="addTicket (${row.TICKETID});">Grant</button>
                    </c:otherwise>
                  </c:choose>
                </td>
              </c:when>
              <c:otherwise>
                <td number>${row.TICKETCOUNT}</td>
                <td number>${row.REDEEMCOUNT}</td>
                <td number>${row.AVAILABLECOUNT}</td>
              </c:otherwise>
            </c:choose>
          </tr>
        </c:forEach>
      </tbody>
      <tfoot>
        <tr class="table-total">
          <th scope="row" colspan="10">
            <div id="pageselector">
              <c:if test = "${requestScope.PAGECOUNT > 1}">
                Pages:
                <c:forEach var = "page" begin = "1" end = "${requestScope.PAGECOUNT}">
                  &nbsp;<a href="javascript:selectPage(${page});">${page}</a>&nbsp;
                </c:forEach>
              </c:if>
            </div>
          </th>
        </tr>
      </tfoot>
    </table>
  </form>
