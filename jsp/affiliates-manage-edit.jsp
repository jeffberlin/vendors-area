<%@ include file="/includes/core.jsp" %>
<div class="transfer-section">
  <form action="https://vendors-new.bmtmicro.com/servlets/Vendors.Affiliates" method="post">
    <input type="hidden" name="ACTION" value="11" />
    <input type="hidden" name="AFFILIATEID" value="${param.AFFILIATEID}" />
    <input type="hidden" name="NEXT_PAGE" value="https://vendors-new.bmtmicro.com/affiliates-manage-edited.jsp" />
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
    <button type="button" onclick="submitEdit (this.form);" class="save-btn" style="margin-right: .5rem;">Save</button>
    <button type="button" onclick="closeResultFrame ();" class="save-btn">Cancel</button>
  </form>
</div> <!-- end .transfer-section -->
