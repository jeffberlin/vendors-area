<%@ include file="/includes/core.jsp" %>
<div class="row table-responsive-lg" style="margin-left: auto; margin-right: auto;">
  <table class="table" id="selection">
    <thead>
      <tr class="table-category">
        <th scope="col" class="sort-column sortable sort text-center" title="Sort on 'ID'" number>
          <a href="#" class="fdTableSortTrigger">ID</a>
        </th>
        <th scope="col" class="sort-column sortable sort text-center" title="Sort on 'Name'" text>
          <a href="#" class="fdTableSortTrigger">Name</a>
        </th>
        <th scope="col" class="sort-column sortable sort text-center" title="Sort on 'Units Sold'" number>
          <a href="#" class="fdTableSortTrigger">Units&nbsp;Sold</a>
        </th>
        <th scope="col" class="sort-column sortable sort text-center" title="Sort on 'Gross Sales'" money>
          <a href="#" class="fdTableSortTrigger">Gross&nbsp;Sales</a>
        </th>
        <th scope="col" class="sort-column sortable sort text-center" title="Sort on 'to Affiliate'" money>
          <a href="#" class="fdTableSortTrigger">to&nbsp;Affiliate</a>
        </th>
      </tr>
    </thead>
    <tbody>
      <c:forEach var="row" items="${requestScope.TABLEDATA}">
        <c:choose>
          <c:when test="${!empty row.TEXT}">
            <tr>
              <th colspan="5">${row.TEXT}</th>
            </tr>
          </c:when>
          <c:otherwise>
            <tr onclick="highlightLinks (this);">
              <td number><c:choose><c:when test="${!empty row.AFFILIATEID}">${row.AFFILIATEID}</c:when><c:otherwise>${row.PRODUCTID}</c:otherwise></c:choose></td>
              <td text>${row.NAME}</td>
              <td class="text-center" number>${row.UNITSSOLD}</td>
              <td class="text-right" money>${row.GROSSSALES}</td>
              <td class="text-right" money>${row.AFFILIATESALES}</td>
            </tr>
          </c:otherwise>
        </c:choose>
      </c:forEach>
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
