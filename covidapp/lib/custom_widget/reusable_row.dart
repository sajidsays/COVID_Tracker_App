import 'package:flutter/material.dart';

class ReusableRow extends StatelessWidget {
  String title, value;

  ReusableRow({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 40, left: 40, top: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(color: Colors.white),
              ),
              Text(
                value,
                style: const TextStyle(color: Colors.white),
              ),
            ],
          ),
          // const SizedBox(
          //   height: 1,
          // ),
          const Divider(color: Colors.white),
        ],
      ),
    );
  }
}
