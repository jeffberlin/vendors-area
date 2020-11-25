<%@ page pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ include file="/includes/core.jsp" %>
<form name="splitsalesreport" action="https://vendors-new.bmtmicro.com/servlets/Vendors.SplitSalesReport" method="post">
  <input type="hidden" name="NEXT_PAGE" value="https://vendors-new.bmtmicro.com/products-split-sales-report-table.jsp" />
  <input type="hidden" name="ERROR_PAGE" value="https://vendors-new.bmtmicro.com/error-div.jsp" />
  <div class="table-header">
    <span>
      From:&nbsp;
      <input id="DATEFROM" name="DATEFROM" value="${requestScope.DATEFROM}" onkeypress="filterKeyPress(event)"/>&nbsp;
  					<img class="calendar" alt="Click Here to Pick the date" title="Click Here to Pick the date" onclick="show_calendar (this)" />
    </span>
    <span>
      To:&nbsp;
      <input id="DATETO" name="DATETO" value="${requestScope.DATETO}" onkeypress="filterKeyPress(event)"/>&nbsp;
  					<img class="calendar" alt="Click Here to Pick the date" title="Click Here to Pick the date" onclick="show_calendar (this)" />
    </span>
    <span>
      <select name="FORMAT">
        <option value="-1"<c:if test="${requestScope.FORMAT=='-1'}"> selected</c:if>>HTML (refresh)</option>
        <option value="0"<c:if test="${requestScope.FORMAT=='0'}"> selected</c:if>>HTML (printable)</option>
        <option value="1"<c:if test="${requestScope.FORMAT=='1'}"> selected</c:if>>CSV</option>
        <option value="2"<c:if test="${requestScope.FORMAT=='2'}"> selected</c:if>>XML</option>
        <option value="3"<c:if test="${requestScope.FORMAT=='3'}"> selected</c:if>>PDF</option>
      </select>
    </span>
    <span>
      <button type="button" class="grey-btn" value="Get Split Sales Summary" onclick="refreshReport (document.splitsalesreport);">Get Split Sales Summary</button>
    </span>
  </div> <!-- end .table-header -->
   <div class="row table-responsive-lg" style="margin-left: auto; margin-right: auto;">
     <table class="table" id="selection">
       <thead>
         <tr class="table-category">
           <th scope="col" class="sort-column sortable sort text-center" title="Sort on 'Vendor ID'" number>
             <a href="#" class="fdTableSortTrigger">Split&nbsp;Vendor&nbsp;ID</a>
           </th>
           <th scope="col" class="sort-column sortable sort text-center" title="Sort on 'Name'" text>
             <a href="#" class="fdTableSortTrigger">Name</a>
           </th>
           <th scope="col" class="sort-column sortable sort text-center" title="Sort on 'Product Name'" text>
             <a href="#" class="fdTableSortTrigger">Product&nbsp;Name</a>
           </th>
           <th scope="col" class="sort-column sortable sort text-center" title="Sort on 'Units Sold'" number>
             <a href="#" class="fdTableSortTrigger">Units&nbsp;Sold</a>
           </th>
           <th scope="col" class="sort-column sortable sort text-center" title="Sort on 'Amount per Unit'" money>
             <a href="#" class="fdTableSortTrigger">Amount&nbsp;per&nbsp;Unit</a>
           </th>
           <th scope="col" class="sort-column sortable sort text-center" title="Sort on 'Total Amount'" money>
             <a href="#" class="fdTableSortTrigger">Total&nbsp;Amount</a>
           </th>
           <th scope="col" class="sort-column sortable sort text-center" title="Sort on 'Percentage/Amount'" number>
             <a href="#" class="fdTableSortTrigger">Percentage/Amount</a>
           </th>
           <th scope="col" class="sort-column sortable sort text-center" title="Sort on 'Percentage/Amount'" money>
             <a href="#" class="fdTableSortTrigger">Split</a>
           </th>
         </tr>
       </thead>
       <tr>
         <th style="text-align: left; color: #707070; letter-spacing: .5px; font-size: .9rem; font-weight: 300; border-bottom: 1px solid #dddddd;" colspan="10">Filter results using the fields below.
         </th>
       </tr>
       <tr id="input-tr">
         <th number>
           <input class="input-search" type="text" name="FLT_SPLITVENDORID" value="${requestScope.FLT_SPLITVENDORID}" placeholder="Search" size="12" onkeypress="filterKeyPress(event);">
         </th>
         <th text>
           <input class="input-search" type="text" name="FLT_NAME" value="${requestScope.FLT_NAME}" placeholder="Search" onkeypress="filterKeyPress(event);">
         </th>
         <th text>
           <input class="input-search" type="text" name="FLT_PRODUCTNAME" value="${requestScope.FLT_PRODUCTNAME}" placeholder="Search" onkeypress="filterKeyPress(event);">
         </th>
         <th number></th>
         <th money></th>
         <th money></th>
         <th number>
           <input class="input-search" type="text" name="FLT_PERCENTAGE" value="${requestScope.FLT_PERCENTAGE}" placeholder="Search" size="14" onkeypress="filterKeyPress(event);">
         </th>
         <th text></th>
       </tr>
       <tbody>
         <c:forEach var="row" items="${requestScope.TABLEDATA}">
           <tr onclick="highlightLinks(this);">
             <td number>${row.SPLITVENDORID}</td>
             <td text>${row.NAME}</td>
             <td text>${row.PRODUCTNAME}</td>
             <td number>${row.QUANTITY}</td>
             <td money>${row.VENDORUNITROYALTY}</td>
             <td money>${row.VENDORROYALTY}</td>
             <td number>${row.PERCENTAGE}</td>
             <td money>${row.SPLITROYALTY}</td>
           </tr>
         </c:forEach>
       </tbody>
       <tfoot>
         <tr class="table-total">
           <th scope="row" colspan="3">Total</th>
           <th scope="row" class="text-center" number>${requestScope.TOTALQUANTITY}</th>
           <th></th>
           <th scope="row" class="text-right" money>${requestScope.TOTALVENDORROYALTY}</th>
           <th></th>
           <th scope="row" class="text-right" money>${requestScope.TOTALSPLITROYALTY}</th>
         </tr>
       </tfoot>
     </table>
   </div> <!-- end .row -->
</form>
