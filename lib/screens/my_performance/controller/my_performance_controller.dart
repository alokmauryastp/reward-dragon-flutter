import 'package:flutter_state_management/screens/my_performance/model/kpi_performance_data.dart';
import 'package:flutter_state_management/screens/my_performance/services/my_performance_api_service.dart';
import 'package:flutter_state_management/screens/user_home_screen/controller/user_home_controller.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../user_home_screen/model/win_level_points.dart';
import '../../user_home_screen/services/user_home_api_services.dart';

class MyPerformanceController extends GetxController {

  var isLoading = false.obs;
  var errorOccurred = false.obs;
  final kpiPerformanceData = KpiPerformanceData().obs;
  var currentDateTime = "".obs;
  // var selectedDate ="".obs;
  var fromDate ="".obs;
  var toDate ="".obs;
  final winLeveLPoints = WinLeveLPoints().obs;


  @override
  void onInit() {
    getKpiPerformanceData();
    getCurrentDateTime();
    winLevelPointsApi();
    super.onInit();
  }


  @override
  void onClose() {
    UserHomeController().onRefresh();
  }

  Future<void> onRefresh() async {
    getKpiPerformanceData();
    getCurrentDateTime();
    winLevelPointsApi();
  }


  Future<void> winLevelPointsApi() async {
    isLoading(true);
    errorOccurred(false);
    try {
      winLeveLPoints.value = await UserHomeApiServices().winLevelPoints();
      isLoading(false);
    } catch (e) {
      errorOccurred(true);
    } finally {
      isLoading(false);
    }
  }

  Future<void> getCurrentDateTime() async {
    currentDateTime.value =  DateFormat('dd/MM/yyyy hh:mm:ss a').format(DateTime.now());
  }

  Future<void> getKpiPerformanceData() async {
    isLoading(true);
    errorOccurred(false);
    try {
      kpiPerformanceData.value = await MyPerformanceApiService().getKpiPerformanceData(fromDate.value,toDate.value,);
    } catch (e) {
      errorOccurred(true);
    } finally {
      isLoading(false);
    }
  }
}
