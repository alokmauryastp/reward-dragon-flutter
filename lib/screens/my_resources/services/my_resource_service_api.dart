import 'dart:convert';
import 'package:flutter_state_management/constants/local_storage.dart';
import '../../../constants/urls.dart';
import 'package:http/http.dart' as http;
import '../model/company_site_data.dart';
import '../model/leadership_talk.dart';
import '../model/learning_material_model.dart';
import '../model/other_link_list.dart';

class MyResourceApiService {

  Future<LearningMaterial> getLearningMaterial() async {
    var user = LocalStorage.user();
    var params = <String, dynamic>{'unique_code': user.uniqueCode};
    Uri uri = Uri.parse(learningMaterialUrl).replace(queryParameters: params);
    var headers = <String, String>{
      'Authorization': user.token,
      'content-type': 'application/json'
    };
    try {
      final response = await http.get(uri, headers: headers);
      final learningMaterial = learningMaterialFromJson(response.body);
      return learningMaterial;
    } catch (e) {
      rethrow;
    }
  }

  //Company portal / Intranet
  Future<CompanySiteData> getCompanySiteListData() async {
    Uri uri = Uri.parse(companySiteDataUrl);
    try {
      var headers = <String, String>{
        'Authorization': LocalStorage.user().token
      };
      final response = await http.get(uri, headers: headers);
      final companySiteData = companySiteDataFromJson(response.body);
      return companySiteData;
    } catch (e) {
      rethrow;
    }
  }

  //Leadership Talk
  Future<LeadershipTalk> getGetLeadershipTalkListData() async {
    Uri uri = Uri.parse(getGetLeadershipTalkListDataUrl);
    var user = LocalStorage.user();
    try {
      var headers = <String, String>{
        'Authorization': user.token,
        'content-type': 'application/json'
      };
      var body = <String, dynamic>{
        'unique_code': user.uniqueCode,
      };
      final response = await http.post(uri, headers: headers, body: jsonEncode(body));
      final leadershipTalk = leadershipTalkFromJson(response.body);
      return leadershipTalk;
    } catch (e) {
      rethrow;
    }
  }

  Future<OtherLinkModel> getOtherLinkListData() async {
    Uri uri = Uri.parse(otherLinkDataUrl);
    try {
      var headers = <String, String>{
        'Authorization': LocalStorage.user().token
      };
      final response = await http.get(uri, headers: headers);
      final otherLinkList = otherLinkListFromJson(response.body);
      return otherLinkList;
    } catch (e) {
      rethrow;
    }
  }

}
