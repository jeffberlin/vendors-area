<!DOCTYPE html>
<html>
  <body>
    <form name="account" method=post action="https://vendors-new.bmtmicro.com/servlets/Vendors.Account">
      <input type="hidden" name="ACTION" value="1">
      <input type="hidden" name="NEXT_PAGE" value="https://vendors-new.bmtmicro.com/new-vendor-submission-form.jsp" />
      <input type="hidden" name="ERROR_PAGE" value="https://vendors-new.bmtmicro.com/new-vendor-error.jsp" />
    </form>
  </body>
  <script src="https://vendors-new.bmtmicro.com/js/vendors.js"></script>
  <script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>
  <script>$(document).ready(function(){ document.account.submit (); });</script>
</html>
