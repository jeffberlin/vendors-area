<%@ include file="/includes/core.jsp" %>
<form name="products" action="https://vendors-new.bmtmicro.com/servlets/Vendors.Products" method="post">
  <input type="hidden" name="ACTION" value="" />
  <input type="hidden" name="ROWTEMPLATEURL" value="${param.ROWTEMPLATEURL}" />
  <input type="hidden" name="ROWSPERPAGE" value="${param.ROWSPERPAGE}" />
  <input type="hidden" name="PAGE" value="${param.PAGE}" />
  <input type="hidden" name="PAGECOUNT" value="${param.PAGECOUNT}" />
  <input type="hidden" name="NEXT_PAGE" value="https://vendors-new.bmtmicro.com/products-manage-table.jsp" />
  <input type="hidden" name="ERROR_PAGE" value="https://vendors-new.bmtmicro.com/error-div.jsp" />
  <input type="hidden" name="PRODUCTID" value="" />
  <div class="table-header">
    <input type="checkbox" name="SHOWINACTIVE" value="-1" onClick="showInactiveChanged ();" /><span>&nbsp;Show inactive products</span>
    &nbsp;&nbsp;&nbsp;&nbsp;
    <span>Filter by Product ID/Name:
      <input type="text" name="FILTER" value="" placeholder="Search" style="margin-bottom: 1rem;" />&nbsp;
      <button type="button" name="FILTERBUTTON" class="grey-btn" onClick="filterChanged ();">Apply</button>
    </span>
    <br clear="all" />
    <button type="button" class="grey-btn" onclick="editDefaultCustomerEMail ();">Edit Global Customer Email</button>
    &nbsp;&nbsp;
    <button type="button" class="grey-btn" onclick="editDefaultVendorEMail ();">Edit Global Vendor Email</button>
    &nbsp;&nbsp;
    <button type="button" class="grey-btn" onclick="addProduct ();" >Add New Product</button>
  </div> <!-- end .table-header -->
  <div class="row table-responsive" style="margin-left: auto; margin-right: auto;">
    <table class="table" id="selection">
      <thead>
        <tr class="table-category">
          <th scope="col" class="sort-column sortable sort text-center" title="Sort on 'Product ID'" number>
            <a href="#" class="fdTableSortTrigger">Product ID</a>
          </th>
          <th scope="col" class="sort-column sortable sort text-center" title="Sort on 'Name'" text>
            <a href="#" class="fdTableSortTrigger">Name</a>
          </th>
          <th scope="col" class="sort-column text-center" option>
            <a href="#" style="cursor: default;" onclick="return false;">Edit Screen</a>
          </th>
          <th scope="col" colspan="2" class="sort-column text-center" option>
            <a href="#" style="cursor: default;" onclick="return false;">Edit Email</a>
          </th>
          <th scope="col" colspan="2" class="sort-column text-center" option>
            <a href="#" style="cursor: default;" onclick="return false;">Order Link</a>
          </th>
          <th scope="col" colspan="2" class="sort-column text-center" option>
            <a href="#" style="cursor: default;" onclick="return false;">Duplicate Product</a>
          </th>
        </tr>
      </thead>
      <tbody>
        ${param.TABLEDATA}
      </tbody>
      <tfoot class="table-total">
        <th scope="col" colspan="20">
          <div id="pageselector">&nbsp;</div>
        </th>
      </tfoot>
    </table>
  </div>
</form>
