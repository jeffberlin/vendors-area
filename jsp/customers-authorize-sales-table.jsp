<%@ include file="/includes/core.jsp" %>
<form name="homeform" action="https://vendors-new.bmtmicro.com/main.jsp"></form>
<form action="https://vendors-new.bmtmicro.com/servlets/Vendors.ImportRipOrders" method="post" target="detailsPopUp">
  <input type="hidden" name="ACTION" value="5" />
  <input type="hidden" name="RIPCODE" value="${requestScope.RIPCODE}" />
  <input type="hidden" name="ORDERID" value="" />
  <input type="hidden" name="NEXT_PAGE" value="https://vendors-new.bmtmicro.com/customers-authorize-sales-orderdetails.jsp" />
</form>
<form name="orderlistform" action="https://vendors-new.bmtmicro.com/servlets/Vendors.ImportRipOrders" method="post">
  <input type="hidden" name="ACTION" value="0" />
  <input type="hidden" name="NEXT_PAGE" value="https://vendors-new.bmtmicro.com/customers-authorize-sales.jsp" />
  <input type="hidden" name="ERROR_PAGE" value="https://vendors-new.bmtmicro.com/error.jsp" />
  <input type="hidden" name="SUBMISSIONID" value="${requestScope.SUBMISSIONID}" />
  <input type="hidden" name="STARFILE" value="https://vendors-new.bmtmicro.com/images/star.gif" />
  <input type="hidden" name="BLANKFILE" value="https://vendors-new.bmtmicro.com/images/blank.gif" />
  <div class="table-header">
    &nbsp;
  </div> <!-- end .table-header -->
  <div class="row table-responsive-lg" style="margin-left: auto; margin-right: auto;">
    <table class="table" id="selection">
      <thead>
        <tr class="table-category">
          <th scope="col" class="sort-column"></th>
          <th scope="col" class="sort-column text-center">
            <a href="#" style="cursor: default;" onclick="return false;">Info</a>
          </th>
          <th scope="col" class="sort-column text-center" number>
            <a href="#" style="cursor: default;" onclick="return false;">Number</a>
          </th>
          <th scope="col" class="sort-column text-center">
            <a href="#" style="cursor: default;" onclick="return false;">Product&nbsp;Name</a>
          </th>
          <th scope="col" class="sort-column text-center" number>
            <a href="#" style="cursor: default;" onclick="return false;">Qty</a>
          </th>
          <th scope="col" class="sort-column text-center" money>
            <a href="#" style="cursor: default;" onclick="return false;">Amount</a>
          </th>
          <th scope="col" class="sort-column text-center" info>
            <a href="#" style="cursor: default;" onclick="return false;">Name</a>
          </th>
          <th scope="col" class="sort-column text-center" info>
            <a href="#" style="cursor: default;" onclick="return false;">Address</a>
          </th>
          <th scope="col" class="sort-column text-center" info>
            <a href="#" style="cursor: default;" onclick="return false;">Country</a>
          </th>
          <th scope="col" class="sort-column text-center" info>
            <a href="#" style="cursor: default;" onclick="return false;">Origin</a>
          </th>
          <th scope="col" class="sort-column text-center">
            <a href="#" style="cursor: default;" onclick="return false;">IP</a>
          </th>
          <th scope="col" class="sort-column text-center">
            <a href="#" style="cursor: default;" onclick="return false;">Email</a>
          </th>
          <th scope="col" class="sort-column text-center">
            <a href="#" style="cursor: default;" onclick="return false;">Payment&nbsp;Method</a>
          </th>
          <th scope="col" class="sort-column text-center">
            <a href="#" style="cursor: default;" onclick="return false;">AVS</a>
          </th>
          <th scope="col" class="sort-column text-center">
            <a href="#" style="cursor: default;" onclick="return false;">CVV</a>
          </th>
          <th scope="col" class="sort-column text-center" info>
            <a href="#" style="cursor: default;" onclick="return false;">Info</a>
          </th>
          <th scope="col" class="sort-column text-center">
            <a href="#" style="cursor: default;" onclick="return false;">Affiliate</a>
          </th>
        </tr>
      </thead>
      <tbody>
        ${requestScope.TABLEDATA}
      </tbody>
      <tfoot>
        <tr class="table-total">
          <th scope="row" colspan="17">
            <div id="pageselector">&nbsp;</div>
          </th>
        </tr>
      </tfoot>
    </table>
  </div>
</form>
