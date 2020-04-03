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
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" href="https://vendors-new.bmtmicro.com/css/style.css"/>
    <link rel="stylesheet" href="https://vendors-new.bmtmicro.com/css/responsive.css"/>
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
    <div style="visibility:hidden;">
      <form name="logout" method="post" action="https://vendors-new.bmtmicro.com/servlets/Vendors.Logout">
        <input type="hidden" name="NEXT_PAGE" value="https://vendors-new.bmtmicro.com/login.html">
        <input type="hidden" name="ERROR_PAGE" value="https://vendors-new.bmtmicro.com/error.jsp">
      </form>
      <form name="payoneer" method="post" action="https://vendors-new.bmtmicro.com/servlets/Vendors.Payoneer">
        <input type="hidden" name="NEXT_PAGE" value="https://vendors-new.bmtmicro.com/main.html">
        <input type="hidden" name="ERROR_PAGE" value="https://vendors-new.bmtmicro.com/error.jsp">
      </form>
    </div>

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

    <script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    <script type="text/javascript">
      /* Anything that gets to the document will hide the dropdown */
      $(window).click(function(){
        $(".dropright").removeClass('show');
      });
    </script>
  </body>
</html>
