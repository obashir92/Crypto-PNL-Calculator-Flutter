import 'package:flutter/material.dart';

class MyResult extends StatelessWidget {
  final double profit;
  final double loss;

  const MyResult({super.key, required this.profit, required this.loss});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.grey.withOpacity(0.1)),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Profit',
                    style: TextStyle(fontSize: 23, fontWeight: FontWeight.w400),
                  ),
                  Text(
                    profit.toStringAsFixed(3),
                    style: const TextStyle(
                        fontSize: 23,
                        color: Colors.green,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Loss',
                    style: TextStyle(fontSize: 23, fontWeight: FontWeight.w400),
                  ),
                  Text(
                    loss.toStringAsFixed(3),
                    style: const TextStyle(
                        fontSize: 23,
                        color: Colors.red,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
