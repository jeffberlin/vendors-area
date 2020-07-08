<!DOCTYPE html>
<html>
  <body>
    <form name="contact" method="post" action="https://vendors-new.bmtmicro.com/servlets/Vendors.Account">
      <input type="hidden" name="NEXT_PAGE" value =  "https://vendors-new.bmtmicro.com/contact-start.jsp"/>
      <input type="hidden" name="ERROR_PAGE" value = "https://vendors-new.bmtmicro.com/error.jsp"/>
    </form>
  </body>
  <script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>
  <script>$(document).ready(function(){ document.contact.submit (); });</script>
</html>
