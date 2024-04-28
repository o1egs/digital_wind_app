import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({super.key});

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  TextEditingController controller = TextEditingController();
  final GlobalKey<FormState> textFormKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: [Colors.purple, Colors.deepOrangeAccent],
                ),
            ),
            width: 342,
          ),
          const SizedBox(
            width: 400,
            child: Image(image: AssetImage('assets/neo.png'),),
          ),
          TextFormField(
            key: textFormKey,
            controller: controller,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Введите имя пж';
              }
              return null;
            },
            decoration: const InputDecoration(
              hintText: 'Введите ник',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 20),
            width: MediaQuery.of(context).size.width,
            height: 60,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.purple, Colors.deepOrangeAccent],
              ),
              borderRadius: BorderRadius.all(Radius.circular(12)),
            ),
            child: ElevatedButton(
              onPressed: () {handleClick();},
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent),
              child: const Text("Погнали учиться", style: TextStyle(color: Colors.white),),
            ),
          )
        ],
      ),
    );
  }

  void handleClick() async {
    Navigator.pushReplacementNamed(context, '/tasks');
  }

  Future<Map<String, dynamic>> loadJsonData() async {
    String jsonData = await rootBundle.loadString('assets/data.json');
    Map<String, dynamic> data = jsonDecode(jsonData);
    return data;
  }
}
