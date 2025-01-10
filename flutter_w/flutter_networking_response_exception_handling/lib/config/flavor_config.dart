import 'package:flutter_networking_response_exception_handling/config/config_dev.dart';
import 'package:flutter_networking_response_exception_handling/config/config_prod.dart';

enum Flavor {
  DEV,
  PRODUCTION,
}

class FlavorConfig {
  static Flavor? appFlavor;

  static void setupFlavor(Flavor flavor) {
    appFlavor = flavor;
  }

  static String get baseUrl {
    switch (appFlavor) {
      case Flavor.DEV:
        return ConfigDev.baseUrl;
      case Flavor.PRODUCTION:
        return ConfigProd.baseUrl;
      default:
        throw Exception("Flavor is not set!");
    }
  }
}