import 'package:flutter/material.dart';
import 'package:password_generator/const.dart';

class GeneratorPage extends StatefulWidget {
  const GeneratorPage({super.key});

  @override
  State<GeneratorPage> createState() => _GeneratorPageState();
}

class _GeneratorPageState extends State<GeneratorPage> {
  int passwordLength = 4;
  bool includeUpperCase = true;
  bool includeLowerCase = true;
  bool includeNumbers = true;
  bool includeSpecialChars = true;
  late List<bool> checkList;

  @override
  void initState() {
    checkList = [
      includeUpperCase,
      includeLowerCase,
      includeNumbers,
      includeSpecialChars
    ];
    // TODO: implement initState
    super.initState();
  }

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
                  Container(
                    width: double.infinity,
                    height: 70,
                    color: kColor,
                    child: const Center(
                      child: Text(
                        'Password will be displayed here',
                        style: TextStyle(
                            color: Color.fromARGB(255, 142, 141, 141)),
                      ),
                    ),
                  ),
                  spaceForHeight10,
                  Text(
                    'Password length : $passwordLength',
                    style: const TextStyle(color: Colors.grey, fontSize: 16),
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
                          child: Slider(
                            value: passwordLength.toDouble(),
                            onChanged: (double value) {
                              setState(() {
                                passwordLength = value.toInt();
                              });
                            },
                            min: 4,
                            max: 20,
                            divisions: 24,
                            label: passwordLength.toString(),
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
                      (index) => CheckBoxWidget(
                        value: checkList[index],
                        onChanged: (value) {
                          setState(() {
                            checkList[index] = value!;
                          });
                        },
                        title: listCheckBox[index],
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
                              onTap: () {},
                              color: const Color.fromARGB(255, 4, 81, 144),),),
                              spaceForWidth10,
                      Expanded(
                        flex: 2,
                        child: ButtonContainer(
                            text: 'COPY',
                            onTap: () {},
                            color: const Color.fromARGB(255, 87, 90, 90),),
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

class ButtonContainer extends StatelessWidget {
  const ButtonContainer({
    super.key,
    required this.text,
    required this.onTap,
    required this.color,
  });
  final String text;
  final Function() onTap;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(6), color: color),
      child: TextButton(
        onPressed: () {},
        child: Text(
          text,
          style: const TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
    );
  }
}

class CheckBoxWidget extends StatelessWidget {
  const CheckBoxWidget(
      {super.key,
      required this.value,
      required this.onChanged,
      required this.title});
  final bool value;
  final Function(bool? value) onChanged;
  final String title;

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(
        color: Color.fromARGB(255, 169, 165, 165),
        fontSize: 18,
        fontWeight: FontWeight.bold);
    return CheckboxListTile(
      title: Text(
        title,
        style: textStyle,
      ),
      value: value,
      onChanged: onChanged,
    );
  }
}

// import 'dart:math';

// import 'package:flutter/material.dart';

// class RandomPasswordGeneratorPage extends StatefulWidget {
//   @override
//   _RandomPasswordGeneratorPageState createState() =>
//       _RandomPasswordGeneratorPageState();
// }

// class _RandomPasswordGeneratorPageState
//     extends State<RandomPasswordGeneratorPage> {
//   bool _includeUpperCase = true;
//   bool _includeLowerCase = true;
//   bool _includeNumbers = true;
//   bool _includeSpecialChars = true;
//   int _passwordLength = 12;
//   final TextEditingController _passwordController = TextEditingController();

//   String _generatePassword() {
//     String chars = '';
//     if (_includeUpperCase) chars += 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
//     if (_includeLowerCase) chars += 'abcdefghijklmnopqrstuvwxyz';
//     if (_includeNumbers) chars += '0123456789';
//     if (_includeSpecialChars) chars += '!@#\$%^&*()_-+=<>?/{}[]|~';

//     String password = '';
//     final random = Random();
//     for (int i = 0; i < _passwordLength; i++) {
//       password += chars[random.nextInt(chars.length)];
//     }
//     return password;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Random Password Generator'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: <Widget>[
//             CheckboxListTile(
//               title: Text('Include Upper Case'),
//               value: _includeUpperCase,
//               onChanged: (bool? value) {
//                 setState(() {
//                   _includeUpperCase = value!;
//                 });
//               },
//             ),
//             CheckboxListTile(
//               title: Text('Include Lower Case'),
//               value: _includeLowerCase,
//               onChanged: (bool? value) {
//                 setState(() {
//                   _includeLowerCase = value!;
//                 });
//               },
//             ),
//             CheckboxListTile(
//               title: Text('Include Numbers'),
//               value: _includeNumbers,
//               onChanged: (bool? value) {
//                 setState(() {
//                   _includeNumbers = value!;
//                 });
//               },
//             ),
//             CheckboxListTile(
//               title: Text('Include Special Characters'),
//               value: _includeSpecialChars,
//               onChanged: (bool? value) {
//                 setState(() {
//                   _includeSpecialChars = value!;
//                 });
//               },
//             ),
//             Padding(
//               padding: EdgeInsets.all(16.0),
//               child: Row(
//                 children: [
//                   Text('Password Length: '),
//                   SizedBox(width: 10),
//                   Expanded(
//                     child: Slider(
//                       value: _passwordLength.toDouble(),
//                       onChanged: (double value) {
//                         setState(() {
//                           _passwordLength = value.toInt();
//                         });
//                       },
//                       min: 6,
//                       max: 30,
//                       divisions: 24,
//                       label: _passwordLength.toString(),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 String password = _generatePassword();
//                 setState(() {
//                   _passwordController.text = password;
//                 });
//               },
//               child: Text('Generate Password'),
//             ),
//             SizedBox(height: 20),
//             if (_passwordController.text.isNotEmpty)
//               SelectableText(
//                 _passwordController.text,
//                 style: TextStyle(fontSize: 20),
//               ),
//           ],
//         ),
//       ),
//     );
//   }
// }

