<%@ include file="/includes/core.jsp" %>
<form name="detailedsummary" method="post" action="https://vendors-new.bmtmicro.com/servlets/Vendors.SalesDSummary">
  <div class="row table-responsive-lg" style="margin-left: auto; margin-right: auto;">
    <div class="table-header">
      <span>From:&nbsp;<input id="DATEFROM" name="DATEFROM" value="${param.DATEFROM}" />
        <img src='<c:url value="/images/cal.gif"></c:url>' width="22" height="22" border="0" alt="Click Here to Pick the date" onclick="show_calendar ('DATEFROM'); return (false);" onmouseover="this.style.cursor='pointer';" />
      </span>
      <span>To:&nbsp;<input id="DATETO" name="DATETO" value="${param.DATETO}" />
        <img src='<c:url value="/images/cal.gif"></c:url>' width="22" height="22" border="0" alt="Click Here to Pick the date" onclick="show_calendar ('DATETO'); return (false);" onmouseover="this.style.cursor='pointer';" />
      </span>
      <span>
        <input type="hidden" name="ROWTEMPLATEURL" value="${param.ROWTEMPLATEURL}" />
        <input type="hidden" name="NEXT_PAGE" value="https://vendors-new.bmtmicro.com/sales-detailed-summary-table.jsp" />
        <input type="hidden" name="ERROR_PAGE" value="https://vendors-new.bmtmicro.com/error.jsp" />
        <button type="button" class="grey-btn" value="Get New Summary" onclick="refreshReport (document.detailedsummary);">Update Summary</button>
      </span>
    </div> <!-- end .table-header -->
    <table class="table" id="selection">
      <thead>
        <tr class="table-category">
          <th scope="col" class="sort-column text-center sortable sort" title="Sort on 'Product'">
            <a href="#" class="fdTableSortTrigger">Product</a>
          </th>
          <th scope="col" class="sort-column text-center sortable-numeric sort" title="Sort on 'Batch Size'">
            <a href="#" class="fdTableSortTrigger">Batch Size</a>
          </th>
          <th scope="col" class="sort-column text-center sortable-currency sort" title="Sort on 'Price'">
            <a href="#" class="fdTableSortTrigger">Price</a>
          </th>
          <th scope="col" class="sort-column text-center sortable-currency sort" title="Sort on 'Discount'">
            <a href="#" class="fdTableSortTrigger">Discount</a>
          </th>
          <th scope="col" class="sort-column text-center sortable-currency sort" title="Sort on 'To Vendor'">
            <a href="#" class="fdTableSortTrigger">To Vendor</a>
          </th>
          <th scope="col" class="sort-column text-center sortable-numeric sort" title="Sort on 'Units Sold'">
            <a href="#" class="fdTableSortTrigger">Units Sold</a>
          </th>
          <th scope="col" class="sort-column text-center sortable-currency sort" title="Sort on 'Total to Vendor'">
            <a href="#" class="fdTableSortTrigger">Total to Vendor</a>
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
          <th scope="row" colspan="5">Total</th>
          <th scope="row" class="text-right" number>${param.TOTALQUANTITY}</th>
          <th scope="row" class="text-right" money>${param.TOTALAMOUNT}</th>
        </tr>
      </tfoot>
    </table>
  </div> <!-- end .row table-responsive-lg -->
</form>
