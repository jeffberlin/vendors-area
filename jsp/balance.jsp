<div id="vendor-balance-result">
  <form name="vendorbalance" action="https://vendors-new.bmtmicro.com/servlets/Vendors.Balance" method="post">
    <input type="hidden" name="NEXT_PAGE" value="https://vendors-new.bmtmicro.com/balance-result.jsp" />
    <input type="hidden" name="ERROR_PAGE" value="https://vendors-new.bmtmicro.com/error-div.html" />
  </form>
</div>
<script language="javascript" type="text/javascript" src="https://vendors-new.bmtmicro.com/js/vendors.js"></script>
<script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>
<script>$(document).ready(function(){ submitToDiv (document.vendorbalance, 'vendor-balance-result'); });</script>
