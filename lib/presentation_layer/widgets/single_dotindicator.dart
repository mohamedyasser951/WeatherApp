import 'package:flutter/material.dart';

class SingleDotIndicator extends StatelessWidget {
  const SingleDotIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:const EdgeInsets.symmetric(horizontal: 5.0),
      width: 12,
      height: 5,
      decoration: BoxDecoration(
      
        color: Colors.white54,
        borderRadius: BorderRadius.circular(5.0)
      ),
    );
  }
}
