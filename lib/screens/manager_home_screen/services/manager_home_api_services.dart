import 'package:flutter_state_management/constants/urls.dart';
import '../../../constants/local_storage.dart';
import 'package:http/http.dart' as http;
import '../model/manager_kpi_data.dart';

class ManagerHomeApiServices {


  Future<ManagerKpiData> getManagerKpiData() async {
    Uri uri = Uri.parse(managerKpiMetAndWipUrl);
    var user = LocalStorage.user();
    try {
      var headers = <String, String>{'Authorization': user.token};

      var body = <String, String>{
        'manager_id': user.id.toString(),
        'team_id': user.teamId.toString()
      };
      final response = await http.post(uri, body: body, headers: headers);
      final managerKpiData = managerKpiDataFromJson(response.body);
      return managerKpiData;
    } catch (e) {
      rethrow;
    }
  }
}
