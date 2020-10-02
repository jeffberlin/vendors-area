<%@ include file="/includes/core.jsp" %>
<script>
  function createField (regionData) {
    var rda = regionData.split ("\f");
    if (rda.length >= 2) {
      var regionID = rda[0];
      var regionName = rda[1];
      var regionFirstItem = (rda.length > 2) ? rda[2] : "";
      var regionNextItem = (rda.length > 2) ? rda[3] : "";
      var regionProductID = (rda.length > 2) ? rda[4] : "";
      var regionRowNum = "regionRow" + (document.getElementsByName ("REGIONID").length + 1);
      var spanElem = document.createElement ("span");
      spanElem.setAttribute ("id", regionRowNum);
      var labelElem = document.createElement ("label");
      labelElem.appendChild (document.createTextNode ("First Item: "));
      spanElem.appendChild (labelElem);
      var firstItemElem = document.createElement ("input");
      firstItemElem.setAttribute ("type", "text");
      firstItemElem.setAttribute ("name", "REGIONFIRSTITEM");
      firstItemElem.setAttribute ("size", "8");
      firstItemElem.setAttribute ("value", regionFirstItem);
      spanElem.appendChild (firstItemElem);
      spanElem.appendChild (document.createTextNode (" \u00A0\u00A0 "));
      labelElem = document.createElement ("label");
      labelElem.appendChild (document.createTextNode ("Next Item: "));
      spanElem.appendChild (labelElem);
      var nextItemElem = document.createElement ("input");
      nextItemElem.setAttribute ("type", "text");
      nextItemElem.setAttribute ("name", "REGIONNEXTITEM");
      nextItemElem.setAttribute ("size", "8");
      nextItemElem.setAttribute ("value", regionNextItem);
      spanElem.appendChild (nextItemElem);
      spanElem.appendChild (document.createTextNode ("\u00A0\u00A0"));
      labelElem = document.createElement ("label");
      labelElem.appendChild (document.createTextNode ("Ship PID: "));
      spanElem.appendChild (labelElem);
      var nextItemElem = document.createElement ("input");
      nextItemElem.setAttribute ("type", "text");
      nextItemElem.setAttribute ("name", "REGIONPRODUCTID");
      nextItemElem.setAttribute ("size", "8");
      nextItemElem.setAttribute("style", "margin-bottom: 1rem;");
      nextItemElem.setAttribute ("value", regionProductID);
      spanElem.appendChild (nextItemElem);
      spanElem.appendChild (document.createTextNode ("\u00A0\u00A0"));
      labelElem = document.createElement ("b");
      labelElem.appendChild (document.createTextNode (regionName));
      spanElem.appendChild (labelElem);
      var regionInputElem = document.createElement ("input");
      regionInputElem.setAttribute ("type", "hidden");
      regionInputElem.setAttribute ("name", "REGIONID");
      regionInputElem.setAttribute ("value", regionID);
      spanElem.appendChild (regionInputElem);
      spanElem.appendChild (document.createTextNode ("\u00A0"));
      var buttonElem = document.createElement ("button");
      buttonElem.setAttribute ("class", "remove");
      buttonElem.setAttribute ("type", "button");
      buttonElem.setAttribute ("onclick", "removeRegion (\"" + regionRowNum + "\");");
      // buttonElem.appendChild (document.createTextNode ("X"));
      spanElem.appendChild (buttonElem);
      // spanElem.style.marginRight = "1rem";
      spanElem.appendChild (document.createElement ("br"));
      document.getElementById ("regions").appendChild (spanElem);
    }
  }

  function initRegionSel () {
    var regions = "${param.REGIONLIST}".split ("\t");
    var usedregions = document.getElementsByName ("REGIONID");
    var select = document.getElementById ("REGIONSEL");
    var optionIdx = 0;
    for (var i = 0; i < regions.length; i++) {
      var region = regions[i].split ("\f");
      if (region.length == 2) {
        var used = false;
        for (var j = 0; j < usedregions.length; j++) {
          if (region[0] == usedregions[j].value) {
            used = true;
            break;
          }
        }
        if (!used) {
          select.options[optionIdx++] = new Option (region[1], regions[i]);
        }
      }
    }
    for ( ;select.options.length > optionIdx; select.options[select.options.length - 1] = null);
  }

  function addRegion () {
    var select = document.getElementById ("REGIONSEL");
    if (select.options.length > 0) {
      createField (select.value);
      initRegionSel ();
    } else {
      if (document.getElementsByName ("REGIONID").length == 0) {
        alert ("No regions have been set up yet. Click the Manage Regions button to set up regions first.");
      } else {
        alert ("All existing regions have shipping cost set. Click the Manage Regions button to add more regions.");
      }
    }
  }

  function removeRegion (id) {
    var spanElem = document.getElementById (id);
    spanElem.parentNode.removeChild (spanElem);
    initRegionSel ();
  }

  function checkValuePair (firstField, nextField) {
    if (isBlank (firstField.value) || isNaN (firstField.value) || (parseFloat (firstField.value) < 0.01)) {
      alert ("You must specify a valid default shipping cost for the first item!");
      firstField.focus ();
      return (false);
    }
    if (isBlank (nextField.value) || isNaN (nextField.value) || (parseFloat (nextField.value) < 0)) {
      alert ("You must specify a valid default shipping cost for subsequent item(s)!");
      nextField.focus ();
      return (false);
    }
    return (true);
  }

  function submitScheme (form) {
    // Important: We need to use hidden fields to submit checkbox values, as the servlets will use default values if the
    // field is not present. (An unchecked checkbox constitutes a non-existent field).
    form.NAME.value = trim (form.NAME.value);
    if (isBlank (form.NAME.value)) {
      alert ("You must name the shipping cost scheme!");
      form.NAME.focus ();
      return (false);
    }
    if ((form.NAME.value != "${param.NAME}") && ("${param.NAMELIST}".split ("\t").indexOf (form.NAME.value) != -1)) {
      alert ("A shipping cost scheme with that name already exists!");
      form.NAME.focus ();
      return (false);
    }
    if (!checkValuePair (form.FIRSTITEM, form.NEXTITEM)) {
      return (false);
    }
    for (var i = 0; i < GetFieldCount (form.REGIONFIRSTITEM); i++) {
      if (!checkValuePair (GetIndexedField (form.REGIONFIRSTITEM, i), GetIndexedField (form.REGIONNEXTITEM, i))) {
        return (false);
      }
    }
    // form.submit ();
    submitToDiv (form);
    return (true);
  }

  function initForm(form) {
    var shippingcosts = "${param.SHIPPINGCOSTLIST}".split ("\t");
    for (var i = 0; i < shippingcosts.length; createField (shippingcosts[i++]));
    initRegionSel();
  }
</script>
<div class="transfer-section">
  <form method="post" action="https://vendors-new.bmtmicro.com/servlets/Vendors.ShippingCost">
    <input type="hidden" name="NEXT_PAGE" value="https://vendors-new.bmtmicro.com/manage-shipping-schemes.jsp" />
    <input type="hidden" name="ERROR_PAGE" value="https://vendors-new.bmtmicro.com/error-div.jsp" />
    <input type="hidden" name="SCHEMEID" value="${param.SCHEMEID}" />
    <input type="hidden" name="ACTION" value="10" />
    <h5>Add New Shipping Scheme</h5>
    <span>
      <label>Scheme Name:&nbsp;</label>
      <input name="NAME" maxlength="80" value="${param.NAME}" title="This is the descriptive name for the Shipping Cost Scheme. maximum 80 characters." style="margin-bottom: 1rem;" />
    </span>
    <br clear="all">
    <h6>Default Shipping Costs</h6>
    <span>
      <label>First Item:&nbsp;</label>
      <input name="FIRSTITEM" size="8" value="${param.FIRSTITEM}" title="The shipping cost for the first item." style="margin-right: .5rem;" />
      <label>Next Item:&nbsp;</label>
      <input name="NEXTITEM" size="8" value="${param.NEXTITEM}" title="The shipping cost for subsequent items." style="margin-right: .5rem;" />
      <label>Ship PID:&nbsp;</label>
      <input name="PRODUCTID" size="8" value="${param.PRODUCTID}" title="The product ID under which this shipping cost will appear. Normally this field should be left blank!" style="margin-bottom: 1rem;" />
    </span>
    <br clear="all">
    <h6>Region Dependent Shipping Costs</h6>
    <div id="regions"></div>
    <span>
      <label>Add Regional Costs:&nbsp;</label>
      <select id="REGIONSEL" name="REGIONSEL" style="margin-bottom: 1.2rem;"></select>
      <button class="add" type="button" onclick="addRegion ();" style="border: none; background: none; padding: .1rem; vertical-align: middle;"><i class="fas fa-plus-circle"></i></button>
    </span>
    <br clear="all">
    <span>
      <button type="button" class="save-btn" onclick="submitScheme (this.form);" style="margin-right: .5rem;">Save</button>
      <button type="button" class="save-btn" onclick="closeResultFrame();">Close</button>
    </span>
  </form>
</div> <!-- end .transfer-section -->
