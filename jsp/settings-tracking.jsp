<input type="hidden" name="VENDORID"   value="${param.VENDORID}" />
<input type="hidden" name="ACTION"     value="11" />
<input type="hidden" name="NEXT_PAGE"  value="${param.NEXT_PAGE}" />
<input type="hidden" name="ERROR_PAGE" value="${param.ERROR_PAGE}" />
<h5>Tracking</h5>
<p>Tracking IDs entered here will automatically add tracking code to your shopping cart.</p>
<span>
	<label>BING Ads ID (UET tag - typically 8 digits):</label>
	<br>
	<input name="BINGADSID" maxlength="16" value="${param.BINGADSID}" size="20" style="margin-bottom: 1rem;" />
</span>
<br clear="all">
<span>
	<label>Facebook Pixel ID (Typically 16 digits):</label>
	<br>
	<input name="FACEBOOKPIXELID" maxlength="16" value="${param.FACEBOOKPIXELID}" size="30" style="margin-bottom: 1rem;" />
</span>
<br clear="all">
<span>
	<label>Google AdWords Conversion ID (Typically starts with 'AW-'):</label>
	<br>
	<input name="GOOGLEADWORDSID" maxlength="40" value="${param.GOOGLEADWORDSID}" size="30" style="margin-bottom: 1rem;" />
</span>
<br clear="all">
<span>
	<label>Google Analytics Tracking ID (Typically starts with 'UA-'):</label>
	<br>
	<input name="GOOGLEANALYTICSID" maxlength="16" value="${param.GOOGLEANALYTICSID}" size="30" style="margin-bottom: 1rem;" />
</span>
<br clear="all">
<button type="button" class="grey-btn" value="Save" onclick="submitForm (form);">Save</button>