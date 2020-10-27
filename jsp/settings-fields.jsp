<h5>Personalize&nbsp;Sales&nbsp;Details&nbsp;Fields</h5>
<div class="container-fluid" style="padding-left: 0; padding-right: 0;">
	<input type="hidden" name="NEXT_PAGE" value="${requestScope.NEXT_PAGE}" />
	<input type="hidden" name="ERROR_PAGE" value="${requestScope.ERROR_PAGE}" />
	<div id="fieldslist" class="row"></div>
	<span>
		<label>Add&nbsp;Field:&nbsp;</label>
		<button class="listadd" type="button" onclick="addField ();" style="border: none; background: none; padding: .1rem; vertical-align: middle;"><i class="fas fa-plus-circle"></i></button>
	</span>
	<!-- <br clear="all"> -->
	<div class="buttons">
		<button type="button" onclick="submitForm (form);" class="grey-btn">Save</button>
		<button type="button" onclick="initFields ('${requestScope.FIELDIDLIST}');" class="grey-btn">Reset</button>
		<button type="button" onclick="initFields ('${requestScope.DEFAULTFIELDIDLIST}');" class="grey-btn">Default</button>
		<button type="button" onclick="initFields ('');" class="grey-btn">Clear all fields</button>
	</div>
</div>
