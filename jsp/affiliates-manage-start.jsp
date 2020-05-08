<%@ include file="/includes/core.jsp" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <style media="screen" type="text/css">
      td[option], td[text], td[date] {
        text-align: center;
      }
    </style>
    <script language="javascript" type="text/javascript">
      <!--
      function submitForm (action, target, nextpage, affiliateid) {
        var form = document.affiliates;
        form.ACTION.value = action;
        form.target = target;
        form.NEXT_PAGE.value = nextpage;
        form.ERROR_PAGE.value = (target == "_parent") ? "https://vendors-new.bmtmicro.com/error.jsp" : "https://vendors-new.bmtmicro.com/error_frame.jsp";
        form.AFFILIATEID.value = affiliateid;
        form.submit ();
      }

      function addAffiliate (affiliateid) {
        if (allowChanges ("You do not have permission to make changes.")) {
          if (isBlank (affiliateid) || isNaN (affiliateid) || (parseInt (affiliateid) < 1)) {
            alert ("Please specify an Affiliate ID!");
            document.affiliates.AFFILIATEID_ADD.focus ();
            // return false;
            window.top.location.reload();
          } else {
            submitForm (10, "_parent", "https://vendors-new.bmtmicro.com/affiliates-manage.jsp", affiliateid);
          }
        }
      }

      function editAffiliate (affiliateid) {
        submitForm (1, "resultframe", "https://vendors-new.bmtmicro.com/affiliates-manage-edit.html", affiliateid);
        document.getElementById('tableframe').style.display = 'none';
        document.getElementById('resultframe').style.display = 'block';
      }

      function removeAffiliate (affiliateid) {
        if (allowChanges ("You do not have permission to make changes.")) {
          submitForm (12, "_parent", "https://vendors-new.bmtmicro.com/affiliates-manage.jsp", affiliateid);
        }
      }
      //-->
    </script>
  </head>
  <body>
    <form name="affiliates" action="https://vendors-new.bmtmicro.com/servlets/Vendors.Affiliates" method="get",
    dataType: 'html'>
      <input type="hidden" name="ACTION" value="" />
      <input type="hidden" name="AFFILIATEID" value="" />
      <input type="hidden" name="ROWTEMPLATEURL" value="${param.ROWTEMPLATEURL}" />
      <input type="hidden" name="NEXT_PAGE" value="https://vendors-new.bmtmicro.com//affiliates-manage-start.jsp" />
      <input type="hidden" name="ERROR_PAGE" value="https://vendors-new.bmtmicro.com/error_frame.jsp" />
      <div class="table-header">
        <span style="color: #ffffff;">
          Affiliate ID:&nbsp;
          <input type="text" name="AFFILIATEID_ADD" value=""/>
        </span>
        <button class="get-btn" id="affiliate-btn" onclick="addAffiliate (affiliates.AFFILIATEID_ADD.value);" >Add New Affiliate</button>
      </div> <!-- end .table-header -->
      <div class="row table-responsive-lg" style="margin-left: auto; margin-right: auto;">
        <table class="table" id="selection">
          <thead>
            <tr class="table-category">
              <th scope="col" class="sort-column sortable sort text-center" title="Sort on 'Affiliate ID'" number>
                <a href="#" class="fdTableSortTrigger">Affiliate&nbsp;ID</a>
              </th>
              <th scope="col" class="sort-column sortable sort text-center" title="Sort on 'Name'" text>
                <a href="#" class="fdTableSortTrigger">Name</a>
              </th>
              <th scope="col" class="sort-column sortable sort text-center" title="Sort on 'Date Joined'" date>
                <a href="#" class="fdTableSortTrigger">Date&nbsp;Joined</a>
              </th>
              <th scope="col" class="sort-column sortable sort text-center" title="Sort on 'Affiliate Email'" text>
                <a href="#" class="fdTableSortTrigger">Affiliate&nbsp;Email</a>
              </th>
              <th scope="col" class="sort-column sortable sort text-center" title="Sort on 'Affiliate Website'" text>
                <a href="#" class="fdTableSortTrigger">Affiliate&nbsp;Website</a>
              </th>
              <th scope="col" class="sort-column text-center" option>
                <a href="#" style="cursor: default;" onclick="return false;">Remove</a>
              </th>
            </tr>
          </thead>
          <tbody>
            <tr>
              ${param.TABLEDATA}
            </tr>
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
