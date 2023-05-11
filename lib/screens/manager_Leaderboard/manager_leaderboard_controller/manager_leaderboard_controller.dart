import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class ManagerLeaderBoardController extends GetxController {
  RxString selectGroupDropdownValue = 'select'.obs;
  RxString selectNameDropdownValue = 'All'.obs;
  RxString timePeriodDropdownvalue = 'select'.obs;
  var selectGroupItems = [
    'select',
    'unselect',
  ];
  var selectNameItems = [
    'All',
    'few',
  ];
  var selectTimePeriodItems = [
    'select',
    'Today',
  ];
}
