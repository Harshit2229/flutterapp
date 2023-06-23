import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomButtons extends StatelessWidget {
  final Color textColor;
  final Color backgroundColor;
   Color? borderColor;
  final String text;
  IconData? icon;
  double width;
  double height;
  VoidCallback onTap;
  CustomButtons({Key ? key,
    required this.textColor,
    required this.backgroundColor,
     this.borderColor,
    required this.text,
    this.icon,
    required this.width,
    required this.height,
    required this.onTap,
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap, // Add onTap callback here
        child:Container ( width:width,
          height: height,
          decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(15),
              border:Border.all(
                color: borderColor ?? Colors.transparent ,
                width: 1.0,
              )
          ),
          child:Center(
            child: Text(
              text,
              style: TextStyle(
                  color: textColor
              ),
            ),
          ),
        )
    );
  }
}
