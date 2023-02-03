import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:password_generator/password_generator.dart';
import 'package:password_generator/widgets/checkbox_widget.dart';
import 'package:password_generator/widgets/slider_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String password = 'Generate to see your password';

  bool letters = true;
  bool capitalLetters = false;
  bool numbers = false;
  bool symbols = false;

  int passLength = 12;

  void _generatePassword() {
    setState(() {
      password = generateRandomString(
          size: passLength,
          useLetters: letters,
          useCapitalLetters: capitalLetters,
          useNumbers: numbers,
          useSymbols: symbols);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          appBar:
              AppBar(title: const Text('Juggler'), shadowColor: Colors.white24),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                  padding: const EdgeInsets.only(top: 50, bottom: 30),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Container(
                      width: 350,
                      height: 150,
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 40, 40, 40),
                        borderRadius: BorderRadius.all(Radius.circular(3)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          password,
                          style: const TextStyle(
                            fontFamily: 'monaco',
                            fontSize: 20,
                            color: Colors.orange,
                          ),
                        ),
                      ),
                    ),
                  ),),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                      padding: const EdgeInsets.all(10),
                      child: MaterialButton(
                        onPressed: () {
                          Clipboard.setData(ClipboardData(text: password));
                        },
                        color: Colors.blue,
                        child: const Padding(
                            padding: EdgeInsets.only(
                                left: 40, right: 40, top: 10, bottom: 10),
                            child: Text('Copy',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20))),
                      )),
                  Padding(
                      padding: const EdgeInsets.all(10),
                      child: MaterialButton(
                        onPressed: _generatePassword,
                        color: Colors.blue,
                        child: const Padding(
                            padding: EdgeInsets.only(
                                left: 25, right: 25, top: 10, bottom: 10),
                            child: Text('Generate',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20))),
                      )),
                ],
              ),
              SafeSlider(
                  initialValue: passLength,
                  onChanged: (int value) {
                    setState(() {
                      passLength = value;
                    });
                  }),
              SafeCheckBox(
                  title: "Letters",
                  initialValue: letters,
                  onChanged: (bool value) {
                    setState(() {
                      letters = value;
                    });
                  }),
              SafeCheckBox(
                  title: "Capital letters",
                  initialValue: capitalLetters,
                  onChanged: (bool value) {
                    setState(() {
                      capitalLetters = value;
                    });
                  }),
              SafeCheckBox(
                  title: "Symbols",
                  initialValue: symbols,
                  onChanged: (bool value) {
                    setState(() {
                      symbols = value;
                    });
                  }),
              SafeCheckBox(
                  title: "Numbers",
                  initialValue: numbers,
                  onChanged: (bool value) {
                    setState(() {
                      numbers = value;
                    });
                  }),
            ],
          ),
        ));
  }
}
