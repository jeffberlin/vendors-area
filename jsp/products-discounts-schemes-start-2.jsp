<%@ include file="/includes/core.jsp" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <style media="screen" type="text/css">
      td[mnumber], td[option] {
        text-align: center;
      }
    </style>
    <script language="javascript" type="text/javascript">
      <!--
        function initForm (form) {
          initField (form, "SHOWINACTIVE", "${param.SHOWINACTIVE}");
        }

        function submitForm (action, target, nextpage, schemeid, schemetype) {
          var form = document.discounts;
          form.ACTION.value     = action;
          form.target           = target;
          form.NEXT_PAGE.value  = nextpage;
          form.ERROR_PAGE.value = (target == "_parent") ? "https://vendors-new.bmtmicro.com/error.jsp" : "https://vendors-new.bmtmicro.com/error_frame.jsp";
          form.SCHEMEID.value   = schemeid;
          form.SCHEMETYPE.value = schemetype;
          form.submit ();
        }

        function showInactiveChanged () {
          setCookieValue ("BMTMicro.Vendors.Discounts.ShowInactive", queryField (document.discounts, "SHOWINACTIVE"), 1000);
          submitForm (-1, "", "https://vendors-new.bmtmicro.com/products-discounts-schemes-start-2.jsp");
        }

        function addDiscount (form) {
          if (allowChanges ("You do not have permission to add new schemes.")) {
            submitForm (0, "_parent", "https://vendors-new.bmtmicro.com/discounts_add.jsp");
          }
        }

        function editDiscount (schemeid, schemetype) {
          submitForm (1, "_parent", "https://vendors-new.bmtmicro.com/discounts_edit.jsp", schemeid, schemetype);
        }

        function deleteDiscount (schemeid, schemetype) {
          if (allowChanges ("You do not have permission to delete schemes.")) {
            submitForm (2, "resultframe", "https://vendors-new.bmtmicro.com/discounts_delete.html", schemeid, schemetype);
            window.parent.document.getElementById('resultframe').style.display = "block";
            window.parent.document.getElementById('tableframe').style.display = "none";
          }
        }

        function generateCodes (schemeid, schemetype) {
          if (allowChanges ("You do not have permission to generate codes.")) {
            submitForm (3, "resultframe", "https://vendors-new.bmtmicro.com/discounts_generatecodes.html", schemeid, schemetype);
            window.parent.document.getElementById('resultframe').style.display = "block";
            window.parent.document.getElementById('tableframe').style.display = "none";
          }
        }

        function viewCodes (schemeid, schemetype) {
          submitForm (4, "resultframe", "https://vendors-new.bmtmicro.com/discounts_viewcodes.html", schemeid, schemetype);
          window.parent.document.getElementById('resultframe').style.display = "block";
          window.parent.document.getElementById('tableframe').style.display = "none";
        }
      //-->
    </script>
  </head>
  <body onload="initForm (document.discounts);">
    <form name="discounts" method="post" action="https://vendors-new.bmtmicro.com/servlets/Vendors.DiscountSchemes" target="">
      <input type="hidden" name="ROWTEMPLATEURL" value="${param.ROWTEMPLATEURL}" />
      <input type="hidden" name="ACTION" value="" />
      <input type="hidden" name="NEXT_PAGE" value="https://vendors-new.bmtmicro.com/products-discounts-schemes-start-2.jsp" />
      <input type="hidden" name="ERROR_PAGE" value="https://vendors-new.bmtmicro.com/error_frame.jsp" />
      <input type="hidden" name="SCHEMEID" value="" />
      <input type="hidden" name="SCHEMETYPE" value="" />
      <div class="table-header">
        <input type="checkbox" name="SHOWINACTIVE" value="-1" onClick="showInactiveChanged ();" style="margin-bottom: 1rem;" />
        <span>
          Show inactive/expired schemes
        </span>
        <br clear="all">
        <button type="button" class="grey-btn" onclick="addDiscount ();">Add New Scheme</button>
      </div> <!-- end .table-header -->
      <div class="row table-responsive" style="margin-left: auto; margin-right: auto;">
        <table class="table" id="selection">
          <thead>
            <tr class="table-category">
              <th scope="col" class="sort-column text-center" text>
                <a href="#" style="cursor: default;" onclick="return false;">Name</a>
              </th>
              <th scope="col" class="sort-column text-center" number>
                <a href="#" style="cursor: default;" onclick="return false;">Use&nbsp;Count</a>
              </th>
              <th scope="col" colspan="2" class="sort-column text-center" option>
                <a href="#" style="cursor: default;" onclick="return false;"></a>
              </th>
              <th scope="col" class="sort-column text-center" option>
                <a href="#" style="cursor: default;" onclick="return false;">Remove</a>
              </th>
            </tr>
          </thead>
          <tbody>
            ${param.TABLEDATA}
          </tbody>
          <tfoot>
            <tr class="table-total">
              <th scope="row" colspan="6">
                <div id="pageselector">&nbsp;</div>
              </th>
            </tr>
          </tfoot>
        </table>
      </div>
    </form>
  </body>
</html>
