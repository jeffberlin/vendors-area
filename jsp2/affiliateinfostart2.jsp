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
    <script language="javascript" type="text/javascript" src="https://vendors-new.bmtmicro.com/js/tablesort.js"></script>
    <script language="javascript" type="text/javascript" src="https://vendors-new.bmtmicro.com/js/vendors.js"></script>
    <script language="javascript" type="text/javascript" src="https://secure.bmtmicro.com/Templates/util.js"></script>
    <style media="screen" type="text/css">
      #resultframe {
        height: calc(100vh - 275px);
      }
      td[option], td[text], td[date] {
        text-align: center;
      }
    </style>
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
              <h4>Manage&nbsp;Affiliates</h4>
              <p>Highlighted affiliates have joined within the last month.</p>
              <div class="content-box overflow-auto">
                <div name="tableframe" id="tableframe">
                  <c:url value = "https://vendors-new.bmtmicro.com/servlets/Vendors.Affiliates" var = "affiliateInfoURL">
                    <c:param name = "SESSIONID" value = "${cookie['BMTMicro.Vendors.SessionID'].value}"/>
                    <c:param name = "ACTION" value = "-1"/>
                    <c:param name = "MAXAMOUNT" value = ""/>
                    <c:param name = "ROWTEMPLATEURL" value = "https://vendors-new.bmtmicro.com/affiliateinfo_tablerow.html"/>
                    <c:param name = "NEXT_PAGE" value = "https://vendors-new.bmtmicro.com/affiliateinfo.html"/>
                    <c:param name = "ERROR_PAGE" value = "https://vendors-new.bmtmicro.com/error_frame.jsp"/>
                  </c:url>
                  <c:import url = "${affiliateInfoURL}"/>
                </div> <!-- end #tableframe -->
                <div name="resultframe" id="resultframe" style="display: none;">

                </div> <!-- end #resultframe -->
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
