<%@ page pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ include file="/includes/core.jsp" %>
<c:if test="${empty cookie['BMTMicro.Vendors.VendorID'].value}">
  <script>
    window.location = "https://vendors.bmtmicro.com/"; // Redirect to login page if this page is accessed and the vendor is not logged in
  </script>
</c:if>
<div class="col-lg-2">
  <aside class="sidebar" role="complementary">
    <img class="img-fluid" src='<c:url value="https://vendors.bmtmicro.com/images/bmt-micro-logo-new-min.png"></c:url>' alt="BMT Micro, Inc. logo">
    <div class="dropright" style="padding-bottom: 0px;">
      <a class="dropdown-toggle vendor-name text-wrap text-break" role="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" href="#">
        ${URLDecoder.decode(cookie['BMTMicro.Vendors.Name'].value)}
      </a>
      <div class="dropdown-menu dropdown-menu-right text-center sidebar-options" aria-labelledby="dropdownMenuButton">
        <a class="dropdown-item" href="https://vendors.bmtmicro.com/account.jsp">My Account</a>
        <a class="dropdown-item" href="https://vendors.bmtmicro.com/settings.jsp">Settings</a>
        <a class="dropdown-item" href="https://vendors.bmtmicro.com/user-management.jsp">User Management</a>
        <a class="dropdown-item" href="https://vendors.bmtmicro.com/logout.jsp">Log Out</a>
      </div>
    </div> <!-- end .dropright -->
    <div class="vendor-company">
      <span>${URLDecoder.decode(cookie['BMTMicro.Vendors.Company'].value)}</span>
    </div> <!-- end .vendor-company -->
    <div class="vendor-balance">
      <jsp:include page="../balance.jsp"/>
    </div>
    <div style="padding-bottom: .5rem;">
      <a class="sidebar-group" href="https://vendors.bmtmicro.com/main.jsp">Home</a>
    </div>
    <div class="dropright">
      <a class="dropdown-toggle sidebar-group" role="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" href="#">Your Sales</a>
      <div class="dropdown-menu dropdown-menu-right text-center sidebar-options" aria-labelledby="dropdownMenuButton">
        <a class="dropdown-item" href="https://vendors.bmtmicro.com/main.jsp">Sales Graphs</a>
        <a class="dropdown-item" href="https://vendors.bmtmicro.com/sales-summary.jsp">Sales Summary</a>
        <a class="dropdown-item" href="https://vendors.bmtmicro.com/sales-detailed-summary.jsp">Detailed Summary</a>
        <a class="dropdown-item" href="https://vendors.bmtmicro.com/sales-eu-summary.jsp">EU Sales Summary</a>
        <a class="dropdown-item" href="https://vendors.bmtmicro.com/sales-details.jsp">Sales Details</a>
        <a class="dropdown-item" href="https://vendors.bmtmicro.com/sales-view-statistics.jsp">View Statistics</a>
        <a class="dropdown-item" href="https://vendors.bmtmicro.com/sales-pending.jsp">Pending Sales</a>
        <a class="dropdown-item" href="https://vendors.bmtmicro.com/sales-account-transactions.jsp">Account Transactions</a>
        <a class="dropdown-item" href="https://vendors.bmtmicro.com/sales-manage-transfers.jsp">Manage Transfers</a>
        <a class="dropdown-item" href="https://vendors.bmtmicro.com/sales-orders-errors-links.jsp">Orders with Errors</a>
      </div>
    </div> <!-- end .dropright -->
    <div class="dropright">
      <a class="dropdown-toggle sidebar-group" role="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" href="#">Your Products</a>
      <div class="dropdown-menu dropdown-menu-right text-center sidebar-options" aria-labelledby="dropdownMenuButton">
        <a class="dropdown-item" href="https://vendors.bmtmicro.com/products-manage.jsp">Manage Products</a>
        <a class="dropdown-item" href="https://vendors.bmtmicro.com/products-manage-files.jsp">Manage Files</a>
        <a class="dropdown-item" href="https://vendors.bmtmicro.com/products-manage-activation-code-tables.jsp">Activation Code Table</a>
        <a class="dropdown-item" href="https://vendors.bmtmicro.com/products-discounts-schemes.jsp">Discount Schemes</a>
        <a class="dropdown-item" href="https://vendors.bmtmicro.com/products-manage-pricing-tiers.jsp">Manage Pricing Tiers</a>
        <a class="dropdown-item" href="https://vendors.bmtmicro.com/products-manage-splits.jsp">Manage Splits</a>
        <a class="dropdown-item" href="https://vendors.bmtmicro.com/products-split-sales-report.jsp">Split Sales Report</a>
      </div>
    </div> <!-- end .dropright -->
    <div class="dropright">
      <a class="dropdown-toggle sidebar-group" role="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" href="#">Your Customers</a>
      <div class="dropdown-menu dropdown-menu-right text-center sidebar-options" aria-labelledby="dropdownMenuButton">
        <a class="dropdown-item" href="https://vendors.bmtmicro.com/customers-search.jsp">Customer Search</a>
        <a class="dropdown-item" href="https://vendors.bmtmicro.com/customers-comments.jsp">Customer Comments</a>
        <a class="dropdown-item" href="https://vendors.bmtmicro.com/customers-manage-download-passwords.jsp">Manage Download Passwords</a>
        <a class="dropdown-item" href="https://vendors.bmtmicro.com/customers-manage-subscriptions.jsp">Manage Subscriptions</a>
        <a class="dropdown-item" href="https://vendors.bmtmicro.com/customers-manage-tickets.jsp">Manage Tickets</a>
        <c:if test="${cookie['BMTMicro.Vendors.AuthMenu'].value==-1}">
          <a class="dropdown-item" href="https://vendors.bmtmicro.com/customers-authorize-sales.jsp">Authorize Sales</a>
        </c:if>
      </div>
    </div> <!-- end .dropright -->
    <div class="dropright">
      <a class="dropdown-toggle sidebar-group" role="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" href="#">Your Affiliates</a>
      <div class="dropdown-menu dropdown-menu-right text-center sidebar-options" aria-labelledby="dropdownMenuButton">
        <a class="dropdown-item" href="https://vendors.bmtmicro.com/affiliates-program.jsp">Program Information</a>
        <a class="dropdown-item" href="https://vendors.bmtmicro.com/affiliates-terms.jsp">Terms & Conditions</a>
        <a class="dropdown-item" href="https://vendors.bmtmicro.com/affiliates-sales.jsp">Affiliate Sales</a>
        <a class="dropdown-item" href="https://vendors.bmtmicro.com/affiliates-manage.jsp">Manage Affiliates</a>
        <a class="dropdown-item" href="https://vendors.bmtmicro.com/affiliates-email-all.jsp">Email All Affiliates</a>
      </div>
    </div> <!-- end .dropright -->
    <div class="dropright">
      <a class="dropdown-toggle sidebar-group" role="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" href="#">Contact Us</a>
      <div class="dropdown-menu dropdown-menu-right text-center sidebar-options" aria-labelledby="dropdownMenuButton">
        <a class="dropdown-item" href="https://help.bmtmicro.com/vendors/" target="_blank">FAQ/Help</a>
        <a class="dropdown-item" href="mailto:vendors@bmtmicro.com?subject=Suggestion for BMT Micro">Suggestions</a>
        <a class="dropdown-item" href="mailto:vendors@bmtmicro.com?subject=Comment about new Developer Control Panel">Comments</a>
        <a class="dropdown-item" href="https://vendors.bmtmicro.com/contact.jsp">Contact BMT Micro</a>
      </div>
    </div> <!-- end .dropright -->
  </aside>
</div> <!-- end .col-lg-2 -->
