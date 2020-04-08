/*
Variables for the tooltip.js functions

Usage

This file must be called in the <head> of document where you use the following:
 onmouseover="this.T_TITLE='Enter title here or remove';return escape(tipVAR)"

The tooltip.js file must be called just before the </body> tag as well for this to work.

*/
// Generic
// Main Products Page
var tipAddNew = "Click this button to bring you to a blank product page for adding a completely new product.";
var tipAddCopy = "Click this button to bring you to a product page with information from another product filled in.";
var tipEditProduct = "Click this button to edit an existing product.";
var tipViewCartLink = "Click this button to retrieve a shopping cart link for the selected product.";
var tipEditCustomerEmail = "Click this button to customize the customer's product information email for a single product selected above.";
var tipEditVendorEmail = "Click this button to customize the order notification email for a single product selected above.";
var tipGlobalCustomerEmail = "Click this button to customize the standard email used for all products.";
var tipGlobalVendorEmail = "Click this button to customize the standard vendor notifications used for all products.";

// Add Product
var tipProductName = "Enter the name of your product here. This is the name that will appear in all reports, sales information and any other references to this product";
var tipIncludeInCatalogChk = "If this product is a special upgrade, academic version or not available to the general public, be sure to UN-check this box. Otherwise, the product may be made available for listing in our online catalog if this option is included in your service tier.";
var tipShortProductDescription = "Use this area as if you were speaking to prospective customers. Try to focus on key features of your program and not fancy adjectives";
var tipKeywords = "Provide any keywords for your product (Limit 50 characters)";
var tipCategory = "Select the category most closely related to your product.";
var tipPlatform = "Select the native platform for your product or download file.";
var tipDemoAvailable = "Select \'Yes\' if you have a demo and enter the download URL below";
var tipDemoDownloadURL = "Please enter the demo download URL.";
var tipFullDescriptionURL = "Enter the complete URL (including http://) for your product description.";
var tipDistributionDate = "Date program will be ready for distribution.  Leave blank if already available.";
var tipProductPrice = "This is the price for a single copy of this product. Please see the help file for more information on currency selection.";
var tipCurrentFilesAvailable = "Current full version files available on our secure server.";
var tipDownloadPasswordExpiration = "The amount of time you prefer the customer\'s password to be valid. For security reasons, any password will automatically expire if accessed by more than one country.";
var tipRegistrationKeyTable = "Registration key tables you have already set up in our system. If you have not setup a registration key table, you will need to do so from the Registration Keys screen first.";
var tipUseOneKeyChk = "Use one key per order regardless of quantity. This box should be checked if the customer is to be sent a single key regardless of the number of licenses purchased.";
var tipKeyGenString = "Enter the URL to your remote key generator or your Armadillo information. Please be sure to read the help files for information on how to enter this string. If setting up a Gift Certificate insert giftcertificate in this field.";
var tipOrderNotifToVendorChk = "If you do not wish to receive an email each time an order is placed, please uncheck this box. If checked, order notifications will be sent to the email address specified under Account Information.";
var tipOrderNotifToOther = "If you would like to specify a different notification email address for this product only, enter email address here. Multiple notification emails can be added, separated with a single space.";
var tipOrderNotifToURL = "If you would like to receive your order notifications via XML through an http post, enter the URL here.";
var tipIncludeInAffiliateListChk = " - If you would like your program to be available to any affiliate signed up with BMT Micro, check this box. Leaving it blank allows you to use the affiliate program for selected individuals only. <br /><strong>Note</strong> - Joined affiliates will always be able to view your product from the affiliate product list!";
var tipUseProductAIDCookie = "Leaving this box checked will allow affiliates to receive commission only when same product is purchased that set the affiliate cookie.  Unchecking this box will allow affiliates to receive commission for any of your products purchased by the customer within 90 days.";
var tipAffiliatePercentage = "The basic percentage you plan to offer affiliates per sale. This percentage is calculated on the total price of your product. Affiliate percentages can be customized for each affiliate. Set this percentage to 0 if you wish to have them contact you before receiving any affiliate commissions. Leave this blank if you do not want to accept affiliates for this product.";
var tipComments = "If there are any specific instructions for BMT Micro, please input them here.";
var tipRegGenCharSet = "This applies to key generators on our servers only.  Armadillo key generators must use Windows-1252.  Remote key generator XML is always sent in UTF-8.";
var tipGenDiscountCode = "If you would like this product to generate a discount code for future purchases, please select discount scheme to use for code generation here.";
var tipShowCdOption = "Check this box if you would like the shopping cart to offer your customers a backup CD. CDs are created by BMT Micro.";
var tipShowDiscGiftField = "Check this box if you would like the shopping cart to display the Discount Code/Gift Certificate field.";
var tipFormatList = "Comma separated list of options available for this product.   Will show in shopping cart if cart is enabled for this feature.   Please contact us for more details.";

// Edit Product
var tipCurrentDownloadFile = "This is the file that will be delivered to customers who purchase this product. To change the file delivered, simply select a different file from the list. To add files to this list, please see the Manage Files screen.";
var tipAffiliateRoyalty = "After enabling your product as an affiliate product, this will show the dollar amount your affiliates will receive per sale.";
var tipAmountToVendorAfterAffiliate = "This will show the amount you will receive after Affiliate and BMT Royalties have been paid.";
var tipAffiliateSecureOrderURL = "<span style='color:red;font-weight:bold'>IMPORTANT</span><br />This order form <strong>must be prepared to pass the affiliate ID information!</strong><br /><br />By default our system will fill in the Affiliate shopping cart.  This shopping cart allows for affiliate branding.";
var tipAffiliateDemoURL = "This is the Demo URL for your product. The Demo Link does not have to be on our server to set the Affiliate information. You can also use this link to point to your product information page, instead of a direct file download.";
// Add Edit Pricing Tier
var tipTierActiveChk = "You must check this box for the pricing tier to function.";
var tipTierName = "This is the descriptive name for the pricing tier. maximum 80 characters.";
var tipTierDiscountAmt = "Enter the discount amount in the text field. Numbers only, decimals are allowed. Use the drop down menu to specify type of discount as percent off of price, dollar amount off of price or new discounted price.";
var tipTierCurrency = "If you have set prices for different currencies and want to run specific pricing tiers based on the separate currencies, select the currency for this tier to apply to here.  Defaults to all currencies.";
var tipTierRounding = "To have the order system round discounts, please select a value here. This is useful for percentage based tiers as it will prevent odd pricing.";
var tipTierMinQty = "Enter a number in the text box and then select items, dollars or products to set order limits before this pricing tier will be applied.";
var tipTierBatchQty = "By default, all products within a batch will be discounted.  A batch is based on the setting above.  If 3 products are required before the tier is applied, and the customer orders 6 products, this would be two batches.";
var tipTierSelectListLeftQualify = "Products selected here must be included in the customer order for this pricing tier to take effect. Select the products from the list on the left and add them to the list on the right. You can remove products by selecting the product on the right and selecting remove.";
var tipTierSelectListLeftApply = "Products selected here will have this pricing tier applied when the above qualifications are met. Select the products from the list on the left and add them to the list on the right. You can remove products by selecting the product on the right and selecting remove.";
var tipTierLevel = "If you need two different Tiered Pricing schemes that use the same qualifying products to be applied within the same order they must be on different levels.  Even run levels allow for multiple discounts to be applied to the same product.  Odd levels do not allow multiple discounts to be applied."
var tipApplyOrder = "When discounts are applied only some of the products in the shopping cart, by default the system will apply the discounts to the lowest priced products in the shopping cart. If you want the tier to apply based on the order the product is entered into the cart, regardless of the product price, set this to 'By Row Number'.  This option should only be used for specific needs."
// Email All Affiliates
var tipEmailAffiliatesCC = "This message will be sent to all affiliates linked to your product(s). If you wish to include yourself or any other single address, please enter it here. Note that only one email address is allowed.";
var tipEmailAffiliatesSubject = "This is the subject that will appear with the email message.";
var tipEmailAffiliatesBody = "This will be the body of the email message. Please note that currently we are unable to send HTML messages, so please do not enter HTML into this field as the recipients will not see the rendered HTML.";
// Vendor Splits
var tipVendorSplits = "This name will appear in the Vendor Transactions report for both you and the split vendor.  Maximum length for this field is 80 characters.";
var tipVendorSplitPercentage = "This is the percentage of your sales you would like split with another vendor.  This percentage is calculated after discounts and BMT commissions have been applied.";
var tipBeneficiaryVendor = "This should be the Vendor ID of the one receiving the split percentage of your sales.";
var tipVendorSplitAll = "If you would like all sales from this account to be credited according to the percentage above to the beneficiary vendor, check this box.  This will apply this split to all current and future products.";
var tipVendorSplitProducts = "Unless Apply to All Products is checked above, only products selected will be credited to the beneficiary vendor ID. Select the products from the list on the left and add them to the list on the right. You can remove products by selecting the product on the right and selecting remove.";
// Discount Schemes
var tipDiscountActiveChk = "You must check this box for the discount scheme to function.  You can set up discounts that are turned on and off using this checkbox.";
var tipDiscountName = "This is the descriptive name for the discount scheme. maximum 80 characters.";
var tipDiscountBegin = "If this is a \'timed\' promotion, enter the starting date for this discount scheme.  You can leave this field blank to be affective immediately. Both dates do not have to be used.";
var tipDiscountEnd = "If this is a \'timed\' promotion, enter the ending date for this discount scheme.  Both dates do not have to be used. When setting an ending date, sales will be discounted until 23:59:59 Eastern Standard Time on the date specified.";
var tipDiscountAmt = "Enter the discount amount in the text field. Numbers only, decimals are allowed. Use the drop down menu to specify type of discount as percent off of price, dollar amount off of price, new discounted price.  Discounts are calculated after tiered pricing has been applied.  If you do not want both tiered pricing and discount amount, you must select percent off full price or dollar off full price.";
var tipDiscountCurrency = "If you have set prices for different currencies and want to run specific discounts based on the separate currencies, select the currency for this scheme to apply to here.  Defaults to all currencies.";
var tipDiscountRounding = "To have the order system round discounts, please select a value here. This is useful for percentage based discounts as it will prevent odd pricing.";
var tipOneItemOnly = "Checking this box will apply the discount to only one item per order, not each item.";
var tipMinQty = "Enter the number of items or minimum dollar amount the customer needs to purchase before discount is to be applied.";
var tipMaxUse = "Use this field to limit the number of times a discount code can be used.  Leave blank if you want all your customers to use the same discount code for this scheme.";
var tipAlwaysApplyDiscount = "If this box is checked the system will look for a discount scheme with each order and if the sale qualifies, will insert the discount code into the order and apply the discount for the customer. Use this if you do not want to distribute a discount code.";
var tipStopOrder = "If this box is checked, the order will not complete unless the discount code input by the customer is valid for the product(s) being purchased.";
var tipDiscountProducts = "Select the products from the list on the left and add them to the list on the right. You can remove products by selecting the product on the right and selecting remove. Only products selected will be allowed to use this discount scheme.";
var tipExpireCode = "Enter the number of days you want the discount code to remain valid from date of code generation. This is useful when generating discount codes in customer email notifications that should only be valid for a limited time.  Leave blank if you do not want to the discount code to expire. This can only be used with Discount Scheme Types that generate discount codes.  When applied to subscription only schemes, if you want the discount to apply for the next 3 months, set this to 93 days.";
var tipSchemeType = "The Scheme Type replaces the Always Apply feature. You can choose to create a scheme that generates discount codes for your customers, a codeless scheme that always applies without a discount code, or a recurring billing discount that only applies to subsequent billings of subscription products.";


// RegKey Tables
var tipCodeID = "This is the name used by the system to associate the proper key table with a product.  This name will be available in a drop down box on the add/edit products pages. Name should be relevant to the product that will use this table. Maximum length for this field is 12 characters.";
var tipNumKeyParts = "A key can have up to four parts. For instance, UserID, Serial Number and Registration Key. The separate parts can also be used to store completely different registration keys for bundled software. Choose the number of parts needed for your Registration Key Table. ";
var tipSeparatorChar = "If you have more than one part to your registration keys, you must select the separator your file uses for the different key parts. All parts must be contained on one line with one of these options as a delimiter. ";
var tipLowKeyWarning = "The number that triggers the system to send a Low Key Warning email containing the Key Table Name and the number of keys left in the table. The Low Key Threshold default is 25. Email is sent as soon as the Registration Table gets down to this number of keys. As the keys are depleted, you will continue to receive email warnings, once per 24 hour period until there are only 10 keys left.";
var tipLowKeyEmail = "This is the email address the Low Key Warning email is sent to. Please make sure this is a valid address that is checked regularly.";
// Add/Edit Users

var tipUserName = "This is the login name set up by the owner of this account. This is the name used to login to the secure Developer's Control Panel. Minimum character length is 4. ";
var tipUserPassword = "This is the password set up by the owner of this account. This is the password used to login to the secure Developer's Control Panel. Minimum character length is 6.  ";
var tipUserEmail = "This is the User's email address as set up by the owner of this account.  This is the email address the system will use to send copies of the customer's product notification email when requested.";
var tipRealName = "This is the real name of the user for this login.";
var tipAllowResend = "Checking this box gives this user permission to resend customer email notifications.";
var tipAllowChanges = "Checking this box gives this user permission to add/edit products, registration key tables, discount schemes, pricing tiers, split vendors, affiliates and edit account information.";
var tipAllowTestOrder = "Checking this box gives this user permission to place test orders.";

//  Charts
var tipDateFrom = "Enter the beginning date for sales included in chart.";
var tipDateTo = "Enter the ending date for sales included in chart.   Please keep in mind that using todays date will not show a complete day of sales.";
var tipReportType = "Units sold will show number of items sold, including any free items! Vendor Royalty displays total amount to vendor for sales during specified date range. ";
var tipMaxLegends = "This selection limits the number of products/countries/affiliates reported on.  Some vendors have thousands of products and/or affiliates.  In order to help ensure charts display meaningful and readable data, charts are limited to a maximum of 50 results.";
var tipTimeGrouping = "No Grouping will show total per product during date range specified.  Grouping will show separate results for each product selected under the specified grouping. For instance, time grouping of monthly and selecting 5 products will show results of each product separately for each month.";
var tipSelectProducts = "Not selecting any products will report on totals only.   Selecting all products will individually report on the top products based on number selected in maximum number of results selected. ";