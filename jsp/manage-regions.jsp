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
    <style media="screen" type="text/css">
      td[option] {
        text-align: center;
      }
      h6 {
        letter-spacing: .5px;
        font-size: 1.15rem;
        color: #195a7c;
      }
      #COUNTRYLIST, #SELECTEDLIST {
        margin-bottom: 1rem;
      }
    </style>
    <script>
      function submitForm (action, target, nextpage, regionid) {
        var form = document.regions;
        form.ACTION.value = action;
        form.target = target;
        form.NEXT_PAGE.value = nextpage;
        // form.ERROR_PAGE.value = (target == "_parent") ? "https://vendors-new.bmtmicro.com/error.jsp" : "https://vendors-new.bmtmicro.com/error-div.jsp";
        form.REGIONID.value = regionid;
        if (target == "_parent") {
					form.target = target;
					form.ERROR_PAGE.value = "https://vendors-new.bmtmicro.com/error.jsp";
					form.submit ();
				} else {
					submitToDiv (form, target);
				}
      }

      function addRegion() {
        <c:if test="${ allowChanges == 0 }">
          alert("You do not have permission to add regions.");
        </c:if>
        <c:if test = "${ allowChanges != 0 }">
          submitForm (0, "resultframe", "https://vendors-new.bmtmicro.com/manage-regions-add.jsp");
        </c:if>
      }

      function deleteRegion (regionid) {
        <c:if test="${ allowChanges == 0 }">
          alert("You do not have permission to delete regions.");
        </c:if>
        <c:if test = "${ allowChanges != 0 }">
          submitForm (2, "resultframe", "https://vendors-new.bmtmicro.com/manage-regions-delete.jsp", regionid);
        </c:if>
      }

      function editRegion (regionid) {
        submitForm (1, "resultframe", "https://vendors-new.bmtmicro.com/manage-regions-edit.jsp", regionid);
      }

      function viewRegion (regionid) {
        submitForm (3, "resultframe", "https://vendors-new.bmtmicro.com/manage-regions-view.jsp", regionid);
      }

      function shippingCosts () {
        submitForm (0, "_parent", "https://vendors-new.bmtmicro.com/manage-shipping-schemes.jsp");
      }

      // from regions_add.html
      function submitRegion (form) {
        // Important: We need to use hidden fields to submit checkbox values, as the servlets will use default values if the
        // field is not present. (An unchecked checkbox constitutes a non-existent field).
        form.NAME.value = trim (form.NAME.value);
        if (isBlank (form.NAME.value)) {
          alert ("You must name the region!");
          form.NAME.focus ();
          return (false);
        }
        if ((form.NAME.value != "${param.NAME}") && ("${param.NAMELIST}".split ("\t").indexOf (form.NAME.value) != -1)) {
          alert ("A region with that name already exists!");
          form.NAME.focus ();
          return (false);
        }
        form.SELECTEDCOUNTRIES.value = getCommaSeparatedSelectorValues (form.SELECTEDLIST);
        form.submit ();
        return (true);
      }

      function addCountry (form) {
        moveSelectedListItems (form.SELECTEDLIST, form.COUNTRYLIST);
      }

      function removeCountry (form) {
        moveSelectedListItems (form.COUNTRYLIST, form.SELECTEDLIST);
      }

      function addAllCountries (form) {
        moveAllListItems (form.SELECTEDLIST, form.COUNTRYLIST);
      }

      function removeAllCountries (form) {
        moveAllListItems (form.COUNTRYLIST, form.SELECTEDLIST);
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
              <h4>Manage Regions</h4>
              <p>Use this section to combine groups of countries into regions. Regions can be used for regional pricing of product or shipping costs.</p>
              <div class="content-box d-flex flex-column overflow-auto">
                <div name="tableframe" class="overflow-auto h-100" id="tableframe">
                  <form name="regions" method="post" action="https://vendors-new.bmtmicro.com/servlets/Vendors.WorldRegions">
                    <input type="hidden" name="ACTION" value="-1" />
                    <input type="hidden" name="MAXAMOUNT" value="" />
                    <input type="hidden" name="ROWTEMPLATEURL" value="https://vendors-new.bmtmicro.com/manage-regions-tablerow.html" />
                    <input type="hidden" name="NEXT_PAGE" value="https://vendors-new.bmtmicro.com/manage-regions-table.jsp" />
                    <input type="hidden" name="ERROR_PAGE" value="https://vendors-new.bmtmicro.com/error.jsp" />
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
  <script>$(document).ready(function(){ submitToDiv (document.regions, 'tableframe'); });</script>
</html>
