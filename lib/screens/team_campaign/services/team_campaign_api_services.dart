import 'dart:convert';
import 'package:flutter_state_management/constants/local_storage.dart';
import 'package:flutter_state_management/constants/urls.dart';
import 'package:flutter_state_management/screens/login_screen/model/user.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import '../model/campaign_data.dart';
import '../model/campaign_purpose_model.dart';
import '../model/create_campaign_model.dart';
import '../model/industry_work_data.dart';
import '../model/kpi_model.dart';

class TeamCampaignApiServices {
  Future<CampaignData> getCampaignList() async {
    Uri uri = Uri.parse(getCampaignListUrl);
    try {
      User user = LocalStorage.user();
      var headers = <String, String>{'Authorization': user.token};
      var body = <String, String>{'user_id': user.id.toString()};
      final response = await http.post(uri, headers: headers, body: body);
      final campaignData = campaignDataFromJson(response.body);
      return campaignData;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> sendCampaignToWhatsapp(campaignId) async {
    Uri uri = Uri.parse(sendCampaignToWhatsappUrl);
    var user = LocalStorage.user();
    try {
      var headers = <String, String>{
        'Authorization': user.token,
        'content-type': 'application/json'
      };
      var body = <String, dynamic>{
        'user_id': user.id,
        'campaign_id': campaignId,
      };
      await http.post(uri, headers: headers, body: jsonEncode(body));
    } catch (e) {
      rethrow;
    }
  }

  Future<IndustryWorkData> getIndustryListData() async {
    Uri uri = Uri.parse(industryListDataUrl);
    try {
      User user = LocalStorage.user();
      var headers = <String, String>{'Authorization': user.token};
      var body = <String, String>{'unique_code': user.uniqueCode};
      final response = await http.post(uri, headers: headers, body: body);
      final industryWorkData = industryWorkDataFromJson(response.body);
      return industryWorkData;
    } catch (e) {
      rethrow;
    }
  }

  Future<CampaignPurposeModel> getCampaignPurposeList() async {
    Uri uri = Uri.parse(campaignPurposeListUrl);
    try {
      User user = LocalStorage.user();
      var headers = <String, String>{'Authorization': user.token};
      var response = await http.get(uri, headers: headers);
      final campaignPurposeModel = campaignPurposeModelFromJson(response.body);
      return campaignPurposeModel;
    } catch (e) {
      rethrow;
    }
  }

  Future<KpiModel> getKpiListData(industryId, type) async {
    var queryParameters = <String, String>{
      'industry_id': industryId.toString(),
      'type': type,
    };
    Uri uri = Uri.parse(kpiListUrl).replace(queryParameters: queryParameters);
    try {
      var headers = <String, String>{
        'Authorization': LocalStorage.user().token
      };
      var response = await http.get(uri, headers: headers);
      final kpiModel = kpiModelFromJson(response.body);
      return kpiModel;
    } catch (e) {
      rethrow;
    }
  }

  Future<CreateCampaignModel> createCampaign(campaignPurposeId, campaignName,
      startDate, endDate, industryWorkTypeId, criteriaPoint) async {
    Uri uri = Uri.parse(createCampaignUrl);
    try {
      User user = LocalStorage.user();
      var headers = <String, String>{
        'Authorization': user.token,
        'content-type': 'application/json'
      };
      var body = <String, dynamic>{
        'user_id': user.id,
        'campaign_purpose_id': campaignPurposeId,
        'campaign_name': campaignName,
        'start_date': startDate,
        'end_date': endDate,
        'industry_work_type_id': industryWorkTypeId,
        'broadcast_id': 1,
        'criteria_point': criteriaPoint,
      };
      final response = await http.post(uri, headers: headers, body: jsonEncode(body));
      final createCampaignModel = createCampaignModelFromJson(response.body);
      return createCampaignModel;
    } catch (e) {
      rethrow;
    }
  }

  Future<int> endCampaignByManager(campaignId) async {
    Uri uri = Uri.parse(endCampaignByManagerUrl);
    try {
      User user = LocalStorage.user();
      var headers = <String, String>{
        'Authorization': user.token,
        'content-type': 'application/json'
      };
      var body = <String, dynamic>{
        'user_id': user.id,
        'campaign_id': campaignId,
        'is_completed_by_manager': 1,
        'updated_end_date': DateTime.now().toString().substring(0, 10),
        //YYYY-MM-DD
      };
      final response =
          await http.post(uri, headers: headers, body: jsonEncode(body));

      if (response.statusCode == 200) {
        var obj = jsonDecode(response.body);
        var resCode = obj['response_code'];
        if (resCode == 200) {
          //refresh
          Fluttertoast.showToast(msg: obj['message']);
        } else {
          Fluttertoast.showToast(msg: obj['message']);
        }
      }
      return response.statusCode;
    } catch (e) {
      rethrow;
    }
  }
}
