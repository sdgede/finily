import 'package:finily/res/constant/config.dart';

class AppEndpoints {
  //  Auth
  static String register = "${Config.baseUrl}/register";
  static String sendVerifyEmail =
      "${Config.baseUrl}/auth/send-verification-email";
  static String login = "${Config.baseUrl}/login";
  static String verify = "${Config.baseUrl}/verify-email";
  static String forgotPassword = "${Config.baseUrl}/forgot-password";
  static String validateOtp = "${Config.baseUrl}/validate-otp";
  static String resetPassword = "${Config.baseUrl}/reset-password";

  // User
  static String getUserProfile = "${Config.baseUrl}/user/profile";
  static String getUserPassword = "${Config.baseUrl}/user/password";
  static String getUserAvatar = "${Config.baseUrl}/user/avatar";

  // Organization
  static String getOwnedOrganizations =
      "${Config.baseUrl}/organizations/owned-organizations";
  static String createOrganization = "${Config.baseUrl}/organizations";
  static String getOrganizationDetail =
      "${Config.baseUrl}/organizations/detail";
  static String switchOrganization = "${Config.baseUrl}/organizations/switch";
  static String getOrganizationLogo = "${Config.baseUrl}/organizations/logo";
  static String settingsOrganization =
      "${Config.baseUrl}/organizations/settings";
  static String updateOrganizationSettings =
      "${Config.baseUrl}/organizations-settings/";

  // Invoice
  static String getInvoices = "${Config.baseUrl}/invoices";
  static String createInvoice = "${Config.baseUrl}/invoices";
  static String getInvoiceByNumber =
      "${Config.baseUrl}/invoices/last-invoice-number";
  static String getInvoiceById = "${Config.baseUrl}/invoices/";
  static String updateInvoiceById = "${Config.baseUrl}/invoices/";
  static String deleteInvoiceById = "${Config.baseUrl}/invoices/";
  static String duplicate = "${Config.baseUrl}/invoices/";

  //  Customer
  static String getCustomers = "${Config.baseUrl}/customers";
  static String createCustomer = "${Config.baseUrl}/customers";
  static String getAllDelCustomers = "${Config.baseUrl}/customers/deleted";
  static String getAllCustomers =
      "${Config.baseUrl}/customers/all-with-deleted";
  static String updateCustomers = "${Config.baseUrl}/customers/";
  static String deleteCustomers = "${Config.baseUrl}/customers/";
  static String softDeleteCustomers = "${Config.baseUrl}/customers/";
  static String restoreCustomers = "${Config.baseUrl}/customers/restore/";

  //  Category
  static String createCategory = "${Config.baseUrl}/categories";
  static String resetCategory = "${Config.baseUrl}/categories/reset";

  // Countries
  static String getCountry = "${Config.baseUrl}/countries/";
  static String getAllCountriesSample =
      "${Config.baseUrl}/countries/all-sample";
  static String getAllCountries = "${Config.baseUrl}/countries/countries";

  //  Products
  static String getProducts = "${Config.baseUrl}/products";
  static String createProduct = "${Config.baseUrl}/products";
  static String getProductById = "${Config.baseUrl}/products/";
  static String updateProductById = "${Config.baseUrl}/products/";
  static String deleteProductById = "${Config.baseUrl}/products/";

  //  Tax
  static String getTaxes = "${Config.baseUrl}/taxes";
  static String createTax = "${Config.baseUrl}/taxes";
  static String getTaxById = "${Config.baseUrl}/taxes/";
  static String updateTaxById = "${Config.baseUrl}/taxes/";
  static String deleteTaxById = "${Config.baseUrl}/taxes/";

  //  Recurring Invoice
  static String getRecurringInvoices = "${Config.baseUrl}/invoices-recurring";
  static String createRecurringInvoice = "${Config.baseUrl}/invoices-recurring";
  static String getRecurringInvoiceById =
      "${Config.baseUrl}/invoices-recurring/";
  static String updateRecurringInvoiceById =
      "${Config.baseUrl}/invoices-recurring/";
  static String deleteRecurringInvoiceById =
      "${Config.baseUrl}/invoices-recurring/";

  // Estimates
  static String getEstimates = "${Config.baseUrl}/estimates";
  static String createEstimate = "${Config.baseUrl}/estimates";
  static String getLastEstimatednumber =
      "${Config.baseUrl}/estimates/last-estimate-number";
  static String getEstimateById = "${Config.baseUrl}/estimates/";
  static String updateEstimateById = "${Config.baseUrl}/estimates/";
  static String converEstimatedToInvoice = "${Config.baseUrl}/estimates/";

  // reports
  static String getReportsSummary = "${Config.baseUrl}/reports/summary";
  static String getReportsCashFlow = "${Config.baseUrl}/reports/cash-flow";
  static String getReportsProfitLoss = "${Config.baseUrl}/reports/profit-loss";
  static String getReportsStats = "${Config.baseUrl}/reports/stats";
  static String getReportsRecent =
      "${Config.baseUrl}/reports/recent-transactions";
  static String getReportsOverdue =
      "${Config.baseUrl}/reports/overdue-invoices";

  // Suggestions
  static String createSuggestion = "${Config.baseUrl}/suggestions";

  // TimeZone
  static String getTimeZones = "${Config.baseUrl}/timezones";

  // Custumer Statements
  static String getCustomerStatements = "${Config.baseUrl}/customer-statements";
  static String createCustomerStatements =
      "${Config.baseUrl}/customer-statements/outstanding-invoice";
  static String getCustomerStatementsByid =
      "${Config.baseUrl}/customer-statements/";
  static String createCustomerStatementsForActivity =
      "${Config.baseUrl}/customer-statements/account-activity";

  // Vendor
  static String getVendors = "${Config.baseUrl}/vendors";
  static String createVendor = "${Config.baseUrl}/vendors";
  static String getVendorById = "${Config.baseUrl}/vendors/";
  static String updateVendorById = "${Config.baseUrl}/vendors/";
  static String deleteVendorById = "${Config.baseUrl}/vendors/";

  // Bill
  static String getBills = "${Config.baseUrl}/bill";
  static String createBill = "${Config.baseUrl}/bill";
  static String getBillById = "${Config.baseUrl}/bill/";
  static String getLastBillNumber = "${Config.baseUrl}/bill/last-bill-number";
  static String updateBillById = "${Config.baseUrl}/bill/";
  static String deleteBillById = "${Config.baseUrl}/bill/";
  static String duplicateBillById = "${Config.baseUrl}/bill/";
}
