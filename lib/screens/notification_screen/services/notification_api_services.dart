import 'dart:convert';
import 'package:flutter_state_management/constants/local_storage.dart';
import 'package:flutter_state_management/constants/urls.dart';
import 'package:flutter_state_management/screens/login_screen/model/user.dart';
import 'package:http/http.dart' as http;
import '../model/notification_model.dart';

class NotificationApiServices {
  Future<NotificationModel> getNotificationList(page) async {
    Uri uri = Uri.parse(notificationUrl);
    try {
      var headers = <String, String>{
        'Authorization': LocalStorage.user().token,
        'content-type': 'application/json',
      };
      var body = <String, dynamic>{
        'user_id': LocalStorage.user().id,
        'page': page
      };
      final response =
          await http.post(uri, body: jsonEncode(body), headers: headers);
      final notificationModel = notificationModelFromJson(response.body);
      return notificationModel;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> markReadNotification(selectedIds) async {
    Uri uri = Uri.parse(markReadNotificationUrl);
    try {
      User user = LocalStorage.user();
      var headers = <String, String>{
        'Authorization': user.token,
        'content-type': 'application/json'
      };
      var body = <String, dynamic>{
        'user_id': user.id.toString(),
        'notification_ids': selectedIds,
      };
      await http.post(uri, headers: headers, body: jsonEncode(body));
    } catch (e) {
      rethrow;
    }
  }

  Future<void> markUnReadNotification(selectedIds) async {
    Uri uri = Uri.parse(markUnReadNotificationUrl);
    try {
      User user = LocalStorage.user();
      var headers = <String, String>{
        'Authorization': user.token,
        'content-type': 'application/json'
      };
      var body = <String, dynamic>{
        'user_id': user.id.toString(),
        'notification_ids': selectedIds,
      };
      await http.post(uri, headers: headers, body: jsonEncode(body));
    } catch (e) {
      rethrow;
    }
  }

  Future<void> deleteNotification(selectedIds) async {
    Uri uri = Uri.parse(deleteNotificationUrl);
    try {
      User user = LocalStorage.user();
      var headers = <String, String>{
        'Authorization': user.token,
        'content-type': 'application/json'
      };
      var body = <String, dynamic>{
        'user_id': user.id.toString(),
        'notification_ids': selectedIds,
      };
      await http.post(uri, headers: headers, body: jsonEncode(body));
    } catch (e) {
      rethrow;
    }
  }
}
