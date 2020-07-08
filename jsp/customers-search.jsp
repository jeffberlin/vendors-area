<%@ include file="/includes/core.jsp" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
  <head>
    <meta http-equiv="Pragma" content="no-cache">
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    <title>BMT Micro Developers Center</title>
    <%@ include file="/includes/bootstrap_top_script.html" %>
    <%@ include file="/includes/style_menu_footer_css.html" %>
    <link rel="stylesheet" href="https://vendors-new.bmtmicro.com/css/table.css"/>
    <script language="javascript" type="text/javascript" src="https://secure.bmtmicro.com/Templates/util.js"></script>
    <script language="javascript" type="text/javascript" src="https://vendors-new.bmtmicro.com/js/vendors.js"></script>
    <script language="javascript" type="text/javascript" src="https://vendors-new.bmtmicro.com/js/tablesort.js"></script>
    <style media="screen" type="text/css">
      #resultframe {
        height: calc(100vh - 275px);
      }
      #tableframe, #resultframe {
        min-height: 290px;
      }
      .input-search {
        width: 100%;
      }
      .save-btn {
        margin-bottom: .3rem;
      }
    </style>
    <script language="javascript" type="text/javascript">
      function stripspaces(input) {
        input.value = input.value.replace(/\s/gi,"");
        return true;
      }

      function submitenter (myfield, e) {
        var keycode;
        if (window.event) keycode = window.event.keyCode;
        else if (e) keycode = e.which;
        else return true;
        if (keycode == 13) {
          myfield.form.submit();
          return false;
        } else {
          return true;
        }
      }

      function checkForm (form) {
        if (isBlank (form.FLT_ORDERID.value) && isBlank (form.FLT_PRODUCTNAME.value) && isBlank (form.FLT_NAME.value) && isBlank (form.FLT_ADDRESS.value) && isBlank (form.FLT_EMAIL.value))  {
          alert ("You must enter search criteria!");
          form.FLT_ORDERID.focus ();
          return (false);
        }
        return (true);
      }

      function editComments (orderid, itemnr) {
        if ((getCookieValue ("BMTMicro.Vendors.Flags") & 2) == 0) {
          alert ("You do not have permission to edit comments.");
          return (false);
        }
        document.getElementById('resultframe').style.display = "block";
        document.getElementById('tableframe').style.display = "none";
        var form = document.CommentsForm;
        form.ORDERID.value = orderid;
        form.ITEMNR.value = itemnr;
        form.submit();
        return (true);
      }

      function resendInfo (orderid, itemnr) {
        if ((getCookieValue ("BMTMicro.Vendors.Flags") & 4) == 0) {
          alert ("You do not have permission to resend information.");
          return (false);
        }
        document.getElementById('resultframe').style.display = "block";
        document.getElementById('tableframe').style.display = "none";
        var form = document.ResendInfoForm;
        form.ORDERID.value = orderid;
        form.ITEMNR.value = itemnr;
        form.submit();
        return (true);
      }

      function refund (orderid, itemnr) {
        if ((getCookieValue ("BMTMicro.Vendors.Flags") & 4) == 0) {
          alert ("You do not have permission to refund an order.");
          return (false);
        }
        document.getElementById('resultframe').style.display = "block";
        document.getElementById('tableframe').style.display = "none";
        var form = document.RefundItem;
        form.ORDERID.value = orderid;
        form.ITEMNR.value = itemnr;
        form.submit();
        return (true);
      }
    </script>
  </head>
  <body>
    <c:import url = "https://vendors-new.bmtmicro.com/servlets/Vendors.OrderSearch">
      <c:param name="SESSIONID" value="${sessionid}" />
      <c:param name="FLT_ORDERID" value=""/>
      <c:param name="FLT_PRODUCTNAME" value=""/>
      <c:param name="FLT_NAME" value=""/>
      <c:param name="FLT_ADDRESS" value=""/>
      <c:param name="FLT_EMAIL" value=""/>
      <c:param name="NEXT_PAGE" value="https://vendors-new.bmtmicro.com/customers-search-start.jsp"/>
      <c:param name="ROWTEMPLATEURL" value="https://vendors-new.bmtmicro.com/customers-search-tablerow.html" />
      <c:param name="ERROR_PAGE" value="https://vendors-new.bmtmicro.com/error_frame.jsp"/>
    </c:import>
    <%@ include file="/includes/bootstrap_bottom_scripts.html" %>
  </body>
</html>
