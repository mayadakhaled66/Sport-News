import 'dart:convert';
import 'package:http/http.dart' as http;

import 'PeriodicTableModel.dart';

class PeriodicTableRepo {
  Future<PeriodicTableModel> getUsers() async {
    final url = "https://reqres.in/api/users";
    try {
      final response = await http.get(
        url,
        // headers: {"app-id" : "602ac221ac5aaa7e77047aa2"},
        // body: {
        //   "email": username,
        //   "password": password
        // },
      );

      if (response.statusCode == 201||response.statusCode == 200) {
        return PeriodicTableModel.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('Failed to with response code state ${response.statusCode}');
      }
    } catch (error) {
      rethrow;
    }
  }
  // Future<TagModel> getTags() async {
  //   final url = "https://dummyapi.io/data/api/tag";
  //   try {
  //     final response = await http.get(
  //       url,headers: {"app-id" : "602ac221ac5aaa7e77047aa2"},
  //       // body: {
  //       //   "email": username,
  //       //   "password": password
  //       // },
  //     );
  //
  //     if (response.statusCode == 201||response.statusCode == 200) {
  //       return TagModel.fromJson(jsonDecode(response.body));
  //     } else {
  //       throw Exception('Failed to with response code state ${response.statusCode}');
  //     }
  //   } catch (error) {
  //     rethrow;
  //   }
  // }
  // Future<PostModel> getPosts() async {
  //   final url = "https://dummyapi.io/data/api//post";
  //   try {
  //     final response = await http.get(
  //       url,headers: {"app-id" : "602ac221ac5aaa7e77047aa2"},
  //       // body: {
  //       //   "email": username,
  //       //   "password": password
  //       // },
  //     );
  //
  //     if (response.statusCode == 201||response.statusCode == 200) {
  //       return PostModel.fromJson(jsonDecode(response.body));
  //     } else {
  //       throw Exception('Failed to with response code state ${response.statusCode}');
  //     }
  //   } catch (error) {
  //     rethrow;
  //   }
  // }
  // Future<PostModel> getPostsPerUserId({@required String userId}) async {
  //   final url = "https://dummyapi.io/data/api/user/$userId/post";
  //   try {
  //     final response = await http.get(
  //       url,headers: {"app-id" : "602ac221ac5aaa7e77047aa2"},
  //       // body: {
  //       //   "email": username,
  //       //   "password": password
  //       // },
  //     );
  //
  //     if (response.statusCode == 201||response.statusCode == 200) {
  //       return PostModel.fromJson(jsonDecode(response.body));
  //     } else {
  //       throw Exception('Failed to with response code state ${response.statusCode}');
  //     }
  //   } catch (error) {
  //     rethrow;
  //   }
  // }
}
