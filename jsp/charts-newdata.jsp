<%@ page pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ include file="/includes/core.jsp" %>
<script>
  function showSelection (selector, labelid) {
    var label = document.getElementById (labelid);
    label.innerHTML = selector.options[selector.selectedIndex].innerHTML;
  }

  function refreshChart (form, check) {
    if (check || CheckDateRange (form)) {
      form.SELECTEDPRODUCTS.value = getCommaSeparatedSelectorValues (form.SELECTEDLIST);
      loadChart (form);
    }
  }
</script>
<form name="chartform${requestScope.DIV_ID}" action="https://vendors-new.bmtmicro.com/servlets/Vendors.SalesGraph" method="post">
  <div class="section">
    <span>
      <label>From:</label>
      <input id="DATEFROM" name="DATEFROM" value="${requestScope.DATEFROM}" size="10" />&nbsp;
      <img class="calendar" alt="Click Here to Pick the date" title="Click Here to Pick the date" onclick="show_calendar (this)" />
    </span>
    <span>
      <label>To:</label>
      <input id="DATETO" name="DATETO" value="${requestScope.DATETO}" size="10" />&nbsp;
      <img class="calendar" alt="Click Here to Pick the date" title="Click Here to Pick the date" onclick="show_calendar (this)" />
    </span>
  </div>
  <div class="dropdown-select section">
    <span>
      <label>Report Type:</label>
      <select name="GROUPTYPE">
        <option value="0"<c:if test="${requestScope.GROUPTYPE==0}"> selected</c:if>>Units sold</option>
        <option value="1"<c:if test="${requestScope.GROUPTYPE==1}"> selected</c:if>>Vendor royalty</option>
      </select>
    </span>
    <span>
      <label>Maximum # of results:</label>
      <select name="MAXLEGENDS">
        <option value="5"<c:if test="${requestScope.MAXLEGENDS==5}"> selected</c:if>>5</option>
        <option value="10"<c:if test="${requestScope.MAXLEGENDS==10}"> selected</c:if>>10</option>
        <option value="15"<c:if test="${requestScope.MAXLEGENDS==15}"> selected</c:if>>15</option>
        <option value="20"<c:if test="${requestScope.MAXLEGENDS==20}"> selected</c:if>>20</option>
        <option value="30"<c:if test="${requestScope.MAXLEGENDS==30}"> selected</c:if>>30</option>
        <option value="50"<c:if test="${requestScope.MAXLEGENDS==50}"> selected</c:if>>50</option>
      </select>
    </span>
  </div>
  <div class="dropdown-select section">
    <span>
      <label>Frequency:</label>
      <select name="FREQUENCY">
        <option value="0"<c:if test="${requestScope.FREQUENCY==0}"> selected</c:if>>Do not group</option>
        <option value="1"<c:if test="${requestScope.FREQUENCY==1}"> selected</c:if>>Daily</option>
        <option value="2"<c:if test="${requestScope.FREQUENCY==2}"> selected</c:if>>Weekly</option>
        <option value="3"<c:if test="${requestScope.FREQUENCY==3}"> selected</c:if>>Monthly</option>
        <option value="4"<c:if test="${requestScope.FREQUENCY==4}"> selected</c:if>>Quarterly</option>
        <option value="5"<c:if test="${requestScope.FREQUENCY==5}"> selected</c:if>>Yearly</option>
      </select>
    </span>
    <span>
      <label>Sales By:</label>
      <select name="GROUPBY">
        <option value="0"<c:if test="${requestScope.GROUPBY==0}"> selected</c:if>>Product</option>
        <option value="1"<c:if test="${requestScope.GROUPBY==1}"> selected</c:if>>Country</option>
        <option value="2"<c:if test="${requestScope.GROUPBY==2}"> selected</c:if>>Affiliate</option>
      </select>
    </span>
  </div>
  <span style="font-size: .9rem;">Choose Products for this report:&nbsp;</span>
  <br>
  <select id="PRODUCTLIST" name="PRODUCTLIST" multiple="multiple" style="width: 85%;" ondblclick="addProduct (chartform${requestScope.DIV_ID});" onchange="showSelection (this, 'currentsel');">
  ${requestScope.PRODUCTLIST}
  </select>
  <div class="currentSelected">
    <i class="fas fa-angle-double-right"></i>&nbsp;<span id="currentsel"></span>
  </div>
  <div class="move">
    <!-- we hardcode the style here since the classes are not visible. We can add class="content" to the "dd" tag to
    make the styles work, but then this will add whitespace on the sides which is not desired... -->
    <button style="margin-right: 5px;" type="button" name="add" value="Add&nbsp;&gt;&gt;" onclick="addProduct (chartform${requestScope.DIV_ID});">Add&nbsp;<i class="fas fa-angle-down"></i></button>
    <button style="margin-right: 25px;" type="button" name="remove" value="&lt;&lt;&nbsp;Remove" onclick="removeProduct (chartform${requestScope.DIV_ID});"><i class="fas fa-angle-up"></i>&nbsp;Remove</button>
    <button style="margin-right: 5px;" type="button" name="addall" value="Add&nbsp;&gt;&gt;" onclick="addAllProducts (chartform${requestScope.DIV_ID});">Add&nbsp;All&nbsp;<i class="fas fa-angle-down"></i></button>
    <button type="button" name="removeall" value="&lt;&lt;&nbsp;Remove" onclick="removeAllProducts (chartform${requestScope.DIV_ID});"><i class="fas fa-angle-up"></i>&nbsp;Remove&nbsp;All</button>
  </div>
  <select id="SELECTEDLIST" name="SELECTEDLIST" style="width: 85%;" multiple="multiple" ondblclick="removeProduct (chartform${requestScope.DIV_ID});" onchange="showSelection (this, 'currentsel');">
  ${requestScope.SELECTEDPRODUCTS}
  </select>
  <div class="controlbuttons">
    <input type="hidden" name="DIV_ID" value="${requestScope.DIV_ID}" />
    <input type="hidden" name="CHARTTYPE" value="${requestScope.CHARTTYPE}" />
    <input type="hidden" name="BULLETSIZE" value="${requestScope.BULLETSIZE}" />
    <input type="hidden" name="NEXT_PAGE" value="${requestScope.CHART_PAGE}" />
    <input type="hidden" name="SELECTEDPRODUCTS" />
    <input type="hidden" name="ERROR_PAGE" value="https://vendors-new.bmtmicro.com/error-div.jsp" />
    <button type="button" onclick="refreshChart(chartform${requestScope.DIV_ID},true);" style="margin-right: 10px;">Get Graph</button>
    <button type="button" name="button" onclick="refreshChart(revertform${requestScope.DIV_ID},false);">Cancel</button>
  </div>
</form>
<div style="display: none;">
  <form name="revertform${requestScope.DIV_ID}" method="post" action="https://vendors-new.bmtmicro.com/servlets/Vendors.SalesGraph">
    <input type="hidden" name="DIV_ID"     value="${requestScope.DIV_ID}" />
    <input type="hidden" name="CHARTTYPE"  value="${requestScope.CHARTTYPE}" />
    <input type="hidden" name="BULLETSIZE" value="${requestScope.BULLETSIZE}" />
    <input type="hidden" name="DATEFROM"   value="${requestScope.DATEFROM}" />
    <input type="hidden" name="DATETO"     value="${requestScope.DATETO}" />
    <input type="hidden" name="GROUPBY"    value="${requestScope.GROUPBY}" />
    <input type="hidden" name="GROUPTYPE"  value="${requestScope.GROUPTYPE}" />
    <input type="hidden" name="MAXLEGENDS" value="${requestScope.MAXLEGENDS}" />
    <input type="hidden" name="FREQUENCY"  value="${requestScope.FREQUENCY}" />
    <select id="SELECTEDLIST" name="SELECTEDLIST">${requestScope.SELECTEDPRODUCTS}</select>
    <input type="hidden" name="SELECTEDPRODUCTS" value="" />
    <input type="hidden" name="NEXT_PAGE" value="${requestScope.CHART_PAGE}" />
    <input type="hidden" name="ERROR_PAGE" value="https://vendors-new.bmtmicro.com/error-div.jsp" />
  </form>
</div>
