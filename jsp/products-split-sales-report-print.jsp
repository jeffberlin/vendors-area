<%@ include file="/includes/core.jsp" %>
<p align="right">
  <input type="image" src="https://vendors-new.bmtmicro.com/images/print.gif" border="0" alt="Print Report" onclick="window.print (); return (false);" />
</p>
<h1 class="header">Split Sales Report</h1>
<table width="100%" border="1" cellpadding="0" cellspacing="0">
  <tr>
    <td width="5%" align=left>Split Vendor ID</td>
    <td width="15%" align=left>Name</td>
    <td width="25%" align=left>Product Name</td>
    <td width="5%" align=right>Units Sold&nbsp;</td>
    <td width="15%" align=right>Amount per Unit</td>
    <td width="15%" align=right>Total Amount</td>
    <td width="5%" align=right>Percentage or Amount</td>
    <td width="15%" align=right>Split</td>
  </tr>
  ${param.TABLEDATA}
  <tr>
    <th colspan="3" align="right"><strong>Total</strong></th>
    <td align="right"><strong>${param.TOTALQUANTITY}</strong></td>
    <td>&nbsp;</td>
    <td align="right"><strong>${param.TOTALVENDORROYALTY}</strong></td>
    <td>&nbsp;</td>
    <td align="right"><strong>${param.TOTALSPLITROYALTY}</strong></td>
  </tr>
</table>
