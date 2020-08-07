<%@ include file="/includes/core.jsp" %>
<div class="transfer-section">
  <form method="post" action="https://vendors-new.bmtmicro.com/servlets/Vendors.WorldRegions">
    <input type="hidden" name="NEXT_PAGE" value="https://vendors-new.bmtmicro.com/manage-regions.jsp" />
    <input type="hidden" name="ERROR_PAGE" value="https://vendors-new.bmtmicro.com/error-div.jsp" />
    <input type="hidden" name="REGIONID" value="${param.REGIONID}" />
    <input type="hidden" name="ACTION" value="11" />
    <h5>Edit Region ${param.NAME}</h5>
    <span>
      <label>Region Name:&nbsp;</label>
      <input name="NAME" maxlength="80" value="${param.NAME}" title="This is the descriptive name for the Region. maximum 80 characters." style="margin-bottom: 1rem;" />
    </span>
    <h6>Choose Countries in this Region</h6>
    <select id="COUNTRYLIST" name="COUNTRYLIST" multiple="multiple" ondblclick="addCountry (regions);" style="width:400px; height:150px">
       ${param.COUNTRYLIST}
    </select>
    <div class="move" style="margin-bottom: 1rem;">
      <!-- we hardcode the style here since the classes are not visible. We can add class="content" to the "dd" tag to
           make the styles work, but then this will add whitespace on the sides which is not desired... -->
      <button style="margin-right: 5px;" type="button" name="add" value="Add&nbsp;&gt;&gt;" class="light-btn" onclick="addCountry (regions);">
        Add&nbsp;<i class="fas fa-angle-down"></i>
      </button>
      <button style="margin-right: 5px;" type="button" name="remove" value="&lt;&lt;&nbsp;Remove" class="light-btn" onclick="removeCountry (regions);">
        <i class="fas fa-angle-up"></i>&nbsp;Remove
      </button>
      <button style="margin-right: 5px;" type="button" name="addall" value="Add&nbsp;&gt;&gt;" class="light-btn" onclick="addAllCountries (regions);">
        Add&nbsp;All&nbsp;<i class="fas fa-angle-down"></i>
      </button>
      <button type="button" name="removeall" value="&lt;&lt;&nbsp;Remove" class="light-btn" onclick="removeAllCountries (regions);">
        <i class="fas fa-angle-up"></i>&nbsp;Remove&nbsp;All
      </button>
    </div> <!-- end .move -->
    <select id="SELECTEDLIST" name="SELECTEDLIST" multiple="multiple" ondblclick="removeCountry (regions);" style="width:400px; height:150px">
       ${param.SELECTEDCOUNTRIES}
    </select>
    <input type="hidden" name="SELECTEDCOUNTRIES" />
    <div class="controlbuttons">
      <button type="button" class="save-btn" onclick="submitRegion (regions);" style="margin-right: .5rem;">Save</button>
      <button type="button" class="save-btn" onclick="closeResultFrame()">Close</button>
    </div>
  </form>
</div> <!-- end .transfer-section -->
