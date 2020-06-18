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
    <script language="javascript" type="text/javascript" src="https://secure.bmtmicro.com/Templates/util.js"></script>
    <script language="javascript" type="text/javascript" src="https://vendors-new.bmtmicro.com/js/vendors.js"></script>
    <script language="javascript" type="text/javascript" src="https://vendors-new.bmtmicro.com/js/tablesort.js"></script>

    <script language="javascript" type="text/javascript">
      <!--
      function addUser () {
        var form = document.users;
        form.NEXT_PAGE.value = "https://vendors-new.bmtmicro.com/users_add.html";
        form.ACTION.value = "0";
        form.USERID.value = "";
        window.parent.document.getElementById('userinfo').style.display = "block";
        window.parent.document.getElementById('tablelayer').style.display = "none";
        form.submit ();
      }
      function editUser (userid) {
        var form = document.users;
        form.NEXT_PAGE.value = "https://vendors-new.bmtmicro.com/users_edit.html";
        form.ACTION.value = "1";
        form.USERID.value = userid;
        window.parent.document.getElementById('userinfo').style.display = "block";
        window.parent.document.getElementById('tablelayer').style.display = "none";
        form.submit ();
      }
      function deleteUser (userid) {
        var form = document.users;
        form.NEXT_PAGE.value = "https://vendors-new.bmtmicro.com/users_delete.html";
        form.ACTION.value = "2";
        form.USERID.value = userid;
        window.parent.document.getElementById('userinfo').style.display = "block";
        window.parent.document.getElementById('tablelayer').style.display = "none";
        form.submit ();
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
            <%@ include file="/includes/menuSidebar.html" %>
            <div class="col-lg-10 col-md-12 page-title">
              <h4>Manage&nbsp;Affiliates</h4>
              <p>Highlighted affiliates have joined within the last month.</p>
              <div class="content-box overflow-auto" id="contentBox">
                <div name="tableframe" class="overflow-auto h-100" id="tableframe">
									<jsp:include page="./user-management-table.jsp" />
                </div> <!-- end #tableframe -->
                <div name="resultframe" id="resultframe"></div>
              </div> <!-- end .content-box -->
            </div> <!-- end .col-lg-10 col-md-12 page-title -->
          </div> <!-- end .row justify-content-start -->
        </article>
      </div> <!-- end .container-fluid -->
      <%@ include file="/includes/footer.html" %>
    </div> <!-- end .main-raised -->
    <%@ include file="/includes/bootstrap_bottom_scripts.html" %>
  </body>
	<script>
     $(document).ready(function(){ submitToDiv (document.affiliates, 'tableframe'); });
  </script>
</html>
