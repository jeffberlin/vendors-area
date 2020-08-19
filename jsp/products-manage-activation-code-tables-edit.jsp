<%@ include file="/includes/core.jsp" %>
<div class="transfer-section">
  <form method="post" name="keytables" action="https://vendors-new.bmtmicro.com/servlets/Vendors.RegistrationKeys" target="_parent">
    <input type="hidden" name="ACTION" value="11" />
    <input type="hidden" name="KEYTABLEID" value="${param.KEYTABLEID}" />
    <input type="hidden" name="NEXT_PAGE" value="https://vendors-new.bmtmicro.com/keytablesstart.html" />
    <input type="hidden" name="ERROR_PAGE" value="https://vendors-new.bmtmicro.com/error.jsp" />
    <h5>Edit Activation Code Table - ${param.NAME}</h5>
    <span>
      <label>Number of Key Parts:&nbsp;</label>
      <select name="KEYPARTS" style="margin-bottom: 1rem;">
        <option value="1"<c:if test="${param.KEYPARTS==1}"> selected</c:if>>1</option>
        <option value="2"<c:if test="${param.KEYPARTS==2}"> selected</c:if>>2</option>
        <option value="3"<c:if test="${param.KEYPARTS==3}"> selected</c:if>>3</option>
        <option value="4"<c:if test="${param.KEYPARTS==4}"> selected</c:if>>4</option>
        <option value="5"<c:if test="${param.KEYPARTS==5}"> selected</c:if>>5</option>
        <!-- <option value="6">6</option>
        <option value="7">7</option>
        <option value="8">8</option>
        <option value="9">9</option> -->
      </select>
    </span>
    <br clear="all">
    <span>
      <label>Separator Character:&nbsp;</label>
      <select name="SEPARATOR" style="margin-bottom: 1rem;">
        <option value=" "<c:if test="${param.SEPARATOR==' '}"> selected</c:if>>White Space ( )</option>
        <option value=","<c:if test="${param.SEPARATOR==','}"> selected</c:if>>Comma (,)</option>
        <option value=";"<c:if test="${param.SEPARATOR==';'}"> selected</c:if>>Semi-Colon (;)</option>
      </select>
      <span style="font-size: .8rem;">(only needed if you have keys with more than one part)</span>
    </span>
    <br clear="all">
    <span>
      <label>Low Key Warning Threshold:&nbsp;</label>
      <input type="text" name="LOWKEYTHRESHOLD" value="${param.LOWKEYTHRESHOLD}" style="margin-bottom: 1rem;" />
    </span>
    <br clear="all">
    <span>
      <label>Low Key Warning Email:&nbsp;</label>
      <input type="text" name="LOWKEYEMAIL" maxlength="80" value="${param.LOWKEYEMAIL}" style="margin-bottom: 1rem;" />
    </span>
    <br>
    <button type="submit" class="save-btn" onclick="submitForm (this.form);" style="margin-right: .5rem;">Save</button>
    <button type="button" class="save-btn" onclick="closeResultFrame()">Cancel</button>
  </form>
</div> <!-- end .transfer-section -->
