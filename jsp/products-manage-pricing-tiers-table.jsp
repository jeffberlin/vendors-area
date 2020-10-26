<%@ include file="/includes/core.jsp" %>
<form name="tiers" method="post" action="https://vendors-new.bmtmicro.com/servlets/Vendors.TieredPricing">
  <input type="hidden" name="ACTION" value="" />
  <input type="hidden" name="TIERID" value="" />
  <input type="hidden" name="NEXT_PAGE" value="https://vendors-new.bmtmicro.com/products-manage-pricing-tiers-table.jsp" />
  <input type="hidden" name="ERROR_PAGE" value="https://vendors-new.bmtmicro.com/error-div.jsp" />
  <div class="table-header">
    <input type="checkbox" name="SHOWINACTIVE" value="-1" onClick="showInactiveChanged ();" style="margin-bottom: 1rem;"<c:if test = "${ cookie['BMTMicro.Vendors.Tiers.ShowInactive'].value == -1 }">checked</c:if> />
    <span>
      Show inactive tiers
    </span>
    <br>
    <button type="button" class="grey-btn" onclick="addTier ();">Add&nbsp;New&nbsp;Tier</button>
  </div> <!-- end .table-header -->
  <div class="row table-responsive" style="margin-left: auto; margin-right: auto;">
    <table class="table" id="selection">
      <thead>
        <tr class="table-category text-center">
          <th scope="col" class="sort-column" text>
            <a href="#" style="cursor: default;" onclick="return false;">Name</a>
          </th>
          <th scope="col" class="sort-column" option>
            <a href="#" style="cursor: default;" onclick="return false;">Remove</a>
          </th>
        </tr>
      </thead>
      <tbody>
        <c:forEach var="row" items="${requestScope.TABLEDATA}">
          <tr onclick="highlightLinks (this);">
            <td mtext>
              <a href="javascript:editTier (${row.TIERID});">${row.NAME}</a>
            </td>
            <td option>
              <button type="button" name="Remove" class="remove" onclick="deleteTier (${row.TIERID});"></button>
            </td>
          </tr>
        </c:forEach>
      </tbody>
      <tfoot>
        <tr class="table-total">
          <th scope="row" colspan="6">&nbsp;</th>
        </tr>
      </tfoot>
    </table>
  </div>
</form>
