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
    <link rel="stylesheet" href="https://vendors-new.bmtmicro.com/css/addPages.css"/>
    <link rel="stylesheet" href="https://vendors-new.bmtmicro.com/css/tabOptions.css"/>
    <script src="https://kit.fontawesome.com/35c40e6698.js"></script>
    <script language="javascript" type="text/javascript" src="https://secure.bmtmicro.com/Templates/util.js"></script>
    <script language="javascript" type="text/javascript" src="https://vendors-new.bmtmicro.com/js/vendors.js"></script>
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
      .toggle-section {
         margin-bottom: 1rem;
         padding-left: 10px;
      }
      .toggle-section h6 {
         margin-bottom: .3rem;
         color: #efa900;
      }
      #fileFields label {
        margin-right: .3rem;
      }
      #DOWNLOADFILEID, #DOWNLOADFILEDESCRIPTION {
        margin-right: .5rem;
      }
      #fileFields span::after {
        content: '\A';
        white-space: pre;
      }
    </style>
    <script>
      var vendorFileList = ${param.VENDORDFL};
      var productFileList = ${param.PRODUCTDFL};

      function createFileField (index, selectedFileID, description) {
        var fieldID = "fileField" + (index + 1);
        var spanElem = document.createElement ("span");
        spanElem.setAttribute ("id", fieldID);
        var labelElem = document.createElement ("label");
        labelElem.appendChild (document.createTextNode ("File " + (index + 1) + ":"));
        spanElem.appendChild (labelElem);
        var selectElem = document.createElement ("select");
        selectElem.setAttribute ("id", "DOWNLOADFILEID");
        selectElem.setAttribute ("name", "DOWNLOADFILEID");
        spanElem.appendChild (selectElem);
        var optionElem = document.createElement ("option");
        optionElem.setAttribute ("value", "0");
        selectElem.appendChild (optionElem);
        for (var i = 0; i < vendorFileList.length; i++) {
          var f = vendorFileList[i];
          optionElem = document.createElement ("option");
          optionElem.setAttribute ("value", f.id);
          if (f.id == selectedFileID) {
            optionElem.setAttribute ("selected", "selected");
          }
          optionElem.appendChild (document.createTextNode (f.name));
          selectElem.appendChild (optionElem);
        }
        labelElem = document.createElement ("label");
        labelElem.appendChild (document.createTextNode ("Description:"));
        spanElem.appendChild (labelElem);
        var textElem = document.createElement ("input");
        textElem.setAttribute ("type", "text");
        textElem.setAttribute ("id", "DOWNLOADFILEDESCRIPTION");
        textElem.setAttribute ("name", "DOWNLOADFILEDESCRIPTION");
        textElem.setAttribute ("value", (description == null) ? "" : description);
        spanElem.appendChild (textElem);
        var buttonElem = document.createElement ("button");
        buttonElem.setAttribute ("class", "remove");
        buttonElem.setAttribute ("type", "button");
        buttonElem.setAttribute ("onclick", "removeFileField (\"" + fieldID + "\");");
        // buttonElem.appendChild (document.createTextNode ("X"));
        spanElem.appendChild (buttonElem);
        spanElem.style.clear = "left";
        return (spanElem);
      }

      function addFileField () {
        var fieldsDiv = document.getElementById ("fileFields");
        fieldsDiv.appendChild (createFileField (fieldsDiv.getElementsByTagName ("select").length, 0));
      }

      function relabelFileFields () {
        var spanElems = document.getElementById ("fileFields").getElementsByTagName ("span");
        for (var i = 0; i < spanElems.length; i++) {
          var labelElems = spanElems[i].getElementsByTagName ("label");
          labelElems[0].childNodes[0].nodeValue = "File " + (i + 1) + ":";
        }
      }

      function removeFileField (id) {
        var spanElem = document.getElementById (id);
        spanElem.parentNode.removeChild (spanElem);
        relabelFileFields ();
        var spanElems = document.getElementById ("fileFields").getElementsByTagName ("span");
        if (spanElems.length == 0) {
          addFileField ();
          setFieldVisible ("downloadfile", false);
        }
      }

      function initFileFields () {
        var docFragment = document.createDocumentFragment ();
        if (productFileList.length == 0) {
          docFragment.appendChild (createFileField (0, 0));
        }
        for (var i = 0; i < productFileList.length; i++) {
          docFragment.appendChild (createFileField (i, productFileList[i].id, productFileList[i].desc));
        }
        var divID = "fileFields";
        var oldDivElem = document.getElementById (divID);
        var newDivElem = document.createElement ("div");
        newDivElem.id = divID;
        newDivElem.appendChild (docFragment);
        oldDivElem.parentNode.replaceChild (newDivElem, oldDivElem);
      }

      function enableButton (buttonid, enabled) {
        document.getElementById (buttonid).disabled = (enabled === false);
      }

      function toggleField (field) {
        var e = document.getElementById (field);
        if (e.style.display == '') {
          e.style.display = 'none';
        } else {
          e.style.display = '';
          e.focus ();
        }
      }

      function testURL (field, url) {
        if (isBlank (url)) {
          url = field.value;
        }
        if (isBlank (url) || !isValidURL (url)) {
          alert ("Please enter a full URL starting with \"http://\" or \"https://\"");
          field.focus ();
          return (false);
        }
        window.open (url)
        return (true);
      }

      function initForm (form) {
        // Important: We need to use hidden fields to submit checkbox values, as the servlets will use default values if the
        // field is not present. (An unchecked checkbox constitutes a non-existent field).
        // initField (form, "SHOWCDOPTION_CHK",        "##SHOWCDOPTION##");
        // initField (form, "SHOWDISCOUNTFIELD_CHK",   "##SHOWDISCOUNTFIELD##");
        // initField (form, "SHOWREGNAMEFIELD_CHK",    "##SHOWREGNAMEFIELD##");
        // initField (form, "SHOWEMAILFIELD_CHK",      "##SHOWEMAILFIELD##");
        // initField (form, "QUANTITYFIXED_CHK",       "##QUANTITYFIXED##");
        // initField (form, "NEEDSORDERPARAMETERS_CHK","##NEEDSORDERPARAMETERS##");
        // initField (form, "NOTIFYVENDOR_CHK",        "##NOTIFYVENDOR##");
        //initField (form, "ACTIVE_CHK",              "##ACTIVE##");
        // initField (form, "SHIPPED_CHK",             "##SHIPPED##");
        // initField (form, "USEONEKEY_CHK",           "##USEONEKEY##");
        // initField (form, "USEONEKEY_CHK2",          "##USEONEKEY##");
        // initField (form, "INCLUDEONAPLIST_CHK",     "##INCLUDEONAPLIST##");
        // initField (form, "USEPRODUCTAIDCOOKIE_CHK", "##USEPRODUCTAIDCOOKIE##");
        // initField (form, "TICKETCHOICE_CHK",        "##TICKETCHOICE##");
        // initField (form, "RECURAFFILIATE_CHK",      "##RECURAFFILIATE##");
        // initField (form, "PRICEINCLUDESVAT_CHK",    "##PRICEINCLUDESVAT##");
        // initField (form, "PRICEINCLUDESGST_CHK",    "##PRICEINCLUDESGST##");
        // initField (form, "PLATFORM",                "##PLATFORM##");
        initField (form, "CATEGORY",                "${param.CATEGORY}");
        // initField (form, "KEYTABLEID",              "##KEYTABLEID##");
        // initField (form, "DISCOUNTSCHEMEID",        "##DISCOUNTSCHEMEID##");
        // initField (form, "DOWNLOADEXPDAYS",         "##DOWNLOADEXPDAYS##");
        // initField (form, "KEYGENCHARSET",           "##KEYGENCHARSET##");
        // initField (form, "RECURFREQUENCY",          "##RECURFREQUENCY##");
        // initField (form, "RECURDELAY",              "##RECURDELAY##");
        // initField (form, "SHIPPINGCOSTSCHEMEID",    "##SHIPPINGCOSTSCHEMEID##");
        // setFieldVisible ("shipping", ("##SHIPPED##" != 0));
        // setFieldVisible ("downloadfile",  productFileList.length != 0);
        // setFieldVisible ("keygenerator",  !isBlank ("##KEYGENERATOR##"));
        // setFieldVisible ("regkeytable",   !isBlank ("##KEYTABLEID##"));
        // setFieldVisible ("discounts",     !isBlank ("##DISCOUNTSCHEMEID##"));
        // setFieldVisible ("affiliateinfo", !isBlank ("##AFFILIATEPERCENTAGE## ##VENDORPRODUCTURL## ##SECUREORDERURL## ##DEMOURL##"));
        // setFieldVisible ("ordernotifications", !isBlank ("##NOTIFICATIONEMAILS## ##NOTIFICATIONURL##"));
        // setFieldVisible ("subscriptionhandling", ("##RECURFREQUENCY##" != "0") || ("##TICKETCHOICE##" != "0") || ("##RECURDELAY##" != "0"));
        enableButton    ("update1", "update2", "update3", "update4", "update5", "update6");
        if (isBlank (form.SECUREORDERURL.value)) {
          form.SECUREORDERURL.value = "Use default";
        }

        var idx = 1;
        if ("${param.CATEGORY}" == "22") {
          form.CATEGORY.options[idx++] = new Option ("XXX-Adult Software", "22");
        } else {
          form.CATEGORY.options[idx++] = new Option ("AutoCad", "1");
          form.CATEGORY.options[idx++] = new Option ("Business", "2");
          form.CATEGORY.options[idx++] = new Option ("Communications", "3");
          form.CATEGORY.options[idx++] = new Option ("Desktop Enhancements", "4");
          form.CATEGORY.options[idx++] = new Option ("Editors and Viewers", "5");
          form.CATEGORY.options[idx++] = new Option ("Educational Software", "6");
          form.CATEGORY.options[idx++] = new Option ("Encryption and Archiving", "7");
          form.CATEGORY.options[idx++] = new Option ("File and Disk Utilities", "8");
          form.CATEGORY.options[idx++] = new Option ("Games and Diversions", "9");
          form.CATEGORY.options[idx++] = new Option ("Internet Software", "10");
          form.CATEGORY.options[idx++] = new Option ("Merchandise", "11");
          form.CATEGORY.options[idx++] = new Option ("Multimedia Software", "12");
          form.CATEGORY.options[idx++] = new Option ("OS/2", "14");
          form.CATEGORY.options[idx++] = new Option ("Organisers, Databases, PIM's", "15");
          form.CATEGORY.options[idx++] = new Option ("Philosophy and Religon", "17");
          form.CATEGORY.options[idx++] = new Option ("Service or Membership", "18");
          form.CATEGORY.options[idx++] = new Option ("Sewing Products", "19");
          form.CATEGORY.options[idx++] = new Option ("Software Development Tools", "20");
          form.CATEGORY.options[idx++] = new Option ("System Tools", "21");
          form.CATEGORY.options[idx++] = new Option ("Other", "16");
        }
        initField (form, "CATEGORY", "${param.CATEGORY}");
        initFileFields ();
      }

      function submitForm (form) {
        // Important: We need to use hidden fields to submit checkbox values, as the servlets will use default values if the
        // field is not present. (An unchecked checkbox constitutes a non-existent field).
        // copyField (form, "SHOWCDOPTION",        "SHOWCDOPTION_CHK");
        // copyField (form, "SHOWDISCOUNTFIELD",   "SHOWDISCOUNTFIELD_CHK");
        // copyField (form, "SHOWREGNAMEFIELD",    "SHOWREGNAMEFIELD_CHK");
        // copyField (form, "SHOWEMAILFIELD",      "SHOWEMAILFIELD_CHK");
        // copyField (form, "QUANTITYFIXED",       "QUANTITYFIXED_CHK");
        // copyField (form, "NEEDSORDERPARAMETERS","NEEDSORDERPARAMETERS_CHK");
        // copyField (form, "ACTIVE",              "ACTIVE_CHK");
        // copyField (form, "SHIPPED",             "SHIPPED_CHK");
        // copyField (form, "NOTIFYVENDOR",        "NOTIFYVENDOR_CHK");
        // copyField (form, "USEONEKEY",           "USEONEKEY_CHK");
        // copyField (form, "INCLUDEONAPLIST",     "INCLUDEONAPLIST_CHK");
        // copyField (form, "USEPRODUCTAIDCOOKIE", "USEPRODUCTAIDCOOKIE_CHK");
        // copyField (form, "TICKETCHOICE",        "TICKETCHOICE_CHK");
        // copyField (form, "RECURAFFILIATE",      "RECURAFFILIATE_CHK");
        // copyField (form, "PRICEINCLUDESVAT",     "PRICEINCLUDESVAT_CHK");
        // copyField (form, "PRICEINCLUDESGST",     "PRICEINCLUDESGST_CHK");

        if ("${param.DATEDISCONTINUED}" != "") {
          alert ("This product has been closed. Please contact vendors@bmtmicro.com");
          return (false);
        }
        if (isBlank (form.PRODUCTNAME.value)) {
          alert ("You must provide a Product Name!");
          form.PRODUCTNAME.focus ();
          return (false);
        }
        if ((form.AFFILIATEPERCENTAGE.value < 0) || (form.AFFILIATEPERCENTAGE.value > 100)) {
          setFieldVisible ('affiliateinfo');
          alert ("Invalid Percentage, please correct");
          form.AFFILIATEPERCENTAGE.focus ();
          return (false);
        }
        if (!isBlank (form.SECUREORDERURL.value) && (form.SECUREORDERURL.value != "Use default") && !isValidURL (form.SECUREORDERURL.value)) {
          setFieldVisible ('affiliateinfo');
          alert ("Please enter a full URL starting with \"http://\" or \"https://\"");
          form.SECUREORDERURL.focus ();
          return (false);
        }
        if (!isBlank (form.DEMOURL.value) && !isValidURL (form.DEMOURL.value)) {
          setFieldVisible ('affiliateinfo');
          alert ("Please enter a full URL starting with \"http://\" or \"https://\"");
          form.DEMOURL.focus ();
          return (false);
        }
        if (!isBlank (form.VENDORPRODUCTURL.value) && !isValidURL (form.VENDORPRODUCTURL.value)) {
          setFieldVisible ('affiliateinfo');
          alert ("Please enter a full URL starting with \"http://\" or \"https://\"");
          form.VENDORPRODUCTURL.focus ();
          return (false);
        }
        if (!isBlank (form.NOTIFICATIONURL.value) && !isValidURL (form.NOTIFICATIONURL.value)) {
          setFieldVisible ('ordernotifications');
          alert ("Please enter a full URL starting with \"http://\" or \"https://\"");
          form.NOTIFICATIONURL.focus ();
          return (false);
        }
        if (form.NOTIFICATIONEMAILS.value.indexOf (",") != -1) {
          setFieldVisible ('ordernotifications');
          alert ("Notification e-mail addresses should be separated with a space, not a comma!");
          form.NOTIFICATIONEMAILS.focus ();
          return (false);
        }
        if (!isBlank (form.NOTIFICATIONEMAILS.value) && !isValidEmailList (form.NOTIFICATIONEMAILS.value)) {
          setFieldVisible ('ordernotifications');
          alert ("You must provide a VALID e-mail address!");
          form.NOTIFICATIONEMAILS.focus ();
          return (false);
        }
        if (isBlank (form.PRICE_USD.value)) {
          alert ("Please enter a price for your product!");
          form.PRICE_USD.focus ();
          return (false);
        }
        if (!isValidDollarAmount (form.PRICE_USD.value)) {
          alert ("Please do not include $ in product price. The price must be specified with numbers only, e.g. 15.25 for fifteen dollars twentyfive cents");
          form.PRICE_USD.focus ();
          return (false);
        }
        switch (form.CURRENCY.value) {
          case "USD":
          form.PRICE_EUR.value = "";
          form.PRICE_GBP.value = "";
          form.PRICE_CAD.value = "";
          form.PRICE_AUD.value = "";
          break;
          case "EUR":
          form.PRICE_EUR.value = form.PRICE_USD.value;
          form.PRICE_GBP.value = "";
          form.PRICE_CAD.value = "";
          form.PRICE_AUD.value = "";
          form.PRICE_USD.value = "";
          break;
          case "GBP":
          form.PRICE_EUR.value = "";
          form.PRICE_GBP.value = form.PRICE_USD.value;
          form.PRICE_CAD.value = "";
          form.PRICE_AUD.value = "";
          form.PRICE_USD.value = "";
          break;
          case "CAD":
          form.PRICE_EUR.value = "";
          form.PRICE_GBP.value = "";
          form.PRICE_CAD.value = form.PRICE_USD.value;
          form.PRICE_AUD.value = "";
          form.PRICE_USD.value = "";
          break;
          case "AUD":
          form.PRICE_GBP.value = "";
          form.PRICE_EUR.value = "";
          form.PRICE_CAD.value = "";
          form.PRICE_AUD.value = form.PRICE_USD.value;
          form.PRICE_USD.value = "";
          break;
        }
        if ((form.RECURDELAY.value < 0) || (form.RECURDELAY.value > 45)) {
          setFieldVisible ('subscriptionhandling');
          alert ("Subscriptions must start billing within 45 days!");
          form.RECURDELAY.focus ();
          return (false);
        }
        if ((form.SECUREORDERURL.value == "Use default") || (form.SECUREORDERURL.value == "${param.DEFAULTSECUREURL}")) {
          form.SECUREORDERURL.value = "";
        }
        form.submit ();
        return (true);
      }
    </script>
  </head>
  <body onload="initForm (document.productform);">
    <!-- Blue background header -->
    <div class="blue-bg"></div>

    <!-- Start of body content -->
    <div class="main-raised">
      <div class="container-fluid body-content">
        <article class="section">
          <div class="row justify-content-start">
            <jsp:include page="includes/menuSidebar.jsp"/>
            <div class="col-lg-10 col-md-12 page-title">
              <h4>Add&nbsp;Product</h4>
              <p>Enter product information using the tabs below.</p>
              <ul class="nav nav-tabs" id="myTab" role="tablist">
                <li class="nav-item">
                  <a class="nav-link active" id="basicInfo-tab" data-toggle="tab" href="#basicInfo" role="tab" aria-controls="basic info" aria-selected="true">
                    Basic Info
                  </a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" id="productFormat-tab" data-toggle="tab" href="#productFormat" role="tab" aria-controls="product format" aria-selected="true">
                    Product Format
                  </a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" id="options-tab" data-toggle="tab" href="#options" role="tab" aria-controls="shopping cart options" aria-selected="true">
                    Shopping Cart
                  </a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" id="fulfillment-tab" data-toggle="tab" href="#fulfillment" role="tab" aria-controls="fulfillment info" aria-selected="true">
                    Fulfillment
                  </a>
                </li>
              </ul>
              <div class="tab-box">
                <form name="productform" method="post" action="https://vendors-new.bmtmicro.com/servlets/Vendors.Products" />
                  <input type="hidden" name="ERROR_PAGE" value="https://vendors-new.bmtmicro.com/error.jsp" />
                  <input type="hidden" name="ACTION" value="10" />
                  <input type="hidden" name="NEXT_PAGE" value="https://vendors-new.bmtmicro.com/products-manage.jsp" />
                  <input type="hidden" name="VENDORID" value="${param.VENDORID}" />
                  <div class="tab-content" id="myTabContent">
                    <div class="tab-pane fade show active" id="basicInfo" role="tabpanel" aria-labelledby="basicInfo-tab">
                      <h5>Basic&nbsp;Info</h5>
                      <p>Enter basic product info in the fields below.</p>
                      <span>
                        <label>Product&nbsp;Name:</label>
                        <input type="text" name="PRODUCTNAME" value="${param.PRODUCTNAME}" style="margin-right: .5rem; margin-bottom: 1rem;">
                      </span>
                      <br>
                      <span>
                        <label>Product&nbsp;Price:</label>
                        <input type="text" name="PRICE_USD" size="8" />
                        <select name="CURRENCY" onmousewheel="return false;" style="margin-right: .5rem; margin-bottom: 1rem;">
                          <option value="USD"<c:if test="${param.CURRENCY=='USD'}"> selected</c:if>>USD</option>
                          <option value="EUR"<c:if test="${param.CURRENCY=='EUR'}"> selected</c:if>>EUR</option>
                          <option value="GBP"<c:if test="${param.CURRENCY=='GBP'}"> selected</c:if>>GBP</option>
                          <option value="CAD"<c:if test="${param.CURRENCY=='CAD'}"> selected</c:if>>CAD</option>
                          <option value="AUD"<c:if test="${param.CURRENCY=='AUD'}"> selected</c:if>>AUD</option>
                        </select>
                        <input type="hidden" name="PRICE_EUR" />
                        <input type="hidden" name="PRICE_GBP" />
                        <input type="hidden" name="PRICE_CAD" />
                        <input type="hidden" name="PRICE_AUD" />
                      </span>
                      <span style="margin-right: .7rem;">
                        <input type="hidden" name="PRICEINCLUDESVAT" value="${param.PRICEINCLUDESVAT}" />
                        <input type="checkbox"<c:if test="${param.PRICEINCLUDESVAT!=0}"> checked</c:if>/>&nbsp;The price includes VAT
                      </span>
                      <span>
                        <input type="hidden" name="PRICEINCLUDESGST" value="${param.PRICEINCLUDESGST}" />
                        <input type="checkbox"<c:if test="${param.PRICEINCLUDESGST!=0}"> checked</c:if>/>&nbsp;The price includes GST
                      </span>
                      <br clear="all">
                      <span>
                        <label style="margin-bottom: .2rem;">Short&nbsp;Description:</label>
                        <br>
                        <textarea name="DESCRIPTION" id="DESCRIPTION" onkeydown="textLimiterAndCounter(this.form.DESCRIPTION,this.form.CHARSREMAINING,1024);" onkeyup="textLimiterAndCounter(this.form.DESCRIPTION,this.form.CHARSREMAINING,1024);" cols="50" rows="4" placeholder="Type a message">${param.DESCRIPTION}</textarea>
                      </span>
                      <span>
                        <label style="font-size: .8rem;">Characters&nbsp;remaining:</label>
                        <input type="text" name="CHARSREMAINING" value="" size="4" readonly="readonly" style="border: none; padding: .25rem 0rem; color: red; margin-bottom: 1rem;" />
                      </span>
                      <br clear="all">
                      <span>
                        <label>Keywords:</label>
                        <input id="KEYWORDS" name="KEYWORDS" size="30" value="${param.KEYWORDS}" title=" Provide any keywords for your product (Limit 50 characters)" placeholder="Limit 50 characters" style="margin-bottom: 2rem;" />
                      </span>
                      <h5>Product&nbsp;Category</h5>
                      <p>Please select the category that most fits your product.</p>
                      <span>
                        <label>Category:</label>
                        <select name="CATEGORY" style="margin-bottom: 2rem;"></select>
                      </span>
                      <br>
                      <button id="toProductFormat" class="save-btn" type="button">Next</button>
                    </div> <!-- end .tab-pane -->
                    <div class="tab-pane fade" id="productFormat" role="tabpanel" aria-labelledby="productFormat-tab">
                      <h5>Product&nbsp;Platform</h5>
                      <p>For products installed on electronical devices.</p>
                      <span>
                        <label>Platform:</label>
                        <select name="PLATFORM" style="margin-bottom: 2rem;">
                          <option value="N/A"<c:if test="${param.PLATFORM=='N/A'}"> selected</c:if>>Not Applicable</option>
                          <option value="OS/2"<c:if test="${param.PLATFORM=='OS/2'}"> selected</c:if>>OS/2</option>
                          <option value="Windows"<c:if test="${param.PLATFORM=='Windows'}"> selected</c:if>>Windows</option>
                          <option value="OS/2 &amp; Win"<c:if test="${param.PLATFORM=='OS/2 &amp; Win'}"> selected</c:if>>OS/2 &amp;Win</option>
                          <option value="Win 3.x"<c:if test="${param.PLATFORM=='Win 3.x'}"> selected</c:if>>Win 3.x</option>
                          <option value="Windows 95/NT"<c:if test="${param.PLATFORM=='Windows 95/NT'}"> selected</c:if>>Windows 95/NT</option>
                          <option value="Windows 9x/Me"<c:if test="${param.PLATFORM=='Windows 9x/Me'}"> selected</c:if>>Windows 9x/Me</option>
                          <option value="Windows NT/2000/XP/Vista"<c:if test="${param.PLATFORM=='Windows NT/2000/XP/Vista'}"> selected</c:if>>Windows NT/2000/XP/Vista</option>
                          <option value="Windows CE"<c:if test="${param.PLATFORM=='Windows CE'}"> selected</c:if>>Windows CE</option>
                          <option value="Palm OS"<c:if test="${param.PLATFORM=='Palm OS'}"> selected</c:if>>Palm OS</option>
                          <option value="Handheld"<c:if test="${param.PLATFORM=='Handheld'}"> selected</c:if>>Handheld</option>
                          <option value="Macintosh"<c:if test="${param.PLATFORM=='Macintosh'}"> selected</c:if>>Macintosh</option>
                          <option value="Unix"<c:if test="${param.PLATFORM=='Unix'}"> selected</c:if>>Unix</option>
                          <option value="Linux"<c:if test="${param.PLATFORM=='Linux'}"> selected</c:if>>Linux</option>
                          <option value="Sun Solaris"<c:if test="${param.PLATFORM=='Sun Solaris'}"> selected</c:if>>Sun Solaris</option>
                          <option value="BeOS"<c:if test="${param.PLATFORM=='BeOS'}"> selected</c:if>>BeOS</option>
                          <option value="Symbian"<c:if test="${param.PLATFORM=='Symbian'}"> selected</c:if>>Symbian OS</option>
                          <option value="DOS"<c:if test="${param.PLATFORM=='DOS'}"> selected</c:if>>DOS</option>
                          <option value="Java"<c:if test="${param.PLATFORM=='Java'}"> selected</c:if>>Java</option>
                          <option value="Embedded"<c:if test="${param.PLATFORM=='Embedded'}"> selected</c:if>>Embedded</option>
                          <option value="Other"<c:if test="${param.PLATFORM=='Other'}"> selected</c:if>>Other</option>
                          <option value="Windows &amp; Linux"<c:if test="${param.PLATFORM=='Windows &amp; Linux'}"> selected</c:if>>Windows &amp; Linux</option>
                          <option value="Windows &amp; Mac"<c:if test="${param.PLATFORM=='Windows &amp; Mac'}"> selected</c:if>>Windows &amp; Mac</option>
                          <option value="Linux &amp; Mac"<c:if test="${param.PLATFORM=='Linux &amp; Mac'}"> selected</c:if>>Linux &amp; Mac</option>
                          <option value="Linux &amp; OS/2"<c:if test="${param.PLATFORM=='Linux &amp; OS/2'}"> selected</c:if>>Linux &amp; OS/2</option>
                          <option value="Win Lin Mac"<c:if test="${param.PLATFORM=='Win Lin Mac'}"> selected</c:if>>Windows Linux &amp; Mac</option>
                          <option value="Win Lin OS2"<c:if test="${param.PLATFORM=='Win Lin OS2'}"> selected</c:if>>Windows Linux &amp; OS/2</option>
                          <option value="Windows &amp; FreeBSD"<c:if test="${param.PLATFORM=='Windows &amp; FreeBSD'}"> selected</c:if>>Windows &amp; FreeBSD</option>
                          <option value="Windows &amp; Symbian"<c:if test="${param.PLATFORM=='Windows &amp; Symbian'}"> selected</c:if>>Windows &amp; Symbian</option>
                          <option value="Mac &amp; Symbian"<c:if test="${param.PLATFORM=='Mac &amp; Symbian'}"> selected</c:if>>Mac &amp; Symbian</option>
                        </select>
                      </span>
                      <h5>Product Format List</h5>
                      <p>Here you can add several different format/size/type/color for a same product.</p>
                      <span>
                        <label>Format&nbsp;List:</label>
                        <input name="FILEFORMATS" size="40" maxlength="80" value="${param.FILEFORMATS}" />
                        <p style="font-size: .9rem; font-style: italic; color: red; margin-bottom: .5rem;">If product purchase does not require a format/size/type/color choice, please leave this field blank.</p>
                        <p style="font-size: .9rem; font-style: italic;" style="margin-bottom: 2rem;">Listing formats here will add a selection box in the shopping cart that lets the customer choose format when purchasing. Use the Format List when the customer needs to pick a format, size, type, color, etc. For example, if you're selling a T-shirt, you may want to specify "S,M,L,XL" here. If you sell a program for several platforms and want to do it all under the same product setup, you can specify "Windows,Linux,Mac" for example. If doing it this way, you can associate an index file (.idx) as download file in order to deliver different download files depening on format purchased.</p>
                      </span>
                      <br>
                      <button id="backToBasic" class="save-btn" type="button" style="margin-right: .5rem;">Previous</button>
                      <button id="toShoppingCart" class="save-btn" type="button">Next</button>
                    </div> <!-- end .tab-pane -->
                    <div class="tab-pane fade" id="options" role="tabpanel" aria-labelledby="options-tab">
                      <h5>Shopping&nbsp;Cart&nbsp;Options</h5>
                      <p style="margin-bottom: .1rem;">Unchecking the boxes will hide these options in your shopping cart.</p>
                      <p style="font-size: .9rem; font-style: italic;">Note that the account settings have additional shopping cart options.</p>
                      <span>
                        <input type="hidden" name="SHOWCDOPTION" value="${param.SHOWCDOPTION}" />
                        <input type="checkbox"<c:if test="${param.SHOWCDOPTION!=0}"> checked</c:if>/>&nbsp;Show Backup CD option<br />
                        <p style="font-size: .9rem; font-style: italic;">(Backup CD will be created by BMT Micro and sent to the customer)</p>
                      </span>
                      <p>
                        <input type="hidden" name="SHOWDISCOUNTFIELD" value="${param.SHOWDISCOUNTFIELD}" />
                        <input type="checkbox"<c:if test="${param.SHOWDISCOUNTFIELD!=0}"> checked</c:if>/>&nbsp;Show Discount/Gift Certificate field
                      </p>
                      <span>
                        <input type="hidden" name="SHIPPED" value="${param.SHIPPED}" />
                        <input type="checkbox" name="SHIPPED_CHK" onchange="setFieldVisible ('shipping', this.checked);"<c:if test="${param.SHIPPED != 0}"> checked</c:if>/>&nbsp;Product is shipped
                        <br />
                        <p style="font-size: .9rem; font-style: italic;">This option ensures that shipping information is available (some payment methods do not require customer to enter address).</p>
                      </span>
                      <div id="shipping" class="toggle-section"<c:if test="${param.SHIPPED==0}">style="display: none;"</c:if>>
                        <label>Shipping&nbsp;Cost&nbsp;Scheme:</label>
                        <select name="SHIPPINGCOSTSCHEMEID">
                          ${param.SHIPPINGSCHEMEIDLIST}
                        </select>
                        <p style="font-size: .9rem; font-style: italic; margin-bottom: .2rem;">If shipping is free or included in product price, please leave this field blank!</p>
                        <p style="font-size: .9rem; font-style: italic;">Click&nbsp;<a href="https://vendors-new.bmtmicro.com/manage-shipping-schemes.jsp">here</a>&nbsp;to set up or configure shipping schemes and regions.</p>
                      </div>
                      <h6>Fields for allowing gift purchases</h6>
                      <span>
                        <input type="hidden" name="SHOWREGNAMEFIELD" value="${param.SHOWREGNAMEFIELD}" />
                        <input type="checkbox"<c:if test="${param.SHOWREGNAMEFIELD!=0}"> checked</c:if>/>&nbsp;Show Registername field
                        <br />
                        <p style="font-size: .9rem; font-style: italic;">Allow buyer to purchase for third party (gift for friend/colleague/etc).</p>
                      </span>
                      <span>
                        <input type="hidden" name="SHOWEMAILFIELD" value="${param.SHOWEMAILFIELD}" />
                        <input type="checkbox"<c:if test="${param.SHOWEMAILFIELD!=0}"> checked</c:if>/>&nbsp;Show Delivery Email field
                        <br />
                        <p style="font-size: .9rem; font-style: italic;">Allow product information email to be sent to third party (gift for friend/colleague/etc).</p>
                      </span>
                      <h6>Cart&nbsp;parameter&nbsp;checks</h6>
                      <span>
                        <input type="hidden" name="QUANTITYFIXED" value="${param.QUANTITYFIXED}" />
                        <input type="checkbox"<c:if test="${param.QUANTITYFIXED!=0}"> checked</c:if>/>&nbsp;Quantity is fixed
                        <br />
                        <p style="font-size: .9rem; font-style: italic;">Enabling this option will prevent the customer from changing the quantity in the shopping cart.</p>
                      </span>
                      <span>
                        <input type="hidden" name="NEEDSORDERPARAMETERS" value="${param.NEEDSORDERPARAMETERS}" />
                        <input type="checkbox"<c:if test="${param.NEEDSORDERPARAMETERS!=0}"> checked</c:if>/>&nbsp;Order Parameters must not be blank
                        <br />
                        <p style="font-size: .9rem; font-style: italic; margin-bottom: 2rem;">Enabling this option will prevent the customer from completing an order if the ORDERPARAMETERS value is missing in the shopping cart.</p>
                      </span>
                      <br>
                      <button id="backToProductFormat" class="save-btn" type="button" style="margin-right: .5rem;">Previous</button>
                      <button id="toFulfillment" class="save-btn" type="button">Next</button>
                    </div> <!-- end .tab-pane -->
                    <div class="tab-pane fade" id="fulfillment" role="tabpanel" aria-labelledby="fulfillment-tab">
                      <h5>Fulfillment&nbsp;Info</h5>
                      <p>Please take some time to review if you need to add support with any of the following, if you do not want any more options added, simply click Save (you can always add those options later).</p>
                      <h6>Associate&nbsp;Download&nbsp;File</h6>
                      <p style="margin-bottom: .5rem;">If order should be fulfilled via secure download from BMT&nbsp;Micro, use selector below to associate a file already uploaded using the Manage Files interface.</p>
                      <button type="button" class="grey-btn" onclick="toggleField('downloadfile');" style="margin-bottom: 1rem;">
                        Choose&nbsp;File
                      </button>
                      <div id="downloadfile" class="toggle-section"<c:if test="${empty param.PRODUCTDFL}">style="display: none;"</c:if>>
                        <h6>Choose&nbsp;File</h6>
                        <div id="fileFields"></div>
                        <br clear="all">
                        <span>
                          <label>Download password should expire in:</label>
                          <select name="DOWNLOADEXPDAYS" style="margin-right: .5rem;">
                            <option value="31"<c:if test="${param.DOWNLOADEXPDAYS=='31'}"> selected</c:if>>31 Days</option>
                            <option value="60"<c:if test="${param.DOWNLOADEXPDAYS=='60'}"> selected</c:if>>60 Days</option>
                            <option value="90"<c:if test="${param.DOWNLOADEXPDAYS=='90'}"> selected</c:if>>90 Days</option>
                            <option value="180"<c:if test="${param.DOWNLOADEXPDAYS=='180'}"> selected</c:if>>180 Days</option>
                            <option value="365"<c:if test="${param.DOWNLOADEXPDAYS=='365'}"> selected</c:if>>365 Days</option>
                            <option value="-1"<c:if test="${param.DOWNLOADEXPDAYS=='-1'}"> selected</c:if>>Never Expires</option>
                          </select>
                        </span>
                        <span>
                          <label>Add&nbsp;Another&nbsp;File:</label>
                          <button type="button" onclick="addFileField();" style="border: none; background: none; padding: .1rem; vertical-align: middle;"><i class="fas fa-plus-circle"></i></button>
                        </span>
                      <!--
                      NOTE: It is possible provide several download files for one purchase and let the customer choose what to download. This can be done by setting up an index file and a HTML file for selection.
                      Please contact&nbsp;<a href="mailto:webmaster@bmtmicro.com">webmaster@bmtmicro.com</a>&nbsp;for information on how to use this feature.
                            <br><br>
                      -->
                      </div>
                      <h6>Generate&nbsp;Codes/Gift&nbsp;Certificates/Subscription&nbsp;Credits</h6>
                      <p>If you would like to add pre-generated Activation Codes to your product select the Choose Activation Code Table button.  If activation code, gift certificate or subscription credit should be generated on the fly, select Add Code Generator Information. To generate promotional discount code for customers use on their next purchase Click Choose Discount Scheme.</p>
                      <button type="button" class="grey-btn" onclick="toggleField('regkeytable');">Choose&nbsp;Activation&nbsp;Code&nbsp;Table</button>
                      <button type="button" class="grey-btn" onclick="toggleField('keygenerator');">Add&nbsp;Code&nbsp;Generator&nbsp;Information</button>
                      <button type="button" class="grey-btn" onclick="toggleField('discounts');" style="margin-bottom: 1rem;">Choose&nbsp;a&nbsp;Discount&nbsp;Scheme</button>
                      <div id="regkeytable" class="toggle-section"<c:if test="${empty param.KEYTABLEID}">style="display: none;"</c:if>>
                        <h6>Include&nbsp;Activation&nbsp;Code&nbsp;from&nbsp;Table</h6>
                        <p>Select activation code table to associate with this product.&nbsp;Our system will retrieve a code from this table for each customer.</p>
                        <span>
                          <input type="hidden" name="USEONEKEY" value="${param.USEONEKEY}" />
                          <input type="checkbox" name="USEONEKEY_CHK" size="12" onclick="document.productform.USEONEKEY_CHK2.checked = this.checked;"<c:if test="${param.USEONEKEY != 0}"> checked</c:if>/>&nbsp;Use only one code for quantity purchases.
                        </span>
                      </div>
                      <div id="keygenerator" class="toggle-section"<c:if test="${empty param.KEYGENERATOR}">style="display: none;"</c:if>>
                        <h6>Include&nbsp;Activation&nbsp;Code&nbsp;Generated&nbsp;On-the-Fly</h6>
                        <p>Add code generation information for this product below.&nbsp;Our system will post this information with each successful order.</p>
                        <span>
                          <label>Generate&nbsp;Activation&nbsp;Codes/Gift&nbsp;Certificate/Subscription&nbsp;Credit:</label>
                          <input name="KEYGENERATOR" maxlength="256" value="${param.KEYGENERATOR}" size="75" style="margin-bottom: 1rem;"/>
                        </span>
                        <br>
                        <span>
                          <label>Character&nbsp;Set:</label>
                          <select name="KEYGENCHARSET" style="margin-bottom: 1rem;">
                            <option value="0"<c:if test="${param.KEYGENCHARSET=='0'}"> selected</c:if>>US ASCII (7-bit)</option>
                            <option value="1"<c:if test="${param.KEYGENCHARSET=='1'}"> selected</c:if>>UTF-8</option>
                            <option value="2"<c:if test="${param.KEYGENCHARSET=='2'}"> selected</c:if>>Windows-1252</option>
                            <option value="3"<c:if test="${param.KEYGENCHARSET=='3'}"> selected</c:if>>ISO 8859-1</option>
                          </select>
                        </span>
                        <br clear="all">
                        <span>
                          <input type="checkbox" name="USEONEKEY_CHK2" size="12" onclick="document.productform.USEONEKEY_CHK.checked = this.checked;"<c:if test="${param.USEONEKEY != 0}"> checked</c:if>/>&nbsp;Generate only one code for quantity purchases.
                        </span>
                        <script>
                          if (!isBlank("${param.KEYVALIDATOR}")) {
                            document.write('<br clear="all"><br>  ');
                            document.write('<span><label>Validate Generated Activation Codes</label>  ');
                            document.write('<input name="KEYVALIDATOR" maxlength="256" value="${param.KEYVALIDATOR}" size="75" /></span> ');
                          }
                        </script>
                      </div> <!-- end .toggle-section -->
                      <div id="discounts" class="toggle-section"<c:if test="${empty param.DISCOUNTSCHEMEID}">style="display: none;"</c:if>>
                        <h6>Include&nbsp;Discount&nbsp;Code</h6>
                        <p>If you would like to send the customer a discount code for their next purchase, please select discount scheme below.</p>
                        <span>
                          <label>Choose&nbsp;Discount&nbsp;Scheme:</label>
                          <select name="DISCOUNTSCHEMEID">
                            <option value="" selected="selected">Select</option>
                            ${param.DISCOUNTSCHEMEIDLIST}
                          </select>
                        </span>
                      </div> <!-- end .toggle-section -->
                      <h6>Add&nbsp;Affiliate&nbsp;Information</h6>
                      <p>Let your affiliates do the marketing for you. Adding your product to the affiliate program is easy to do. Follow our simple steps by clicking the button below.</p>
                      <button type="button" class="grey-btn" onclick="toggleField('affiliateinfo');" style="margin-bottom: 1rem;">Make available for affiliate sales</button>
                      <div id="affiliateinfo" class="toggle-section"<c:if test="${empty param.AFFILIATEPERCENTAGE && empty param.VENDORPRODUCTURL && empty param.SECUREORDERURL && empty param.DEMOURL}">style="display: none;"</c:if>>
                        <h6>Affiliate&nbsp;Sales&nbsp;Info</h6>
                        <p>If you would like to accept affiliate sales for this product, fill in information below.</p>
                        <span>
                          <label>Affiliate&nbsp;Percentage:</label>
                          <input type="text" maxlength="100" name="AFFILIATEPERCENTAGE" value="${param.AFFILIATEPERCENTAGE}" style="margin-bottom: 1rem;" />
                        </span>
                        <br clear="all">
                        <span>
                          <label>Full&nbsp;Description&nbsp;URL:</label>
                          <input type="text" maxlength="100" name="VENDORPRODUCTURL"  size="75" value="${param.VENDORPRODUCTURL}" style="margin-bottom: 1rem;" />&nbsp;<button class="grey-btn" type="button" onclick="testURL (form.VENDORPRODUCTURL)">Test</button>
                        </span>
                        <br clear="all">
                        <span>
                          <label>Secure&nbsp;Order&nbsp;URL:</label>
                          <input type="text" maxlength="100" name="SECUREORDERURL"  size="75" value="${param.SECUREORDERURL}" style="margin-bottom: 1rem;" />&nbsp;<button class="grey-btn" type="button" onclick="testURL (form.SECUREORDERURL, (form.SECUREORDERURL.value == 'Use default') ? '${param.DEFAULT_SECUREORDERURL}' : '')">Test</button>
                        </span>
                        <br clear="all">
                        <span>
                          <label>Demo/Product&nbsp;Info&nbsp;URL:</label>
                          <input type="text" maxlength="100" name="DEMOURL" size="75" value="${param.DEMOURL}" style="margin-bottom: 1rem;" />&nbsp;<button class="grey-btn" type="button" onclick="testURL (form.DEMOURL)">Test</button>
                        </span>
                        <br clear="all">
                        <span>
                          <input type="hidden" name="INCLUDEONAPLIST" value="${param.INCLUDEONAPLIST}" />
                          <input type="checkbox" style="margin-bottom: .5rem;"<c:if test="${param.INCLUDEONAPLIST!=0}"> checked</c:if>/>&nbsp;Include in All Affiliates List
                        </span>
                        <br clear="all">
                        <span>
                          <input type="hidden" name="USEPRODUCTAIDCOOKIE" value="${param.USEPRODUCTAIDCOOKIE}" />
                          <input type="checkbox"<c:if test="${param.USEPRODUCTAIDCOOKIE!=0}"> checked</c:if>/>&nbsp;Use Product Specific Cookie
                        </span>
                      </div> <!-- end .toggle-section -->
                      <h6>Order&nbsp;Notifications/Subscription&nbsp;Handling</h6>
                      <p>Click button below to add an additional notification email address, XML notification URL, recurring billing information and allow ticket use.</p>
                      <button type="button" class="grey-btn" onclick="toggleField('ordernotifications');">Order&nbsp;Notifications</button>
                      <button type="button" class="grey-btn" onclick="toggleField('subscriptionhandling');" style="margin-bottom: 1rem;">Subscription&nbsp;Handling</button>
                      <div id="ordernotifications" class="toggle-section"<c:if test="${empty param.NOTIFICATIONEMAILS && empty param.NOTIFICATIONURL}">style="display: none;"</c:if>>
                        <h6>Order&nbsp;Notifications</h6>
                        <p>By default order notifications are sent via email to the notification email address listed under 'My Account'.&nbsp;To stop order notifications, add a different email address or receive notification via XML, fill in appropriate fields below.</p>
                        <span>
                          <input type="hidden" name="NOTIFYVENDOR" value="${param.NOTIFYVENDOR}" />
                          <input type="checkbox" style="margin-bottom: 1rem;"<c:if test="${param.NOTIFYVENDOR!=0}"> checked</c:if>/>&nbsp;Send to Vendor Notification email
                        </span>
                        <br clear="all">
                        <span>
                          <label>Send&nbsp;Order&nbsp;Notification&nbsp;to&nbsp;other&nbsp;email&nbsp;address:&nbsp;</label>
                          <input name="NOTIFICATIONEMAILS" size="50" value="${param.NOTIFICATIONEMAILS}" maxlength="200" placeholder="example@domain.com" style="margin-bottom: 1rem;"/>
                          <input type="hidden" name="NOTIFYPRODUCT" />
                        </span>
                        <br clear="all">
                        <span>
                          <label>Send&nbsp;XML&nbsp;Notification&nbsp;to&nbsp;remote&nbsp;system&nbsp;(full&nbsp;URL):&nbsp;</label>
                          <input name="NOTIFICATIONURL" size="75" value="${param.NOTIFICATIONURL}" maxlength="256" />
                        </span>
                      </div> <!-- end .toggle-section -->
                      <div id="subscriptionhandling" class="toggle-section"<c:if test="${param.RECURFREQUENCY==0 && param.TICKETCHOICE==0 && param.RECURDELAY}">style="display: none;"</c:if>>
                        <h6>Subscription&nbsp;Handling</h6>
                        <p>If this is product should be rebilled automatically, select frequency below.</p>
                        <span>
                          <p style="margin-bottom: .3rem;">Your website must inform your customers that they are purchasing a subscription product.</p>
                          <label>Recurring&nbsp;Billing&nbsp;Frequency:</label>
                          <select name="RECURFREQUENCY" style="margin-bottom: 1rem;" />
                            <option value="0"<c:if test="${param.RECURFREQUENCY==0}"> selected</c:if>>None</option>
                            <option value="1"<c:if test="${param.RECURFREQUENCY==1}"> selected</c:if>>Every Month</option>
                            <option value="3"<c:if test="${param.RECURFREQUENCY==3}"> selected</c:if>>Every 3 Months</option>
                            <option value="4"<c:if test="${param.RECURFREQUENCY==4}"> selected</c:if>>Every 4 Months</option>
                            <option value="6"<c:if test="${param.RECURFREQUENCY==6}"> selected</c:if>>Every 6 Months</option>
                            <option value="12"<c:if test="${param.RECURFREQUENCY==12}"> selected</c:if>>Every 12 Months</option>
                          </select>
                        </span>
                        <br clear="all">
                        <span>
                          <p style="margin-bottom: .3rem;">To offer trial subscriptions, enter the number of days for the trial period below.</p>
                          <label>Recurring&nbsp;Billing&nbsp;Delay:</label>
                          <input name="RECURDELAY" size="10" value="${param.RECURDELAY}" style="margin-bottom: 1rem;" />
                        </span>
                        <br clear="all">
                        <span>
                          <p style="margin-bottom: .3rem;">To allow customer to purchase this product using a credit from subscription product purchase, check the box below.</p>
                          <input type="hidden" name="TICKETCHOICE" value="${param.TICKETCHOICE}" />
                          <input type="checkbox" style="margin-bottom: 1rem;"<c:if test="${param.TICKETCHOICE!=0}"> checked</c:if>/>&nbsp;Allow purchase with Ticket
                        </span>
                        <br clear="all">
                        <span>
                          <p style="margin-bottom: .3rem;">To give affiliates credit for recurring billings, check box below. If unchecked, affiliates will only get credit for the initial sale.</p>
                          <input type="hidden" name="RECURAFFILIATE" value="${param.RECURAFFILIATE}" />
                          <input type="checkbox" style="margin-bottom: 1rem;"<c:if test="${param.RECURAFFILIATE!=0}"> checked</c:if>/> Credit affiliate when rebilling
                        </span>
                      </div> <!-- end .toggle-section -->
                      <p style="margin-top: 2rem;">Click 'Save' button to add the new product, or 'Previous' to go back.</p>
                      <button id="backToCartOptions" class="save-btn" type="button" style="margin-right: .5rem;">Previous</button>
                      <button id="update" class="save-btn" type="button" onclick="return (submitForm (productform));" disabled >Save</button>
                    </div> <!-- end .tab-pane -->
                  </div> <!-- end tab-content -->
                </form>
              </div> <!-- end .content-box -->
            </div> <!-- end .col-lg-12 -->
          </div> <!-- end first .row justify-content-start -->
        </article>
      </div> <!-- end .container-fluid -->
      <jsp:include page="includes/footer.jsp"/>
    </div> <!-- end .main-raised -->
    <%@ include file="/includes/bootstrap_bottom_scripts.html" %>
    <script>
      // Handles the 'Next'/'Previous' buttons for tabs
      // 'Next' to Product Format
      $("#toProductFormat").click(function(){
        $("#productFormat-tab").tab('show');
        $("#productFormat-tab").addClass('active');
        $("#basicInfo-tab").removeClass('active');
      });
      // 'Previous' to Basic Info
      $("#backToBasic").click(function(){
        $("#basicInfo-tab").tab('show');
        $("#basicInfo-tab").addClass('active');
        $("#productFormat-tab").removeClass('active');
      });
      // 'Next' to Shopping Cart Options
      $("#toShoppingCart").click(function(){
        $("#options-tab").tab('show');
        $("#options-tab").addClass('active');
        $("#productFormat-tab").removeClass('active');
      });
      // 'Previous' to Product Format
      $("#backToProductFormat").click(function(){
        $("#productFormat-tab").tab('show');
        $("#productFormat-tab").addClass('active');
        $("#options-tab").removeClass('active');
      });
      // 'Next' to Fulfillment Info
      $("#toFulfillment").click(function(){
        $("#fulfillment-tab").tab('show');
        $("#fulfillment-tab").addClass('active');
        $("#options-tab").removeClass('active');
      });
      // 'Previous' to Shopping Cart Options
      $("#backToCartOptions").click(function(){
        $("#options-tab").tab('show');
        $("#options-tab").addClass('active');
        $("#fulfillment-tab").removeClass('active');
      });

      $('input[type=checkbox]').change(function(){
        $(this).prev('input[type=hidden]').val (this.checked ? -1 : 0);
      });
    </script>
  </body>
</html>