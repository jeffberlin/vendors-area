<%@ page pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ include file="/includes/core.jsp" %>
<div class="transfer-section">
  <form method="post" action="https://vendors.bmtmicro.com/servlets/Vendors.RegistrationKeys">
    <h5>Add&nbsp;Activation&nbsp;Codes&nbsp;to&nbsp;${requestScope.NAME}</h5>
    <span>
      <!-- <input type="checkbox" style="margin-bottom: 1rem;"<c:if test="${requestScope.REPLACEKEYS!=0}"> checked</c:if>/>&nbsp;Replace&nbsp;existing&nbsp;codes -->
      <input type="checkbox" style="margin-bottom: 1rem;" name="REPLACEKEYS" value="-1" />&nbsp;Replace&nbsp;existing&nbsp;codes
    </span>
    <br>
    <span>
      <label>Insert&nbsp;codes&nbsp;below:</label>
      <br clear="all">
      <textarea name="KEYLIST" rows="8" cols="70"></textarea>
    </span>
    <br>
    <div>
      <p>Each row contains one code.
        <c:if test="${requestScope.KEYPARTS==1}">
          (The codes are single-part. The separator character is not used).
        </c:if>
        <c:if test="${requestScope.KEYPARTS!=1}">
          Each code should have ${requestScope.KEYPARTS} parts. Each part should be separated by
          <c:choose>
            <c:when test="${requestScope.SEPARATOR==' '}"> a space character ('&nbsp;').</c:when>
            <c:when test="${requestScope.SEPARATOR==','}"> a comma (',').</c:when>
            <c:when test="${requestScope.SEPARATOR==';'}"> a semicolon (';').</c:when>
            <c:otherwise> the character '${requestScope.SEPARATOR}'.</c:otherwise>
          </c:choose>
        </c:if>
      </p>
    </div>
    <span>
      <button type="button" class="save-btn" onclick="submitNewKeysCodes (this.form);" style="margin-right: .5rem;">Add Codes</button>
      <button type="button" class="save-btn" onclick="closeResultFrame()">Cancel</button>
    </span>
    <input type="hidden" name="ACTION" value="13" />
    <input type="hidden" name="KEYPARTS" value="${requestScope.KEYPARTS}" />
    <input type="hidden" name="SEPARATOR" value="${requestScope.SEPARATOR}" />
    <input type="hidden" name="KEYTABLEID" value="${requestScope.KEYTABLEID}" />
    <input type="hidden" name="NEXT_PAGE" value="https://vendors.bmtmicro.com/products-manage-activation-code-tables-add-keys-progress.jsp" />
    <input type="hidden" name="ERROR_PAGE" value="https://vendors.bmtmicro.com/error-div.jsp" />
  </form>
  <div id="progress" style="display: none;"></div>
</div> <!-- end .transfer-section -->
