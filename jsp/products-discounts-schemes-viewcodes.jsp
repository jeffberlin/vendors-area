<%@ include file="/includes/core.jsp" %>

<!-- discounts_viewcodes.html -->
<c:if test="${param.SCHEMETYPE == 0}">

	<!-- discounts_viewcodes_codesneeded.html -->
	<c:if test="${param.NUMCODES == 0}">
		<!-- discounts_viewcodes_nocodes.html -->
		<div class="transfer-section">
      <h5>View&nbsp;Discount&nbsp;Codes</h5>
      <p>No codes have been generated for ${param.NAME}.</p>
      <button type="button" class="light-btn" onclick="closeResultFrame()">Close</button>
    </div> <!-- end .transfer-section -->
	</c:if>

	<!-- discounts_viewcodes_codesneeded.html -->
	<c:if test="${param.NUMCODES != 0}">

		<!-- discounts_viewcodes_havecodes.html -->
		<c:if test="${param.MAXUSECOUNT == 0}">
			<!-- discounts_viewcodes_viewcode.html -->
			<div class="transfer-section">
	      <h5>View Discount Codes</h5>
	      <p>The discount code for ${param.NAME} is ${param,DISCOUNTCODE}.&nbsp;This code is good for any number of purchases.</p>
	      ##SELECT(EXPIRATIONDATE,"","","<p>It expires on %%EXPIRATIONDATE%%.</p>")##
	      <p>It has been used ${param.USECOUNT} times.</p>
	      <button type="button" class="light-btn" onclick="closeResultFrame()">Close</button>
	    </div> <!-- end .transfer-section -->
		</c:if>

		<!-- discounts_viewcodes_havecodes.html -->
		<c:if test="${param.MAXUSECOUNT == 1}">
			<!-- discounts_viewcodes_singleuse.html -->
			<div class="transfer-section">
	      <form method="post" action="https://vendors-new.bmtmicro.com/servlets/Vendors.DiscountSchemes" target="resultframe">
	        <h5>View Discount Codes for ${param.NAME}</h5>
	        <p>The number of uses is limited to one purchase per code.</p>
	        <p>This discount scheme has ${param.NUMCODES} codes of which ${param.USECOUNT} codes have been used.</p>
	        <select name="VIEWTYPE" style="margin-bottom: 1rem;">
	          <option value="0">View All Codes</option>
	          <option value="1">View Used Codes</option>
	          <option value="3">View Unused Codes</option>
	        </select>
	        <br>
	        <button type="submit" class="light-btn" style="margin-right: .5rem;" >View Codes</button>
					<button type="button" class="light-btn" onclick="closeResultFrame()">Close</button>
	        <input type="hidden" name="ACTION" value="14" />
	        <input type="hidden" name="SCHEMEID" value="${param.SCHEMEID}" />
	        <input type="hidden" name="NAME" value="${param.NAME}" />
	        <input type="hidden" name="NEXT_PAGE" value="https://vendors-new.bmtmicro.com/discounts_viewcodes_viewcodes.html" />
	        <input type="hidden" name="ERROR_PAGE" value="https://vendors-new.bmtmicro.com/error_frame.jsp" />
	      </form>
	    </div> <!-- end .transfer-section -->
		</c:if>

		<!-- discounts_viewcodes_havecodes.html -->
		<c:if test="${param.MAXUSECOUNT != 0 && 1}">
			<!-- discounts_viewcodes_multiuse.html -->
			<div class="transfer-section">
	      <form method="post" action="https://vendors-new.bmtmicro.com/servlets/Vendors.DiscountSchemes" target="resultframe">
	        <h5>View Discount Codes for ${param.NAME}</h5>
	        <p>The number of uses is limited to ${param.MAXUSECOUNT} purchases per code.</p>
	        <select name="VIEWTYPE" style="margin-bottom: 1rem;">
	          <option value="0">View All Codes</option>
	          <option value="1">View Completely Used Codes</option>
	          <option value="2">View Partially Used Codes</option>
	          <option value="3">View Unused Codes</option></select>
	        </select>
	        <br>
	        <button type="submit" class="light-btn">View Codes</button>
	        <button type="button" class="light-btn" onclick="closeResultFrame()">Close</button>
	        <input type="hidden" name="ACTION" value="14" />
	        <input type="hidden" name="SCHEMEID" value="${param.SCHEMEID}" />
	        <input type="hidden" name="NAME" value="${param.NAME}" />
	        <input type="hidden" name="NEXT_PAGE" value="https://vendors-new.bmtmicro.com/discounts_viewcodes_viewcodes.html" />
	        <input type="hidden" name="ERROR_PAGE" value="https://vendors-new.bmtmicro.com/error_frame.jsp" />
	      </form>
	    </div> <!-- end .transfer-section -->
		</c:if>
	</c:if>

	<c:if test="${param.NUMCODES != 0}">
		<c:if test="${param.MAXUSECOUNT == 0}">
			<!-- discounts_viewcodes_viewcode.html -->
			<div class="transfer-section">
	      <h5>View Discount Codes</h5>
	      <p>The discount code for ${param.NAME} is ${param.DISCOUNTCODE}.&nbsp;This code is good for any number of purchases.</p>
	      ##SELECT(EXPIRATIONDATE,"","","<p>It expires on %%EXPIRATIONDATE%%.</p>")##
	      <p>It has been used ${param.USECOUNT} times.</p>
				<button type="button" class="light-btn" onclick="closeResultFrame()">Close</button>
	    </div> <!-- end .transfer-section -->
		</c:if>
	</c:if>

</c:if>

<!-- discounts_viewcodes.html -->
<c:if test="${param.SCHEMETYPE != 0}">
	<!-- discounts_viewcodes_nocodesneeded.html -->
</c:if>
