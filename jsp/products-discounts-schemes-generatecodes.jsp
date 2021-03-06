<%@ page pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ include file="/includes/core.jsp" %>
<div class="transfer-section">
  <c:if test="${requestScope.SCHEMETYPE == 0}">
    <c:if test="${requestScope.MAXUSECOUNT == 0}">
      <c:if test="${requestScope.NUMCODES == 0}">
        <h5>Generated Discount Code</h5>
        <p>The discount code for <strong>${requestScope.NAME}</strong> is <strong>${requestScope.DISCOUNTCODE}</strong>. This code is good for any number of purchases.</p>
        <c:if test="${requestScope.EXPIRATIONDATE!=''}"><p>It expires on ${requestScope.EXPIRATIONDATE}.</p></c:if>
        <form method="post" name="discform" action="https://vendors-new.bmtmicro.com/servlets/Vendors.DiscountSchemes">
          <p><strong>Would you like to customize this code?</strong></p>
          <span>
            <label>New discount code:&nbsp;</label>
            <input type="text" name="DISCOUNTCODE" value="" size="10" maxlength="12" style="margin-bottom: .5rem;" />
          </span>
          <br>
          <p style="font-size: .9rem; margin-bottom: 1.2rem;">(Leave blank to let the system generate a new code for you)</p>
          <div class="row">
            <button type="button" class="save-btn" style="margin-right: .5rem;" onclick="submitToDiv (form, 'resultframe');">Apply Custom Code</button>
            <button type="button" class="save-btn" onclick="closeResultFrame()">Cancel</button>
            <input type="hidden" name="SCHEMEID" value="${requestScope.SCHEMEID}" />
            <input type="hidden" name="ACTION" value="13" />
            <input type="hidden" name="GENCOUNT" value="1" />
            <input type="hidden" name="REPLACE" value="-1" />
            <input type="hidden" name="NEXT_PAGE" value="https://vendors-new.bmtmicro.com/products-discounts-schemes-codetable.jsp" />
            <input type="hidden" name="ERROR_PAGE" value="https://vendors-new.bmtmicro.com/error-div.jsp" />
            <input type="hidden" name="NAME" value="${requestScope.NAME}" />
          </div> <!-- end .row -->
        </form>
      </c:if>
      <c:if test="${requestScope.NUMCODES != 0}">
        <form method="post" action="https://vendors-new.bmtmicro.com/servlets/Vendors.DiscountSchemes">
          <h5>Generate&nbsp;Discount&nbsp;Codes&nbsp;for&nbsp;${requestScope.NAME}</h5>
          <p>The current code for this discount scheme is&nbsp;<strong>${requestScope.DISCOUNTCODE}</strong>.</p>
          <c:if test="${requestScope.EXPIRATIONDATE!=''}"><p>Date of expiration: ${requestScope.EXPIRATIONDATE}.</p></c:if>
          <p>Would you like to discontinue this code and generate a new code?</p>
          <c:if test="${requestScope.EXPIRATIONDAYS!=''}"><p>The new code you generate will expire in ${requestScope.EXPIRATIONDAYS} days from today.</p></c:if>
          <span>
            New&nbsp;discount&nbsp;code:&nbsp;
            <input type="text" name="DISCOUNTCODE" value="" size="10" maxlength="12" style="margin-bottom: .5rem;" />
          </span>
          <br>
          <p style="font-size: .9rem; margin-bottom: 1.2rem;">(Leave blank to let the system generate a new code for you)</p>
          <button type="button" class="save-btn" style="margin-right: .5rem;" onclick="submitToDiv (form, 'resultframe');">Generate New Code</button>
          <button type="button" class="save-btn" onclick="closeResultFrame()">Cancel</button>
          <input type="hidden" name="ACTION" value="13" />
          <input type="hidden" name="SCHEMEID" value="${requestScope.SCHEMEID}" />
          <input type="hidden" name="GENCOUNT" value="1" />
          <input type="hidden" name="REPLACE" value="-1" />
          <input type="hidden" name="NEXT_PAGE" value="https://vendors-new.bmtmicro.com/products-discounts-schemes-codetable.jsp" />
          <input type="hidden" name="ERROR_PAGE" value="https://vendors-new.bmtmicro.com/error-div.jsp" />
        </form>
      </c:if>
    </c:if>
    <c:if test="${requestScope.MAXUSECOUNT != 0}">
      <form method="post" action="https://vendors-new.bmtmicro.com/servlets/Vendors.DiscountSchemes">
        <h5>Generate Discount Codes for ${requestScope.NAME}</h5>
        <span>
          Number of codes to generate:&nbsp;
          <input type="text" name="GENCOUNT" value="" style="margin-bottom: 1rem;"/>
        </span>
        <br>
        <span>
          <input type="checkbox"<c:if test="${requestScope.REPLACE == -1}"> checked</c:if> style="margin-bottom: 1.2rem;" />&nbsp;&nbsp;Replace current codes (Discontinues current codes)
        </span>
        <br>
        <input type="hidden" name="ACTION" value="13" />
        <input type="hidden" name="SCHEMEID" value="${requestScope.SCHEMEID}" />
        <input type="hidden" name="NAME" value="${requestScope.NAME}" />
        <input type="hidden" name="NEXT_PAGE" value="https://vendors-new.bmtmicro.com/products-discounts-schemes-codetable.jsp" />
        <input type="hidden" name="ERROR_PAGE" value="https://vendors-new.bmtmicro.com/error-div.jsp" />
        <button type="button" class="save-btn" style="margin-right: .5rem;" onclick="submitToDiv (form, 'resultframe');">Generate&nbsp;Codes</button>
        <button type="button" class="save-btn" onclick="closeResultFrame()">Cancel</button>
      </form>
    </c:if>
  </c:if>
  <c:if test="${requestScope.SCHEMETYPE != 0}">
    <h5>${requestScope.NAME}</h5>
    <p>This scheme does not require any codes.</p>
    <button type="button" class="save-btn" onclick="closeResultFrame()">Cancel</button>
  </c:if>
</div> <!-- end .transfer-section -->
