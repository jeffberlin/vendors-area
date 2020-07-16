<%@ include file="/includes/core.jsp" %>
<form name="splits" action="https://vendors-new.bmtmicro.com/servlets/Vendors.V2VTransfer" method="post">
  <input type="hidden" name="ROWTEMPLATEURL" value="${param.ROWTEMPLATEURL}" />
  <input type="hidden" name="NEXT_PAGE" value="https://vendors-new.bmtmicro.com/sales-manage-transfers-table.jsp" />
  <input type="hidden" name="ERROR_PAGE" value="https://vendors-new.bmtmicro.com/error-div.jsp" />
  <input type="hidden" name="ACTION" value="" />
  <input type="hidden" name="TRANSFERID" value="" />
  <input type="hidden" name="PAYDAY" value="${param.PAYDAY}" />
  <div class="table-header">
    <button type="button" class="grey-btn" onclick="addAffiliateTransfer ();" style="margin-right: .5rem;">Add Affiliate Transfer</button>
    <button type="button" class="grey-btn" onclick="addVendorTransfer ();" >Add Vendor Transfer</button>
  </div> <!-- end .table-header -->
  <div class="row table-responsive" style="margin-left: auto; margin-right: auto;">
    <table class="table" id="selection">
      <thead>
        <tr class="table-category">
          <th scope="col" class="sort-column sortable sort text-center" title="Sort on 'Date'" date>
            <a href="#" class="fdTableSortTrigger">Transfer Date</a>
          </th>
          <th scope="col" class="sort-column sortable sort text-center" title="Sort" text>
            <a href="#" class="fdTableSortTrigger">Description</a>
          </th>
          <th scope="col" class="sort-column sortable sort text-center" title="Sort on 'Amount'" money>
            <a href="#" class="fdTableSortTrigger">Amount</a>
          </th>
          <th scope="col" class="sort-column text-center" option>
          </th>
          <th scope="col" class="sort-column sortable sort text-center" title="Sort on 'Status'" option>
            <a href="#" class="fdTableSortTrigger">Status</a>
          </th>
        </tr>
      </thead>
      <tbody>
        ${param.TABLEDATA}
      </tbody>
      <tfoot class="table-total">
        <th scope="col" colspan="6"></th>
      </tfoot>
    </table>
  </div>
</form>
