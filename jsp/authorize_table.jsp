<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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
    <c:import url = "https://vendors-new.bmtmicro.com/includes/bootstrap_top_script.html" />
    <c:import url = "https://vendors-new.bmtmicro.com/includes/menu_footer_css.html" />
    <link rel="stylesheet" href="https://vendors-new.bmtmicro.com/css/style.css"/>
    <link rel="stylesheet" href="https://vendors-new.bmtmicro.com/css/table.css"/>
    <script language="javascript" type="text/javascript" src="https://vendors-new.bmtmicro.com/js/vendors.js"></script>
    <script language="javascript" type="text/javascript" src="https://secure.bmtmicro.com/Templates/util.js"></script>
    <style media="screen" type="text/css">
      .table-responsive-lg {
        height:calc(100vh - 350px);
        display: block;
        overflow-y: scroll;
      }
    </style>
    <script language="javascript" type="text/javascript">
      <!--
      function doAction(action) {
        document.orderlistform.ACTION.value = action;
        document.orderlistform.submit();
      }
      function showDetails(ctrl) {
        var row = GetIndexOfElement (ctrl);
        window.open("", "detailsPopUp","location=no,menubar=1,width=680,height=550,resizable=yes").focus();
        document.bmtconfig.ORDERID.value = GetIndexedField (document.orderlistform.ORDERID,row).value;
        document.bmtconfig.submit();
      }
      //-->
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
            <c:import url = "https://vendors-new.bmtmicro.com/includes/menuSidebar.html" />
            <div class="col-lg-10 col-md-12 page-title">
              <h4>${param.TITLE}</h4>
              <div class="content-box">
                <form name="orderlistform" action="https://vendors-new.bmtmicro.com/servlets/Vendors.ImportRipOrders" method="post">
                  <input type="hidden" name="ACTION" value="0" />
                  <input type="hidden" name="NEXT_PAGE" value="https://vendors-new.bmtmicro.com/authorize_table.jsp" />
                  <input type="hidden" name="ERROR_PAGE" value="https://vendors-new.bmtmicro.com/error.jsp">
                  <input type="hidden" name="SUBMISSIONID" value="${param.SUBMISSIONID}">
                  <input type="hidden" name="STARFILE" value="https://vendors-new.bmtmicro.com/images/star.gif" />
                  <input type="hidden" name="BLANKFILE" value="https://vendors-new.bmtmicro.com/images/blank.gif" />

                  <div class="table-header">
                    &nbsp;
                  </div> <!-- end .table-header -->
                  <div class="row table-responsive-lg" style="margin-left: auto; margin-right: auto;">
                    <table class="table" id="selection">
                      <thead>
                        <tr class="table-category">
                          <th scope="col" class="sort-column"></th>
                          <th scope="col" class="sort-column text-center">
                            <a href="#" style="cursor: default;" onclick="return false;">Info</a>
                          </th>
                          <th scope="col" class="sort-column text-center" number>
                            <a href="#" style="cursor: default;" onclick="return false;">Number</a>
                          </th>
                          <th scope="col" class="sort-column text-center">
                            <a href="#" style="cursor: default;" onclick="return false;">Product&nbsp;Name</a>
                          </th>
                          <th scope="col" class="sort-column text-center" number>
                            <a href="#" style="cursor: default;" onclick="return false;">Qty</a>
                          </th>
                          <th scope="col" class="sort-column text-center" money>
                            <a href="#" style="cursor: default;" onclick="return false;">Amount</a>
                          </th>
                          <th scope="col" class="sort-column text-center" info>
                            <a href="#" style="cursor: default;" onclick="return false;">Name</a>
                          </th>
                          <th scope="col" class="sort-column text-center" info>
                            <a href="#" style="cursor: default;" onclick="return false;">Address</a>
                          </th>
                          <th scope="col" class="sort-column text-center" info>
                            <a href="#" style="cursor: default;" onclick="return false;">Country</a>
                          </th>
                          <th scope="col" class="sort-column text-center" info>
                            <a href="#" style="cursor: default;" onclick="return false;">Origin</a>
                          </th>
                          <th scope="col" class="sort-column text-center">
                            <a href="#" style="cursor: default;" onclick="return false;">IP</a>
                          </th>
                          <th scope="col" class="sort-column text-center">
                            <a href="#" style="cursor: default;" onclick="return false;">Email</a>
                          </th>
                          <th scope="col" class="sort-column text-center">
                            <a href="#" style="cursor: default;" onclick="return false;">Payment&nbsp;Method</a>
                          </th>
                          <th scope="col" class="sort-column text-center">
                            <a href="#" style="cursor: default;" onclick="return false;">AVS</a>
                          </th>
                          <th scope="col" class="sort-column text-center">
                            <a href="#" style="cursor: default;" onclick="return false;">CVV</a>
                          </th>
                          <th scope="col" class="sort-column text-center" info>
                            <a href="#" style="cursor: default;" onclick="return false;">Info</a>
                          </th>
                          <th scope="col" class="sort-column text-center">
                            <a href="#" style="cursor: default;" onclick="return false;">Affiliate</a>
                          </th>
                        </tr>
                      </thead>
                      <tbody>
                        ${param.TABLEDATA}
                      </tbody>
                      <tfoot>
                        <tr class="table-total">
                          <th scope="row" colspan="17">
                            <div id="pageselector">&nbsp;</div>
                          </th>
                        </tr>
                      </tfoot>
                    </table>
                  </div>
                </form>
                <form name="homeform" action="https://vendors-new.bmtmicro.com/mainstart.html"></form>
                <form action="https://vendors-new.bmtmicro.com/servlets/Vendors.ImportRipOrders" method="post">
                  <input Type="hidden" NAME="ACTION" value="5">
                  <input type="hidden" name="RIPCODE" value="${param.RIPCODE}">
                  <input Type="hidden" NAME="ORDERID" value="">
                  <input type="hidden" name="NEXT_PAGE" value="https://vendors-new.bmtmicro.com/authorize_orderdetails.html" />
                </form>
              </div> <!-- end .content-box -->
            </div> <!-- end .col-lg-10 col-md-12 page-title -->
          </div> <!-- end .row justify-content-start -->
        </article>
      </div> <!-- end .container-fluid -->
      <c:import url = "https://vendors-new.bmtmicro.com/includes/footer.html" />
    </div> <!-- end .main-raised -->
    <c:import url = "https://vendors-new.bmtmicro.com/includes/bootstrap_bottom_scripts.html" />
  </body>
</html>
