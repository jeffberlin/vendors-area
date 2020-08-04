<%@ include file="/includes/core.jsp" %>
<form name="regions" action="https://vendors-new.bmtmicro.com/servlets/Vendors.WorldRegions" method="post">
  <input type="hidden" name="ROWTEMPLATEURL" value="${param.ROWTEMPLATEURL}" />
  <input type="hidden" name="NEXT_PAGE" value="https://vendors-new.bmtmicro.com/manage-regions-table.jsp" />
  <input type="hidden" name="ERROR_PAGE" value="https://vendors-new.bmtmicro.com/error-div.jsp" />
  <input type="hidden" name="ACTION" value="" />
  <input type="hidden" name="REGIONID" value="" />
  <div class="table-header">
    <button type="button" class="grey-btn" onclick="addRegion ();" >Add New Region</button>
    <button type="button" class="grey-btn" onclick="shippingCosts ();" >Manage Shipping Schemes</button>
  </div> <!-- end .table-header -->
  <div class="row table-responsive">
    <table class="table" id="selection">
      <thead>
        <tr class="table-category">
          <th scope="col" class="sort-column sortable sort text-center" title="Sort on 'Product ID'" text>
            <a href="#" class="fdTableSortTrigger">Name</a>
          </th>
          <th scope="col" class="sort-column" option>
            <a href="#" style="cursor: default;" onclick="return false;"></a>
          </th>
          <th scope="col" class="sort-column text-center" option>
            <a href="#" style="cursor: default;" onclick="return false;">Remove</a>
          </th>
        </tr>
      </thead>
      <tbody>
        ${param.TABLEDATA}
      </tbody>
      <tfoot class="table-total">
        <th scope="col" colspan="20"></th>
      </tfoot>
    </table>
  </div> <!-- end .row -->
