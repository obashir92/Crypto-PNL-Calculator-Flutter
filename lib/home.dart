import 'package:flutter/material.dart';
import 'package:pnlcalculator/mybutton.dart';
import 'package:pnlcalculator/mytextfield.dart';
import 'package:pnlcalculator/myresult.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController sizeController = TextEditingController();
  final TextEditingController entryController = TextEditingController();
  final TextEditingController slController = TextEditingController();
  final TextEditingController tpController = TextEditingController();

  double profit = 0.0;
  double loss = 0.0;

  String errorMessage = '';

  void calculatePnl() {
    if (_validateInputs()) {
      final double size = double.parse(sizeController.text);
      final double entry = double.parse(entryController.text);
      final double stopLoss = double.parse(slController.text);
      final double takeProfit = double.parse(tpController.text);

      setState(() {
        profit = ((takeProfit - entry) * size).abs();
        loss = ((entry - stopLoss) * size).abs();
        errorMessage = '';
      });
    } else {
      setState(() {
        errorMessage = 'Please enter valid numbers in all fields.';
      });
    }
  }

  bool _validateInputs() {
    return [sizeController, entryController, slController, tpController]
        .every((controller) {
      final value = controller.text;
      return double.tryParse(value) != null && value.isNotEmpty;
    });
  }

  @override
  void dispose() {
    sizeController.dispose();
    entryController.dispose();
    slController.dispose();
    tpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 100),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (errorMessage.isNotEmpty)
                  Text(
                    errorMessage,
                    style: const TextStyle(color: Colors.red, fontSize: 14),
                  ),
                MyTextField(labelText: 'Size', controller: sizeController),
                MyTextField(
                    labelText: 'Entry Price', controller: entryController),
                MyTextField(labelText: 'Stop Loss', controller: slController),
                MyTextField(labelText: 'Take Profit', controller: tpController),
                MyButton(onTap: calculatePnl),
                MyResult(profit: profit, loss: loss),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
