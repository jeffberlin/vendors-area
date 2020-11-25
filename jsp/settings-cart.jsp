<%@ page pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<h5>Shopping&nbsp;Cart&nbsp;Options</h5>
<p style="margin-bottom: .2rem;">Unchecking the boxes will hide these options in your shopping cart.</p>
<p class="shrinkText"><em>Note that the product settings have additional shopping cart options.</em></p>
<span>
	<input type="hidden" name="SHOWCOMMENTSFIELD" value="${requestScope.SHOWCOMMENTSFIELD}" />
	<input type="checkbox" style="margin-bottom: 1rem;"<c:if test="${requestScope.SHOWCOMMENTSFIELD!=0}"> checked</c:if>/>&nbsp;Show Comments field
</span>
<br clear="all">
<span>
	<input type="hidden" name="SHOWCOMPANYFIELD" value="${requestScope.SHOWCOMPANYFIELD}" />
	<input type="checkbox" style="margin-bottom: 1rem;"<c:if test="${requestScope.SHOWCOMPANYFIELD!=0}"> checked</c:if>/>&nbsp;Show Company field
</span>
<br clear="all">
<span>
	<input type="hidden" name="SHOWPHONEFIELD" value="${requestScope.SHOWPHONEFIELD}" />
	<input type="checkbox" style="margin-bottom: 1rem;"<c:if test="${requestScope.SHOWPHONEFIELD!=0}"> checked</c:if><c:if test="${requestScope.DISABLE_SHOWPHONEFIELD==-1}"> disabled</c:if>/>&nbsp;Show Phone field
	<c:if test="${requestScope.DISABLE_SHOWPHONEFIELD==-1}"><br /><em>This setting cannot be changed at this time. The Phone Field must be displayed for new vendors and vendors under strong fraud check level.</em></c:if>
</span>
<br clear="all">
<span>
	<input type="hidden" name="SHOWPONUMBERFIELD" value="${requestScope.SHOWPONUMBERFIELD}" />
	<input type="checkbox" style="margin-bottom: 1rem;"<c:if test="${requestScope.SHOWPONUMBERFIELD!=0}"> checked</c:if><c:if test="${requestScope.DISABLE_SHOWPONUMBERFIELD==-1}"> disabled</c:if>/>&nbsp;Show Purchase Order Number field
	<c:if test="${requestScope.DISABLE_SHOWPONUMBERFIELD==-1}"><br /><em>Due to the vendor category on your account, this option is automatically disabled. The PO Number field will not be displayed.</em></c:if>
</span>
<br clear="all">
<span>
	<input type="hidden" name="SHOWLOGINSECTION" value="${requestScope.SHOWLOGINSECTION}" />
	<input type="checkbox" style="margin-bottom: 1rem;"<c:if test="${requestScope.SHOWLOGINSECTION!=0}"> checked</c:if>/>&nbsp;Show Customer Login Section
</span>
<br clear="all">
<span>
	<input type="hidden" name="SHOWSIDEBAR" value="${requestScope.SHOWSIDEBAR}" />
	<input type="checkbox" style="margin-bottom: 1rem;"<c:if test="${requestScope.SHOWSIDEBAR!=0}"> checked</c:if>/>&nbsp;Show Informational Side Bar
</span>
<br clear="all">
<span>
	<input type="hidden" name="SHOWGIFTOPTION" value="${requestScope.SHOWGIFTOPTION}" />
	<input type="checkbox" style="margin-bottom: .2rem;"<c:if test="${requestScope.SHOWGIFTOPTION!=0}"> checked</c:if>/>&nbsp;Show Gift Option
	<p class="shrinkText"><em>Checking this box will let the customer place an order for multiple recipients with different registration names and/or e-mail addresses</em></p>
</span>
<span>
	<input type="hidden" name="SHOWEMAILCONSENT" value="${requestScope.SHOWEMAILCONSENT}" />
	<input type="checkbox" style="margin-bottom: .2rem;"<c:if test="${requestScope.SHOWEMAILCONSENT!=0}"> checked</c:if>/>&nbsp;Show EMail Consent Checkbox
	<p class="shrinkText"><em>Checking this box will let the user opt in/out of receiving special offerings and updates related to the item(s) purchased. The response can be found in the sales details report.</em></p>
</span>
<button type="button" class="grey-btn" value="Save" onclick="submitForm (form);">Save</button>
