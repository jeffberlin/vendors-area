<%@ page pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ include file="/includes/core.jsp" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta http-equiv="Pragma" content="no-cache">
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    <%@ include file="/includes/favicon-meta.html" %>
    <title>BMT Micro Developers Center</title>
    <%@ include file="/includes/bootstrap_top_script.html" %>
    <%@ include file="/includes/style_menu_footer_css.html" %>
    <link rel="stylesheet" href="https://vendors-new.bmtmicro.com/css/table.css"/>
    <link rel="stylesheet" href="https://vendors-new.bmtmicro.com/css/addTransfer.css"/>
    <script src="https://secure.bmtmicro.com/Templates/util.js"></script>
    <script src="https://vendors-new.bmtmicro.com/js/vendors.js"></script>
    <style media="screen" type="text/css">
      td[date], td[option] {
        text-align: center;
      }
    </style>
    <script>
      function initForm (form) {
        var showexpired = getCookieValue ("BMTMicro.Vendors.Subscriptions.ShowExpired");
        if (showexpired != null) {
          form.SHOWEXPIRED.value = showexpired;
        }
        form.submit ();
        initField (form, "SHOWEXPIRED", "${requestScope.SHOWEXPIRED}");
      }

      function submitForm (action, target, nextpage, subscriptionid) {
        var form = document.subscriptions;
        form.ACTION.value = action;
        form.target = target;
        form.SUBSCRIPTIONID.value = subscriptionid;
        form.NEXT_PAGE.value = nextpage;
        if (target == "_parent") {
          form.ERROR_PAGE.value = "https://vendors-new.bmtmicro.com/error.jsp";
          form.submit ();
        } else {
          form.target = "";
          submitToDiv (form, target);
        }
      }

      function showExpiredChanged () {
        setCookieValue ("BMTMicro.Vendors.Subscriptions.ShowExpired", queryField (document.subscriptions, "SHOWEXPIRED"), 1000);
        refreshReport ();
      }

      function refreshReport () {
        submitForm (-1, "tableframe", "https://vendors-new.bmtmicro.com/customers-manage-subscriptions-table.jsp");
      }

      function selectPage (p) {
        document.subscriptions.PAGE.value = p;
        refreshReport ();
      }

      function cancelSubscription (subscriptionid) {
        <c:if test="${!allowResend}">
          alert("You do not have permission to cancel subscriptions.")
        </c:if>
        <c:if test="${allowResend}">
          submitForm (1, "resultframe", "https://vendors-new.bmtmicro.com/customers-manage-subscriptions-cancel.jsp", subscriptionid);
        </c:if>
      }

      function filterKeyPress(event) {
        if (event.keyCode == 13) {
          refreshReport ();
          return (true);
        }
      }
    </script>
  </head>
  <body>
    <!-- Blue background header -->
    <div class="blue-bg"></div>

    <!-- Start of body content -->
    <div class="main-raised">
      <div class="container-fluid body-content">
        <article class="section">
          <div class="row justify-content-start">
            <jsp:include page="/includes/menuSidebar.jsp" />
            <div class="col-lg-10 col-md-12 page-title">
              <h4>Manage&nbsp;Subscriptions</h4>
              <p>Check box to show inactive subscriptions.&nbsp;Use search fields to filter results.</p>
              <div class="content-box overflow-auto d-flex flex-column">
                <div name="tableframe" class="overflow-auto h-100" id="tableframe">
                  <c:catch var="errormsg">
                    <c:import url="https://vendors-new.bmtmicro.com/servlets/Vendors.Subscriptions">
                      <c:param name="SESSIONID" value="${sessionid}" />
                      <c:param name="NEXT_PAGE" value="https://vendors-new.bmtmicro.com/customers-manage-subscriptions-table.jsp"/>
                      <c:param name="ERROR_PAGE" value="https://vendors-new.bmtmicro.com/error-div.jsp"/>
                      <c:param name="ACTION" value="-1" />
                      <c:param name="ROWSPERPAGE" value="500" />
                      <c:param name="PAGE" value="1" />
                      <c:param name="SHOWEXPIRED" value="${cookie['BMTMicro.Vendors.Subscriptions.ShowExpired'].value}" />
                    </c:import>
                  </c:catch>
                  <%@ include file="/includes/catch.jsp" %>
                </div> <!-- end #tableframe -->
                <div name="resultframe" id="resultframe"></div> <!-- end #resultframe -->
              </div> <!-- end .content-box -->
            </div> <!-- end .col-lg-12 -->
          </div> <!-- end first .row -->
        </article>
      </div> <!-- end .container-fluid -->
      <jsp:include page="/includes/footer.jsp" />
    </div> <!-- end .main-raised -->
    <%@ include file="/includes/bootstrap_bottom_scripts.html" %>
  </body>
  <script>
    $('input[type=checkbox]').change(function(){
      $(this).prev('input[type=hidden]').val (this.checked ? -1 : 0);
    });
  </script>
</html>
