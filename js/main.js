// Redirect to login page if this page is accessed and the vendor is not logged in
if (getCookieValue ("BMTMicro.Vendors.VendorID") == null) {
    window.location = "https://vendors-new.bmtmicro.com/login.html";
}
// Function for pulling name and company when available
//function getVendorName () {
    var n = getCookieValue ("BMTMicro.Vendors.Name");
    var c = getCookieValue ("BMTMicro.Vendors.Company");
    //return (((c == null) || (c == "")) ? n : (n + "</br>" + c ));
//}
