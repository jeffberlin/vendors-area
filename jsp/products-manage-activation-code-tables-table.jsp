<%@ include file="/includes/core.jsp" %>
<form name="keytables" method="post" action="https://vendors-new.bmtmicro.com/servlets/Vendors.RegistrationKeys">
  <input type="hidden" name="ROWTEMPLATEURL" value="${param.ROWTEMPLATEURL}">
  <input type="hidden" name="ACTION" value="" />
  <input type="hidden" name="KEYTABLEID" value="" />
  <input type="hidden" name="NEXT_PAGE" value="https://vendors-new.bmtmicro.com/products-manage-activation-code-tables-table.jsp" />
  <input type="hidden" name="ERROR_PAGE" value="https://vendors-new.bmtmicro.com/error-div.jsp" />
  <div class="table-header">
    <button type="button" class="grey-btn" onclick="addTable ();">Add&nbsp;New&nbsp;Table</button>
  </div> <!-- end .table-header -->
  <div class="row table-responsive" style="margin-left: auto; margin-right: auto;">
    <table class="table" id="selection">
      <thead>
        <tr class="table-category">
          <th scope="col" class="sort-column text-center" text>
            <a href="#" style="cursor: default;" onclick="return false;">Code&nbsp;Table&nbsp;Name</a>
          </th>
          <th scope="col" class="sort-column text-center" number>
            <a href="#" style="cursor: default;" onclick="return false;">Codes</a>
          </th>
          <th scope="col" class="sort-column" text>
            <a href="#" style="cursor: default;" onclick="return false;"></a>
          </th>
          <th scope="col" class="sort-column" text>
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
          <th scope="row" colspan="5">
            <div id="pageselector">&nbsp;</div>
          </th>
        </tr>
      </tfoot>
    </table>
  </div>
</form>