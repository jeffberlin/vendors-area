<%@ include file="/includes/core.jsp" %>
<form name="salesdetails" action="https://vendors-new.bmtmicro.com/servlets/Vendors.SalesDetails" method="post" onsubmit="return (CheckDateRange(this));">
  <div class="table-header">
    <span>From:&nbsp;
      <input id="DATEFROM" name="DATEFROM" value="${param.DATEFROM}" />&nbsp;
      <img src='<c:url value="/images/cal.gif"></c:url>' width="16" height="16" border="0" alt="Click Here to Pick up the date" onclick="show_calendar ('DATEFROM'); return (false);" onmouseover="this.style.cursor='pointer';" />
    </span>
    <span>To:&nbsp;
      <input id="DATETO" name="DATETO" value="${param.DATETO}" style="margin-bottom: 1rem;"/>&nbsp;
      <img src='<c:url value="/images/cal.gif"></c:url>' width="16" height="16" border="0" alt="Click Here to Pick up the date" onclick="show_calendar ('DATETO'); return (false);"  onmouseover="this.style.cursor='pointer';" />
    </span>
    <!-- <br> -->
    <span>
      <input type="checkbox" name="EXACTMATCH" value="-1" onclick="exactMatch(salesdetails);" title="Check for exact matches">&nbsp;Use exact match when filtering
      <input type="hidden" name="NEXT_PAGE" value="https://vendors-new.bmtmicro.com/sales-details-table.jsp" />
      <input type="hidden" name="ERROR_PAGE" value="https://vendors-new.bmtmicro.com/error.jsp" />
    </span>
    <span>
      <select name="FORMAT">
        <option value="0" selected="selected">HTML</option>
        <option value="1">CSV</option>
        <option value="2">XML</option>
        <option value="3">PDF</option>
      </select>
    </span>
    <span>
      <button class="get-btn" value="Get Report">Get Sales Details</button>
    </span>
  </div> <!-- end .table-header -->
  <div class="table-responsive">
    <table class="table">
      <script language="javascript" type="text/javascript">
        <!--
        document.write (tabledata ());
        //-->
      </script>
    </table>
  </div>
</form>
<div style="visibility:hidden;">
  <form name="invoice" action="https://vendors-new.bmtmicro.com/servlets/Vendors.Invoice" method="post" target="_blank">
    <input name="ORDERID" type="hidden" value="0">
    <input name="VENDORID" type="hidden" value="##VENDORID##">
  </form>
</div>
