import 'package:flutter/material.dart';


OutlineInputBorder  buildBorder({color = const Color(0xffBEC5D1), double borderRadius = 18}) {
            return OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
             borderSide: BorderSide(color: color),
    );
}