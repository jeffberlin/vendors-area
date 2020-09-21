<%@ include file="/includes/core.jsp" %>
<script>
  function init (form) {
    if (form.EXPIRATIONDATE.value == "") {
      form.EXPIRATIONDATE.value = makeFutureDate (31);
    }
  }

  function submitShortLink (form) {
    if (isBlank (form.PARAMETERS.value)) {
      alert ("You must provide custom parameters for short links!");
      form.PARAMETERS.focus ();
      return (false);
    }
    // form.submit ();
    submitToDiv (form, "resultframe");
    return (true);
  }
</script>
<div class="transfer-section">
  <h5>The&nbsp;secure&nbsp;order&nbsp;link&nbsp;for&nbsp;${param.PRODUCTNAME}</h5>
  <p class="text-section" style="margin-bottom: .5rem;">
    https://secure.bmtmicro.com/cart?CID=${param.VENDORID}&amp;PRODUCTID=${param.PRODUCTID}
  </p>
  <p style="font-size: .9rem; font-style: italic; color: #707070; letter-spacing: .5px;">
    <strong>Please&nbsp;note:</strong>
    <br>
    Our shopping cart system uses secure P3P signed cookies to remember products for 60 days if not purchased.
    <br>
    This is necessary for affiliates to receive credit for referred sales that are purchased at a later date.
    <br>
    If you are testing your cart other tested products may appear in a single shopping cart link.
    <br>
    To clear all products from the shopping cart each time,add a <b>CLR=0</b> parameter to the link, like this:
  </p>
  <p style="padding-left: 10px; color: #195a7c !important;">
    https://secure.bmtmicro.com/cart?CID=${param.VENDORID}&amp;CLR=0&amp;PRODUCTID=${param.PRODUCTID}
  </p>
  <h5>Short&nbsp;Links:</h5>
  <p class="text-section" style="margin-bottom: .5rem;">To create short links with custom parameters, please enter parameters below.</p>
  <form name="short" method="post" action="https://vendors-new.bmtmicro.com/servlets/Vendors.Products">
    <input type="hidden" name="ACTION" value="18" />
    <input type="hidden" name="NEXT_PAGE" value="https://vendors-new.bmtmicro.com/products-manage-generated-short-link-short-link.jsp" />
    <input type="hidden" name="ERROR_PAGE" value="https://vendors-new.bmtmicro.com/error-div.jsp" />
    <span>
      Link&nbsp;Parameters:&nbsp;
      <input type="text" name="PARAMETERS" value="CID=${param.VENDORID}&amp;CLR=0&amp;PRODUCTID=${param.PRODUCTID}" size=70 style="margin-bottom: 1rem;" />
    </span>
    <br clear="all">
    <p>If you would like to choose a specific expiration date, please enter date below.</p>
    <span>
      Expiration&nbsp;Date:&nbsp;
      <!-- <input id="EXPIRATIONDATE" name="EXPIRATIONDATE" value="" size=10 style="margin-bottom: 1rem;"/>&nbsp; -->
      <!-- <img src="https://vendors-new.bmtmicro.com/images/cal.gif" width="16" height="16" border="0" alt="Click Here to Pick up the date" onclick="show_calendar ('EXPIRATIONDATE'); return (false);" onmouseover="this.style.cursor='pointer';" /> -->
      <input id="EXPIRATIONDATE" name="EXPIRATIONDATE" value="" onkeypress="filterKeyPress(event)" style="margin-bottom: 1rem;"/>&nbsp;
      <img class="calendar" alt="Click Here to Pick the date" title="Click Here to Pick the date" onclick="show_calendar (this);" />
    </span>
    <br>
    <button type="button" onclick="submitShortLink (form);" value="submit" class="save-btn" style="margin-right: .5rem;">Generate&nbsp;Short&nbsp;Link</button>
    <button type="button" class="save-btn" onclick="closeResultFrame ();">Close</button>
  </form>
</div> <!-- end .transfer-section -->
