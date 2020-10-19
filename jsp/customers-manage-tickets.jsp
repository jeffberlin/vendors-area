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
    <script src="https://vendors-new.bmtmicro.com/js/tablesort.js"></script>
    <style media="screen">
      td[number] {
        text-align: center;
      }
    </style>
    <script>
      function submitForm (action, target, nextpage, ticketid) {
        var form = document.tickets;
        form.ACTION.value = action;
        form.target = target;
        form.NEXT_PAGE.value = nextpage;
        form.TICKETID.value = ticketid;
        if (target == "_parent") {
          form.ERROR_PAGE.value = "https://vendors-new.bmtmicro.com/error.jsp";
          form.submit ();
        } else {
          form.target = "";
          submitToDiv (form, target);
        }
      }

      function showDetailsChanged () {
        var form = document.tickets;
        var value = queryField (form, "SHOWDETAILS");
        setCookieValue ("BMTMicro.Vendors.Tickets.ShowDetails", value, 1000);
        form.ROWTEMPLATEURL.value = (value == -1) ? "https://vendors-new.bmtmicro.com/customers-manage-tickets-tablerow-details.html" : "https://vendors-new.bmtmicro.com/customers-manage-tickets-tablerow.html";
        refreshReport ();
      }

      function refreshReport () {
        submitForm (-1, "tableframe", "https://vendors-new.bmtmicro.com/customers-manage-tickets-table.jsp");
      }

      function selectPage (p) {
        document.tickets.PAGE.value = p;
        refreshReport ();
      }

      <c:if test = "${ allowResend == 0 }">
        function expireTicket (ticketid) {
          alert("You do not have permission to expire tickets.");
        }
        function addTicket (ticketid) {
          alert("You do not have permission to grant new tickets.");
        }
      </c:if>

      <c:if test = "${ allowResend == 1 }">
        function expireTicket (ticketid) {
          submitForm (1, "resultframe", "https://vendors-new.bmtmicro.com/customers-manage-tickets-expire.jsp", ticketid);
        }
        function addTicket (ticketid) {
          submitForm (2, "resultframe", "https://vendors-new.bmtmicro.com/customers-manage-tickets-add.jsp", ticketid);
        }
      </c:if>

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
            <jsp:include page="includes/menuSidebar.jsp" />
            <div class="col-lg-10 col-md-12 page-title">
              <h4>Manage&nbsp;Tickets</h4>
              <div class="content-box d-flex flex-column">
                <div name="tableframe" class="overflow-auto h-100" id="tableframe">
                  <form name="tickets" action="https://vendors-new.bmtmicro.com/servlets/Vendors.Tickets" method="post">
                    <input type="hidden" name="ACTION" value="-1" />
                    <input type="hidden" name="ROWSPERPAGE" value="500" />
                    <input type="hidden" name="PAGE" value="1" />
                    <input type="hidden" name="SHOWDETAILS" value="${cookie['BMTMicro.Vendors.Tickets.ShowDetails'].value}" />
                    <c:if test="${cookie['BMTMicro.Vendors.Tickets.ShowDetails'].value==-1}">
                      <input type="hidden" name="ROWTEMPLATEURL" value="https://vendors-new.bmtmicro.com/customers-manage-tickets-tablerow-details.html" />
                    </c:if>
                    <c:if test="${cookie['BMTMicro.Vendors.Tickets.ShowDetails'].value!=-1}">
                      <input type="hidden" name="ROWTEMPLATEURL" value="https://vendors-new.bmtmicro.com/customers-manage-tickets-tablerow.html" />
                    </c:if>
                    <input type="hidden" name="NEXT_PAGE" value="https://vendors-new.bmtmicro.com/customers-manage-tickets-table.jsp" />
                    <input type="hidden" name="ERROR_PAGE" value="https://vendors-new.bmtmicro.com/error-div.jsp" />
                  </form>
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
    $(document).ready(function(){ submitToDiv (document.tickets, 'tableframe'); });
    $('input[type=checkbox]').change(function(){
      $(this).prev('input[type=hidden]').val (this.checked ? -1 : 0);
    });
  </script>
</html>
