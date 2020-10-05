<%@ include file="/includes/core.jsp" %>
<script>
  function createRegionViewField (regionData) {
    var rda = regionData.split ("\f");
    if (rda.length >= 2) {
      var regionID = rda[0];
      var regionName = rda[1];
      var regionFirstItem = rda[2];
      var regionNextItem = rda[3];
      var regionProductID = rda[4];
      var spanElem = document.createElement ("span");
      var labelElem = document.createElement ("label");
      labelElem.appendChild (document.createTextNode ("First Item: " + regionFirstItem));
      spanElem.appendChild (labelElem);
      spanElem.appendChild (document.createTextNode (" \u00A0\u00A0 "));
      spanElem.appendChild (document.createElement("br"));
      labelElem = document.createElement ("label");
      labelElem.appendChild (document.createTextNode ("Next Item: " + regionNextItem));
      labelElem.setAttribute ("width", "150px");
      spanElem.appendChild(document.createElement("br"));
      spanElem.appendChild (labelElem);
      spanElem.appendChild (document.createTextNode ("\u00A0\u00A0"));
      labelElem = document.createElement ("label");
      labelElem.appendChild (document.createTextNode ("Ship PID: " + regionProductID));
      labelElem.setAttribute ("width", "150px");
      spanElem.appendChild (labelElem);
      spanElem.appendChild (document.createTextNode ("\u00A0\u00A0"));
      labelElem = document.createElement ("b");
      labelElem.appendChild (document.createTextNode (regionName));
      spanElem.appendChild (labelElem);
      spanElem.appendChild (document.createElement ("br"));
      document.getElementById ("regions").appendChild (spanElem);
    }
  }

  function initForm (form) {
    var shippingcosts = "${param.SHIPPINGCOSTLIST}".split ("\t");
    for (var i = 0; i < shippingcosts.length; createField (shippingcosts[i++]));
  }
</script>
<div class="transfer-section">
  <form method="post" action="https://vendors-new.bmtmicro.com/servlets/Vendors.ShippingCost">
    <h5>View Shipping Scheme</h5>
    <span>
      <label>Name:&nbsp;</label>
      ${param.NAME}
    </span>
    <h6>Default Shipping Costs</h6>
    <div class="item-info">
      <label>First Item:&nbsp;</label>
      <span>${param.FIRSTITEM}</span>
      <!-- <br> -->
      <label>Next Item:&nbsp;</label>
      <span>${param.NEXTITEM}</span>
      <!-- <br> -->
      <label>Ship PID:&nbsp;</label>
      <span>${param.PRODUCTID}</span>
    </div>
    <!-- <br clear="all"> -->
    <h6>Region Dependent Shipping Costs</h6>
    <div class="item-info" id="regions"></div>
  </form>
  <button type="button" class="save-btn" onclick="closeResultFrame()">Close</button>
</div> <!-- end .transfer-section -->
