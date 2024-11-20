import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CustomLoader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.transparent,
        child: Container(
          height: 60,
          width: 220,
          alignment: Alignment.center,
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12), color: Colors.white),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Gap(6),
             CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Color.fromARGB(255, 65, 89, 224)),
              ),
              Gap(6),
              Text(
                "Please wait..."
              ),
            ],
          ),
        ),
      ),
    );
  }
}
