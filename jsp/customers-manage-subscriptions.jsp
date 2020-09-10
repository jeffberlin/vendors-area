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
    <title>BMT Micro Developers Center</title>
    <%@ include file="/includes/bootstrap_top_script.html" %>
    <%@ include file="/includes/style_menu_footer_css.html" %>
    <link rel="stylesheet" href="https://vendors-new.bmtmicro.com/css/table.css"/>
    <link rel="stylesheet" href="https://vendors-new.bmtmicro.com/css/addTransfer.css"/>
    <script src="https://secure.bmtmicro.com/Templates/util.js"></script>
    <script src="https://vendors-new.bmtmicro.com/js/vendors.js"></script>
    <script>
      function initForm (form) {
        // var showexpired = getCookieValue ("BMTMicro.Vendors.Subscriptions.ShowExpired");
        // if (showexpired != null) {
        //   form.SHOWEXPIRED.value = showexpired;
        // }
        form.submit ();
        initField (form, "SHOWEXPIRED", "${param.SHOWEXPIRED}");
        // initField (form, "FLT_SUBSCRIPTIONID",  "${param.FLT_SUBSCRIPTIONID}");
        // initField (form, "FLT_PRODUCTNAME",     "${param.FLT_PRODUCTNAME}");
        // initField (form, "FLT_NAME",            "${param.FLT_NAME}");
        // initField (form, "FLT_EMAIL",           "${param.FLT_EMAIL}");
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
        // form.submit ();
      }

      function showExpiredChanged () {
        setCookieValue ("BMTMicro.Vendors.Subscriptions.ShowExpired", queryField (document.subscriptions, "SHOWEXPIRED"), 1000);
        submitForm(-1, "tableframe", "https://vendors-new.bmtmicro.com/customers-manage-subscriptions-table.jsp");
      }

      function filter () {
        submitForm (-1, "tableframe", "https://vendors-new.bmtmicro.com/customers-manage-subscriptions-table.jsp");
      }

      function selectPage (p) {
        document.subscriptions.PAGE.value = p;
        submitForm(-1, "tableframe", "https://vendors-new.bmtmicro.com/customers-manage-subscriptions-table.jsp");
      }

      function cancelSubscription (subscriptionid) {
        <c:if test="${allowResend == 0}">
          alert("You do not have permission to cancel subscriptions.")
        </c:if>
        // if (allowResend ("You do not have permission to cancel subscriptions.")) {
        <c:if test="${allowResend == 1}">
          submitForm (1, "resultframe", "https://vendors-new.bmtmicro.com/customers-manage-subscriptions-cancel.jsp", subscriptionid);
        </c:if>
        // }
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
            <jsp:include page="includes/menuSidebar.jsp" />
            <div class="col-lg-10 col-md-12 page-title">
              <h4>Manage&nbsp;Subscriptions</h4>
              <p>Check box to show inactive subscriptions.&nbsp;Use search fields to filter results.</p>
              <div class="content-box overflow-auto d-flex flex-column">
                <!-- <form name="subscriptions" method="post" action="https://vendors-new.bmtmicro.com/servlets/Vendors.Subscriptions">
                  <input type="hidden" name="ACTION" value="-1" />
                  <input type="hidden" name="ROWSPERPAGE" value="500" />
                  <input type="hidden" name="PAGE" value="1" />
                  <input type="hidden" name="SHOWEXPIRED" value="0" />
                  <input type="hidden" name="ROWTEMPLATEURL" value="https://vendors-new.bmtmicro.com/customers-manage-subscriptions-tablerow.html" />
                  <input type="hidden" name="NEXT_PAGE" value="https://vendors-new.bmtmicro.com/customers-manage-subscriptions-table.jsp"/>
                  <input type="hidden" name="ERROR_PAGE" value="https://vendors-new.bmtmicro.com/error.jsp"/>
                </form> -->
                <div name="tableframe" class="overflow-auto h-100" id="tableframe">
                  <jsp:include page="customers-manage-subscriptions-table.jsp" />
                </div> <!-- end #tableframe -->
                <div name="resultframe" id="resultframe"></div> <!-- end #resultframe -->
              </div> <!-- end .content-box -->
            </div> <!-- end .col-lg-12 -->
          </div> <!-- end first .row -->
        </article>
      </div> <!-- end .container-fluid -->
      <jsp:include page="includes/footer.jsp" />
    </div> <!-- end .main-raised -->
    <%@ include file="/includes/bootstrap_bottom_scripts.html" %>
  </body>
  <script>
    $(document).ready(function(){ submitToDiv (document.subscriptions, 'tableframe'); });
    $('input[type=checkbox]').change(function(){
      $(this).prev('input[type=hidden]').val (this.checked ? -1 : 0);
    });
  </script>
</html>
