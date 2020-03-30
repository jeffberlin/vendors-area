function getDates (form) {
   if (form == 'undefined') {
      form = document.daterange;
      }
   if (form.DATEFROM.value == "") {
      form.DATEFROM.value = firstOfMonthDate ();
      }
   if (form.DATETO.value == "") {
      form.DATETO.value = makeDate ();
      }
   }

function getVendorDateRange (form) {
   if (form.DATEFROM.value == "") {
      form.DATEFROM.value = fromDate ();
      }
   if (form.DATETO.value == "") {
      form.DATETO.value = makeDate ();
      }
   }

//NO SPAM EMAIL LINKS
function nospam (name, domain, subject) {
   location.href = "mailto:"+name+"@"+domain+subject;
   }

// Highlight lists onClick

function highlightLinks (obj) {
   var linkList = document.getElementById("selection").getElementsByTagName("tr");
   for (i = 0; i < linkList.length; i++) {
      linkList[i].className = "";
      }
   obj.className = "selected";
   }

function setFieldVisible (field, visible) {
   document.getElementById (field).style.display = (visible === false) ? 'none' : '';
   }

function moveSelectedListItems (targetList, sourceList) {
   for (var index = 0; index < sourceList.options.length; index++) {
      var option = sourceList.options[index];
      if (option.selected) {
         targetList.options[targetList.options.length] = new Option (option.text, option.value);
         sourceList.options[index--] = null;
         }
      }
   }

function moveAllListItems (targetList, sourceList) {
   for (var index = 0; index < sourceList.options.length; index++) {
      var option = sourceList.options[index];
      targetList.options[targetList.options.length] = new Option (option.text, option.value);
      sourceList.options[index--] = null;
      }
   }

function addProduct (form) {
   moveSelectedListItems (form.SELECTEDLIST, form.PRODUCTLIST);
   }

function removeProduct (form) {
   moveSelectedListItems (form.PRODUCTLIST, form.SELECTEDLIST);
   }

function addAllProducts (form) {
   moveAllListItems (form.SELECTEDLIST, form.PRODUCTLIST);
   }

function removeAllProducts (form) {
   moveAllListItems (form.PRODUCTLIST, form.SELECTEDLIST);
   }

function allowTestOrders (message) {
   if ((getCookieValue ("BMTMicro.Vendors.Flags") & 1) == 0) {
      alert (message);
      return (false);
      }
   return (true);
   }

function allowChanges (message) {
   if ((getCookieValue ("BMTMicro.Vendors.Flags") & 2) == 0) {
      alert (message);
      return (false);
      }
   return (true);
   }

function allowResend (message) {
   if ((getCookieValue ("BMTMicro.Vendors.Flags") & 4) == 0) {
      alert (message);
      return (false);
      }
   return (true);
   }

function catchEnter (elem, func) {
   elem.onkeypress = function (e) {
      if (!e) {
         e = window.event;
         }
      var code = e.keyCode ? e.keyCode : e.which;
      if (code == 13) {
         func ();
         return (false);
         }
      return (true);
      }
   }

function enableButton (buttonid, enabled) {
   document.getElementById (buttonid).disabled = (enabled === false);
   }

function disableButton (buttonid, disabled) {
   document.getElementById (buttonid).disabled = (disabled !== false);
   }

function insertAtCursor (myField, myValue) {
   // IE support
   if (document.selection) {
      myField.focus();
      sel = document.selection.createRange ();
      sel.text = myValue;
      }
   // MOZILLA/NETSCAPE support
   else if (myField.selectionStart || myField.selectionStart == '0') {
      var startPos = myField.selectionStart;
      var endPos = myField.selectionEnd;
      myField.value = myField.value.substring(0, startPos) + myValue + myField.value.substring(endPos, myField.value.length);
      }
   else {
      myField.value += myValue;
      }
   }
