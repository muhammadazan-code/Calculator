import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  final firstController = TextEditingController();
  final secondController = TextEditingController();
  String solution = "";
  String num1 = "";
  String num2 = "";
  String operator = "";
  FocusNode? myFocusNode;
  @override
  void initState() {
    myFocusNode = FocusNode();
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    myFocusNode?.dispose();
    firstController.dispose();
    secondController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculator"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 10,
              children: [
                Text("Enter first number"),
                TextField(
                  focusNode: myFocusNode,
                  autofocus: true,
                  keyboardType: TextInputType.number,
                  controller: firstController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                ),
                Text("Enter second number"),
                TextField(
                  inputFormatters: [],
                  keyboardType: TextInputType.number,
                  controller: secondController,
                  decoration: InputDecoration(border: OutlineInputBorder()),
                ),
                Text("Solution"),
                SingleChildScrollView(
                  child: Container(
                    width: double.infinity,
                    height: size.height / 14,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      border: Border.all(color: Colors.black),
                    ),
                    child: Text(
                      solution,
                      style: TextTheme.of(context).bodyMedium!.copyWith(
                          fontSize: 20, fontWeight: FontWeight.normal),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Column(
                  children: [
                    Row(
                      spacing: 20,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ReuseableWidget(
                          text: "Add",
                          onPressed: () {
                            setState(() {
                              operator = "+";
                            });
                            double num1 = double.parse(firstController.text);
                            double num2 = double.parse(secondController.text);
                            solution = (num1 + num2).toString();
                            setState(() {});
                            FocusManager.instance.primaryFocus?.unfocus();
                          },
                        ),
                        ReuseableWidget(
                          text: "Subtract",
                          onPressed: () {
                            setState(() {
                              operator = "-";
                            });

                            double num1 = double.parse(firstController.text);
                            double num2 = double.parse(secondController.text);
                            solution = (num1 - num2).toString();
                            setState(() {});
                            FocusManager.instance.primaryFocus?.unfocus();
                          },
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      spacing: 20,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ReuseableWidget(
                          text: "Multiply",
                          onPressed: () {
                            setState(() {
                              operator = "x";
                            });
                            double num1 = double.parse(firstController.text);
                            double num2 = double.parse(secondController.text);
                            solution = (num1 * num2).toString();
                            setState(() {});
                            FocusManager.instance.primaryFocus?.unfocus();
                          },
                        ),
                        ReuseableWidget(
                          text: "Divide",
                          onPressed: () {
                            setState(() {
                              operator = "/";
                            });

                            double num1 = double.parse(firstController.text);
                            double num2 = double.parse(secondController.text);
                            solution = (num1 / num2).toString();
                            FocusManager.instance.primaryFocus?.unfocus();
                            setState(() {});
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ReuseableWidget extends StatelessWidget {
  String text;
  Function()? onPressed;
  ReuseableWidget({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      height: 60,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
