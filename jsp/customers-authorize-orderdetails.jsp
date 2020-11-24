<%@ page pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ include file="/includes/core.jsp" %>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>Unauthorized Orders - Details</title>
    <script src="https://secure.bmtmicro.com/Templates/util.js"></script>
  </head>
  <body bgcolor="white">
    <table border="0" width="75%" bgcolor="#ffffff" align="center">
      <tr>
        <th align="middle" class="header">Order Details</th>
      </tr>
    </table>
    <form name="orderdetailstable" action="" method="post">
      <table border=0 width="100%">
        <tr>
          <td align="middle" colspan="3">
            <table cellspacing="0" cellpadding="2" bgcolor="#dddddd" width="100%">
              <tr>
                <td>
                  <table cellspacing="0" cellpadding="0" bgcolor="white" width="100%">
                    <tr class="altrow">
                      <td colspan="2" valign="top" width="65%" align="left">
                        <table cellspacing="0" cellpadding="0" width="100%">
                          <tr>
                            <td colspan="2" class="accentrow">Billing Information</td>
                            <td colspan="2" class="accentrow">Shipping Information</td>
                          </tr>
                          <tr bgcolor="#ffffff">
                            <td>Company: </td>
                            <td class="detailfont"><b>${requestScope.COMPANY}</b></td>
                            <td>Ship Company: </td>
                            <td class="detailfont"><b>${requestScope.SHIP_COMPANY}</b></td>
                          </tr>
                          <tr class="altrow">
                            <td>VAT Number: </td>
                            <td class="detailfont"><b>${requestScope.VATNUMBER}</b></td>
                            <td>Ship Name: </td>
                            <td class="detailfont"><b>${requestScope.SHIP_FIRSTNAME} ${requestScope.SHIP_LASTNAME}</b></td>
                          </tr>
                          <tr bgcolor="#ffffff">
                            <td>Name: </td>
                            <td class="detailfont"><b>${requestScope.FIRSTNAME} ${requestScope.LASTNAME}</b></td>
                            <td>Ship Address 1:  </td>
                            <td class="detailfont"><b>${requestScope.SHIP_ADDRESS1}</b></td>
                          </tr>
                          <tr class="altrow">
                            <td>Registered To: </td>
                            <td class="detailfont"><b>${requestScope.REGISTERNAME}</b></td>
                            <td>Ship Address 2: </td>
                            <td class="detailfont"><b>${requestScope.SHIP_ADDRESS2}</b></td>
                          </tr>
                          <tr bgcolor="#ffffff">
                            <td>Address 1: </td>
                            <td class="detailfont"><b>${requestScope.ADDRESS1}</b></td>
                            <td>Ship City/St/Zip: </td>
                            <td class="detailfont"><b>${requestScope.SHIP_CITY}, ${requestScope.SHIP_STATE} ${requestScope.SHIP_ZIP}</b></td>
                          </tr>
                          <tr class="altrow">
                            <td>Address 2: </td>
                            <td class="detailfont"><b>${requestScope.ADDRESS2}</b></td>
                            <td>Ship Country: </td>
                            <td class="detailfont"><b>${requestScope.SHIP_COUNTRY}</b></td>
                          </tr>
                          <tr bgcolor="#ffffff">
                            <td>City/St/Zip: </td>
                            <td class="detailfont"><b>${requestScope.CITY}, ${requestScope.STATE} ${requestScope.ZIP}</b></td>
                            <td>Ship Phone: </td>
                            <td class="detailfont"><b>${requestScope.SHIP_PHONE}</b></td>
                          </tr>
                          <tr class="altrow">
                            <td>Country: </td>
                            <td class="detailfont"><b>${requestScope.COUNTRY}</b></td>
                            <td>Ship EMail: </td>
                            <td class="detailfont"><b>${requestScope.SHIP_EMAIL}</b></td>
                          </tr>
                          <tr bgcolor="#ffffff">
                            <td>IP (Origin): </td>
                            <td class="detailfont"><b>${requestScope.IPADDRESS} (${requestScope.ORIGIN})</b></td>
                            <td COLSPAN=2 class=accentrow>Fulfillment Information</td>
                          </tr>
                          <tr class="altrow">
                            <td>Phone: </td>
                            <td class="detailfont"><b>${requestScope.PHONE}</b></td>
                            <td>Comments: </td>
                            <td class="detailfont"><b>${requestScope.ITEMCOMMENTS}</b></td>
                          </tr>
                          <tr bgcolor="#ffffff">
                            <td>EMail: </td>
                            <td class="detailfont"><b>${requestScope.EMAIL}</b></td>
                            <td>Error Message: </td>
                            <td class="detailfont"><b>${requestScope.FULFILLMENTMESSAGE}</b></td>
                          </tr>
                          <tr class="altrow">
                            <td>2nd EMail: </td>
                            <td class="detailfont"><b>${requestScope.ALTEMAIL}</b></td>
                            <td>Error Code: </td>
                            <td class="detailfont"><b>${requestScope.FULFILLMENTERROR}</b></td>
                          </tr>
                          <tr bgcolor="#ffffff">
                            <td>Comment: </td>
                            <td colspan=3 class="detailfont"><b>${requestScope.COMMENTS}</b></td>
                          </tr>
                        </table>
                      </td>
                      <td colspan="2" valign="top" width="35%" align="right">
                        <table cellspacing="0" cellpadding="0" width="100%">
                          <tr>
                            <td colspan="2" class="accentrow">Product Information</td>
                          </tr>
                          <tr bgcolor="#ffffff">
                            <td>Product: </td>
                            <td class="detailfont"><b>${requestScope.PRODUCTNAME}</b></td>
                          </tr>
                          <tr class="altrow">
                            <td>Product ID: </td>
                            <td class="detailfont"><b>${requestScope.PRODUCTID}</b></td>
                          </tr>
                          <tr bgcolor="#ffffff">
                            <td>Product Price: </td>
                            <td class="detailfont"><b>${requestScope.PRODUCTPRICE}</b></td>
                          </tr>
                          <tr class="altrow">
                            <td>Sales Tax: </td>
                            <td class="detailfont"><b>${requestScope.SALESTAX}</b></td>
                          </tr>
                          <tr bgcolor="#ffffff">
                            <td>Shipping: </td>
                            <td class="detailfont"><b>${requestScope.SHIPPINGPRICE} ${requestScope.SHIPPINGMETHOD}</b></td>
                          </tr>
                          <tr class="altrow">
                            <td></td>
                            <td class="detailfont"></td>
                          </tr>
                          <tr class="altrow">
                            <td>Order ID:</td>
                            <td class="detailfont"><b>${requestScope.ORDERID}</b></td>
                          </tr>
                          <tr bgcolor="#ffffff">
                            <td>Order Number: </td>
                            <td class="detailfont"><b>${requestScope.ORDERNUMBER}</b></td>
                          </tr>
                          <tr>
                            <td colspan="2" class="accentrow">Payment Information</td>
                          </tr>
                          <tr bgcolor="#ffffff">
                            <td>Payment Method: </td>
                            <td class="detailfont"><b>${requestScope.CARDTYPE}</b></td>
                          </tr>
                          <tr class="altrow">
                            <td>Card Number: </td>
                            <td class="detailfont"><b>${requestScope.CREDITCARD}</b></td>
                          </tr>
                          <tr bgcolor="#ffffff">
                            <td>Expiration: </td>
                            <td class="detailfont"><b>${requestScope.EXPIRATION}</b></td>
                          </tr>
                          <tr class="altrow">
                            <td>AVS Code: </td>
                            <td class="detailfont"><b>${requestScope.AVSCODE} ${requestScope.AVSINFO}</b></td>
                          </tr>
                          <tr bgcolor="#ffffff">
                            <td>CVV Code: </td>
                            <td class="detailfont"><b>${requestScope.CVVCODE} ${requestScope.CVVINFO}</b></td>
                          </tr>
                        </table>
                      </td>
                    </tr>
                    <tr class="altrow" valign="top">
                      <td colspan="4" align="right">
                        <input type="button" value="close" onclick="window.close()">
                      </td>
                    </tr>
                  </table>
                </td>
              </tr>
            </table>
          </td>
        </tr>
      </table>
    </form>
  </body>
</html>
