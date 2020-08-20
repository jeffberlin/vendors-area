<%@ include file="/includes/core.jsp" %>
<div class="transfer-section" id="main">
  <h5>View Products Using Activation Code Table - ${param.NAME}</h5>
  <table class="table" style="margin-bottom: 1rem; width: 70%; border: 1px solid #a9a9a9;">
    <thead>
      <tr class="table-category">
        <th class="sort-column text-center">Product&nbsp;ID</th>
        <th class="sort-column text-center">Product&nbsp;Name</th>
      </tr>
    </thead>
    <tbody>
      ${param.TABLEDATA}
    </tbody>
  </table>
  <button type="button" class="save-btn" onclick="closeResultFrame()">Close</button>
</div> <!-- end .transfer-section -->