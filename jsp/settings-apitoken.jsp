<h5>API&nbsp;Token</h5>
<p>Token for XML connection.</p>
<span>
	<label>API&nbsp;token:&nbsp;</label>
	<c:if test="${param.APITOKEN==''}"><button type="button" class="grey-btn" value="Generate API" onclick="submitForm (form);">Generate API Token</button></c:if>
	<c:if test="${param.APITOKEN!=''}">${param.APITOKEN}</c:if>
</span>