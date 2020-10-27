<%@ include file="/includes/core.jsp" %>
<div class="row table-responsive-lg" style="margin-left: auto; margin-right: auto;">
  <table class="table" id="selection">
    <thead>
      <tr class="table-category">
        <th scope="col" class="sort-column text-center sortable sort" title="Sort on '${requestScope.FIELDNAME}'">
          <a href="#" class="fdTableSortTrigger">${requestScope.FIELDNAME}</a>
        </th>
        <th scope="col" class="sort-column text-center sortable sort" title="Sort on 'Occurrence'">
          <a href="#" class="fdTableSortTrigger">Occurrence</a>
        </th>
      </tr>
    </thead>
    <tbody>
      <c:forEach var="row" items="${requestScope.TABLEDATA}">
        <tr onclick="highlightLinks(this);">
          <td text>${row.DATA}</td>
          <td number>${row.COUNT}</td>
        </tr>
      </c:forEach>
    </tbody>
    <tfoot>
      <tr class="table-total">
        <th scope="row"></th>
        <th scope="row" class="text-right"></th>
      </tr>
    </tfoot>
  </table>
</div> <!-- end .row -->
