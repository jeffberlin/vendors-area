<%@ include file="/includes/core.jsp" %>
<div class="transfer-section">
  <form method="post" action="https://vendors-new.bmtmicro.com/servlets/Vendors.ShippingCost">
    <input type="hidden" name="NEXT_PAGE" value="https://vendors-new.bmtmicro.com/manage-shipping-scheme.jsp" />
    <input type="hidden" name="ERROR_PAGE" value="https://vendors-new.bmtmicro.com/error-div.jsp" />
    <input type="hidden" name="SCHEMEID" value="${param.SCHEMEID}" />
    <input type="hidden" name="ACTION" value="11" />
    <h5>Edit Region ${param.NAME}</h5>
    <span>
      <label>Scheme Name:&nbsp;</label>
      <input name="NAME" maxlength="80" value="${param.NAME}" title="This is the descriptive name for the Shipping Cost Scheme. maximum 80 characters." style="margin-bottom: 1rem;" />
    </span>
    <br clear="all">
    <h6>Default Shipping Costs</h6>
    <span>
      <label>First Item:&nbsp;</label>
      <input name="FIRSTITEM" size="8" value="${param.FIRSTITEM}" title="The shipping cost for the first item." style="margin-right: 1rem;" />
      <label>Next Item:&nbsp;</label>
      <input name="NEXTITEM" size="8" value="${param.NEXTITEM}" title="The shipping cost for subsequent items." style="margin-right: 1rem;" />
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
      <button type="button" class="save-btn" onclick="submitForm (this.form);" style="margin-right: .5rem;">Save</button>
      <button type="button" class="save-btn" onclick="closeResultFrame()">Close</button>
    </span>
  </form>
</div> <!-- end .transfer-section -->
