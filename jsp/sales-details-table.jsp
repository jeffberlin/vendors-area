<%@ page pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ include file="/includes/core.jsp" %>
<%--
coltypemap maps an integer to a column type

"text"    0 - Text
"number"  1 - Number
"money"   2 - Amount
"money"   3 - Currency
"date"    4 - Date
"info"    5 - EMail
"number"  6 - Order ID

Note: The c:set below is used to get the column type and ensure it's a sting value even if the column
type list is passed an array of integers. This ensures that ${coltypemap[coltype]} lookup works properly.
<c:set var="coltype">${coltypes[loop.index]}</c:set>
--%>

<jsp:useBean id="coltypemap" class="java.util.HashMap" />
<c:set target="${coltypemap}" property="0" value="text"   />
<c:set target="${coltypemap}" property="1" value="number" />
<c:set target="${coltypemap}" property="2" value="money"  />
<c:set target="${coltypemap}" property="3" value="money"  />
<c:set target="${coltypemap}" property="4" value="date"   />
<c:set target="${coltypemap}" property="5" value="info"   />
<c:set target="${coltypemap}" property="6" value="number" />

<c:set var="coltypes"    value="${requestScope.COLTYPELIST}" />
<c:set var="colheaders"  value="${requestScope.COLHDRLIST}" />
<c:set var="colfilters"  value="${requestScope.COLFLTLIST}" />
<c:set var="coldatarows" value="${requestScope.COLDATALIST}" />
<c:set var="coltotals"   value="${requestScope.COLTOTALLIST}" />

<form name="salesdetails" action="https://vendors-new.bmtmicro.com/servlets/Vendors.SalesDetails" method="post">
  <input type="hidden" name="ROWSPERPAGE" value="250" />
  <input type="hidden" name="NEXT_PAGE" value="https://vendors-new.bmtmicro.com/sales-details-table.jsp" />
  <input type="hidden" name="ERROR_PAGE" value="https://vendors-new.bmtmicro.com/error-div.jsp" />
  <div class="table-responsive" style="overflow-x: inherit;">
    <div class="table-header">
      <span>From:&nbsp;
        <input id="DATEFROM" name="DATEFROM" value="${requestScope.DATEFROM}" onkeypress="filterKeyPress(event)"/>&nbsp;
        <img class="calendar" alt="Click Here to Pick the date" title="Click Here to Pick the date" onclick="show_calendar (this)" />
      </span>
      <span>To:&nbsp;
        <input id="DATETO" name="DATETO" value="${requestScope.DATETO}" onkeypress="filterKeyPress(event)"/>&nbsp;
        <img class="calendar" alt="Click Here to Pick the date" title="Click Here to Pick the date" onclick="show_calendar (this)" />
      </span>
      <span>
        <input type="checkbox" name="EXACTMATCH" value="-1"<c:if test="${requestScope.EXACTMATCH==-1}"> checked</c:if> onclick="exactMatch(salesdetails);" title="Check for exact matches">&nbsp;Use exact match when filtering
      </span>
      <span>
        <select name="FORMAT">
          <option value="0"<c:if test="${requestScope.FORMAT == '0'}"> selected</c:if>>HTML</option>
          <option value="1"<c:if test="${requestScope.FORMAT == '1'}"> selected</c:if>>CSV</option>
          <option value="2"<c:if test="${requestScope.FORMAT == '2'}"> selected</c:if>>XML</option>
          <option value="3"<c:if test="${requestScope.FORMAT == '3'}"> selected</c:if>>PDF</option>
        </select>
      </span>
      <span>
        <button class="grey-btn" type="button" value="Get Report" onclick="refreshReport (document.salesdetails);">Get Sales Details</button>
      </span>
    </div> <!-- end .table-header -->
    <table class="table" id="selection">
      <thead>
        <tr class="table-category">
          <c:forEach var="colheader" items="${colheaders}" varStatus="loop">
            <c:set var="coltype">${coltypes[loop.index]}</c:set>
            <th class="sortable sort-column text-center sort" ${coltypemap[coltype]}>
              <a href="#" class="fdTableSortTrigger">${colheader}</a>
            </th>
          </c:forEach>
        </tr>
      </thead>
      <tbody class="text-center">
        <tr>
          <c:forEach var="colfilter" items="${colfilters}" varStatus="loop">
            <c:set var="coltype">${coltypes[loop.index]}</c:set>
            <th ${coltypemap[coltype]}>
              <input class="input-search" type="text" name="FILTER" placeholder="Search" value="${colfilter}" style="width: 100%" onkeypress="filterKeyPress(event)"/>
            </th>
          </c:forEach>
        </tr>
        <c:forEach var="coldatarow" items="${coldatarows}">
          <tr>
            <c:forEach var="coldata" items="${coldatarow}" varStatus="loop">
              <c:set var="coltype">${coltypes[loop.index]}</c:set>
              <td ${coltypemap[coltype]}>
                <c:choose>
                  <c:when test="${coltype == '3'}"><b>${coldata}</b></c:when> <%-- Currency --%>
                  <c:when test="${coltype == '5'}"><a href="mailto:${coldata}">${coldata}</a></c:when> <%-- EMail --%>
                  <c:when test="${coltype == '6'}"><a href="javascript:invoice(${coldata});">${coldata}</a></c:when> <%-- Order ID with invoice link --%>
                  <c:otherwise>${coldata}</c:otherwise>
                </c:choose>
              </td>
            </c:forEach>
          </tr>
        </c:forEach>
      </tbody>
      <tfoot>
        <tr class="table-total text-center">
          <c:forEach var="coltotal" items="${coltotals}" varStatus="loop">
            <c:set var="coltype">${coltypes[loop.index]}</c:set>
            <td ${coltypemap[coltype]}>
              <strong>${coltotal}</strong>
            </td>
          </c:forEach>
        </tr>
      </tfoot>
    </table>
  </div>
</form>
<div style="visibility:hidden;">
  <form name="invoice" action="https://vendors-new.bmtmicro.com/servlets/Vendors.Invoice" method="post" target="_blank">
    <input name="ORDERID" type="hidden" value="0">
    <input name="VENDORID" type="hidden" value="${requestScope.VENDORID}">
  </form>
</div>
