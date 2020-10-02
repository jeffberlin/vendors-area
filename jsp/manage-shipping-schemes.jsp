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
    <script src="https://kit.fontawesome.com/35c40e6698.js"></script>
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
      td[option] {
        text-align: center;
      }
      .item-info span {
        margin-right: 1rem;
      }
      .item-info span:last-child {
        margin-right: 0;
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

      function addScheme() {
        <c:if test = "${ allowChanges == 0 }">
          alert("You do not have permission to add shipping cost schemes.");
        </c:if>
        <c:if test = "${ allowChanges != 0 }">
          submitForm (0, "resultframe", "https://vendors-new.bmtmicro.com/manage-shipping-schemes-add.jsp");
        </c:if>
      }

      function deleteScheme(schemeid) {
        <c:if test = "${ allowChanges == 0 }">
          alert("You do not have permission to delete shipping cost schemes.");
        </c:if>
        <c:if test = "${ allowChanges != 0 }">
          submitForm (2, "resultframe", "https://vendors-new.bmtmicro.com/manage-shipping-schemes-delete.jsp", schemeid);
        </c:if>
      }

      function editScheme (schemeid) {
        submitForm (1, "resultframe", "https://vendors-new.bmtmicro.com/manage-shipping-schemes-edit.jsp", schemeid);
      }

      function viewScheme (schemeid) {
        submitForm (3, "resultframe", "https://vendors-new.bmtmicro.com/manage-shipping-schemes-view.jsp", schemeid);
      }

      function regions () {
        submitForm (0, "_parent", "https://vendors-new.bmtmicro.com/manage-regions.jsp");
      }

      // from shipping_view.html
      function createRegionViewField (regionData) {
        var rda = regionData.split ("\f");
        if (rda.length >= 2) {
          var regionID = rda[0];
          var regionName = rda[1];
          var regionFirstItem = rda[2];
          var regionNextItem = rda[3];
          var regionProductID = rda[4];
          var spanElem = document.createElement ("span");
          var labelElem = document.createElement ("label");
          labelElem.appendChild (document.createTextNode ("First Item: " + regionFirstItem));
          spanElem.appendChild (labelElem);
          spanElem.appendChild (document.createTextNode (" \u00A0\u00A0 "));
          spanElem.appendChild (document.createElement("br"));
          labelElem = document.createElement ("label");
          labelElem.appendChild (document.createTextNode ("Next Item: " + regionNextItem));
          labelElem.setAttribute ("width", "150px");
          spanElem.appendChild(document.createElement("br"));
          spanElem.appendChild (labelElem);
          spanElem.appendChild (document.createTextNode ("\u00A0\u00A0"));
          labelElem = document.createElement ("label");
          labelElem.appendChild (document.createTextNode ("Ship PID: " + regionProductID));
          labelElem.setAttribute ("width", "150px");
          spanElem.appendChild (labelElem);
          spanElem.appendChild (document.createTextNode ("\u00A0\u00A0"));
          labelElem = document.createElement ("b");
          labelElem.appendChild (document.createTextNode (regionName));
          spanElem.appendChild (labelElem);
          spanElem.appendChild (document.createElement ("br"));
          document.getElementById ("regions").appendChild (spanElem);
        }
      }

      // function initForm (form){
        // Important: We need to use hidden fields to submit checkbox values, as the servlets will use default values if the
        // field is not present. (An unchecked checkbox constitutes a non-existent field).
      //   var shippingcosts = "${param.SHIPPINGCOSTLIST}".split ("\t");
      //   for (var i = 0; i < shippingcosts.length; createRegionViewField (shippingcosts[i++]));
      //   for (var i = 0; i < shippingcosts.length; createField (shippingcosts[i++]));
      //   initRegionSel ();
      // }
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
                  <form name="shipping" method="post" action="https://vendors-new.bmtmicro.com/servlets/Vendors.ShippingCost">
                    <input type="hidden" name="ACTION" value="-1" />
                    <input type="hidden" name="MAXAMOUNT" value="" />
                    <input type="hidden" name="SCHEMEID" value="">
                    <input type="hidden" name="ROWTEMPLATEURL" value="https://vendors-new.bmtmicro.com/manage-shipping-schemes-tablerow.html" />
                    <input type="hidden" name="NEXT_PAGE" value="https://vendors-new.bmtmicro.com/manage-shipping-schemes-table.jsp" />
                    <input type="hidden" name="ERROR_PAGE" value="https://vendors-new.bmtmicro.com/error-div.jsp" />
                  </form>
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
