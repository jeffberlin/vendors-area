<%@ include file="/includes/core.jsp" %>
    <form action="https://vendors-new.bmtmicro.com/servlets/Vendors.Comments" method="get" onsubmit="return (CheckDateRange (this));">
      <div class="table-header">
        <span>
          From:&nbsp;
          <input id="DATEFROM" name="DATEFROM" value="${param.DATEFROM}" />
          <img src='<c:url value="/images/cal.gif"></c:url>' width="22" height="22" border="0" alt="Click Here to Pick the date" onclick="show_calendar ('DATEFROM'); return (false);" onmouseover="this.style.cursor='pointer';" />
        </span>
        <span>
          To:&nbsp;
          <input id="DATETO" name="DATETO" value="${param.DATETO}"  style="margin-bottom: 1rem;"/>
          <img src='<c:url value="/images/cal.gif"></c:url>' width="22" height="22" border="0" alt="Click Here to Pick the date" onclick="show_calendar ('DATETO'); return (false);" onmouseover="this.style.cursor='pointer';" />
        </span>
        <span>
          <input type="hidden" name="ROWTEMPLATEURL" value="${param.ROWTEMPLATEURL}" />
          <input type="hidden" name="NEXT_PAGE" value="https://vendors-new.bmtmicro.com/customers-comments-start.jsp" />
          <input type="hidden" name="ERROR_PAGE" value="https://vendors-new.bmtmicro.com/error.jsp" />
          <select name="FORMAT">
            <option value="0" selected="selected">HTML</option>
            <option value="1">CSV</option>
            <option value="2">XML</option>
          </select>
        </span>
        <button class="get-btn" value="Get Report" />Get&nbsp;Report</button>
      </div> <!-- end .table-header -->
      <div class="row table-responsive" style="margin-left: auto; margin-right: auto;">
        <table class="table" id="selection">
          <thead>
            <tr class="table-category text-center" id="center-th">
              <th scope="col" class="sort-column sortable sort" title="Sort on 'Order ID'" number>
                <a href="#" class="fdTableSortTrigger">Order&nbsp;ID</a>
              </th>
              <th scope="col" class="sort-column sortable sort" title="Sort on 'Product Name'" text>
                <a href="#" class="fdTableSortTrigger">Product&nbsp;Name</a>
              </th>
              <th scope="col" class="sort-column" info>
                <a href="#" style="cursor: default;" onclick="return false;">Comments</a>
              </th>
              <th scope="col" class="sort-column sortable sort" title="Sort on 'How Heard'" info>
                <a href="#" class="fdTableSortTrigger">How&nbsp;Heard</a>
              </th>
              <th scope="col" class="sort-column sortable sort" title="Sort on 'Custom 1'" info>
                <a href="#" class="fdTableSortTrigger">Custom&nbsp;1</a>
              </th>
              <th scope="col" class="sort-column sortable sort" title="Sort on 'Custom 2'" info>
                <a href="#" class="fdTableSortTrigger">Custom&nbsp;2</a>
              </th>
              <th scope="col" class="sort-column sortable sort" title="Sort on 'Custom 3'" info>
                <a href="#" class="fdTableSortTrigger">Custom&nbsp;3</a>
              </th>
              <th scope="col" class="sort-column sortable sort" title="Sort on 'Company/Name'" info>
                <a href="#" class="fdTableSortTrigger">Company/Name</a>
              </th>
              <th scope="col" class="sort-column sortable sort" title="Sort on 'Email Address'" info>
                <a href="#" class="fdTableSortTrigger">Email&nbsp;Address</a>
              </th>
            </tr>
          </thead>
          <tr>
            <th style="text-align: left; color: #707070; letter-spacing: .5px; font-size: .9rem; font-weight: 300; border-bottom: 1px solid #dddddd;" colspan="10">Filter results using the fields below.</th>
          </tr>
          <tr id="input-tr">
            <th number>
              <input class="input-search" type="text" name="FLT_ORDERID" value="${param.FLT_ORDERID}" size="10" style="min-width: 60px" placeholder="Search">
            </th>
            <th text>
              <input class="input-search" type="text" name="FLT_PRODUCTNAME" value="${param.FLT_PRODUCTNAME}" size="15"  placeholder="Search">
            </th>
            <th info>
              <input class="input-search" type="text" name="FLT_COMMENTS" value="${param.FLT_COMMENTS}" size="15"  placeholder="Search">
            </th>
            <th info>
              <input class="input-search" type="text" name="FLT_HOWHEARD" value="${param.FLT_HOWHEARD}" size="15"  placeholder="Search">
            </th>
            <th info>
              <input class="input-search" type="text" name="FLT_CCOM0" value="${param.FLT_CCOM0}" size="15"  placeholder="Search">
            </th>
            <th info>
              <input class="input-search" type="text" name="FLT_CCOM1" value="${param.FLT_CCOM1}" size="15"  placeholder="Search">
            </th>
            <th info>
              <input class="input-search" type="text" name="FLT_CCOM2" value="${param.FLT_CCOM2}" size="15"  placeholder="Search">
            </th>
            <th info>
              <input class="input-search" type="text" name="FLT_NAME" value="${param.FLT_NAME}" size="15"  placeholder="Search">
            </th>
            <th info>
              <input class="input-search" type="text" name="FLT_EMAIL" value="${param.FLT_EMAIL}" size="15"  placeholder="Search">
            </th>
          </tr>
          <tbody>
            <tr>
              ${param.TABLEDATA}
            </tr>
          </tbody>
          <tfoot>
            <tr class="table-total">
              <th scope="row" colspan="10">
                <div id="pageselector">&nbsp;</div>
              </th>
            </tr>
          </tfoot>
        </table>
      </div>
    </form>
