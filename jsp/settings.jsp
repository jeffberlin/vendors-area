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
    <link rel="stylesheet" href="https://vendors-new.bmtmicro.com/css/addPages.css"/>
    <link rel="stylesheet" href="https://vendors-new.bmtmicro.com/css/tabOptions.css"/>
    <script src="https://kit.fontawesome.com/35c40e6698.js"></script>
    <script src="https://secure.bmtmicro.com/Templates/util.js"></script>
    <script src="https://vendors-new.bmtmicro.com/js/vendors.js"></script>
    <style media="screen" type="text/css">
      .fa-plus-circle:hover {
        color: darkgreen;
      }
      .fa-plus-circle {
        color: green;
        font-size: 1.5rem;
        transition: all .2s ease;
      }
      .shrinkText {
        font-size: .9rem;
      }
      #fieldslist label {
        margin-right: .3rem;
        min-width: 4.3rem;
      }
      #fieldslist select {
        margin-right: .5rem;
        margin-bottom: 1rem;
      }
      .remove {
        margin-right: 3rem;
      }
      .buttons {
        margin-top: 1rem;
      }
      #fieldslist > div {
        width: 400px;
      }
    </style>
    <script>
      var fieldnamelist;
      function createField (index, selectedindex) {
        var fieldID = "field" + (index + 1);
        var spanElem = document.createElement ("div");
        spanElem.setAttribute ("id", fieldID);
        var labelElem = document.createElement ("label");
        labelElem.appendChild (document.createTextNode ("Field " + (index + 1) + ":"));
        spanElem.appendChild (labelElem);
        var selectElem = document.createElement ("select");
        selectElem.setAttribute ("id", "FIELDID");
        selectElem.setAttribute ("name", "FIELDID");
        spanElem.appendChild (selectElem);
        var optionElem = document.createElement ("option");
        optionElem.setAttribute ("value", "-1");
        selectElem.appendChild (optionElem);
        var list = fieldnamelist.split(",");
        for (var index = 0; index < list.length; index++) {
          optionElem = document.createElement ("option");
          optionElem.setAttribute ("value", "" + index);
          if (index == selectedindex) {
            optionElem.setAttribute ("selected", "selected");
          }
          optionElem.appendChild (document.createTextNode (list[index]));
          selectElem.appendChild (optionElem);
        }
        var buttonElem = document.createElement ("button");
        buttonElem.setAttribute ("class", "remove");
        buttonElem.setAttribute ("type", "button");
        buttonElem.setAttribute ("onclick", "removeField (\"" + fieldID + "\");");
        // buttonElem.appendChild (document.createTextNode ("X"));
        spanElem.appendChild (buttonElem);
        return (spanElem);
      }

      function initFields (lst, fnl) {
        if (fnl != null) {
          fieldnamelist = fnl;
        }
        var docFragment = document.createDocumentFragment ();
        var list = lst.split(",");
        for (var index = 0; index < list.length; index++) {
          docFragment.appendChild (createField (index, parseInt (list[index])));
        }
        var divID = "fieldslist";
        var oldDivElem = document.getElementById (divID);
        var newDivElem = document.createElement ("div");
        newDivElem.id = divID;
        newDivElem.appendChild (docFragment);
        newDivElem.setAttribute("class", "row");
        oldDivElem.parentNode.replaceChild (newDivElem, oldDivElem);
      }

      function addField () {
        var fieldsDiv = document.getElementById ("fieldslist");
        fieldsDiv.appendChild (createField (fieldsDiv.getElementsByTagName ("select").length, -1));
      }

      function relabel () {
        var labelElems = document.getElementById ("fieldslist").getElementsByTagName ("label");
        for (var i = 0; i < labelElems.length; i++) {
          labelElems[i].childNodes[0].nodeValue = "Field " + (i + 1) + ":";
        }
      }

      function removeField (id) {
        var spanElem = document.getElementById (id);
        spanElem.parentNode.removeChild (spanElem);
        relabel ();
      }

      function submitForm (form) {
        <c:if test = "${ !allowChanges }">
          alert ("You do not have permission to make changes.");
        </c:if>
        <c:if test = "${ allowChanges }">
          submitToAlert (form, 'The settings have been saved');
        </c:if>
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
            <div id="settings-page" class="col-lg-10 col-md-12 page-title">
              <c:catch var="errormsg">
                <c:import url="https://vendors-new.bmtmicro.com/servlets/Vendors.Account">
                  <c:param name="SESSIONID" value="${sessionid}" />
                  <c:param name="NEXT_PAGE" value = "https://vendors-new.bmtmicro.com/settings-page.jsp"/>
                  <c:param name="ERROR_PAGE" value = "https://vendors-new.bmtmicro.com/error-div.jsp"/>
                  <c:param name="ACTION" value = "1"/>
                </c:import>
              </c:catch>
              <%@ include file="/includes/catch.jsp" %>
            </div> <!-- end .col-lg-10 col-md-12 page-title -->
          </div> <!-- end .row justify-content-start -->
        </article>
      </div> <!-- end .container-fluid -->
      <jsp:include page="/includes/footer.jsp" />
    </div> <!-- end .main-raised -->
    <%@ include file="/includes/bootstrap_bottom_scripts.html" %>
  </body>
  <script>
    $('input[type=checkbox]').change(function(){ $(this).prev('input[type=hidden]').val (this.checked ? -1 : 0); });
  </script>
</html>
