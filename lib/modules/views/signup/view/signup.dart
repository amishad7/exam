import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled1/modules/utils/helper/dbhelper.dart';
import 'package:untitled1/modules/views/signup/view/components/components.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    int? res;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(bottom: 30),
              alignment: Alignment.bottomCenter,
              child: Text(
                "SIgn up here".toUpperCase(),
                style: const TextStyle(
                  color: Color(0xfff48757),
                  fontSize: 30,
                  letterSpacing: -2,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(53),
                color: const Color(0xfff48757),
              ),
              child: Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 26, top: 80, right: 26),
                    child: TextFormField(
                      controller: nameEditor,
                      autocorrect: true,
                      cursorColor: Colors.black,
                      decoration: const InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        enabled: true,
                        labelStyle: TextStyle(color: Colors.black),
                        labelText: "username",
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 26, top: 20, right: 26),
                    child: TextFormField(
                      controller: passwordEditor,
                      autocorrect: true,
                      cursorColor: Colors.black,
                      decoration: const InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        enabled: true,
                        labelStyle: TextStyle(color: Colors.black),
                        labelText: "password",
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 26, top: 20, right: 26),
                    child: TextFormField(
                      controller: mailEditor,
                      autocorrect: true,
                      cursorColor: Colors.black,
                      decoration: const InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        enabled: true,
                        labelStyle: TextStyle(color: Colors.black),
                        labelText: "mail",
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 28.0),
                    child: StatefulBuilder(
                      builder: (context, setState) => FilledButton(
                        style: FilledButton.styleFrom(
                          backgroundColor: Colors.black,
                        ),
                        onPressed: () async {
                          res = await DBHelper.instance.insertValue(
                              name: nameEditor.text,
                              mail: mailEditor.text,
                              password: passwordEditor.text);

                          if (res != null) {
                            mailEditor.clear();
                            passwordEditor.clear();
                            nameEditor.clear();

                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                backgroundColor: Colors.black,
                                //  elevation: 0.6,
                                shape: UnderlineInputBorder(
                                  borderRadius: BorderRadius.circular(23),
                                ),
                                showCloseIcon: true,

                                content: const Text('process done'),
                              ),
                            );

                            Get.offAllNamed("/home");
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                backgroundColor: Colors.black,
                                //  elevation: 0.6,
                                shape: UnderlineInputBorder(
                                  borderRadius: BorderRadius.circular(23),
                                ),
                                showCloseIcon: true,

                                content: const Text('error try again'),
                              ),
                            );
                          }
                        },
                        child: const Text("SUBMIT"),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
