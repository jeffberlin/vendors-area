<%@ include file="/includes/core.jsp" %>
<div class="transfer-section">
	<!-- discounts_viewcodes.html -->
	<c:if test="${param.SCHEMETYPE == 0}">
		<!-- discounts_viewcodes_codesneeded.html -->
		<c:if test="${param.NUMCODES == 0}">
			<!-- discounts_viewcodes_nocodes.html -->
      <h5>View&nbsp;Discount&nbsp;Codes</h5>
      <p>No codes have been generated for ${param.NAME}.</p>
      <button type="button" class="light-btn" onclick="closeResultFrame()">Close</button>
		</c:if>
		<!-- discounts_viewcodes_codesneeded.html -->
		<c:if test="${param.NUMCODES != 0}">
			<!-- discounts_viewcodes_havecodes.html -->
			<c:if test="${param.MAXUSECOUNT == 0}">
				<!-- discounts_viewcodes_viewcode.html -->
	      <h5>View Discount Codes</h5>
	      <p>The discount code for ${param.NAME} is ${param,DISCOUNTCODE}.&nbsp;This code is good for any number of purchases.</p>
	      <c:if test="${param.EXPIRATIONDATE!=''}"><p>It expires on ${param.EXPIRATIONDATE}.</p></c:if>
	      <p>It has been used ${param.USECOUNT} times.</p>
	      <button type="button" class="light-btn" onclick="closeResultFrame()">Close</button>
			</c:if>
			<!-- discounts_viewcodes_havecodes.html -->
			<c:if test="${param.MAXUSECOUNT == 1}">
				<!-- discounts_viewcodes_singleuse.html -->
	      <form method="post" action="https://vendors-new.bmtmicro.com/servlets/Vendors.DiscountSchemes">
	        <h5>View Discount Codes for ${param.NAME}</h5>
	        <p>The number of uses is limited to one purchase per code.</p>
	        <p>This discount scheme has ${param.NUMCODES} codes of which ${param.USECOUNT} codes have been used.</p>
	        <select name="VIEWTYPE" style="margin-bottom: 1rem;">
	          <option value="0"<c:if test="${param.VIEWTYPE==0}"> selected</c:if>>View All Codes</option>
	          <option value="1"<c:if test="${param.VIEWTYPE==1}"> selected</c:if>>View Used Codes</option>
	          <option value="3"<c:if test="${param.VIEWTYPE==3}"> selected</c:if>>View Unused Codes</option>
	        </select>
	        <br>
	        <button type="submit" class="light-btn" style="margin-right: .5rem;" >View Codes</button>
					<button type="button" class="light-btn" onclick="closeResultFrame()">Close</button>
	        <input type="hidden" name="ACTION" value="14" />
	        <input type="hidden" name="SCHEMEID" value="${param.SCHEMEID}" />
	        <input type="hidden" name="NAME" value="${param.NAME}" />
	        <input type="hidden" name="NEXT_PAGE" value="https://vendors-new.bmtmicro.com/products-discounts-schemes-viewcodes.jsp" />
	        <input type="hidden" name="ERROR_PAGE" value="https://vendors-new.bmtmicro.com/error_frame.jsp" />
	      </form>
			</c:if>
			<!-- discounts_viewcodes_havecodes.html -->
			<c:if test="${param.MAXUSECOUNT != 0 && 1}">
				<!-- discounts_viewcodes_multiuse.html -->
	      <form method="post" action="https://vendors-new.bmtmicro.com/servlets/Vendors.DiscountSchemes">
	        <h5>View Discount Codes for ${param.NAME}</h5>
	        <p>The number of uses is limited to ${param.MAXUSECOUNT} purchases per code.</p>
	        <select name="VIEWTYPE" style="margin-bottom: 1rem;">
	          <option value="0"<c:if test="${param.VIEWTYPE==0}"> selected</c:if>>View All Codes</option>
	          <option value="1"<c:if test="${param.VIEWTYPE==1}"> selected</c:if>>View Completely Used Codes</option>
	          <option value="2"<c:if test="${param.VIEWTYPE==2}"> selected</c:if>>View Partially Used Codes</option>
	          <option value="3"<c:if test="${param.VIEWTYPE==3}"> selected</c:if>>View Unused Codes</option></select>
	        </select>
	        <br>
	        <button type="submit" class="light-btn">View Codes</button>
	        <button type="button" class="light-btn" onclick="closeResultFrame()">Close</button>
	        <input type="hidden" name="ACTION" value="14" />
	        <input type="hidden" name="SCHEMEID" value="${param.SCHEMEID}" />
	        <input type="hidden" name="NAME" value="${param.NAME}" />
	        <input type="hidden" name="NEXT_PAGE" value="https://vendors-new.bmtmicro.com/products-discounts-schemes-viewcodes.jsp" />
	        <input type="hidden" name="ERROR_PAGE" value="https://vendors-new.bmtmicro.com/error_frame.jsp" />
	      </form>
			</c:if>
		</c:if>
	</c:if>
	<!-- discounts_viewcodes.html -->
	<c:if test="${param.SCHEMETYPE != 0}">
		<!-- discounts_viewcodes_nocodesneeded.html -->
		<p>This scheme does not require any codes.</p>
		<button type="button" class="light-btn" onclick="closeResultFrame()">Close</button>
	</c:if>
</div> <!-- end .transfer-section -->
