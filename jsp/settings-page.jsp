<%@ include file="/includes/core.jsp" %>
<form method="post" action="https://vendors-new.bmtmicro.com/servlets/Vendors.Account">
  <input type="hidden" name="VENDORID" value="${requestScope.VENDORID}" />
  <input type="hidden" name="ACTION" value="11" />
  <input type="hidden" name="NEXT_PAGE" value="${requestScope.NEXT_PAGE}" />
  <input type="hidden" name="ERROR_PAGE" value="${requestScope.ERROR_PAGE}" />
  <ul class="nav nav-tabs flex-nowrap" id="myTab" role="tablist">
    <li class="nav-item">
      <a class="nav-link active" id="account-tab" data-toggle="tab" href="#account" role="tab" aria-controls="account" aria-selected="true">Settings</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" id="cart-tab" data-toggle="tab" href="#cart" role="tab" aria-controls="cart" aria-selected="true">Shopping Cart Options</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" id="tracking-tab" data-toggle="tab" href="#tracking" role="tab" aria-controls="tracking" aria-selected="false">Tracking</a>
      </li>
    <li class="nav-item">
      <a class="nav-link" id="apitoken-tab" data-toggle="tab" href="#apitoken" role="tab" aria-controls="apitoken" aria-selected="false">API Token</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" id="fields-tab" data-toggle="tab" href="#fields" role="tab" aria-controls="fields" aria-selected="false">Sales Details Fields</a>
    </li>
  </ul>
  <div class="tab-box">
    <div class="tab-content" id="myTabContent">
      <div class="tab-pane fade active show" id="account" role="tabpanel" aria-labelledby="account-tab">
         <%@ include file="./settings-account.jsp" %>
      </div>
      <div class="tab-pane fade" id="cart" role="tabpanel" aria-labelledby="cart-tab">
         <%@ include file="./settings-cart.jsp" %>
      </div>
      <div class="tab-pane fade" id="tracking" role="tabpanel" aria-labelledby="tracking-tab">
         <%@ include file="./settings-tracking.jsp" %>
      </div>
      <div class="tab-pane fade" id="apitoken" role="tabpanel" aria-labelledby="apitoken-tab">
         <%@ include file="./settings-apitoken.jsp" %>
      </div>
      <div class="tab-pane fade" id="fields" role="tabpanel" aria-labelledby="fields-tab">
         <%@ include file="./settings-fields.jsp" %>
      </div>
    </div>
  </div>
</form>
<script>
    initFields ('${requestScope.FIELDIDLIST}','${requestScope.FIELDNAMELIST}');
    $('input[type=checkbox]').change(function(){ $(this).prev('input[type=hidden]').val (this.checked ? -1 : 0); });
</script>
