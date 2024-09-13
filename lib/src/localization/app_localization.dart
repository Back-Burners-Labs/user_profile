import 'package:get/get.dart';
import 'ar_ab/ar_ae_translations.dart';
import 'en_us/en_us_translations.dart';
import 'es_sp/es_es_translations.dart';
import 'fr_fr/fr_fr_translations.dart';
import 'gr_de/gr_de_translations.dart';
import 'hi_sk/hi_in_translations.dart';

class AppLocalization extends Translations {


  @override
  Map<String, Map<String, String>> get keys =>
      {'en_US': enUs,
        'es_ES':esEs,
        'gr_DE':grDe,
        'ar_AE':arAe,
        'hi_IN':hiIn,
        'fr_FR':frFr
      };


}
