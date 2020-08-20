<%@ include file="/includes/core.jsp" %>
<div class="transfer-section">
  <form method="post" action="https://vendors-new.bmtmicro.com/servlets/Vendors.RegistrationKeys">
    <h5>Add&nbsp;Activation&nbsp;Codes&nbsp;to&nbsp;${param.NAME}</h5>
    <span>
      <input type="checkbox" name="REPLACEKEYS" value="-1"  style="margin-bottom: 1rem;"/>&nbsp;Replace&nbsp;existing&nbsp;codes
    </span>
    <br>
    <span>
      <label>Insert&nbsp;codes&nbsp;below:</label>
      <br clear="all">
      <textarea name="KEYLIST" rows="8" cols="70"></textarea>
    </span>
    <br>
    <div id="keyinfo"></div>
    <span>
      <button type="button" class="light-btn" onclick="submitNewKeysCodes (this.form);" style="margin-bottom: 1rem; margin-right: .5rem;">Add Codes</button>
      <button type="button" class="save-btn" onclick="closeResultFrame()">Cancel</button>
    </span>
    <input type="hidden" name="ACTION" value="13" />
    <input type="hidden" name="KEYPARTS" value="${param.KEYPARTS}" />
    <input type="hidden" name="SEPARATOR" value="${param.SEPARATOR}" />
    <input type="hidden" name="KEYTABLEID" value="${param.KEYTABLEID}" />
    <input type="hidden" name="NEXT_PAGE" value="https://vendors-new.bmtmicro.com/keytables_add_keys_progress.html" />
    <input type="hidden" name="ERROR_PAGE" value="https://vendors-new.bmtmicro.com/error-div.jsp" />
  </form>
  <div id="progress" style="display: none;">
    <h6>Add&nbsp;Activation&nbsp;Codes</h6>
    <p style="margin-bottom: .2rem;">Please wait, adding codes.</p>
    <p style="margin-bottom: .2rem;">This process can take several minutes depending on the number of codes you are inserting.</p>
    <p style="margin-bottom: .2rem;"><strong>No codes have been added so far.</strong></p>
    <p style="color: #FF0000;">Please do not exit this window until complete as this will stop the insertion process.</p>
  </div>
</div> <!-- end .transfer-section -->
