<%@ page pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ include file="/includes/core.jsp" %>
<h4>Account</h4>
<ul class="nav nav-tabs" id="myTab" role="tablist">
  <li class="nav-item">
    <a class="nav-link active" id="account-tab" data-toggle="tab" href="#accountTab" role="tab" aria-controls="account information" aria-selected="true">
      Account Information
    </a>
  </li>
  <li class="nav-item">
    <a class="nav-link" id="payment-tab" data-toggle="tab" href="#paymentTab" role="tab" aria-controls="payment method" aria-selected="true">
      Payment Method
    </a>
  </li>
  <li class="nav-item">
    <a class="nav-link" id="public-tab" data-toggle="tab" href="#publicTab" role="tab" aria-controls="public information" aria-selected="true">
      Public Information
    </a>
  </li>
</ul>
<div class="tab-box">
  <form method="post" action="https://vendors-new.bmtmicro.com/servlets/Vendors.Account">
    <input type="hidden" name="ACTION" value="11" />
    <input type="hidden" name="NEXT_PAGE" value="${requestScope.NEXT_PAGE}" />
    <input type="hidden" name="ERROR_PAGE" value="${requestScope.ERROR_PAGE}" />
    <div class="tab-content" id="myTabContent">
      <div class="tab-pane fade show active" id="accountTab" role="tabpanel" aria-labelledby="account-tab">
        <h5>Account&nbsp;Information</h5>
        <p>Information provided will be displayed to BMT Micro only.</p>
        <div class="row shrinkText">
          <div class="col-4" style="padding-right: 0; font-size: .9rem;">
            <span>
              <input type="hidden" name="VENDORID" value="${requestScope.VENDORID}" />
              <p style="margin-bottom: .2rem;">My vendor ID: ${requestScope.VENDORID}</p>
              <p style="margin-bottom: .2rem;"><strong>${requestScope.COMPANY}</strong></p>
              <p style="margin-bottom: .2rem;">${requestScope.NAME}</p>
              <p style="margin-bottom: .2rem;">${requestScope.ADDRESS1}</p>
              <p style="margin-bottom: .2rem;">${requestScope.ADDRESS2}</p>
              <p style="margin-bottom: .2rem;">${requestScope.CITY}, ${requestScope.STATE}&nbsp;${requestScope.ZIP}</p>
              <p>${requestScope.COUNTRYNAME}</p>
              <p><a href="mailto:vendors@bmtmicro.com">Email changes to BMT Micro</a></p>
            </span>
          </div>
          <div class="col-4" style="padding: 0;">
            <span>
              <label>Primary&nbsp;Email:&nbsp;</label>
              <input id="EMAIL" name="EMAIL" value="${requestScope.EMAIL}" maxlength="50" size="30" style="margin-bottom: 1rem;" />
            </span>
            <br clear="all">
            <span>
              <label>Secondary&nbsp;Email:&nbsp;</label>
              <input id="EMAIL2" name="EMAIL2" value="${requestScope.EMAIL2}" maxlength="50" size="30" style="margin-bottom: 1rem;" />
            </span>
            <br clear="all">
            <span>
              <label>Order&nbsp;Notification&nbsp;Email:&nbsp;</label>
              <input id="NOTIFICATIONEMAILS" name="NOTIFICATIONEMAILS" value="${requestScope.NOTIFICATIONEMAILS}" maxlength="200" size="30" style="margin-bottom: 1rem;" />
            </span>
            <br clear="all">
            <span>
              <label>File&nbsp;sharing&nbsp;password:&nbsp;</label>
              <input id="FILESHAREPASSWORD" name="FILESHAREPASSWORD" value="${requestScope.FILESHAREPASSWORD}" maxlength="16" size="30" style="margin-bottom: 1rem;" />
            </span>
          </div>
        </div> <!-- end .row -->
        <div class="controlbuttons">
          <button type="button" class="grey-btn" onclick="submitForm (form);">Save</button>
          <button type="reset" value="Reset" class="grey-btn">Reset</button>
        </div>
      </div> <!-- end .tab-pane -->
      <div class="tab-pane fade" id="paymentTab" role="tabpanel" aria-labelledby="payment-tab">
        <h5>Payment&nbsp;Method</h5>
        <p>Chose the payment threshold and frequency you wish to use.</p>
        <c:choose>
          <c:when test = "${requestScope.MULTICURRENCY == -1}">
            <span>
              <label>Minimum threshold:</label>
              <input id="PAYOUTMINAMT" name="PAYOUTMINAMT_USD" value="${requestScope.PAYOUTMINAMT_USD}" maxlength="10" onKeyPress="return (numbersonly (this, event, true))" />&nbsp;USD
            </span>
            <span>
              <label>Frequency:</label>
              <select type="text" name="PAYOUTFREQUENCY_USD" value="${requestScope.PAYOUTFREQUENCY_USD}" onmousewheel="return false;">
                <c:if test = "${requestScope.PAYOUTFREQUENCY_USD==0}"><option value='0' selected>Twice a month</option></c:if>
                <option value="1"<c:if test="${requestScope.PAYOUTFREQUENCY_USD==1}"> selected</c:if>>Monthly</option>
                <option value="2"<c:if test="${requestScope.PAYOUTFREQUENCY_USD==2}"> selected</c:if>>Every 2 Months</option>
                <option value="3"<c:if test="${requestScope.PAYOUTFREQUENCY_USD==3}"> selected</c:if>>Quarterly</option>
                <option value="4"<c:if test="${requestScope.PAYOUTFREQUENCY_USD==4}"> selected</c:if>>Triannually</option>
                <option value="6"<c:if test="${requestScope.PAYOUTFREQUENCY_USD==6}"> selected</c:if>>Biannually</option>
                <option value="12"<c:if test="${requestScope.PAYOUTFREQUENCY_USD==12}"> selected</c:if>>Yearly</option>
              </select>
            </span>
            <br clear="all">
            <span>
              <input id="PAYOUTMINAMT" name="PAYOUTMINAMT_EUR" value="${requestScope.PAYOUTMINAMT_EUR}" maxlength="10" onKeyPress="return (numbersonly (this, event, true))" />&nbsp;EUR
            </span>
            <span>
              <select type="text" name="PAYOUTFREQUENCY_EUR" value="${requestScope.PAYOUTFREQUENCY_EUR}" onmousewheel="return false;">
                <c:if test = "${requestScope.PAYOUTFREQUENCY_EUR==0}"><option value='0' selected>Twice a month</option></c:if>
                <option value="1"<c:if test="${requestScope.PAYOUTFREQUENCY_EUR==1}"> selected</c:if>>Monthly</option>
                <option value="2"<c:if test="${requestScope.PAYOUTFREQUENCY_EUR==2}"> selected</c:if>>Every 2 Months</option>
                <option value="3"<c:if test="${requestScope.PAYOUTFREQUENCY_EUR==3}"> selected</c:if>>Quarterly</option>
                <option value="4"<c:if test="${requestScope.PAYOUTFREQUENCY_EUR==4}"> selected</c:if>>Triannually</option>
                <option value="6"<c:if test="${requestScope.PAYOUTFREQUENCY_EUR==6}"> selected</c:if>>Biannually</option>
                <option value="12"<c:if test="${requestScope.PAYOUTFREQUENCY_EUR==12}"> selected</c:if>>Yearly</option>
              </select>
            </span>
            <br clear="all">
            <span>
              <input id="PAYOUTMINAMT" name="PAYOUTMINAMT_GBP" value="${requestScope.PAYOUTMINAMT_GBP}" maxlength="10" onKeyPress="return (numbersonly (this, event, true))" />&nbsp;GBP
            </span>
            <span>
              <select type="text" name="PAYOUTFREQUENCY_GBP" value="${requestScope.PAYOUTFREQUENCY_GBP}" onmousewheel="return false;">
                <c:if test = "${requestScope.PAYOUTFREQUENCY_GBP==0}">
                  <option value='0' selected>Twice a month</option>
                </c:if>
                <option value="1"<c:if test="${requestScope.PAYOUTFREQUENCY_GBP==1}"> selected</c:if>>Monthly</option>
                <option value="2"<c:if test="${requestScope.PAYOUTFREQUENCY_GBP==2}"> selected</c:if>>Every 2 Months</option>
                <option value="3"<c:if test="${requestScope.PAYOUTFREQUENCY_GBP==3}"> selected</c:if>>Quarterly</option>
                <option value="4"<c:if test="${requestScope.PAYOUTFREQUENCY_GBP==4}"> selected</c:if>>Triannually</option>
                <option value="6"<c:if test="${requestScope.PAYOUTFREQUENCY_GBP==6}"> selected</c:if>>Biannually</option>
                <option value="12"<c:if test="${requestScope.PAYOUTFREQUENCY_GBP==12}"> selected</c:if>>Yearly</option>
              </select>
            </span>
          </c:when>
          <c:otherwise>
            <span>
              <label>Minimum threshold:</label>
              <input id="PAYOUTMINAMT" name="PAYOUTMINAMT" value="${requestScope.PAYOUTMINAMT}" maxlength="10" onKeyPress="return (numbersonly (this, event, true))" />&nbsp;${requestScope.CURRENCY}
            </span>
            <span>
              <label>Frequency:</label>
              <select type="text" name="PAYOUTFREQUENCY" value="${requestScope.PAYOUTFREQUENCY}" onmousewheel="return false;">
                <c:if test = "${requestScope.PAYOUTFREQUENCY==0}">
                  <option value='0' selected>Twice a month</option>
                </c:if>
                <option value="1"<c:if test="${requestScope.PAYOUTFREQUENCY==1}"> selected</c:if>>Monthly</option>
                <option value="2"<c:if test="${requestScope.PAYOUTFREQUENCY==2}"> selected</c:if>>Every 2 Months</option>
                <option value="3"<c:if test="${requestScope.PAYOUTFREQUENCY==3}"> selected</c:if>>Quarterly</option>
                <option value="4"<c:if test="${requestScope.PAYOUTFREQUENCY==4}"> selected</c:if>>Triannually</option>
                <option value="6"<c:if test="${requestScope.PAYOUTFREQUENCY==6}"> selected</c:if>>Biannually</option>
                <option value="12"<c:if test="${requestScope.PAYOUTFREQUENCY==12}"> selected</c:if>>Yearly</option>
              </select>
            </span>
          </c:otherwise>
        </c:choose>
        <br clear="all">
        <span>
          <p class="shrinkText" style="margin-bottom: .3rem;">You will be paid in
            <c:choose>
              <c:when test = "${requestScope.MULTICURRENCY == -1}">multiple currencies</c:when>
              <c:otherwise>${requestScope.CURRENCY}</c:otherwise>
            </c:choose>
            via:
          </p>
          <div id="payoutmethod" class="shrinkText" style="padding-left: 15px; margin-bottom: 1rem;">
            <c:choose>
              <c:when test = "${requestScope.MULTICURRENCY == -1}">
                USD:
                <c:choose>
                  <c:when test = "${requestScope.PAYOUTMETHOD_USD == 0}">No payment due yet.</c:when>
                  <c:when test = "${requestScope.PAYOUTMETHOD_USD == 1}">USD Check</c:when>
                  <c:when test = "${requestScope.PAYOUTMETHOD_USD == 2}">ACH Direct Deposit</c:when>
                  <c:when test = "${requestScope.PAYOUTMETHOD_USD == 3}">PayPal to ${requestScope.PAYOUTEMAIL}</c:when>
                  <c:when test = "${requestScope.PAYOUTMETHOD_USD == 4}">Wire Transfer - Deutsche Bank</c:when>
                  <c:when test = "${requestScope.PAYOUTMETHOD_USD == 5}">Wire Transfer - JP Morgan</c:when>
                  <c:when test = "${requestScope.PAYOUTMETHOD_USD == 6}">Wire Transfer - First Federal</c:when>
                  <c:when test = "${requestScope.PAYOUTMETHOD_USD == 7}">PayPal eCheck</c:when>
                  <c:when test = "${requestScope.PAYOUTMETHOD_USD == 8}">Other - Special payment arrangement</c:when>
                  <c:when test = "${requestScope.PAYOUTMETHOD_USD == 9}">Payoneer pre-paid Mastercard</c:when>
                  <c:when test = "${requestScope.PAYOUTMETHOD_USD == 10}">Wire Transfer - Suntrust</c:when>
                  <c:when test = "${requestScope.PAYOUTMETHOD_USD == 11}">EUR Wire Transfer - Commerzbank</c:when>
                  <c:when test = "${requestScope.PAYOUTMETHOD_USD == 12}">PayPal (EUR)</c:when>
                  <c:when test = "${requestScope.PAYOUTMETHOD_USD == 13}">PayPal (GBP)</c:when>
                  <c:otherwise>Unknown</c:otherwise>
                </c:choose>
                <br />
                EUR:
                <c:choose>
                  <c:when test = "${requestScope.PAYOUTMETHOD_EUR == 0}">No payment due yet.</c:when>
                  <c:when test = "${requestScope.PAYOUTMETHOD_EUR == 1}">EUR Check</c:when>
                  <c:when test = "${requestScope.PAYOUTMETHOD_EUR == 2}">ACH Direct Deposit</c:when>
                  <c:when test = "${requestScope.PAYOUTMETHOD_EUR == 3}">PayPal to ${requestScope.PAYOUTEMAIL}</c:when>
                  <c:when test = "${requestScope.PAYOUTMETHOD_EUR == 4}">Wire Transfer - Deutsche Bank</c:when>
                  <c:when test = "${requestScope.PAYOUTMETHOD_EUR == 5}">Wire Transfer - JP Morgan</c:when>
                  <c:when test = "${requestScope.PAYOUTMETHOD_EUR == 6}">Wire Transfer - First Federal</c:when>
                  <c:when test = "${requestScope.PAYOUTMETHOD_EUR == 7}">PayPal eCheck</c:when>
                  <c:when test = "${requestScope.PAYOUTMETHOD_EUR == 8}">Other - Special payment arrangement</c:when>
                  <c:when test = "${requestScope.PAYOUTMETHOD_EUR == 9}">Payoneer pre-paid Mastercard</c:when>
                  <c:when test = "${requestScope.PAYOUTMETHOD_EUR == 10}">Wire Transfer - Suntrust</c:when>
                  <c:when test = "${requestScope.PAYOUTMETHOD_EUR == 11}">EUR Wire Transfer - Commerzbank</c:when>
                  <c:when test = "${requestScope.PAYOUTMETHOD_EUR == 12}">PayPal (EUR)</c:when>
                  <c:when test = "${requestScope.PAYOUTMETHOD_EUR == 13}">PayPal (GBP)</c:when>
                  <c:otherwise>Unknown</c:otherwise>
                </c:choose>
                <br />
                GBP:
                <c:choose>
                  <c:when test = "${requestScope.PAYOUTMETHOD_GBP == 0}">No payment due yet.</c:when>
                  <c:when test = "${requestScope.PAYOUTMETHOD_GBP == 1}">GBP Check</c:when>
                  <c:when test = "${requestScope.PAYOUTMETHOD_GBP == 2}">ACH Direct Deposit</c:when>
                  <c:when test = "${requestScope.PAYOUTMETHOD_GBP == 3}">PayPal to ${requestScope.PAYOUTEMAIL}</c:when>
                  <c:when test = "${requestScope.PAYOUTMETHOD_GBP == 4}">Wire Transfer - Deutsche Bank</c:when>
                  <c:when test = "${requestScope.PAYOUTMETHOD_GBP == 5}">Wire Transfer - JP Morgan</c:when>
                  <c:when test = "${requestScope.PAYOUTMETHOD_GBP == 6}">Wire Transfer - First Federal</c:when>
                  <c:when test = "${requestScope.PAYOUTMETHOD_GBP == 7}">PayPal eCheck</c:when>
                  <c:when test = "${requestScope.PAYOUTMETHOD_GBP == 8}">Other - Special payment arrangement</c:when>
                  <c:when test = "${requestScope.PAYOUTMETHOD_GBP == 9}">Payoneer pre-paid Mastercard</c:when>
                  <c:when test = "${requestScope.PAYOUTMETHOD_GBP == 10}">Wire Transfer - Suntrust</c:when>
                  <c:when test = "${requestScope.PAYOUTMETHOD_GBP == 11}">EUR Wire Transfer - Commerzbank</c:when>
                  <c:when test = "${requestScope.PAYOUTMETHOD_GBP == 12}">PayPal (EUR)</c:when>
                  <c:when test = "${requestScope.PAYOUTMETHOD_GBP == 13}">PayPal (GBP)</c:when>
                  <c:otherwise>Unknown</c:otherwise>
                </c:choose>
                <br />
              </c:when>
              <c:otherwise>
                <c:choose>
                  <c:when test = "${requestScope.PAYOUTMETHOD_USD == 0}">No payment due yet.</c:when>
                  <c:when test = "${requestScope.PAYOUTMETHOD_USD == 1}">USD Check</c:when>
                  <c:when test = "${requestScope.PAYOUTMETHOD_USD == 2}">ACH Direct Deposit</c:when>
                  <c:when test = "${requestScope.PAYOUTMETHOD_USD == 3}">PayPal to ${requestScope.PAYOUTEMAIL}</c:when>
                  <c:when test = "${requestScope.PAYOUTMETHOD_USD == 4}">Wire Transfer - Deutsche Bank</c:when>
                  <c:when test = "${requestScope.PAYOUTMETHOD_USD == 5}">Wire Transfer - JP Morgan</c:when>
                  <c:when test = "${requestScope.PAYOUTMETHOD_USD == 6}">Wire Transfer - First Federal</c:when>
                  <c:when test = "${requestScope.PAYOUTMETHOD_USD == 7}">PayPal eCheck</c:when>
                  <c:when test = "${requestScope.PAYOUTMETHOD_USD == 8}">Other - Special payment arrangement</c:when>
                  <c:when test = "${requestScope.PAYOUTMETHOD_USD == 9}">Payoneer pre-paid Mastercard</c:when>
                  <c:when test = "${requestScope.PAYOUTMETHOD_USD == 10}">Wire Transfer - Suntrust</c:when>
                  <c:when test = "${requestScope.PAYOUTMETHOD_USD == 11}">EUR Wire Transfer - Commerzbank</c:when>
                  <c:when test = "${requestScope.PAYOUTMETHOD_USD == 12}">PayPal (EUR)</c:when>
                  <c:when test = "${requestScope.PAYOUTMETHOD_USD == 13}">PayPal (GBP)</c:when>
                  <c:otherwise>Unknown</c:otherwise>
                </c:choose>
              </c:otherwise>
            </c:choose>
          </div>
        </span>
        <span class="shrinkText">
          <p style="margin-bottom: .3rem;">Charges appear on customers credit card as:</p>
          <XMP style="padding-left: 15px;">${requestScope.FULLBILLINGDESCRIPTOR}</XMP>
        </span>
        <div class="controlbuttons" style="margin-bottom: 1rem;">
          <button type="button" class="grey-btn" onclick="submitForm (form);">Save</button>
          <button type="reset" value="Reset" class="grey-btn">Reset</button>
        </div>
      </div> <!-- end .tab-pane -->
      <div class="tab-pane fade" id="publicTab" role="tabpanel" aria-labelledby="public-tab">
        <h5>Public&nbsp;Information</h5>
        <p>Information provided will be displayed to customers.</p>
        <span>
          <label>Support&nbsp;Email:&nbsp;</label>
          <input id="SUPPORTEMAIL" name="SUPPORTEMAIL" value="${requestScope.SUPPORTEMAIL}" maxlength="50" size="30" style="margin-bottom: 1rem;" />
        </span>
        <br>
        <span>
          <label>Support&nbsp;URL:&nbsp;</label>
          <input id="SUPPORTURL" name="SUPPORTURL" value="${requestScope.SUPPORTURL}" maxlength="100" size="50" style="margin-bottom: 1rem;" />
        </span>
        <br>
        <span>
          <label>Website:&nbsp;</label>
          <input id="WEB" name="WEB" value="${requestScope.WEB}" maxlength="60" size="50" style="margin-bottom: 1rem;" />
        </span>
        <br>
        <span>
          <label>Phone:&nbsp;</label>
          <input id="PHONE" name="PHONE" value="${requestScope.PHONE}" maxlength="50" size="15" style="margin-bottom: 1rem;" />
        </span>
        <br>
        <span>
          <label>Fax:&nbsp;</label>
          <input id="FAX" name="FAX" value="${requestScope.FAX}" maxlength="50" size="15" style="margin-bottom: 1rem;" />
        </span>
        <p class="shrinkText"<em>For security reasons the payment information cannot be changed on-line. Please send any updates regarding company name, contact name, payment address, payment frequency, payment currency and charge description to <a href="mailto:vendors@bmtmicro.com">vendors@bmtmicro.com</a>.</em></p>
        <p class="shrinkText"><em>Order related settings can be managed under the Settings link in the dropdown menu associated with your name on the left.</em></p>
        <div class="controlbuttons">
          <button type="button" class="grey-btn" onclick="submitForm (form);">Save</button>
          <button type="reset" value="Reset" class="grey-btn">Reset</button>
        </div>
      </div> <!-- end .tab-pane -->
    </div> <!-- end .tab-content -->
  </form>
</div> <!-- end .content-box -->
