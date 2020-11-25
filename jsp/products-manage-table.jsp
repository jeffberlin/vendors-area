<%@ page pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ include file="/includes/core.jsp" %>
<form id="products" name="products" action="https://vendors-new.bmtmicro.com/servlets/Vendors.Products" method="post">
  <input type="hidden" name="ACTION" value="-1" />
  <input type="hidden" name="ROWSPERPAGE" value="${requestScope.ROWSPERPAGE}" />
  <input type="hidden" name="PAGE" value="${requestScope.PAGE}" />
  <input type="hidden" name="NEXT_PAGE" value="https://vendors-new.bmtmicro.com/products-manage-table.jsp" />
  <input type="hidden" name="ERROR_PAGE" value="https://vendors-new.bmtmicro.com/error-div.jsp" />
  <input type="hidden" name="PRODUCTID" value="" />
  <div class="table-header">
    <input type="checkbox" name="SHOWINACTIVE" value="-1" onClick="showInactiveChanged ();"<c:if test = "${ cookie['BMTMicro.Vendors.Products.ShowInactive'].value == -1 }"> checked</c:if>/><span>&nbsp;Show inactive products</span>
    &nbsp;&nbsp;&nbsp;&nbsp;
    <span>Filter by Product ID/Name:
      <input type="text" name="FILTER" value="${requestScope.FILTER}" placeholder="Search" style="margin-bottom: 1rem;" />&nbsp;
      <script>
        catchEnter (document.products.FILTER, refreshReport);
      </script>
      <button type="button" name="FILTERBUTTON" class="grey-btn" onClick="refreshReport ();">Apply</button>
    </span>
    <br clear="all" />
    <button type="button" class="grey-btn" onclick="editDefaultCustomerEMail ();">Edit Global Customer Email</button>
    &nbsp;&nbsp;
    <button type="button" class="grey-btn" onclick="editDefaultVendorEMail ();">Edit Global Vendor Email</button>
    &nbsp;&nbsp;
    <button type="button" class="grey-btn" onclick="addNewProduct ();" >Add New Product</button>
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
        <c:forEach var="row" items="${requestScope.TABLEDATA}">
          <tr onclick="highlightLinks(this)" ${row.CLASS}>
            <td mnumber><a href="javascript:editProduct (${row.PRODUCTID});">${row.PRODUCTID}</a></td>
            <td mtext>${row.PRODUCTNAME}</td>
            <td class="td-button">
              <button type="button" name-"Edit On-screen Template" onclick="editScreenTemplate (${row.PRODUCTID});">Screen</button>
            </td>
            <td class="td-button">
              <button type="button" name="Edit Customer Email" onclick="editCustomerEMail (${row.PRODUCTID});">Customer</button>
            </td>
            <td class="td-button">
              <button type="button" name="Edit Vendor Email" onclick="editVendorEMail (${row.PRODUCTID});">Vendor</button>
            </td>
            <td class="td-button">
              <button type="button" name="Place Test Order" onclick="testOrder (${row.PRODUCTID});">Test</button>
            </td>
            <td class="td-button">
              <button type="button" name="View" onclick="viewLink (${row.PRODUCTID});">View</button>
            </td>
            <td class="td-button">
              <button type="button" name="Duplicate" onclick="addNewProduct (${row.PRODUCTID});">One</button>
            </td>
            <td class="td-button">
              <button type="button" name="Add Multiple Products" onclick="addMultiple (${row.PRODUCTID});">Multiple</button>
            </td>
          </tr>
        </c:forEach>
      </tbody>
      <tfoot class="table-total">
        <th scope="col" colspan="20">
          <div id="pageselector">
            <c:if test = "${requestScope.PAGECOUNT > 1}">
              Pages:
              <c:forEach var = "page" begin = "1" end = "${requestScope.PAGECOUNT}">
                &nbsp;<a href="javascript:selectPage(${page});">${page}</a>&nbsp;
              </c:forEach>
            </c:if>
          </div>
        </th>
      </tfoot>
    </table>
  </div>
</form>
