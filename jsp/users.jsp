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
    <%@ include file="includes/bootstrap_top_script.html" %>
    <%@ include file="/includes/style_menu_footer_css.html" %>
    <link rel="stylesheet" href="https://vendors-new.bmtmicro.com/css/table.css"/>
    <script language="javascript" type="text/javascript" src="https://secure.bmtmicro.com/Templates/util.js"></script>
    <script language="javascript" type="text/javascript" src="https://vendors-new.bmtmicro.com/js/vendors.js"></script>
    <script language="javascript" type="text/javascript" src="https://vendors-new.bmtmicro.com/js/tablesort.js"></script>
    <script type="text/javascript" src="https://vendors-new.bmtmicro.com/js/main.js"></script>
    <style media="screen">
      .table-responsive {
        overflow-y: scroll;
        display: block;
      }
      .table-responsive, #userinfo {
        height: calc(100vh - 350px);
      }
      td[option], td[text] {
        text-align: center;
      }
    </style>
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
            <jsp:include page="jsp/menuSidebar.jsp" />
            <div class="col-lg-10 col-md-12 page-title">
              <h4>Manage&nbsp;Users</h4>
              <p>Use this interface to add or edit additional logins under your account.</p>
              <div class="content-box">
                <form name="users" action="https://vendors-new.bmtmicro.com/servlets/Vendors.Users" method="post" target="userinfo">
                  <input type="hidden" name="ACTION" value="" />
                  <input type="hidden" name="ROWTEMPLATEURL" value="<%= request.getParameter ("ROWTEMPLATEURL") %>" />
                  <input type="hidden" name="NEXT_PAGE" value="https://vendors-new.bmtmicro.com/users.jsp" />
                  <input type="hidden" name="ERROR_PAGE" value="https://vendors-new.bmtmicro.com/error_frame.jsp" />
                  <input type="hidden" name="USERID" value="" />
                  <div id="tablelayer">
                    <div class="table-header">
                      <button type="button" class="grey-btn" onclick="addUser ();" >Add New User</button>
                    </div> <!-- end .table-header -->
                    <div class="row table-responsive" style="margin-left: auto; margin-right: auto;">
                      <table class="table" id="selection">
                        <thead>
                          <tr class="table-category text-center">
                            <th scope="col" class="sortable sort-column sort" title="Sort on 'Login'" text>
                              <a href="#" class="fdTableSortTrigger">Login</a>
                            </th>
                            <th scope="col" class="sortable sort-column sort" title="Sort on 'Email'" text>
                              <a href="#" class="fdTableSortTrigger">Email</a>
                            </th>
                            <th scope="col" class="sortable sort-column sort" title="Sort on 'Name'" text>
                              <a href="#" class="fdTableSortTrigger">Name</a>
                            </th>
                            <th scope="col" class="sort-column">
                              <a href="#" style="cursor: default;" onclick="return false;">Remove</a>
                            </th>
                          </tr>
                        </thead>
                        <tbody>
                          <tr>
                            <%= request.getParameter ("TABLEDATA") %>
                          </tr>
                        </tbody>
                        <tfoot>
                          <tr class="table-total">
                            <th scope="row" colspan="6">&nbsp;</th>
                          </tr>
                        </tfoot>
                      </table>
                    </div> <!-- end .row -->
                  </div> <!-- end #tablelayer -->
                </form>
                <iframe src="" name="userinfo" id="userinfo" frameborder="0" border="0" cellspacing="0" style="border-style: none; width: 100%; padding: 0px; margin:0px; display: none;"></iframe>
              </div> <!-- end .content-box -->
            </div> <!-- end .col-lg-10 col-md-12 page-title -->
          </div> <!-- end .row justify-content-start -->
        </article>
      </div> <!-- end .container-fluid -->
      <jsp:include page="jsp/footer.jsp" />
    </div> <!-- end .main-raised -->
    <%@ include file="includes/bootstrap_bottom_scripts.html" %>
  </body>
</html>
