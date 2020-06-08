<html>
	<body>
		<form name="account" action = "https://vendors-new.bmtmicro.com/servlets/Vendors.Account" method="post">
			<input type="hidden" name = "ACTION" value = "1"/>
			<input type="hidden" name = "NEXT_PAGE" value = "https://vendors-new.bmtmicro.com/account-page.jsp"/>
			<input type="hidden" name = "ERROR_PAGE" value = "https://vendors-new.bmtmicro.com/error.jsp"/>
		</form>
	<body>                                                             
	<script language="javascript" type="text/javascript" src="https://vendors-new.bmtmicro.com/js/vendors.js"></script>
	<script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>
	<script>$(document).ready(function(){ submitToDoc (document.account); });</script>
</html>