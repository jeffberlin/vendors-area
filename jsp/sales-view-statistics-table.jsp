<%@ page pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ include file="/includes/core.jsp" %>
<form name="statistics" action="https://vendors-new.bmtmicro.com/servlets/Vendors.Statistics" method="post">
   <input type="hidden" name="NEXT_PAGE" value="https://vendors-new.bmtmicro.com/sales-view-statistics-table.jsp" />
   <input type="hidden" name="ERROR_PAGE" value="https://vendors-new.bmtmicro.com/error-div.jsp" />
   <div class="table-header">
    <span>From:&nbsp;<input id="DATEFROM" name="DATEFROM" value="${requestScope.DATEFROM}" onkeypress="filterKeyPress(event)" />
      <img class="calendar" alt="Click Here to Pick the date" title="Click Here to Pick the date" onclick="show_calendar (this)" />
    </span>
    <span>To:&nbsp;
      <input id="DATETO" name="DATETO" value="${requestScope.DATETO}" style="margin-bottom: 1rem;" onkeypress="filterKeyPress(event)" />
      <img class="calendar" alt="Click Here to Pick the date" title="Click Here to Pick the date" onclick="show_calendar (this)" />
    </span>
    <br>
    <span>Consolidate By:&nbsp;
      <select name="CONSOLIDATEBY" onchange="consolidateByChanged (statistics);">
        <option value="0"<c:if test="${requestScope.CONSOLIDATEBY=='0'}"> selected</c:if>>Product Name</option>
        <option value="1"<c:if test="${requestScope.CONSOLIDATEBY=='1'}"> selected</c:if>>Product ID</option>
        <option value="2"<c:if test="${requestScope.CONSOLIDATEBY=='2'}"> selected</c:if>>Payment Date</option>
        <option value="3"<c:if test="${requestScope.CONSOLIDATEBY=='3'}"> selected</c:if>>Number of Items Ordered</option>
        <option value="4"<c:if test="${requestScope.CONSOLIDATEBY=='4'}"> selected</c:if>>Price of Item Ordered</option>
        <option value="5"<c:if test="${requestScope.CONSOLIDATEBY=='5'}"> selected</c:if>>Payment Method</option>
        <option value="6"<c:if test="${requestScope.CONSOLIDATEBY=='6'}"> selected</c:if>>Country</option>
        <option value="7"<c:if test="${requestScope.CONSOLIDATEBY=='7'}"> selected</c:if>>Comments</option>
        <option value="8"<c:if test="${requestScope.CONSOLIDATEBY=='8'}"> selected</c:if>>Howheard</option>
        <option value="9"<c:if test="${requestScope.CONSOLIDATEBY=='9'}"> selected</c:if>>Vendor specific info 1</option>
        <option value="10"<c:if test="${requestScope.CONSOLIDATEBY=='10'}"> selected</c:if>>Vendor specific info 2</option>
        <option value="11"<c:if test="${requestScope.CONSOLIDATEBY=='11'}"> selected</c:if>>Vendor specific info 3</option>
      </select>
    </span>
    <span>
      <select name="DIRECTION" onchange="directionChanged (statistics);">
        <option value="0"<c:if test="${requestScope.DIRECTION=='0'}"> selected</c:if>>Ascending order</option>
        <option value="1"<c:if test="${requestScope.DIRECTION=='1'}"> selected</c:if>>Descending order</option>
      </select>
    </span>
    <span>
      <button type="button" class="grey-btn" value="Get Sales Summary" onclick="refreshReport (document.statistics);">Get Statistics</button>
    </span>
   </div> <!-- end .table-header -->
</form>
<div class="row table-responsive-lg" style="margin-left: auto; margin-right: auto;">
  <table class="table" id="selection">
    <thead>
      <tr class="table-category">
        <th scope="col" class="sort-column text-center sortable sort" title="Sort on '${requestScope.FIELDNAME}'">
          <a href="#" class="fdTableSortTrigger">${requestScope.FIELDNAME}</a>
        </th>
        <th scope="col" class="sort-column text-center sortable sort" title="Sort on 'Occurrence'">
          <a href="#" class="fdTableSortTrigger">Occurrence</a>
        </th>
      </tr>
    </thead>
    <tbody>
      <c:forEach var="row" items="${requestScope.TABLEDATA}">
        <tr onclick="highlightLinks(this);">
          <td text>${row.DATA}</td>
          <td number>${row.COUNT}</td>
        </tr>
      </c:forEach>
    </tbody>
    <tfoot>
      <tr class="table-total">
        <th scope="row"></th>
        <th scope="row" class="text-right"></th>
      </tr>
    </tfoot>
  </table>
</div> <!-- end .row -->
