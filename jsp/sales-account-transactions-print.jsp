<%@ include file="/includes/core.jsp" %>
<p align="right">
  <input type="image" src="https://vendors-new.bmtmicro.com/images/print.gif" border="0" alt="Print Report" onclick="window.print (); return (false);"  />
</p>
<h1 class="header">Account Transactions Report</h1>
<table width="100%" border="1" cellpadding="0" cellspacing="0">
  <tr align=center>
    <td width="15%">Date</td>
    <td width="45%">Description</td>
    <td width="15%">Amount</td>
    <td width="25%">Notes</td>
  </tr>
  ${param.TABLEDATA}
  <tr>
    <td colspan=2 align=right>
      <strong>Total:</strong>&nbsp;
    </td>
    <td align=right>
      <strong>${param.TOTALAMOUNT}</strong>
    </td>
    <td >
      &nbsp;
    </td>
  </tr>
</table>
