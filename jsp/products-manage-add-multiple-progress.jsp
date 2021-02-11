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
    <script src="https://secure.bmtmicro.com/Templates/util.js"></script>
    <script src="https://vendors-new.bmtmicro.com/js/vendors.js"></script>
    <style media="screen" type="text/css">
      h6 {
        color: #195a7c;
        font-size: 1.15rem;
        letter-spacing: .5px;
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
            <jsp:include page="/includes/menuSidebar.jsp" />
            <div class="col-lg-10 col-md-12 page-title">
              <h4>Create Multiple Products</h4>
              <div class="content-box" style="padding: 1rem;">
                <c:if test="${requestScope.COUNT == requestScope.TOTAL}">
                  <div class="content">
                    <h6>Add Multiple Products</h6>
                    <p>Processing Complete. ${requestScope.COUNT} products were set up.</p>
                    <p>${requestScope.MESSAGE}</p>
                    <form action="https://vendors-new.bmtmicro.com/products-manage.jsp" method="get" target="_parent">
                      <button type="submit" class="save-btn">Close</button>
                    </form>
                  </div>
                </c:if>
                <c:if test="${requestScope.COUNT != requestScope.TOTAL}">
                  <div class="content">
                    <h6>Add&nbsp;Multiple&nbsp;Products</h6>
                    <p style="margin-bottom: .2rem;">Please wait, adding products.</p>
                    <p style="margin-bottom: .2rem;">This process can take several minutes depending on the number of products you are setting up.</p>
                    <p style="margin-bottom: .2rem;"><strong>${requestScope.COUNT} products of ${requestScope.TOTAL} have been set up so far.</strong></p>
                    <p style="color: #FF0000;">Please do not exit this window until complete as this will stop the setup process.</p>
                  </div> <!-- end .content -->
                  <form method="post" name="progress" action="https://vendors-new.bmtmicro.com/servlets/Vendors.Products">
                    <input type="hidden" name="ACTION" value="17" />
                    <input type="hidden" name="NEXT_PAGE" value="https://vendors-new.bmtmicro.com/products-manage-add-multiple-progress.jsp" />
                    <input type="hidden" name="ERROR_PAGE" value="https://vendors-new.bmtmicro.com/error-div.jsp" />
                  </form>
                </c:if>
              </div> <!-- end .content-box -->
            </div> <!-- end .col-lg-12 -->
          </div> <!-- end first .row -->
        </article>
      </div> <!-- end .container-fluid -->
      <jsp:include page="/includes/footer.jsp" />
    </div> <!-- end .main-raised -->
    <%@ include file="/includes/bootstrap_bottom_scripts.html" %>
  </body>
</html>
