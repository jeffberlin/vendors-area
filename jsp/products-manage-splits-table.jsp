<%@ include file="/includes/core.jsp" %>
<form name="splits" action="https://vendors-new.bmtmicro.com/servlets/Vendors.SplitSchemes" method="post">
  <input type="hidden" name="ROWTEMPLATEURL" value="${param.ROWTEMPLATEURL}" />
  <input type="hidden" name="NEXT_PAGE" value="https://vendors-new.bmtmicro.com/products-manage-splits-table.jsp" />
  <input type="hidden" name="ERROR_PAGE" value="https://vendors-new.bmtmicro.com/error-div.jsp" />
  <input type="hidden" name="ACTION" value="" />
  <input type="hidden" name="SCHEMEID" value="" />
  <input type="hidden" name="PAYDAY" value="${param.PAYDAY}" />
  <div class="table-header">
    <button type="button" class="grey-btn" onclick="addSplit ();" >Add&nbsp;New&nbsp;Split</button>
  </div> <!-- end .table-header -->
  <div class="row table-responsive-lg" style="margin-left: auto; margin-right: auto;">
    <table class="table" id="selection">
      <thead>
        <tr class="table-category">
          <th scope="col" class="sort-column sortable sort text-center" title="Sort on 'Name'" text>
            <a href="#" class="fdTableSortTrigger">Name</a>
          </th>
          <th scope="col" class="sort-column text-center" option>
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
      <tfoot>
        <tr class="table-total">
          <th scope="row" colspan="6">
            <div id="pageselector">&nbsp;</div>
          </th>
        </tr>
      </tfoot>
    </table>
  </div>
</form>
