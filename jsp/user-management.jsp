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
    <script src="https://secure.bmtmicro.com/Templates/util.js"></script>
    <script src="https://vendors-new.bmtmicro.com/js/vendors.js"></script>
    <script src="https://vendors-new.bmtmicro.com/js/tablesort.js"></script>
    <style media="screen" type="text/css">
      td[text]:first-child {
        text-align: left;
      }
      td[option], td[text] {
        text-align: center;
      }
    </style>
    <script>
      function submitForm(action, target, nextpage, userid) {
        var form = document.users;
        form.ACTION.value = action;
        form.NEXT_PAGE.value = nextpage;
        form.USERID.value = userid;
        if (target == "_parent") {
					form.target = target;
					form.ERROR_PAGE.value = "https://vendors-new.bmtmicro.com/error.jsp";
					form.submit ();
				} else {
					submitToDiv (form, target);
				}
      }

      function addUser(form) {
        submitForm(0, "_parent", "https://vendors-new.bmtmicro.com/user-management-add.jsp");
      }

      function editUser(userid) {
        submitForm(1, "_parent", "https://vendors-new.bmtmicro.com/user-management-edit.jsp", userid);
      }

      function deleteUser(userid) {
        submitForm(2, "resultframe", "https://vendors-new.bmtmicro.com/user-management-delete.jsp", userid);
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
              <h4>Manage&nbsp;Users</h4>
              <p>Use this interface to add or edit additional logins under your account.</p>
              <div class="content-box overflow-auto" id="contentBox">
                <div name="tableframe" class="overflow-auto h-100" id="tableframe">
                  <c:catch var="errormsg">
                    <c:import url="https://vendors-new.bmtmicro.com/servlets/Vendors.Users">
                      <c:param name="SESSIONID" value="${sessionid}" />
                      <c:param name="NEXT_PAGE" value="https://vendors-new.bmtmicro.com/user-management-table.jsp" />
                      <c:param name="ERROR_PAGE" value="https://vendors-new.bmtmicro.com/error-div.jsp" />
                      <c:param name="ACTION" value="-1" />
                    </c:import>
                  </c:catch>
                  <%@ include file="/includes/catch.jsp" %>
                </div> <!-- end #tableframe -->
                <div name="resultframe" id="resultframe"></div>
              </div> <!-- end .content-box -->
            </div> <!-- end .col-lg-10 col-md-12 page-title -->
          </div> <!-- end .row justify-content-start -->
        </article>
      </div> <!-- end .container-fluid -->
      <jsp:include page="/includes/footer.jsp" />
    </div> <!-- end .main-raised -->
    <%@ include file="/includes/bootstrap_bottom_scripts.html" %>
  </body>
</html>
