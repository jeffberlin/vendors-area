<%@ include file="/includes/core.jsp" %>
<p align="right">
  <input type="image" src="https://vendors-new.bmtmicro.com/images/print.gif" border="0" alt="Print Report" onclick="window.print (); return (false);"  />
</p>
<h1 class="header">Account Transactions Report</h1>
<table width="100%" border="1" cellpadding="0" cellspacing="0">
  <tr>
    <td width="15%" align=left>Date</td>
    <td width="45%" align=left>Description</td>
    <td width="15%" align=right>Amount</td>
    <td width="25%" align=center>Notes</td>
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
