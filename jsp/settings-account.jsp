<h5>Settings</h5>
<span>
	<label>Download&nbsp;Restrictions:&nbsp;</label>
	<select name="IPENFORCEMENT" style="margin-bottom: 1rem;">
		<option value='0'<c:if test="${requestScope.IPENFORCEMENT==0}"> selected</c:if>>No IP Restriction</option>
		<option value='1'<c:if test="${requestScope.IPENFORCEMENT==1}"> selected</c:if>>No Country Mismatch Allowed</option>
		<option value='2'<c:if test="${requestScope.IPENFORCEMENT==2}"> selected</c:if>>No Region Mismatch Allowed (Default)</option>
		<option value='3'<c:if test="${requestScope.IPENFORCEMENT==3}"> selected</c:if>>Only Subnet Mismatch Allowed</option>
		<option value='4'<c:if test="${requestScope.IPENFORCEMENT==4}"> selected</c:if>>No IP Mismatch Allowed</option>
	</select>
</span>
<br>
<span>
	<label>Fraud&nbsp;Check&nbsp;Level:&nbsp;</label>
	<select name="FRAUDCHECKLEVEL" style="margin-bottom: 1rem;">
		<c:if test="${requestScope.FRAUDCHECKLEVEL<=0}"><option value='0'<c:if test="${requestScope.FRAUDCHECKLEVEL==0}"> selected</c:if>>Weak</option></c:if>
		<c:if test="${requestScope.FRAUDCHECKLEVEL<=1}"><option value='1'<c:if test="${requestScope.FRAUDCHECKLEVEL==1}"> selected</c:if>>Loose</option></c:if>
		<c:if test="${requestScope.FRAUDCHECKLEVEL<=2}"><option value='2'<c:if test="${requestScope.FRAUDCHECKLEVEL==2}"> selected</c:if>>Strict</option></c:if>
		<c:if test="${requestScope.FRAUDCHECKLEVEL<=3}"><option value='3'<c:if test="${requestScope.FRAUDCHECKLEVEL==3}"> selected</c:if>>Review</option></c:if>
		<c:if test="${requestScope.FRAUDCHECKLEVEL<=4}"><option value='4'<c:if test="${requestScope.FRAUDCHECKLEVEL==4}"> selected</c:if>>Undetermined</option></c:if>
	</select>
</span>
<br clear="all">
<span>
	<input type="hidden" name="ALLOWANYAFFILIATE" value="${requestScope.ALLOWANYAFFILIATE}" />
	<input type="checkbox" style="margin-bottom: 1rem;"<c:if test="${requestScope.ALLOWANYAFFILIATE!=0}"> checked</c:if>/>&nbsp;Allow credit to unjoined affiliates
</span>
<br clear="all">
<span>
	<input type="hidden" name="VENDORMAIL" value="${requestScope.VENDOREMAIL}" />
	<input type="checkbox" style="margin-bottom: 1rem;"<c:if test="${requestScope.VENDOREMAIL!=0}"> checked</c:if>/>&nbsp;Receive updates from BMT
</span>
<br clear="all">
<span>
	<input type="hidden" name="FAILEDORDERNOTIFICATION" value="${requestScope.FAILEDORDERNOTIFICATION}" />
	<input type="checkbox" style="margin-bottom: 1rem;"<c:if test="${requestScope.FAILEDORDERNOTIFICATION!=0}"> checked</c:if>/>&nbsp;Receive Failed Order Emails
</span>
<br clear="all">
<span>
	<input type="hidden" name="CREDITNOTIFICATION" value="${requestScope.CREDITNOTIFICATION}" />
	<input type="checkbox" style="margin-bottom: 1rem;"<c:if test="${requestScope.CREDITNOTIFICATION!=0}"> checked</c:if>/>&nbsp;Receive Credit Order Notifications
</span>
<br clear="all">
<span>
	<input type="hidden" name="EXPIREDPWDNOTIFICATION" value="${requestScope.EXPIREDPWDNOTIFICATION}" />
	<input type="checkbox" style="margin-bottom: 1rem;"<c:if test="${requestScope.EXPIREDPWDNOTIFICATION!=0}"> checked</c:if>/>&nbsp;Receive Expired Password Emails
</span>
<br clear="all">
<span>
	<input type="hidden" name="USETWOTIERAUTHENTICATION" value="${requestScope.USETWOTIERAUTHENTICATION}" />
	<input type="checkbox" style="margin-bottom: 1rem;"<c:if test="${requestScope.USETWOTIERAUTHENTICATION!=0}"> checked</c:if>/>&nbsp;Use two factor authentication
</span>
<br clear="all">
<span>
	<input type="hidden" name="HTMLEMAIL" value="${requestScope.HTMLEMAIL}" />
	<input type="checkbox" style="margin-bottom: 1rem;"<c:if test="${requestScope.HTMLEMAIL!=0}"> checked</c:if>/>&nbsp;Send vendor Emails in HTML format
</span>
<br clear="all">
<button type="button" class="grey-btn" value="Save" onclick="submitForm (form);">Save</button>
