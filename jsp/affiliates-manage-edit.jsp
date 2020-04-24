<%@ include file="/includes/core.jsp" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <style media="screen" type="text/css">
      th {
        font-size: .9rem;
        color: #195a7c;
        text-decoration: underline;
        text-decoration-color: #efa900;
      }
    </style>
    <script language="javascript" type="text/javascript">
      <!--
      function submitForm (form) {
        if (allowChanges ("You do not have permission to make changes.")) {
          form.submit();
        }
      }
      //-->
    </script>
  </head>
  <body>
    <div class="transfer-section">
      <form name="affiliates" action="https://vendors-new.bmtmicro.com/servlets/Vendors.Affiliates" method="get">
        <input type="hidden" name="ACTION" value="11" />
        <input type="hidden" name="AFFILIATEID" value="${param.AFFILIATEID}" />
        <input type="hidden" name="NEXT_PAGE" value="https://vendors-new.bmtmicro.com/affiliates-manage-edited.html" />
        <input type="hidden" name="ERROR_PAGE" value="https://vendors-new.bmtmicro.com/error_frame.jsp" />
        <table class="table" style="margin-bottom: 1rem; width: 70%; border: 1px solid #a9a9a9;">
          <thead>
            <tr class="table-category text-center">
              <th class="sort-column">Product&nbsp;Name</th>
              <th class="sort-column">Default&nbsp;Percentage</th>
              <th class="sort-column">Custom&nbsp;Percentage</th>
            </tr>
            ${param.TABLEDATA}
          </thead>
        </table>
        <p>To use Standard Percentages - Leave Custom Percentage field blank.</p>
        <input type="button" value="Save" onclick="submitForm (affiliates);" class="save-btn" style="margin-right: .3rem;" />
        <input type="button" value="Cancel" onclick="document.close.submit ();" class="save-btn" />
      </form>
      <form name="close" action="https://vendors-new.bmtmicro.com/affiliates-manage.jsp" method="get" target="_parent">
      </form>
    </div> <!-- end .transfer-section -->
  </body>
</html>
