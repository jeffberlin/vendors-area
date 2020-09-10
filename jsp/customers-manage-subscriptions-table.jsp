<%@ include file="/includes/core.jsp" %>
<form name="subscriptions" action="https://vendors-new.bmtmicro.com/servlets/Vendors.Subscriptions" method="post">
  <input type="hidden" name="NEXT_PAGE" value="https://vendors-new.bmtmicro.com/customers-manage-subscriptions-table.jsp" />
  <input type="hidden" name="ERROR_PAGE" value="https://vendors-new.bmtmicro.com/error-div.jsp" />
  <input type="hidden" name="ROWTEMPLATEURL" value="https://vendors-new.bmtmicro.com/customers-manage-subscriptions-tablerow.html" />
  <input type="hidden" name="ROWSPERPAGE" value="${param.ROWSPERPAGE}" />
  <input type="hidden" name="PAGE" value="${param.PAGE}" />
  <input type="hidden" name="PAGECOUNT" value="${param.PAGECOUNT}" />
  <input type="hidden" name="ACTION" value="-1" />
  <input type="hidden" name="SUBSCRIPTIONID" value="" />
  <div class="table-header">
    <span>
      <input type="checkbox" name="SHOWEXPIRED" value="-1" onClick="showExpiredChanged ();"<c:if test = "${ cookie['BMTMicro.Vendors.Subscriptions.ShowExpired'].value == -1 }">checked</c:if> />&nbsp;Show expired subscriptions
    </span>
    <button type="button" class="grey-btn" onclick="filter ();">Show Subscriptions</button>
  </div> <!-- end .table-header -->
  <div class="row table-responsive" style="margin-left: auto; margin-right: auto;">
    <table class="table" id="selection">
      <thead>
        <tr class="table-category">
          <th scope="col" class="sort-column sortable sort text-center" title="Sort on 'Subscription ID'" number>
            <a href="#" class="fdTableSortTrigger">Subscription&nbsp;ID</a>
          </th>
          <th scope="col" class="sort-column sortable sort text-center" title="Sort on 'Email'" info>
            <a href="#" class="fdTableSortTrigger">Email</a>
          </th>
          <th scope="col" class="sort-column sortable sort text-center" title="Sort on 'Company/Name'" text>
            <a href="#" class="fdTableSortTrigger">Company/Name</a>
          </th>
          <th scope="col" class="sort-column sortable sort text-center" title="Sort on 'Product Name'" text>
            <a href="#" class="fdTableSortTrigger">Product&nbsp;Name</a>
          </th>
          <th scope="col" class="sort-column sortable sort text-center" title="Sort on 'Price'" money>
            <a href="#" class="fdTableSortTrigger">Price</a>
          </th>
          <th scope="col" class="sort-column sortable sort text-center" title="Sort on 'Effective Date'" date>
            <a href="#" class="fdTableSortTrigger">Effective&nbsp;Date</a>
          </th>
          <th scope="col" class="sort-column sortable sort text-center" title="Sort on 'Expiration Date'" date>
            <a href="#" class="fdTableSortTrigger">Expiration&nbsp;Date</a>
          </th>
          <th scope="col" class="sort-column sortable sort text-center" title="Sort on 'Billing Date'" date>
            <a href="#" class="fdTableSortTrigger">Billing&nbsp;Date</a>
          </th>
          <th scope="col" class="sort-column sortable sort text-center" title="Sort on 'Cancel'" option>
            <a href="#" class="fdTableSortTrigger">Cancel</a>
          </th>
        </tr>
      </thead>
      <tr>
        <th style="text-align: left; color: #707070; letter-spacing: .5px; font-size: .9rem; font-weight: 300; border-bottom: 1px solid #dddddd;" colspan="10">Filter results using the fields below or leave all fields blank to retrieve all subscriptions.</th>
      </tr>
      <tr id="input-tr">
        <th number>
          <input class="input-search" type="text" name="FLT_SUBSCRIPTIONID" value="" size="10" style="min-width: 80px" placeholder="Search">
        </th>
        <th info>
          <input class="input-search" type="text" name="FLT_EMAIL" value="" size="16" placeholder="Search">
        </th>
        <th text>
          <input class="input-search" type="text" name="FLT_NAME" value="" size="16" placeholder="Search">
        </th>
        <th text>
          <input class="input-search" type="text" name="FLT_PRODUCTNAME" value="" size="16" placeholder="Search">
        </th>
        <th money></th>
        <th date></th>
        <th date></th>
        <th date></th>
        <th option></th>
      </tr>
      <tbody>
        ${param.TABLEDATA}
      </tbody>
      <tfoot>
        <tr class="table-total">
          <th scope="row" colspan="9">
            <div id="pageselector">
              <c:if test = "${param.PAGECOUNT > 1}">
                Pages:
                <c:forEach var = "page" begin = "1" end = "${param.PAGECOUNT}">
                  &nbsp;<a href="javascript:selectPage(${page});">${page}</a>&nbsp;
                </c:forEach>
              </c:if>
            </div>
          </th>
        </tr>
      </tfoot>
    </table>
  </div>
</form>
