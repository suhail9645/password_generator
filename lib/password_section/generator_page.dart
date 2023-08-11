import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:password_generator/const.dart';
import 'package:password_generator/password_section/controller.dart';
import 'widget/custom_widget.dart';

class GeneratorPage extends StatelessWidget {
  GeneratorPage({super.key});

  final HomePageController controller = Get.put(HomePageController());

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(
        color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold);
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 55,
              color: kColor,
              child: const Row(
                children: [
                  spaceForWidth10,
                  Icon(
                    Icons.lock,
                    color: Colors.white,
                  ),
                  spaceForWidth10,
                  Text(
                    'PASSWORD GENERATOR',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 19,
                        color: Colors.white),
                  )
                ],
              ),
            ),
            spaceForHeight20,
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    children: [
                      Text(
                        'GENERATED PASSWORD',
                        textAlign: TextAlign.start,
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                  spaceForHeight10,
                  Obx(
                    () => Container(
                      width: double.infinity,
                      height: 70,
                      color: kColor,
                      child: Center(
                          child: controller.password.value == ''
                              ? const Text(
                                  'Password will be displayed here',
                                  style: TextStyle(
                                      color:
                                          Color.fromARGB(255, 142, 141, 141)),
                                )
                              : Text(controller.password.value,
                                  style: const TextStyle(
                                      letterSpacing: 1.5,
                                      color: Colors.white,
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold))),
                    ),
                  ),
                  spaceForHeight10,
                  Obx(
                    () => Text(
                      'Password length : ${controller.count.value}',
                      style: const TextStyle(color: Colors.grey, fontSize: 16),
                    ),
                  ),
                  spaceForHeight10,
                  Container(
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                        color: kColor, borderRadius: BorderRadius.circular(6)),
                    child: Row(
                      children: [
                        spaceForWidth10,
                        const Text(
                          '4',
                          style: textStyle,
                        ),
                        Expanded(
                          child: Obx(
                            () => Slider(
                                value: controller.count.value.toDouble(),
                                onChanged: (double value) {
                                  controller.onChangeSlider(value.toInt());
                                },
                                min: 4,
                                max: 20,
                                divisions: 24,
                                label: controller.count.value.toString()),
                          ),
                        ),
                        const Text(
                          '20',
                          style: textStyle,
                        ),
                        spaceForWidth10,
                      ],
                    ),
                  ),
                  spaceForHeight20,
                  const Text(
                    'SETTINGS',
                    style: TextStyle(color: Colors.grey),
                  ),
                  Column(
                    children: List.generate(
                      4,
                      (index) => Obx(
                        () => CheckBoxWidget(
                          value: controller.checkList[index],
                          onChanged: (value) {
                            controller.onChangeCheck(value!, index);
                          },
                          title: listCheckBox[index],
                        ),
                      ),
                    ),
                  ),
                  spaceForHeight20,
                  Row(
                    children: [
                      Expanded(
                        flex: 5,
                        child: ButtonContainer(
                          text: 'GENERATE PASSWORD',
                          onTap: () {
                            controller.onGeneratePassword();
                          },
                          color: const Color.fromARGB(255, 4, 81, 144),
                        ),
                      ),
                      spaceForWidth10,
                      Expanded(
                        flex: 2,
                        child: ButtonContainer(
                          text: 'COPY',
                          onTap: () {
                            Clipboard.setData(
                                ClipboardData(text: controller.password.value));
                            Get.showSnackbar(
                              const GetSnackBar(
                                message: 'Password Copied',
                                duration: Duration(seconds: 3),
                              ),
                            );
                          },
                          color: const Color.fromARGB(255, 87, 90, 90),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
