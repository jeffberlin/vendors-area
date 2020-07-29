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
    <script language="javascript" type="text/javascript" src="https://secure.bmtmicro.com/Templates/util.js"></script>
    <script language="javascript" type="text/javascript" src="https://vendors-new.bmtmicro.com/js/vendors.js"></script>
    <script language="javascript" type="text/javascript" src="https://vendors-new.bmtmicro.com/js/tablesort.js"></script>
    <style media="screen" type="text/css">
      .fa-plus-circle:hover {
        color: darkgreen;
      }
      .fa-plus-circle {
        color: green;
        font-size: 1.5rem;
        transition: all .2s ease;
      }
      h6 {
        color: #195a7c;
        font-size: 1.15rem;
        letter-spacing: .5px;
      }
    </style>
    <script>
      function submitForm (action, target, nextpage, schemeid) {
        var form = document.shipping;
        form.ACTION.value = action;
        form.target = target;
        form.NEXT_PAGE.value = nextpage;
        form.SCHEMEID.value = schemeid;
        if (target == "_parent") {
					form.target = target;
					form.ERROR_PAGE.value = "https://vendors-new.bmtmicro.com/error.jsp";
					form.submit ();
				} else {
					submitToDiv (form, target);
				}
      }

      <c:if test = "${ allowChanges == 0 }">
        function addScheme() {
          alert("You do not have permission to add shipping cost schemes.");
        }
        function deleteScheme(schemeid) {
          alert("You do not have permission to delete shipping cost schemes.");
        }
      </c:if>

      <c:if test = "${ allowChanges == 1 }">
        function addScheme () {
          submitForm (0, "resultframe", "https://vendors-new.bmtmicro.com/manage-shipping-schemes-add.jsp");
        }

        function editScheme (schemeid) {
          submitForm (1, "resultframe", "https://vendors-new.bmtmicro.com/manage-shipping-schemes-edit.jsp", schemeid);
        }

        function deleteScheme (schemeid) {
          submitForm (2, "resultframe", "https://vendors-new.bmtmicro.com/manage-shipping-schemes-delete.jsp", schemeid);
        }

        function viewScheme (schemeid) {
          submitForm (3, "resultframe", "https://vendors-new.bmtmicro.com/manage-shipping-schemes-view.jsp", schemeid);
        }

        function regions () {
          submitForm (0, "_parent", "https://vendors-new.bmtmicro.com/regionsstart.html");
        }
      </c:if>

      // from ...add.jsp
      function createField (regionData) {
        var rda = regionData.split ("\f");
        if (rda.length >= 2) {
          var regionID   = rda[0];
          var regionName = rda[1];
          var regionFirstItem = (rda.length > 2) ? rda[2] : "";
          var regionNextItem  = (rda.length > 2) ? rda[3] : "";
          var regionProductID  = (rda.length > 2) ? rda[4] : "";
          var regionRowNum = "regionRow" + (document.getElementsByName ("REGIONID").length + 1);
          var spanElem = document.createElement ("span");
          spanElem.setAttribute ("id", regionRowNum);
          var labelElem = document.createElement ("label");
          labelElem.appendChild (document.createTextNode ("First Item: "));
          spanElem.appendChild (labelElem);
          var firstItemElem = document.createElement ("input");
          firstItemElem.setAttribute ("type", "text");
          firstItemElem.setAttribute ("name", "REGIONFIRSTITEM");
          firstItemElem.setAttribute ("size", "8");
          firstItemElem.setAttribute ("value", regionFirstItem);
          spanElem.appendChild (firstItemElem);
          spanElem.appendChild (document.createTextNode (" \u00A0\u00A0 "));
          labelElem = document.createElement ("label");
          labelElem.appendChild (document.createTextNode ("Next Item: "));
          spanElem.appendChild (labelElem);
          var nextItemElem = document.createElement ("input");
          nextItemElem.setAttribute ("type", "text");
          nextItemElem.setAttribute ("name", "REGIONNEXTITEM");
          nextItemElem.setAttribute ("size", "8");
          nextItemElem.setAttribute ("value", regionNextItem);
          spanElem.appendChild (nextItemElem);
          spanElem.appendChild (document.createTextNode ("\u00A0\u00A0"));
          labelElem = document.createElement ("label");
          labelElem.appendChild (document.createTextNode ("Ship PID: "));
          spanElem.appendChild (labelElem);
          var nextItemElem = document.createElement ("input");
          nextItemElem.setAttribute ("type", "text");
          nextItemElem.setAttribute ("name", "REGIONPRODUCTID");
          nextItemElem.setAttribute ("size", "8");
          nextItemElem.setAttribute("style", "margin-bottom: 1rem;");
          nextItemElem.setAttribute ("value", regionProductID);
          spanElem.appendChild (nextItemElem);
          spanElem.appendChild (document.createTextNode ("\u00A0\u00A0"));
          labelElem = document.createElement ("b");
          labelElem.appendChild (document.createTextNode (regionName));
          spanElem.appendChild (labelElem);
          var regionInputElem = document.createElement ("input");
          regionInputElem.setAttribute ("type", "hidden");
          regionInputElem.setAttribute ("name", "REGIONID");
          regionInputElem.setAttribute ("value", regionID);
          spanElem.appendChild (regionInputElem);
          spanElem.appendChild (document.createTextNode ("\u00A0"));
          var buttonElem = document.createElement ("button");
          buttonElem.setAttribute ("class", "remove");
          buttonElem.setAttribute ("type", "button");
          buttonElem.setAttribute ("onclick", "removeRegion (\"" + regionRowNum + "\");");
          // buttonElem.appendChild (document.createTextNode ("X"));
          spanElem.appendChild (buttonElem);
          spanElem.appendChild (document.createElement ("br"));
          document.getElementById ("regions").appendChild (spanElem);
        }
      }

      function initRegionSel () {
        var regions = "${param.REGIONLIST}".split ("\t");
        var usedregions = document.getElementsByName ("REGIONID");
        var select = document.getElementById ("REGIONSEL");
        var optionIdx = 0;
        for (var i = 0; i < regions.length; i++) {
          var region = regions[i].split ("\f");
          if (region.length == 2) {
            var used = false;
            for (var j = 0; j < usedregions.length; j++) {
              if (region[0] == usedregions[j].value) {
                used = true;
                break;
              }
            }
            if (!used) {
              select.options[optionIdx++] = new Option (region[1], regions[i]);
            }
          }
        }
        for ( ;select.options.length > optionIdx; select.options[select.options.length - 1] = null);
      }

      function addRegion () {
        var select = document.getElementById ("REGIONSEL");
        if (select.options.length > 0) {
          createField (select.value);
          initRegionSel ();
        } else {
          if (document.getElementsByName ("REGIONID").length == 0) {
            alert ("No regions have been set up yet. Click the Manage Regions button to set up regions first.");
          } else {
            alert ("All existing regions have shipping cost set. Click the Manage Regions button to add more regions.");
          }
        }
      }

      function removeRegion (id) {
        var spanElem = document.getElementById (id);
        spanElem.parentNode.removeChild (spanElem);
        initRegionSel ();
      }

      function initForm (form){
        // Important: We need to use hidden fields to submit checkbox values, as the servlets will use default values if the
        // field is not present. (An unchecked checkbox constitutes a non-existent field).
        var shippingcosts = "${param.SHIPPINGCOSTLIST}".split ("\t");
        for (var i = 0; i < shippingcosts.length; createField (shippingcosts[i++]));
        initRegionSel ();
      }

      function checkValuePair (firstField, nextField) {
        if (isBlank (firstField.value) || isNaN (firstField.value) || (parseFloat (firstField.value) < 0.01)) {
          alert ("You must specify a valid default shipping cost for the first item!");
          firstField.focus ();
          return (false);
        }
        if (isBlank (nextField.value) || isNaN (nextField.value) || (parseFloat (nextField.value) < 0)) {
          alert ("You must specify a valid default shipping cost for subsequent item(s)!");
          nextField.focus ();
          return (false);
        }
        return (true);
      }

      function submitForm (form) {
        // Important: We need to use hidden fields to submit checkbox values, as the servlets will use default values if the
        // field is not present. (An unchecked checkbox constitutes a non-existent field).
        form.NAME.value = trim (form.NAME.value);
        if (isBlank (form.NAME.value)) {
          alert ("You must name the shipping cost scheme!");
          form.NAME.focus ();
          return (false);
        }
        if ((form.NAME.value != "${param.NAME}") && ("${param.NAMELIST}".split ("\t").indexOf (form.NAME.value) != -1)) {
          alert ("A shipping cost scheme with that name already exists!");
          form.NAME.focus ();
          return (false);
        }
        if (!checkValuePair (form.FIRSTITEM, form.NEXTITEM)) {
          return (false);
        }
        for (var i = 0; i < GetFieldCount (form.REGIONFIRSTITEM); i++) {
          if (!checkValuePair (GetIndexedField (form.REGIONFIRSTITEM, i), GetIndexedField (form.REGIONNEXTITEM, i))) {
            return (false);
          }
        }
        form.submit ();
        return (true);
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
              <h4>Manage Shipping Schemes</h4>
              <p>Use this section to define shipping schemes that can be linked to products subject to a shipping charge.</p>
              <div class="content-box d-flex flex-column overflow-auto">
                <div name="tableframe" class="overflow-auto h-100" id="tableframe">
                  <jsp:include page="./manage-shipping-schemes-table.jsp" />
                </div>
                <div name="resultframe" id="resultframe"></div>
              </div> <!-- end .content-box -->
            </div> <!-- end .col-lg-10 -->
          </div> <!-- end first .row -->
        </article>
      </div> <!-- end .container-fluid -->
      <jsp:include page="includes/footer.jsp" />
    </div> <!-- end .main-raised -->
    <%@ include file="/includes/bootstrap_bottom_scripts.html" %>
  </body>
  <script>$(document).ready(function(){ submitToDiv (document.shipping, 'tableframe'); });</script>
</html>
