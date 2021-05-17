import 'dart:convert';
import 'package:http/http.dart' as http;

import 'PeriodicTableModel.dart';

class PeriodicTableRepo {
  Future<PeriodicTableModel> getUsers() async {
    final url = "https://reqres.in/api/users";
    try {
      final response = await http.get(url);

      if (response.statusCode == 201||response.statusCode == 200) {
        return PeriodicTableModel.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('Failed to with response code state ${response.statusCode}');
      }
    } catch (error) {
      rethrow;
    }
  }
}
