<%@ include file="/includes/core.jsp" %>
<form name="statistics" action="https://vendors-new.bmtmicro.com/servlets/Vendors.Statistics" method="post" onsubmit="return (CheckDateRange (this));">
  <div class="table-header">
    <span>From:&nbsp;<input id="DATEFROM" name="DATEFROM" value="${param.DATEFROM}" />
      <img src='<c:url value="/images/cal.gif"></c:url>' width="22" height="22" border="0" alt="Click Here to Pick the date" onclick="show_calendar ('DATEFROM'); return (false);" onmouseover="this.style.cursor='pointer';" />
    </span>
    <span>To:&nbsp;
      <input id="DATETO" name="DATETO" value="${param.DATETO}" style="margin-bottom: 1rem;" />
      <img src='<c:url value="/images/cal.gif"></c:url>' width="22" height="22" border="0" alt="Click Here to Pick the date" onclick="show_calendar ('DATETO'); return (false);"  onmouseover="this.style.cursor='pointer';" />
    </span>
    <br>
    <span>Consolidate By:&nbsp;
      <select name="CONSOLIDATEBY" onchange="consolidateByChanged (statistics);">
        <option value="0">Product Name</option>
        <option value="1">Product ID</option>
        <option value="2">Payment Date</option>
        <option value="3">Number of Items Ordered</option>
        <option value="4">Price of Item Ordered</option>
        <option value="5">Payment Method</option>
        <option value="6">Country</option>
        <option value="7">Comments</option>
        <option value="8">Howheard</option>
        <option value="9">Vendor specific info 1</option>
        <option value="10">Vendor specific info 2</option>
        <option value="11">Vendor specific info 3</option>
      </select>
    </span>
    <span>
      <select name="DIRECTION" onchange="directionChanged (statistics);">
        <option value="0">Ascending order</option>
        <option value="1">Descending order</option>
      </select>
    </span>
    <span>
      <input type="hidden" name="ROWTEMPLATEURL" value="${param.ROWTEMPLATEURL}" />
      <input type="hidden" name="NEXT_PAGE" value="https://vendors-new.bmtmicro.com/sales-view-statistics-table.jsp" />
      <input type="hidden" name="ERROR_PAGE" value="https://vendors-new.bmtmicro.com/error.jsp" />
      <button class="get-btn" value="Get Sales Summary">Get Statistics</button>
    </span>
  </div> <!-- end .table-header -->
  <div class="row table-responsive-lg" style="margin-left: auto; margin-right: auto;">
    <table class="table" id="selection">
      <thead>
        <tr class="table-category">
          <th scope="col" class="sort-column text-center sortable sort" title="Sort on '${param.FIELDNAME}'">
            <a href="#" class="fdTableSortTrigger">${param.FIELDNAME}</a>
          </th>
          <th scope="col" class="sort-column text-center sortable sort" title="Sort on 'Occurrence'">
            <a href="#" class="fdTableSortTrigger">Occurrence</a>
          </th>
        </tr>
      </thead>
      <tbody>
        ${param.TABLEDATA}
      </tbody>
      <tfoot>
        <tr class="table-total">
          <th scope="row"></th>
          <th scope="row" class="text-right"></th>
        </tr>
      </tfoot>
    </table>
  </div> <!-- end .row -->
</form>
