import 'package:get/get.dart';

import 'ar_map.dart';
import 'en_map.dart';

class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {'en': en, 'ar': ar};
}