<%@ include file="/includes/core.jsp" %>
<div class="transfer-section">
  <form name="affiliates" action="https://vendors-new.bmtmicro.com/servlets/Vendors.Affiliates" method="post">
    <input type="hidden" name="ACTION" value="11" />
    <input type="hidden" name="AFFILIATEID" value="${param.AFFILIATEID}" />
    <input type="hidden" name="NEXT_PAGE" value="https://vendors-new.bmtmicro.com/affiliates-manage-edited.html" />
    <input type="hidden" name="ERROR_PAGE" value="https://vendors-new.bmtmicro.com/error-div.jsp" />
    <table class="table" style="margin-bottom: 1rem; width: 70%; border: 1px solid #a9a9a9;">
      <thead>
        <tr class="table-category text-center">
          <th class="sort-column transfer-edit-th">Product&nbsp;Name</th>
          <th class="sort-column transfer-edit-th">Default&nbsp;Percentage</th>
          <th class="sort-column transfer-edit-th">Custom&nbsp;Percentage</th>
        </tr>
        ${param.TABLEDATA}
      </thead>
    </table>
    <p>To use Standard Percentages - Leave Custom Percentage field blank.</p>
    <input type="button" value="Save" onclick="submitForm (affiliates);" class="save-btn" style="margin-right: .3rem;" />
    <input type="button" value="Cancel" onclick="location.reload();" class="save-btn" />
  </form>
</div> <!-- end .transfer-section -->
