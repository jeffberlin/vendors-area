<%@ page pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ include file="/includes/core.jsp" %>
<div class="transfer-section">
  <form method="post" action="https://vendors-new.bmtmicro.com/servlets/Vendors.RegistrationKeys">
    <input type="hidden" name="ACTION" value="11" />
    <input type="hidden" name="KEYTABLEID" value="${requestScope.KEYTABLEID}" />
    <input type="hidden" name="NAMELIST" value="${requestScope.NAMELIST}" />
    <input type="hidden" name="NEXT_PAGE" value="https://vendors-new.bmtmicro.com/products-manage-activation-code-tables.jsp" />
    <input type="hidden" name="ERROR_PAGE" value="https://vendors-new.bmtmicro.com/error.jsp" />
    <h5>Edit Activation Code Table - ${requestScope.NAME}</h5>
    <span>
      <label>Number of Key Parts:&nbsp;</label>
      <select name="KEYPARTS" style="margin-bottom: 1rem;">
        <option value="1"<c:if test="${requestScope.KEYPARTS==1}"> selected</c:if>>1</option>
        <option value="2"<c:if test="${requestScope.KEYPARTS==2}"> selected</c:if>>2</option>
        <option value="3"<c:if test="${requestScope.KEYPARTS==3}"> selected</c:if>>3</option>
        <option value="4"<c:if test="${requestScope.KEYPARTS==4}"> selected</c:if>>4</option>
        <option value="5"<c:if test="${requestScope.KEYPARTS==5}"> selected</c:if>>5</option>
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
        <option value=" "<c:if test="${requestScope.SEPARATOR==' '}"> selected</c:if>>White Space ( )</option>
        <option value=","<c:if test="${requestScope.SEPARATOR==','}"> selected</c:if>>Comma (,)</option>
        <option value=";"<c:if test="${requestScope.SEPARATOR==';'}"> selected</c:if>>Semi-Colon (;)</option>
      </select>
      <span style="font-size: .8rem;">(only needed if you have keys with more than one part)</span>
    </span>
    <br clear="all">
    <span>
      <label>Low Key Warning Threshold:&nbsp;</label>
      <input type="text" name="LOWKEYTHRESHOLD" value="${requestScope.LOWKEYTHRESHOLD}" style="margin-bottom: 1rem;" />
    </span>
    <br clear="all">
    <span>
      <label>Low Key Warning Email:&nbsp;</label>
      <input type="text" name="LOWKEYEMAIL" maxlength="80" value="${requestScope.LOWKEYEMAIL}" style="margin-bottom: 1rem;" />
    </span>
    <br>
    <button type="submit" class="save-btn" onclick="submitKeys (this.form);" style="margin-right: .5rem;">Save</button>
    <button type="button" class="save-btn" onclick="closeResultFrame()">Cancel</button>
  </form>
</div> <!-- end .transfer-section -->
