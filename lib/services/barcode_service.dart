import 'dart:convert';
import 'package:flutter/services.dart' as bundle;

class BarCodeService {
  static Future<List<dynamic>>? getData() async {
    try {
      final data =
          await bundle.rootBundle.loadString('lib/core/data/mock_data.json');
      final list = jsonDecode(data) as List;

      return list;
    } catch (e) {
      return [];
    }
  }
}
