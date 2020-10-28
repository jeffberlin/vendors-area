<%@ include file="/includes/core.jsp" %>
<form name="users" action="https://vendors-new.bmtmicro.com/servlets/Vendors.Users" method="post">
  <input type="hidden" name="ACTION" value="-1" />
  <input type="hidden" name="NEXT_PAGE" value="https://vendors-new.bmtmicro.com/user-management-table.jsp" />
  <input type="hidden" name="ERROR_PAGE" value="https://vendors-new.bmtmicro.com/error-div.jsp" />
  <input type="hidden" name="USERID" value="" />
  <div class="table-header">
    <button type="button" class="grey-btn" onclick="addUser ();" >Add New User</button>
  </div> <!-- end .table-header -->
  <div class="row table-responsive" style="margin-left: auto; margin-right: auto;">
    <table class="table" id="selection">
      <thead>
        <tr class="table-category">
          <th scope="col" class="sortable sort-column sort text-center" title="Sort on 'Login'" text>
            <a href="#" class="fdTableSortTrigger">Login</a>
          </th>
          <th scope="col" class="sortable sort-column sort text-center" title="Sort on 'Email'" text>
            <a href="#" class="fdTableSortTrigger">Email</a>
          </th>
          <th scope="col" class="sortable sort-column sort text-center" title="Sort on 'Name'" text>
            <a href="#" class="fdTableSortTrigger">Name</a>
          </th>
          <th scope="col" class="sort-column text-center">
            <a href="#" style="cursor: default;" onclick="return false;">Remove</a>
          </th>
        </tr>
      </thead>
      <tbody>
        <c:forEach var="row" items="${requestScope.TABLEDATA}">
          <tr onclick="highlightLinks(this);">
            <td text>
              <a href="javascript:editUser (${row.USERID});">${row.LOGINNAME}</a>
            </td>
            <td text>
              ${row.EMAIL}
            </td>
            <td text>
              ${row.NAME}
            </td>
            <td option>
              <button type="button" name="Remove" class="remove" onclick="deleteUser (${row.USERID});"></button>
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
  </div> <!-- end .row -->
</form>
