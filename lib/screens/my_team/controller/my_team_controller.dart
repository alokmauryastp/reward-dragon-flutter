import 'package:flutter_state_management/screens/my_team/services/my_team_api_services.dart';
import 'package:get/get.dart';
import '../model/team_data_model.dart';

class MyTeamController extends GetxController {
  var isLoading = false.obs;
  var errorOccurred = false.obs;
  final teamDataModel = TeamDataModel().obs;
  List<TeamList> teamList = [];
  Rx<List<TeamList>> searchResult = Rx([]);

  @override
  void onInit() {
    getTeamData();
    super.onInit();
  }

  Future<void> onRefresh() async {
    getTeamData();
  }

  onChanged(String text) async {
    if (text.isEmpty) {
      searchResult.value = teamList;
      return;
    }
    searchResult.value = teamList
        .where((element) => element.employeeName.toLowerCase().contains(text.toLowerCase()))
        .toList();
  }

  Future<void> getTeamData() async {
    isLoading(true);
    errorOccurred(false);
    try {
      teamDataModel.value = await MyTeamApiServices().getTeamData();
      teamList = teamDataModel.value.teamsData!.teamList;
      searchResult.value = teamList;
    } catch (e) {
      errorOccurred(true);
    } finally {
      isLoading(false);
    }
  }
}
