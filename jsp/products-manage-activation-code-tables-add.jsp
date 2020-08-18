<%@ include file="/includes/core.jsp" %>
<div class="transfer-section">
  <form method="post" action="https://vendors-new.bmtmicro.com/servlets/Vendors.RegistrationKeys">
    <input type="hidden" name="ACTION" value="10" />
    <input type="hidden" name="KEYTABLEID" value="${param.KEYTABLEID}" />
    <input type="hidden" name="NEXT_PAGE" value="https://vendors-new.bmtmicro.com/products-manage-activation-code-tables.jsp" />
    <input type="hidden" name="ERROR_PAGE" value="https://vendors-new.bmtmicro.com/error-div.jsp" />
    <h5>Add&nbsp;Activation&nbsp;Code&nbsp;Table</h5>
    <span>
      <label>Table&nbsp;Name:</label>
      <input type="text" name="NAME" maxlength="80" style="margin-bottom: 1rem;" />
    </span>
    <br clear="all">
    <span>
      <label>Number&nbsp;of&nbsp;Key&nbsp;Parts:</label>
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
      <label>Separator&nbsp;Character:</label>
      <select name="SEPARATOR" style="margin-bottom: 1rem;">
        <option value=" "<c:if test="${param.SEPARATOR==' '}"> selected</c:if>>White Space ( )</option>
        <option value=","<c:if test="${param.SEPARATOR==','}"> selected</c:if>>Comma (,)</option>
        <option value=";"<c:if test="${param.SEPARATOR==';'}"> selected</c:if>>Semi-Colon (;)</option>
      </select>
      <span style="font-size: .8rem; color: #707070;">(only needed if you have keys with more than one part)</span>
    </span>
    <br clear="all">
    <span>
      <label>Low&nbsp;Key&nbsp;Warning&nbsp;Threshold:</label>
      <input type="text" name="LOWKEYTHRESHOLD" value="${param.LOWKEYTHRESHOLD}" style="margin-bottom: 1rem;" />
    </span>
    <br clear="all">
    <span>
      <label>Low&nbsp;Key&nbsp;Warning&nbsp;Email:</label>
      <input type="text" name="LOWKEYEMAIL" maxlength="80" value="${param.LOWKEYEMAIL}" style="margin-bottom: 1rem;" />
    </span>
    <br clear="all">
    <button type="button" class="save-btn" onclick="submitKeys (keytables);" style="margin-right: .5rem;">Save</button>
    <button type="button" class="save-btn" onclick="closeResultFrame()">Cancel</button>
  </form>
</div> <!-- end .transfer-section -->
