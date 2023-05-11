import 'dart:convert';
import 'package:flutter_state_management/constants/local_storage.dart';
import 'package:flutter_state_management/constants/urls.dart';
import 'package:http/http.dart' as http;

import '../model/my_campaign_model.dart';

class MyCampaignApiServices {

  Future<MyCampaignModel> getCampaignList() async {
    Uri uri = Uri.parse(myCampaignListUrl);
    var user = LocalStorage.user();
    try {
      var headers = <String, String>{
        'Authorization': user.token,
        'content-type': 'application/json'
      };
      var body = <String, dynamic>{
        'unique_code': user.uniqueCode,
        'team_id': user.teamId,
      };
      final response =
          await http.post(uri, headers: headers, body: json.encode(body));

      final myCampaignModel = myCampaignModelFromJson(response.body);
      return myCampaignModel;
    } catch (e) {
      rethrow;
    }
  }
}
