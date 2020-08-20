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
    <style media="screen" type="text/css">
      td[mnumber], td[info], td[option] {
        text-align: center;
      }
      #keyinfo {
        color: #707070;
        margin-bottom: 1rem;
        font-size: .9rem;
      }
      #keyinfo {
        letter-spacing: .5px;
      }
    </style>
    <script>
      function submitForm (action, target, nextpage, keytableid) {
        var form = document.keytables;
        form.ACTION.value = action;
        form.target = target;
        form.NEXT_PAGE.value  = nextpage;
        // form.ERROR_PAGE.value = (target == "_parent") ? "https://vendors-new.bmtmicro.com/error.jsp" : "https://vendors-new.bmtmicro.com/error-div.jsp";
        form.KEYTABLEID.value = keytableid;
        // submitToDiv (form, "resultframe");
        if (target == "_parent") {
          form.ERROR_PAGE.value = "https://vendors-new.bmtmicro.com/error.jsp";
          form.submit ();
        } else {
          form.target = "";
          submitToDiv (form, target);
        }
      }

      <c:if test = "${ allowChanges == 0 }">
        function addTable () {
          alert("You do not have permission to add new tables.");
        }
        function deleteTable (keytableid) {
          alert("You do not have permission to delete tables.");
        }
        function addKeys (keytableid) {
          alert("You do not have permission to add keys.");
        }

        function submitKeys (form) {
          alert ("You do not have permission to edit tables.");
        }
      </c:if>

      <c:if test = "${ allowChanges == 1 }">
        function addTable () {
          submitForm (0, "resultframe", "https://vendors-new.bmtmicro.com/products-manage-activation-code-tables-add.jsp");
        }
        function deleteTable (keytableid) {
          submitForm (2, "resultframe", "https://vendors-new.bmtmicro.com/products-manage-activation-code-tables-delete.jsp", keytableid);
        }
        function addKeys (keytableid) {
          submitForm (3, "resultframe", "https://vendors-new.bmtmicro.com/products-manage-activation-code-tables-add-keys.jsp", keytableid);
        }
      </c:if>

      // function addTable () {
      //   if (allowChanges ("You do not have permission to add new tables.")) {
      //     submitForm (0, "resultframe", "https://vendors-new.bmtmicro.com/keytables_add.html");
      //   }
      // }

      function editTable (keytableid) {
        submitForm (1, "resultframe", "https://vendors-new.bmtmicro.com/products-manage-activation-code-tables-edit.jsp", keytableid);
      }

      // function deleteTable (keytableid) {
      //   if (allowChanges ("You do not have permission to delete tables.")) {
      //     submitForm (2, "resultframe", "https://vendors-new.bmtmicro.com/keytables_delete.html", keytableid);
      //   }
      // }

      // function addKeys (keytableid) {
      //   if (allowChanges ("You do not have permission to add keys.")) {
      //     submitForm (3, "resultframe", "https://vendors-new.bmtmicro.com/keytables_add_keys.html", keytableid);
      //   }
      // }

      function viewProducts (keytableid) {
        submitForm (4, "resultframe", "https://vendors-new.bmtmicro.com/products-manage-activation-code-tables-view-products.jsp", keytableid);
      }

      function downloadKeys (keytableid) {
        submitForm (5, "", "https://vendors-new.bmtmicro.com/products-manage-code-activation-tables.jsp", keytableid);
      }

      // from keytables_add.html
      function initForm (form){
        initField (form, "KEYPARTS", "${param.KEYPARTS}");
        initField (form, "SEPARATOR", "${param.SEPARATOR}");

        var info = "Each row contains one code."
        if (${param.KEYPARTS} == 1) {
          info += " (The codes are single-part. The separator character is not used.)";
        } else {
          info += " Each code should have ${param.KEYPARTS} parts. Each part should be separated by ";
          switch ('${param.SEPARATOR}') {
            case ' ':
              info += " a space character ('&nbsp;').";
            break;
            case ',':
              info += " a comma (',').";
            break;
            case ';':
              info += " a semicolon (';').";
            break;
            default:
              info += "the character '${param.SEPARATOR}'";
            break;
          }
        }
        document.getElementById ("keyinfo").innerHTML = info;
      }

      function submitKeys (form) {
        form.NAME.value = trim (form.NAME.value);
        if (isBlank (form.NAME.value)) {
          alert ("You must name the table!");
          form.NAME.focus ();
          return (false);
        }
        if ("${param.NAMELIST}".split ("\t").indexOf (form.NAME.value) != -1) {
          alert ("A table with that name already exists!");
          form.NAME.focus ();
          return (false);
        }
        if (!isBlank (form.LOWKEYEMAIL.value) && !isValidEmail (form.LOWKEYEMAIL.value)) {
          alert ("You must use a valid email address!");
          form.LOWKEYEMAIL.focus ();
          return (false);
        }
        form.submit ();
        return (true);
      }

      // from keytables_add_keys.html
      function checkKeyParts (str,parts,separator) {
        var i = 0;
        var l = str.length;
        var lineNumber = 0;
        var keyCount = 0;
        while (i < l) {
          var next;
          var lf = str.indexOf ("\r\n", i);
          if (lf != -1) {
            next = lf + 2;
          } else if ((lf = str.indexOf ("\n", i)) != -1) {
            next = lf + 1;
          } else {
            next = lf = l;
          }
          var line = str.substring (i, lf);
          lineNumber++;
          i = next;

          if (isBlank (line)) {
            if (!confirm ("Warning: Line " + lineNumber + "  will be ignored because it is blank")) {
              return (false);
            }
          continue;
          }

          var keyparts = ["","","",""];
          if (parts == 1) {
            keyparts[0] = line.substring (j);
          } else {
            var part = 0;
            var j = 0;
            for (;;) {
              var s = line.indexOf (separator, j);
              if (s == -1) {
                break;
              }
              keyparts[part++] = line.substring (j, s);
              j = s + 1;
              if (part == parts) {
                alert ("Error on line " + lineNumber + ". Found more than " + parts + " parts.\nThis table should only have " + parts + " parts per code");
                return (false);
              }
            }
            keyparts[part++] = line.substring (j);
            if (part < parts) {
              alert ("Error on line " + lineNumber + ". Could only find " + part + " parts.\nThis table needs " + parts + " parts per code");
              return (false);
            }
          }

          for (var k = 0; k < part; k++) {
            if (keyparts[k].length > 80) {
              alert ("Error on line " + lineNumber + ". The length of the code (part " + k + ") exceeds the maximum length of 80 characters.");
              return (false);
            }
          }

          keyCount++;
        }
        return (confirm (keyCount + " codes will be added to the database."));
      }

      // function initForm (form) {
      //   var info = "Each row contains one code."
      //   if (${param.KEYPARTS} == 1) {
      //     info += " (The codes are single-part. The separator character is not used.)";
      //   } else {
      //     info += " Each code should have ${param.KEYPARTS} parts. Each part should be separated by ";
      //     switch ('${param.SEPARATOR}') {
      //       case ' ':
      //         info += " a space character ('&nbsp;').";
      //       break;
      //       case ',':
      //         info += " a comma (',').";
      //       break;
      //       case ';':
      //         info += " a semicolon (';').";
      //       break;
      //       default:
      //         info += "the character '${param.SEPARATOR}'";
      //       break;
      //     }
      //   }
      //   document.getElementById ("keyinfo").innerHTML = info;
      // }

      function submitNewKeysCodes (form) {
        if (isBlank (form.KEYLIST.value)) {
          alert ("No codes provided!");
          form.KEYLIST.focus ();
          return (false);
        }
        if (!checkKeyParts (form.KEYLIST.value, form.KEYPARTS.value, form.SEPARATOR.value)) {
          form.KEYLIST.focus ();
          return (false);
        }
        setFieldVisible ("main", false);
        setFieldVisible ("progress", true);
        form.submit ();
        return (true);
      }
    </script>
  </head>
  <body onload="initForm (document.keytables);">
    <!-- Blue background header -->
    <div class="blue-bg"></div>

    <!-- Start of body content -->
    <div class="main-raised">
      <div class="container-fluid body-content">
        <article class="section">
          <div class="row justify-content-start">
            <jsp:include page="includes/menuSidebar.jsp" />
            <div class="col-lg-10 col-md-12 page-title">
              <h4>Manage&nbsp;Activation&nbsp;Code&nbsp;Tables</h4>
              <p>Click on table name to edit existing tables.</p>
              <div class="content-box overflow-auto d-flex flex-column">
                <div name="tableframe" class="overflow-auto h-100" id="tableframe">
                  <form name="keytables" method="post" action="https://vendors-new.bmtmicro.com/servlets/Vendors.RegistrationKeys">
                    <input type="hidden" name="ACTION" value="-1" />
                    <input type="hidden" name="ROWTEMPLATEURL" value="https://vendors-new.bmtmicro.com/products-manage-activation-code-tables-tablerow.html" />
                    <input type="hidden" name="NEXT_PAGE" value="https://vendors-new.bmtmicro.com/products-manage-activation-code-tables-table.jsp">
                    <input type="hidden" name="ERROR_PAGE" value="https://vendors-new.bmtmicro.com/error-div.jsp">
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
  <script>$(document).ready(function(){ submitToDiv (document.keytables, 'tableframe'); });</script>
</html>