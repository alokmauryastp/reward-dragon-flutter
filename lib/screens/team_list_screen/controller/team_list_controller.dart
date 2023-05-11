import 'package:get/get.dart';
import '../../leaderboard_screen/model/team_list_reward_resource.dart';
import '../../team_performance/model/employee_model.dart';
import '../services/team_list_api_services.dart';

class TeamListController extends GetxController {

  var isLoading = false.obs;
  var errorOccurred = false.obs;
  final teamListRewardResource = TeamListRewardResource().obs;
  final employeeModel = EmployeeModel().obs;
  var teamId = Get.arguments;
  List<Employee> teamList = [];
  Rx<List<Employee>> searchResult = Rx([]);

  @override
  void onInit() {
    teamEmployeeList();
    super.onInit();
  }

  Future<void> onRefresh() async {
    teamEmployeeList();
  }

  onChanged(String text) async {
    if (text.isEmpty) {
      searchResult.value = teamList;
      return;
    }
    searchResult.value = teamList
        .where((element) =>
        element.userFirstName.toLowerCase().contains(text.toLowerCase()))
        .toList();
  }

  Future<void> teamEmployeeList() async {
    isLoading(true);
    errorOccurred(false);
    try {
      employeeModel.value = await TeamListApiServices().teamEmployeeList(teamId);
      teamList = employeeModel.value.employees!;
      searchResult.value = teamList;
    } catch (e) {
      errorOccurred(true);
    } finally {
      isLoading(false);
    }
  }
}
