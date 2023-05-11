import 'package:flutter_state_management/constants/local_storage.dart';
import 'package:flutter_state_management/screens/my_josh/controller/my_josh_controller.dart';
import 'package:flutter_state_management/screens/team_performance/services/team_performance_api_services.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:intl/intl.dart';

import '../model/employee_model.dart';
import '../model/kpi_list_model.dart';
import '../model/team_performance_model.dart';

class TeamPerformanceController extends GetxController {
  var isLoading = false.obs;
  var errorOccurred = false.obs;
  final kpiListModel = KpiListModel().obs;
  final employeeModel = EmployeeModel().obs;
  final teamPerformanceModel = TeamPerformanceModel().obs;

  var selectName = 0.obs;
  var selectKPI = 0.obs;
  RxString selectTimePeriod = 'ALL'.obs;
  var currentDateTime = "".obs;

  final data = <SalesData>[].obs;

  var timePeriod = [
    'ALL',
    'TODAY',
    'YESTERDAY',
    'WTD',
    'MTD',
    'YTD',
  ];

  @override
  void onInit() {
    getKpiList();
    teamEmployeeList();
    getTeamPerformanceList();
    getCurrentDateTime();
    super.onInit();
  }

  Future<void> onRefresh() async {
    getKpiList();
    teamEmployeeList();
    getTeamPerformanceList();
    getCurrentDateTime();
  }

  Future<void> getCurrentDateTime() async {
    currentDateTime.value =  DateFormat('dd/MM/yyyy hh:mm:ss a').format(DateTime.now());
  }

  Future<void> getKpiList() async {
    isLoading(true);
    errorOccurred(false);
    try {
      kpiListModel.value = await TeamPerformanceApiServices().getKpiList();
      kpiListModel.value.kpiData?.insert(
          0,
          KpiDetails(
              id: 0,
              industryWorkTypeId: 0,
              organiztaionId: 0,
              name: "All",
              kpiType: "",
              kpiUnit: "",
              expected: "",
              kpiTarget: "",
              targetTimePeriod: "",
              applicable: ""));
      selectKPI.value = kpiListModel.value.kpiData!.first.id;
    } catch (e) {
      errorOccurred(true);
    } finally {
      isLoading(false);
    }
  }

  Future<void> teamEmployeeList() async {
    isLoading(true);
    errorOccurred(false);
    try {
      employeeModel.value = await TeamPerformanceApiServices().teamEmployeeList(LocalStorage.user().id);
      employeeModel.value.employees?.insert(0, Employee(id: 0, userFirstName: "All", userLastName: "", roleId: 0, roleRoleName: "",userImage: ""));
      selectName.value = employeeModel.value.employees!.first.id;
    } catch (e) {
      errorOccurred(true);
    } finally {
      isLoading(false);
    }
  }

  String getTime(time) {
    switch (time) {
      case 'ALL':
        return 'all';
      case 'TODAY':
        return 'today';
      case 'YESTERDAY':
        return 'yesterday';
      case 'WTD':
        return 'wtd';
      case 'MTD':
        return 'mtd';
      case 'YTD':
        return 'ytd';
    }
    return 'all';
  }

  Future<void> getTeamPerformanceList() async {
    isLoading(true);
    errorOccurred(false);
    try {
      data.clear();
      teamPerformanceModel.value =
          await TeamPerformanceApiServices().getTeamPerformanceList(selectKPI.value,selectName.value,getTime(selectTimePeriod));
      for (var i = 0;
          i < teamPerformanceModel.value.kpiTrendChartData!.length;
          i++) {
        var mood = teamPerformanceModel.value.kpiTrendChartData![i];
        data.add(
            SalesData(mood.date.toString().substring(0, 10), mood.kpiPercent));
      }
    } catch (e) {
      errorOccurred(true);
    } finally {
      isLoading(false);
    }
  }

}
