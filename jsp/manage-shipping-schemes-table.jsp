<%@ page pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ include file="/includes/core.jsp" %>
<form name="shipping" action="https://vendors-new.bmtmicro.com/servlets/Vendors.ShippingCost" method="post">
  <input type="hidden" name="NEXT_PAGE" value="https://vendors-new.bmtmicro.com/manage-shipping-schemes-table.jsp" />
  <input type="hidden" name="ERROR_PAGE" value="https://vendors-new.bmtmicro.com/error-div.jsp" />
  <input type="hidden" name="ACTION" value="-1" />
  <input type="hidden" name="SCHEMEID" value="" />
  <input type="hidden" name="MAXAMOUNT" value="" />
  <div class="table-header">
    <button type="button" class="grey-btn" onclick="addScheme ();">Add New Scheme</button>
    <button type="button" class="grey-btn" onclick="regions ();">Manage Regions</button>
  </div> <!-- end .table-header -->
  <div class="row table-responsive">
    <table class="table sortable" id="selection">
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
        <c:forEach var="row" items="${requestScope.TABLEDATA}">
          <tr onclick="highlightLinks (this);">
            <td text>
              <a href="javascript:editScheme (${row.SCHEMEID});">${row.NAME}</a>
            </td>
            <td option>
              <button type="button" class="save-btn" onclick="viewScheme (${row.SCHEMEID});">View Scheme</button>
            </td>
            <td option>
              <button type="button" class="remove" onclick="deleteScheme (${row.SCHEMEID});"></button>
            </td>
          </tr>
        </c:forEach>
      </tbody>
      <tfoot class="table-total">
        <th scope="col" colspan="20">
          <div id="pageselector">&nbsp;</div>
        </th>
      </tfoot>
    </table>
  </div> <!-- end .row -->
</form>
