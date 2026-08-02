import 'package:get/get.dart';

class MyBookingsController extends GetxController {
  // Selected tab: 'upcoming', 'past', 'cancelled'
  var selectedTab = 'upcoming'.obs;

  void selectTab(String tab) {
    selectedTab.value = tab;
  }
}