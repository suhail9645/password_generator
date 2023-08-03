import 'dart:math';
import 'package:get/get.dart';

class HomePageController extends GetxController {
  final List<bool> checkList = List.filled(4, true).obs;
  final password = ''.obs;
  final count = 4.obs;
  onChangeSlider(int data) {
    count(data);
  }

  onChangeCheck(bool value, int index) {
    checkList[index] = value;
  }

  onGeneratePassword() {
    bool isvalid = false;
    for (var element in checkList) {
      if (element == true) {
        isvalid = true;
        break;
      }
    }
    if (isvalid) {
      bool includeUpperCase = checkList[0];
      bool includeLowerCase = checkList[1];
      bool includeNumbers = checkList[2];
      bool includeSpecialChars = checkList[3];
      String chars = '';
      if (includeUpperCase) chars += 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
      if (includeLowerCase) chars += 'abcdefghijklmnopqrstuvwxyz';
      if (includeNumbers) chars += '0123456789';
      if (includeSpecialChars) chars += '!@#\$%^&*()_-+=<>?/{}[]|~';
      final random = Random();
      String gPassword = '';
      for (int i = 0; i < count.value; i++) {
        gPassword += chars[random.nextInt(chars.length)];
      }
      password(gPassword);
    } else {
      Get.showSnackbar(
        const GetSnackBar(
          message: 'Please chose atleast one option',
          duration: Duration(seconds: 3),
        ),
      );
    }
  }
}
