<%@ include file="/includes/core.jsp" %>
<script>
  function insertAtCursor (myField, myValue) {
    //IE support
    if (document.selection) {
      myField.focus();
      sel = document.selection.createRange ();
      sel.text = myValue;
    }
    //MOZILLA/NETSCAPE support
    else if (myField.selectionStart || myField.selectionStart == '0') {
      var startPos = myField.selectionStart;
      var endPos = myField.selectionEnd;
      myField.value = myField.value.substring(0, startPos) + myValue + myField.value.substring(endPos, myField.value.length);
    } else {
      myField.value += myValue;
    }
  }

  function makeToken (s) {
    return ((s.charAt (0) == "#") ? s : ("##" + s + "##"));
  }

  function addToken (div) {
    insertAtCursor (document.getElementById ("emailtemplate"), makeToken (div.title));
  }

  function fixTitle (div) {
    div.title = makeToken (div.title);
    return (false);
  }

  function useDefaultChanged (form) {
    if (form.USEDEFAULTTEMPLATE.checked) {
      form.CUSTOMEREMAILTEMPLATE.value = form.DEFAULTCUSTOMEREMAILTEMPLATE.value;
    }
    form.CUSTOMEREMAILTEMPLATE.disabled = form.USEDEFAULTTEMPLATE.checked;
  }

  function initForm (form) {
    if (isBlank (form.CUSTOMEREMAILTEMPLATE.value)){
      form.CUSTOMEREMAILTEMPLATE.value = form.DEFAULTCUSTOMEREMAILTEMPLATE.value;
      form.CUSTOMEREMAILTEMPLATE.disabled = true;
      form.USEDEFAULTTEMPLATE.checked = true;
    }
  }
  function showPreview (form) {
    var tgtform = document.previewform;
    tgtform.PREVIEWTEXT.value = form.DEFAULTCUSTOMEREMAILTEMPLATE.value;
    tgtform.submit ();
  }

  function submitEmailForm(form) {
    if (isBlank(form.DEFAULTCUSTOMEREMAILTEMPLATE.value)) {
      alert("Cannot leave default template blank! It must at least have the Standard Message token.");
      form.DEFAULTCUSTOMEREMAILTEMPLATE.value = "\#\#STDMESSAGE\#\#";
      form.DEFAULTCUSTOMEREMAILTEMPLATE.focus();
      return (false);
    }
    <c:if test = "${ allowChanges == 0 }">
      alert("You do not have permission to edit email templates.");
    </c:if>
    <c:if test = "${ allowChanges == 1 }">
      form.submit();
    </c:if>
  }
</script>
<div class="transfer-section">
  <form method="post" name="emailform" action="https://vendors-new.bmtmicro.com/servlets/Vendors.Products" target="_parent">
    <input type="hidden" name="PRODUCTID" value="${param.PRODUCTID}" />
    <input type="hidden" name="ACTION" value="15" />
    <input type="hidden" name="NEXT_PAGE" value="https://vendors-new.bmtmicro.com/products-manage.jsp" />
    <input type="hidden" name="ERROR_PAGE" value="https://vendors-new.bmtmicro.com/error-div.jsp" />
    <h5>Default Customer Email template</h5>
    <p class="text-section" style="margin-bottom: .5rem;">
      This template will be used by all products that do not have a custom specific table set.
      <br />
      Please read <a href="https://help.bmtmicro.com/vendors/edit-customer-email-notifications" target="_blank">help
      files</a> for a full explanation on standard messages and token usage.
    </p>
    <div class="toolbar d-flex">
      <div class="dropright">
        <a class="dropdown-toggle transfer-dropdown" role="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" href="#">
          User&nbsp;Token&nbsp;List
        </a>
        <div class="transfer-dropdown-menu dropdown-menu" aria-labelledby="dropdownMenuButton">
          <a class="transfer-dropdown-item dropdown-item" title="DATE" onmouseover="return (fixTitle (this));" onclick="addToken (this);">Date</a>
          <a class="transfer-dropdown-item dropdown-item" title="ORDERDATE" onmouseover="return (fixTitle (this));" onclick="addToken (this);">Order&nbsp;date</a>
          <a class="transfer-dropdown-item dropdown-item" title="PAYMENTDATE" onmouseover="return (fixTitle (this));" onclick="addToken (this);">Payment&nbsp;date</a>
          <a class="transfer-dropdown-item dropdown-item" title="FIRSTNAME" onmouseover="return (fixTitle (this));" onclick="addToken (this);">First&nbsp;name</a>
          <a class="transfer-dropdown-item dropdown-item" title="LASTNAME" onmouseover="return (fixTitle (this));" onclick="addToken (this);">Last&nbsp;name</a>
          <a class="transfer-dropdown-item dropdown-item" title="COMPANY" onmouseover="return (fixTitle (this));" onclick="addToken (this);">Company</a>
          <a class="transfer-dropdown-item dropdown-item" title="REGISTERNAME" onmouseover="return (fixTitle (this));" onclick="addToken (this);">Register&nbsp;name</a>
          <a class="transfer-dropdown-item dropdown-item" title="ADDRESS1" onmouseover="return (fixTitle (this));" onclick="addToken (this);">Address&nbsp;1</a>
          <a class="transfer-dropdown-item dropdown-item" title="ADDRESS2" onmouseover="return (fixTitle (this));" onclick="addToken (this);">Address&nbsp;2</a>
          <a class="transfer-dropdown-item dropdown-item" title="CITY" onmouseover="return (fixTitle (this));" onclick="addToken (this);">City</a>
          <a class="transfer-dropdown-item dropdown-item" title="POSTALCODE" onmouseover="return (fixTitle (this));" onclick="addToken (this);">Postal&nbsp;Code</a>
          <a class="transfer-dropdown-item dropdown-item" title="STATE" onmouseover="return (fixTitle (this));" onclick="addToken (this);">State</a>
          <a class="transfer-dropdown-item dropdown-item" title="COUNTRY" onmouseover="return (fixTitle (this));" onclick="addToken (this);">Country</a>
          <a class="transfer-dropdown-item dropdown-item" title="WORKPHONE" onmouseover="return (fixTitle (this));" onclick="addToken (this);">Work&nbsp;phone</a>
          <a class="transfer-dropdown-item dropdown-item" title="HOMEPHONE" onmouseover="return (fixTitle (this));" onclick="addToken (this);">Home&nbsp;phone</a>
          <a class="transfer-dropdown-item dropdown-item" title="EMAIL" onmouseover="return (fixTitle (this));" onclick="addToken (this);">Primary&nbsp;Email</a>
          <a class="transfer-dropdown-item dropdown-item" title="ALTEMAIL" onmouseover="return (fixTitle (this));" onclick="addToken (this);">Secondary&nbsp;Email</a>
        </div>
      </div> <!-- end .dropdown -->
      <div class="dropright">
        <a class="dropdown-toggle transfer-dropdown" role="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" href="#">
          Server&nbsp;Token&nbsp;List
        </a>
        <div class="transfer-dropdown-menu dropdown-menu" aria-labelledby="dropdownMenuButton">
          <a class="transfer-dropdown-item dropdown-item" title="IPADDRESS" onmouseover="return (fixTitle (this));" onclick="addToken (this);">IP&nbsp;address</a>
          <a class="transfer-dropdown-item dropdown-item" title="IPORIGIN" onmouseover="return (fixTitle (this));" onclick="addToken (this);">IP&nbsp;origin</a>
          <a class="transfer-dropdown-item dropdown-item" title="ORDERNUMBER" onmouseover="return (fixTitle (this));" onclick="addToken (this);">Order&nbsp;number</a>
          <a class="transfer-dropdown-item dropdown-item" title="HOWHEARD" onmouseover="return (fixTitle (this));" onclick="addToken (this);">How&nbsp;heard</a>
          <a class="transfer-dropdown-item dropdown-item" title="COMMENTS" onmouseover="return (fixTitle (this));" onclick="addToken (this);">Comments</a>
          <a class="transfer-dropdown-item dropdown-item" title="CCOM0" onmouseover="return (fixTitle (this));" onclick="addToken (this);">Custom&nbsp;comment&nbsp;0</a>
          <a class="transfer-dropdown-item dropdown-item" title="CCOM1" onmouseover="return (fixTitle (this));" onclick="addToken (this);">Custom&nbsp;comment&nbsp;1</a>
          <a class="transfer-dropdown-item dropdown-item" title="CCOM2" onmouseover="return (fixTitle (this));" onclick="addToken (this);">Custom&nbsp;comment&nbsp;2</a>
          <a class="transfer-dropdown-item dropdown-item" title="REFERRAL" onmouseover="return (fixTitle (this));" onclick="addToken (this);">Regerral</a>
          <a class="transfer-dropdown-item dropdown-item" title="AFFILIATEID" onmouseover="return (fixTitle (this));" onclick="addToken (this);">Affiliated&nbsp;ID</a>
          <a class="transfer-dropdown-item dropdown-item" title="DISCOUNTCODE" onmouseover="return (fixTitle (this));" onclick="addToken (this);">Discount&nbsp;code</a>
          <a class="transfer-dropdown-item dropdown-item" title="PONUMBER" onmouseover="return (fixTitle (this));" onclick="addToken (this);">PO&nbsp;number</a>
          <a class="transfer-dropdown-item dropdown-item" title="PAYMENTMETHOD" onmouseover="return (fixTitle (this));" onclick="addToken (this);">Payment&nbsp;method</a>
          <a class="transfer-dropdown-item dropdown-item" title="PAYMENTMETHOD_DESC" onmouseover="return (fixTitle (this));" onclick="addToken (this);">Payment&nbsp;description</a>
        </div>
      </div>
      <div class="dropright">
        <a class="dropdown-toggle transfer-dropdown" role="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" href="#">
          Products&nbsp;Token&nbsp;List
        </a>
        <div class="transfer-dropdown-menu dropdown-menu" aria-labelledby="dropdownMenuButton">
          <a class="transfer-dropdown-item dropdown-item" title="PRODUCTID" onmouseover="return (fixTitle (this));" onclick="addToken (this);">Product&nbsp;ID</a>
          <a class="transfer-dropdown-item dropdown-item" title="PRODUCTNAME" onmouseover="return (fixTitle (this));" onclick="addToken (this);">Product&nbsp;name</a>
          <a class="transfer-dropdown-item dropdown-item" title="QUANTITY" onmouseover="return (fixTitle (this));" onclick="addToken (this);">Quantity</a>
          <a class="transfer-dropdown-item dropdown-item" title="PRODUCTCURRENCY" onmouseover="return (fixTitle (this));" onclick="addToken (this);">Product&nbsp;currency</a>
          <a class="transfer-dropdown-item dropdown-item" title="PRODUCTPRICE" onmouseover="return (fixTitle (this));" onclick="addToken (this);">Product&nbsp;price</a>
          <a class="transfer-dropdown-item dropdown-item" title="PRODUCTPRICE" onmouseover="return (fixTitle (this));" onclick="addToken (this);">Order&nbsp;currency</a>
          <a class="transfer-dropdown-item dropdown-item" title="ORDERSHIPPINGAMOUNT" onmouseover="return (fixTitle (this));" onclick="addToken (this);">Order&nbsp;shipping</a>
          <a class="transfer-dropdown-item dropdown-item" title="SHIPPINGMETHOD" onmouseover="return (fixTitle (this));" onclick="addToken (this);">Shipping&nbsp;method</a>
          <a class="transfer-dropdown-item dropdown-item" title="SUPPORTEMAIL" onmouseover="return (fixTitle (this));" onclick="addToken (this);">Support&nbsp;email</a>
          <a class="transfer-dropdown-item dropdown-item" title="PRODUCTEMAIL" onmouseover="return (fixTitle (this));" onclick="addToken (this);">Product&nbsp;email</a>
          <a class="transfer-dropdown-item dropdown-item" title="PROMODISCOUNTCODE" onmouseover="return (fixTitle (this));" onclick="addToken (this);">Promo&nbsp;discount&nbsp;code</a>
          <a class="transfer-dropdown-item dropdown-item" title="GIFTCERTIFICATES" onmouseover="return (fixTitle (this));" onclick="addToken (this);">Gift&nbsp;certificates</a>
          <a class="transfer-dropdown-item dropdown-item" title="REGKEY1" onmouseover="return (fixTitle (this));" onclick="addToken (this);">Activation&nbsp;code&nbsp;part&nbsp;1</a>
          <a class="transfer-dropdown-item dropdown-item" title="REGKEY2" onmouseover="return (fixTitle (this));" onclick="addToken (this);">Activation&nbsp;code&nbsp;part&nbsp;2</a>
          <a class="transfer-dropdown-item dropdown-item" title="REGKEY3" onmouseover="return (fixTitle (this));" onclick="addToken (this);">Activation&nbsp;code&nbsp;part&nbsp;3</a>
          <a class="transfer-dropdown-item dropdown-item" title="REGKEY4" onmouseover="return (fixTitle (this));" onclick="addToken (this);">Activation&nbsp;code&nbsp;part&nbsp;4</a>
          <a class="transfer-dropdown-item dropdown-item" title="REGKEYLIST" onmouseover="return (fixTitle (this));" onclick="addToken (this);">Activation&nbsp;code&nbsp;List</a>
          <a class="transfer-dropdown-item dropdown-item" title="DOWNLOADPASSWORD" onmouseover="return (fixTitle (this));" onclick="addToken (this);">Download&nbsp;Password</a>
          <a class="transfer-dropdown-item dropdown-item" title="DPWEXPIRATIONDATE" onmouseover="return (fixTitle (this));" onclick="addToken (this);">Password&nbsp;expiration&nbsp;date</a>
        </div>
      </div>
    </div>
    <textarea style="margin: .5rem 0;" id="emailtemplate" name="DEFAULTCUSTOMEREMAILTEMPLATE" rows="8" cols="80" placeholder="Type a message">${param.DEFAULTCUSTOMEREMAILTEMPLATE}</textarea>
    <br>
    <button class="save-btn" type="button" onclick="closeResultFrame ();" style="margin-right: .5rem;">Cancel</button>
    <button class="save-btn" type="button" onclick="showPreview (emailform);" style="margin-right: .5rem;">Preview</button>
    <button class="save-btn" type="button" onclick="submitEmailForm (emailform);">Save</button>
  </form>
  <form method="post" name="previewform" action="https://vendors-new.bmtmicro.com/servlets/Vendors.Products" target="previewPopUp" onsubmit="window.open ('', this.target, 'location=no,width=400,height=600,resizable=yes').focus(); return (true);">
    <input type="hidden" name="ACTION" value="20">
    <input type="hidden" name="PRODUCTID" value="${param.PRODUCTID}">
    <input type="hidden" name="PREVIEWTEXT" value="">
    <input type="hidden" name="NEXT_PAGE" value="https://vendors-new.bmtmicro.com/previewtext.html">
    <input type="hidden" name="ERROR_PAGE" value="https://vendors-new.bmtmicro.com/error.jsp">
  </form>
</div> <!-- end .transfer-section -->
