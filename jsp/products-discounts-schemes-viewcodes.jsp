<%@ include file="/includes/core.jsp" %>
<div class="transfer-section">
	<c:if test="${requestScope.SCHEMETYPE == 0}">
		<c:if test="${requestScope.NUMCODES == 0}">
      <h5>View&nbsp;Discount&nbsp;Codes</h5>
      <p>No codes have been generated for ${requestScope.NAME}.</p>
      <button type="button" class="save-btn" onclick="closeResultFrame()">Close</button>
		</c:if>
		<c:if test="${requestScope.NUMCODES != 0}">
			<c:if test="${requestScope.MAXUSECOUNT == 0}">
	      <h5>View Discount Codes</h5>
	      <p>The discount code for ${requestScope.NAME} is ${requestScope.DISCOUNTCODE}.&nbsp;This code is good for any number of purchases.</p>
	      <c:if test="${requestScope.EXPIRATIONDATE!=''}"><p>It expires on ${requestScope.EXPIRATIONDATE}.</p></c:if>
	      <p>It has been used ${requestScope.USECOUNT} times.</p>
	      <button type="button" class="save-btn" onclick="closeResultFrame()">Close</button>
			</c:if>
			<c:if test="${requestScope.MAXUSECOUNT == 1}">
	      <form method="post" action="https://vendors-new.bmtmicro.com/servlets/Vendors.DiscountSchemes">
	        <h5>View Discount Codes for ${requestScope.NAME}</h5>
	        <p>The number of uses is limited to one purchase per code.</p>
	        <p>This discount scheme has ${requestScope.NUMCODES} codes of which ${requestScope.USECOUNT} codes have been used.</p>
	        <select name="VIEWTYPE" style="margin-bottom: 1rem;">
	          <option value="0"<c:if test="${requestScope.VIEWTYPE==0}"> selected</c:if>>View All Codes</option>
	          <option value="1"<c:if test="${requestScope.VIEWTYPE==1}"> selected</c:if>>View Used Codes</option>
	          <option value="3"<c:if test="${requestScope.VIEWTYPE==3}"> selected</c:if>>View Unused Codes</option>
	        </select>
	        <br>
	        <button type="button" class="save-btn" style="margin-right: .5rem;" onclick="submitToDiv (form, 'resultframe');" >View Codes</button>
					<button type="button" class="save-btn" onclick="closeResultFrame()">Close</button>
	        <input type="hidden" name="ACTION" value="14" />
	        <input type="hidden" name="SCHEMEID" value="${requestScope.SCHEMEID}" />
	        <input type="hidden" name="NAME" value="${requestScope.NAME}" />
	        <input type="hidden" name="NEXT_PAGE" value="https://vendors-new.bmtmicro.com/products-discounts-schemes-codetable.jsp" />
	        <input type="hidden" name="ERROR_PAGE" value="https://vendors-new.bmtmicro.com/error-div.jsp" />
	      </form>
			</c:if>
			<c:if test="${requestScope.MAXUSECOUNT > 1}">
	      <form method="post" action="https://vendors-new.bmtmicro.com/servlets/Vendors.DiscountSchemes">
	        <h5>View Discount Codes for ${requestScope.NAME}</h5>
	        <p>The number of uses is limited to ${requestScope.MAXUSECOUNT} purchases per code.</p>
	        <select name="VIEWTYPE" style="margin-bottom: 1rem;">
	          <option value="0"<c:if test="${requestScope.VIEWTYPE==0}"> selected</c:if>>View All Codes</option>
	          <option value="1"<c:if test="${requestScope.VIEWTYPE==1}"> selected</c:if>>View Completely Used Codes</option>
	          <option value="2"<c:if test="${requestScope.VIEWTYPE==2}"> selected</c:if>>View Partially Used Codes</option>
	          <option value="3"<c:if test="${requestScope.VIEWTYPE==3}"> selected</c:if>>View Unused Codes</option>
	        </select>
	        <br>
	        <button type="button" class="save-btn" style="margin-right: .5rem;" onclick="submitToDiv (form, 'resultframe');">View Codes</button>
	        <button type="button" class="save-btn" onclick="closeResultFrame()">Close</button>
	        <input type="hidden" name="ACTION" value="14" />
	        <input type="hidden" name="SCHEMEID" value="${requestScope.SCHEMEID}" />
	        <input type="hidden" name="NAME" value="${requestScope.NAME}" />
	        <input type="hidden" name="NEXT_PAGE" value="https://vendors-new.bmtmicro.com/products-discounts-schemes-codetable.jsp" />
	        <input type="hidden" name="ERROR_PAGE" value="https://vendors-new.bmtmicro.com/error-div.jsp" />
	      </form>
			</c:if>
		</c:if>
	</c:if>
	<c:if test="${requestScope.SCHEMETYPE != 0}">
		<p>This scheme does not require any codes.</p>
		<button type="button" class="save-btn" onclick="closeResultFrame()">Close</button>
	</c:if>
</div> <!-- end .transfer-section -->
