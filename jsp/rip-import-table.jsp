<%@ page pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ include file="/includes/core.jsp" %>
<form name="homeform" action="https://vendors-new.bmtmicro./main.jsp"></form>
<form name="bmtconfig" action="https://vendors-new.bmtmicro.com/servlets/Vendors.ImportRipOrders" method="post" target="detailsPopUp">
  <input Type="hidden" NAME="ACTION" value="5" />
  <input type="hidden" name="RIPCODE" value="${requestScope.RIPCODE}" />
  <input Type="hidden" NAME="ORDERID" value="" />
  <input type="hidden" name="NEXT_PAGE" value="https://vendors-new.bmtmicro.com/rip-import-order-details.jsp" />
</form>
<form method="post" name="orderlistform" action="https://vendors-new.bmtmicro.com/servlets/Vendors.ImportRipOrders">
  <input type="hidden" name="ACTION" value="0" />
  <input type="hidden" name="NEXT_PAGE" value="https://vendors-new.bmtmicro.com/rip-import-table.jsp" />
  <input type="hidden" name="ERROR_PAGE" value="https://vendors-new.bmtmicro.com/error.jsp" />
  <input type="hidden" name="SUBMISSIONID" value="${requestScope.SUBMISSIONID}" />
  <input type="hidden" name="STARFILE" value="https://vendors-new.bmtmicro.com/images/star.gif" />
  <input type="hidden" name="BLANKFILE" value="https://vendors-new.bmtmicro.com/images/blank.gif" />
  <div class="table-header">
    <span>&nbsp;</span>
  </div> <!-- end .table-header -->
  <div class="row table-responsive-lg" style="margin-left: auto; margin-right: auto;">
    <table class="table" id="selection">
      <thead>
        <tr class="table-category">
          <th scope="col" class="sort-column text-center">
            <a href="#" style="cursor: default;" onclick="return false;"></a>
          </th>
          <th scope="col" class="sort-column text-center">
            <a href="#" style="cursor: default;" onclick="return false;">Info</a>
          </th>
          <th scope="col" class="sort-column text-center" title="Sort on 'Order ID'" number>
            <a href="#" style="cursor: default;" onclick="return false;">Order&nbsp;ID</a>
          </th>
          <th scope="col" class="sort-column text-center" title="Sort on 'Product Name'">
            <a href="#" style="cursor: default;" onclick="return false;">Product&nbsp;Name</a>
          </th>
          <th scope="col" class="sort-column text-center" title="Sort on 'Quantity'" number>
            <a href="#" style="cursor: default;" onclick="return false;">Qty</a>
          </th>
          <th scope="col" class="sort-column text-center" title="Sort on 'Name'" info>
            <a href="#" style="cursor: default;" onclick="return false;">Name</a>
          </th>
          <th scope="col" class="sort-column text-center" title="Sort on 'Address'" info>
            <a href="#" style="cursor: default;" onclick="return false;">Address</a>
          </th>
          <th scope="col" class="sort-column text-center" title="Sort on 'Country'" info>
            <a href="#" style="cursor: default;" onclick="return false;">Country</a>
          </th>
          <th scope="col" class="sort-column text-center" title="Sort on 'Origin'" info>
            <a href="#" style="cursor: default;" onclick="return false;">Origin</a>
          </th>
          <th scope="col" class="sort-column text-center" title="Sort on 'IP'">
            <a href="#" style="cursor: default;" onclick="return false;">IP</a>
          </th>
          <th scope="col" class="sort-column text-center" title="Sort on 'Email'">
            <a href="#" style="cursor: default;" onclick="return false;">Email</a>
          </th>
          <th scope="col" class="sort-column text-center" title="Sort on 'Card Type'">
            <a href="#" style="cursor: default;" onclick="return false;">Card Type</a>
          </th>
          <th scope="col" class="sort-column text-center" title="Sort on 'AVS'">
            <a href="#" style="cursor: default;" onclick="return false;">AVS</a>
          </th>
          <th scope="col" class="sort-column text-center" title="Sort on 'CVV'">
            <a href="#" style="cursor: default;" onclick="return false;">CVV</a>
          </th>
        </tr>
      </thead>
      <tbody>
        ${requestScope.TABLEDATA}
      </tbody>
      <tfoot>
        <tr class="table-total">
          <th colspan="17"></th>
        </tr>
      </tfoot>
    </table>
  </div> <!-- end .row table-responsive -->
</form>
