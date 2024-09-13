class AppConfig {
  static const String defaultLanguage = "en";
  static const bool https = false;
  static const String domainPath = "38.242.248.221:3000";
  static const String apiEndPath = "api/";
  static const String protocol = https ? "https://" : "http://";
  static const String rawBaseUrl = "$protocol$domainPath";
  static const String baseUrl = rawBaseUrl;
  static const cloudName = "NextUpFit";
  static const cloudApiSecret = "VBfuCDJ2VWNwkZNx8GcBIDx7MKU";
  static const cloudApiKey = "973966771388895";

  static const edamamAppId = "a14c5b73";

  static const edamamAppKey = "883be8a7cf66fdfcfae3c43e765704dd";
}
