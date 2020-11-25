<%@ page pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ include file="/includes/core.jsp" %>
<div class="transfer-section">
  <form method="post" action="https://vendors-new.bmtmicro.com/servlets/Vendors.SplitSchemes">
    <input type="hidden" name="NEXT_PAGE" value="https://vendors-new.bmtmicro.com/products-manage-splits.jsp" />
    <input type="hidden" name="ERROR_PAGE" value="https://vendors-new.bmtmicro.com/error-div.jsp" />
    <input type="hidden" name="SCHEMEID" value="${requestScope.SCHEMEID}" />
    <input type="hidden" name="ACTION" value="11" />
    <h5>Edit Vendor Split ${requestScope.NAME}</h5>
    <span>
      <label>Split Name:&nbsp;</label>
      <input name="NAME" maxlength="80" value="${requestScope.NAME}" title=" This is the descriptive name for the Vendor Split. maximum 80 characters." style="margin-bottom: 1rem;" />
    </span>
    <br clear="all">
    <span>
      <label>Percentage:&nbsp;</label>
      <input name="PERCENTAGE" value="${requestScope.PERCENTAGE}" size="10" title=" Enter the percentage amount in the text field. Numbers only, decimals are allowed." style="margin-bottom: 1rem;" />
    </span>
    <br clear="all">
    <span>
      <label>Fixed Amount:</label>
      <input name="AMOUNT" value="${requestScope.AMOUNT}" size="10" title=" Enter the fixed amount in the text field. Numbers only, decimals are allowed. Leave blank for no fixed amount." style="margin-bottom: 1rem;" />
      <em style="font-size: .8rem;">(Fixed amount for each unit sold)</em>
    </span>
    <br clear="all">
    <span>
      <label>Maximum Amount:&nbsp;</label>
      <input name="MAXAMOUNT" value="${requestScope.MAXAMOUNT}" size="10" title=" Enter the maximum amount in the text field. Numbers only, decimals are allowed. Leave blank for no maximum amount." style="margin-bottom: 1rem;" />
      <em style="font-size: .8rem;">(Leave blank to split all sales)</em>
    </span>
    <br clear="all">
    <span>
      <label>Beneficiary Vendor ID:&nbsp;</label>
      <input name="SPLITVENDORID" maxlength="5" size="5" value="${requestScope.SPLITVENDORID}" title=" This should be the vendor ID credited with a percentage of your sales." style="margin-bottom: 1rem;" />
    </span>
    <h6>Choose Products for this Vendor Split</h6>
    <span>
      <input type="hidden" name="ALLPRODUCTS" value="${requestScope.ALLPRODUCTS}" />
      <input type="checkbox" title=" Includes all products for this vendor, including products added in the future." style="margin-bottom: 1rem;"<c:if test="${requestScope.ALLPRODUCTS!=0}"> checked</c:if>/>&nbsp;Apply to all products
    </span>
    <br>
    <select id="PRODUCTLIST" name="PRODUCTLIST" multiple="multiple" ondblclick="addProduct (this.form);" style="width: 45%; height: 125px;">
       ${requestScope.PRODUCTLIST}
    </select>
    <div class="move">
      <!-- we hardcode the style here since the classes are not visible. We can add class="content" to the "dd" tag to
           make the styles work, but then this will add whitespace on the sides which is not desired... -->
      <button style="margin-right: 5px;" type="button" name="add" value="Add&nbsp;&gt;&gt;" onclick="addProduct (this.form);">
        Add&nbsp;<i class="fas fa-angle-down"></i>
      </button>
      <button style="margin-right: 5px;" type="button" name="remove" value="&lt;&lt;&nbsp;Remove" onclick="removeProduct (this.form);">
        <i class="fas fa-angle-up"></i>&nbsp;Remove
      </button>
      <button style="margin-right: 5px;" type="button" name="addall" value="Add&nbsp;&gt;&gt;" onclick="addAllProducts (this.form);">
        Add&nbsp;All&nbsp;<i class="fas fa-angle-down"></i>
      </button>
      <button type="button" name="removeall" value="&lt;&lt;&nbsp;Remove" onclick="removeAllProducts (this.form);">
        <i class="fas fa-angle-up"></i>&nbsp;Remove&nbsp;All
      </button>
    </div> <!-- end .move -->
    <select id="SELECTEDLIST" name="SELECTEDLIST" multiple="multiple" ondblclick="removeProduct (this.form);" style="width: 45%; height: 125px;">
       ${requestScope.SELECTEDPRODUCTS}
    </select>
    <input type="hidden" name="SELECTEDPRODUCTS" />
    <div class="controlbuttons">
      <button type="button" class="save-btn" onclick="submitSplit (this.form);" style="margin-right: .5rem;">Save</button>
      <button type="button" class="save-btn" onclick="closeResultFrame()">Cancel</button>
    </div>
  </form>
</div> <!-- end .transfer-section -->
