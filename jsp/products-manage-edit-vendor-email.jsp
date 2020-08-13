<%@ include file="/includes/core.jsp" %>
<div class="transfer-section">
  <form method="post" name="emailform" action="https://vendors-new.bmtmicro.com/servlets/Vendors.Products">
    <h5>Vendor&nbsp;Email&nbsp;template&nbsp;for&nbsp;${param.PRODUCTNAME}</h5>
    <p class="text-section" style="margin-bottom: .5rem;">
      The template specified below will be used to override the global email template.
      <br>
      When possible, please consider using the global e-mail template since this makes it easier to manage future updates.
      <br>
      Please read&nbsp;<a href="https://help.bmtmicro.com/vendors/edit-vendor-email-notifications/" target="_blank">help
      files</a>&nbsp;for a full explanation on standard messages and token usage.
    </p>
    <div class="toolbar">
      <div class="dropright">
        <a class="transfer-dropdown dropdown-toggle" role="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" href="#">
          User&nbsp;Token&nbsp;List
        </a>
        <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
          <a class="dropdown-item" title="DATE" onmouseover="return (fixTitle (this));" onclick="addToken (this);">Date</a>
          <a class="dropdown-item" title="ORDERDATE" onmouseover="return (fixTitle (this));" onclick="addToken (this);">Order&nbsp;date</a>
          <a class="dropdown-item" title="PAYMENTDATE" onmouseover="return (fixTitle (this));" onclick="addToken (this);">Payment&nbsp;date</a>
          <a class="dropdown-item" title="FIRSTNAME" onmouseover="return (fixTitle (this));" onclick="addToken (this);">First&nbsp;name</a>
          <a class="dropdown-item" title="LASTNAME" onmouseover="return (fixTitle (this));" onclick="addToken (this);">Last&nbsp;name</a>
          <a class="dropdown-item" title="COMPANY" onmouseover="return (fixTitle (this));" onclick="addToken (this);">Company</a>
          <a class="dropdown-item" title="REGISTERNAME" onmouseover="return (fixTitle (this));" onclick="addToken (this);">Register&nbsp;name</a>
          <a class="dropdown-item" title="ADDRESS1" onmouseover="return (fixTitle (this));" onclick="addToken (this);">Address&nbsp;1</a>
          <a class="dropdown-item" title="ADDRESS2" onmouseover="return (fixTitle (this));" onclick="addToken (this);">Address&nbsp;2</a>
          <a class="dropdown-item" title="CITY" onmouseover="return (fixTitle (this));" onclick="addToken (this);">City</a>
          <a class="dropdown-item" title="POSTALCODE" onmouseover="return (fixTitle (this));" onclick="addToken (this);">Postal&nbsp;Code</a>
          <a class="dropdown-item" title="STATE" onmouseover="return (fixTitle (this));" onclick="addToken (this);">State</a>
          <a class="dropdown-item" title="COUNTRY" onmouseover="return (fixTitle (this));" onclick="addToken (this);">Country</a>
          <a class="dropdown-item" title="WORKPHONE" onmouseover="return (fixTitle (this));" onclick="addToken (this);">Work&nbsp;phone</a>
          <a class="dropdown-item" title="HOMEPHONE" onmouseover="return (fixTitle (this));" onclick="addToken (this);">Home&nbsp;phone</a>
          <a class="dropdown-item" title="EMAIL" onmouseover="return (fixTitle (this));" onclick="addToken (this);">Primary&nbsp;Email</a>
          <a class="dropdown-item" title="ALTEMAIL" onmouseover="return (fixTitle (this));" onclick="addToken (this);">Secondary&nbsp;Email</a>
        </div>
      </div> <!-- end .dropdown -->
      <div class="dropright">
        <a class="transfer-dropdown dropdown-toggle" role="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" href="#">
          Server&nbsp;Token&nbsp;List
        </a>
        <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
          <a class="dropdown-item" title="IPADDRESS" onmouseover="return (fixTitle (this));" onclick="addToken (this);">IP&nbsp;address</a>
          <a class="dropdown-menu" title="IPORIGIN" onmouseover="return (fixTitle (this));" onclick="addToken (this);">IP&nbsp;origin</a>
          <a class="dropdown-item" title="ORDERNUMBER" onmouseover="return (fixTitle (this));" onclick="addToken (this);">Order&nbsp;number</a>
          <a class="dropdown-item" title="HOWHEARD" onmouseover="return (fixTitle (this));" onclick="addToken (this);">How&nbsp;heard</a>
          <a class="dropdown-item" title="COMMENTS" onmouseover="return (fixTitle (this));" onclick="addToken (this);">Comments</a>
          <a class="dropdown-item" title="CCOM0" onmouseover="return (fixTitle (this));" onclick="addToken (this);">Custom&nbsp;comment&nbsp;0</a>
          <a class="dropdown-item" title="CCOM1" onmouseover="return (fixTitle (this));" onclick="addToken (this);">Custom&nbsp;comment&nbsp;1</a>
          <a class="dropdown-item" title="CCOM2" onmouseover="return (fixTitle (this));" onclick="addToken (this);">Custom&nbsp;comment&nbsp;2</a>
          <a class="dropdown-item" title="REFERRAL" onmouseover="return (fixTitle (this));" onclick="addToken (this);">Regerral</a>
          <a class="dropdown-item" title="AFFILIATEID" onmouseover="return (fixTitle (this));" onclick="addToken (this);">Affiliated&nbsp;ID</a>
          <a class="dropdown-item" title="DISCOUNTCODE" onmouseover="return (fixTitle (this));" onclick="addToken (this);">Discount&nbsp;code</a>
          <a class="dropdown-item" title="PONUMBER" onmouseover="return (fixTitle (this));" onclick="addToken (this);">PO&nbsp;number</a>
          <a class="dropdown-item" title="PAYMENTMETHOD" onmouseover="return (fixTitle (this));" onclick="addToken (this);">Payment&nbsp;method</a>
          <a class="dropdown-item" title="PAYMENTMETHOD_DESC" onmouseover="return (fixTitle (this));" onclick="addToken (this);">Payment&nbsp;description</a>
        </div>
      </div>
      <div class="dropright">
        <a class="transfer-dropdown dropdown-toggle" role="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" href="#">
          Products&nbsp;Token&nbsp;List
        </a>
        <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
          <a class="dropdown-item" title="PRODUCTID" onmouseover="return (fixTitle (this));" onclick="addToken (this);">Product&nbsp;ID</a>
          <a class="dropdown-item" title="PRODUCTNAME" onmouseover="return (fixTitle (this));" onclick="addToken (this);">Product&nbsp;name</a>
          <a class="dropdown-item" title="QUANTITY" onmouseover="return (fixTitle (this));" onclick="addToken (this);">Quantity</a>
          <a class="dropdown-item" title="PRODUCTCURRENCY" onmouseover="return (fixTitle (this));" onclick="addToken (this);">Product&nbsp;currency</a>
          <a class="dropdown-item" title="PRODUCTPRICE" onmouseover="return (fixTitle (this));" onclick="addToken (this);">Product&nbsp;price</a>
          <a class="dropdown-item" title="PRODUCTPRICE" onmouseover="return (fixTitle (this));" onclick="addToken (this);">Order&nbsp;currency</a>
          <a class="dropdown-item" title="ORDERSHIPPINGAMOUNT" onmouseover="return (fixTitle (this));" onclick="addToken (this);">Order&nbsp;shipping</a>
          <a class="dropdown-item" title="SHIPPINGMETHOD" onmouseover="return (fixTitle (this));" onclick="addToken (this);">Shipping&nbsp;method</a>
          <a class="dropdown-item" title="SUPPORTEMAIL" onmouseover="return (fixTitle (this));" onclick="addToken (this);">Support&nbsp;email</a>
          <a class="dropdown-item" title="PRODUCTEMAIL" onmouseover="return (fixTitle (this));" onclick="addToken (this);">Product&nbsp;email</a>
          <a class="dropdown-item" title="PROMODISCOUNTCODE" onmouseover="return (fixTitle (this));" onclick="addToken (this);">Promo&nbsp;discount&nbsp;code</a>
          <a class="dropdown-item" title="GIFTCERTIFICATES" onmouseover="return (fixTitle (this));" onclick="addToken (this);">Gift&nbsp;certificates</a>
          <a class="dropdown-item" title="REGKEY1" onmouseover="return (fixTitle (this));" onclick="addToken (this);">Activation&nbsp;code&nbsp;part&nbsp;1</a>
          <a class="dropdown-item" title="REGKEY2" onmouseover="return (fixTitle (this));" onclick="addToken (this);">Activation&nbsp;code&nbsp;part&nbsp;2</a>
          <a class="dropdown-item" title="REGKEY3" onmouseover="return (fixTitle (this));" onclick="addToken (this);">Activation&nbsp;code&nbsp;part&nbsp;3</a>
          <a class="dropdown-item" title="REGKEY4" onmouseover="return (fixTitle (this));" onclick="addToken (this);">Activation&nbsp;code&nbsp;part&nbsp;4</a>
          <a class="dropdown-item" title="REGKEYLIST" onmouseover="return (fixTitle (this));" onclick="addToken (this);">Activation&nbsp;code&nbsp;List</a>
          <a class="dropdown-item" title="DOWNLOADPASSWORD" onmouseover="return (fixTitle (this));" onclick="addToken (this);">Download&nbsp;Password</a>
          <a class="dropdown-item" title="DPWEXPIRATIONDATE" onmouseover="return (fixTitle (this));" onclick="addToken (this);">Password&nbsp;expiration&nbsp;date</a>
        </div>
      </div>
    </div> <!-- end .toolbar -->
    <textarea style="margin: .5rem 0;" rows="8" cols="100" id="emailtemplate" name="VENDOREMAILTEMPLATE">${param.VENDOREMAILTEMPLATE}</textarea>
    <br>
    <span>
      <input type="checkbox" name="USEDEFAULTTEMPLATE" onClick="useDefaultChanged (emailform);" style="margin-bottom: 1.2rem;"/>&nbsp;Use default/global template
    </span>
    <br>
    <textarea style="margin: .5rem 0; position: absolute; visibility: hidden;" rows="8" cols="100" name="DEFAULTVENDOREMAILTEMPLATE">${param.DEFAULTVENDOREMAILTEMPLATE}</textarea>
    <input type="hidden" name="PRODUCTID" value="${param.PRODUCTID}" />
    <input type="hidden" name="ACTION" value="13" />
    <input type="hidden" name="NEXT_PAGE" value="https://vendors-new.bmtmicro.com/products-manage.jsp" />
    <input type="hidden" name="ERROR_PAGE" value="https://vendors-new.bmtmicro.com/error-div.jsp" />
    <button type="button" class="save-btn" onclick="closeResultFrame()" style="margin-right: .5rem;">Close</button>
    <button class="save-btn" type="button" style="margin-right: .5rem;" onclick="showPreview (emailform);">Preview</button>
    <button class="save-btn" type="button" onclick="submitForm (emailform);">Save</button>
  </form>

  <form method="post" name="previewform" action="https://vendors-new.bmtmicro.com/servlets/Vendors.Products" target="previewPopUp" onsubmit="window.open ('', this.target, 'location=no,width=400,height=600,resizable=yes').focus(); return (true);" >
    <input type="hidden" name="ACTION" value="21" />
    <input type="hidden" name="PRODUCTID" value="${param.PRODUCTID}" />
    <input type="hidden" name="PREVIEWTEXT" value="" />
    <input type="hidden" name="NEXT_PAGE" value="https://vendors-new.bmtmicro.com/previewtext.html" />
    <input type="hidden" name="ERROR_PAGE" value="https://vendors-new.bmtmicro.com/error.jsp" />
  </form>
</div> <!-- end .transfer-section -->
