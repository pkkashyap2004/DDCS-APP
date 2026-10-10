import 'package:flutter/material.dart';
class AppTheme {
 static const navy=Color(0xFF102A43); static const blue=Color(0xFF1769E0); static const mint=Color(0xFF18B89A);
 static ThemeData get light => ThemeData(useMaterial3:true,colorScheme:ColorScheme.fromSeed(seedColor:blue,primary:blue,secondary:mint),scaffoldBackgroundColor:const Color(0xFFF7F9FC),appBarTheme:const AppBarTheme(backgroundColor:Colors.white,foregroundColor:navy),cardTheme:CardThemeData(color:Colors.white,elevation:0,shape:RoundedRectangleBorder(borderRadius:BorderRadius.circular(20),side:const BorderSide(color:Color(0xFFE6ECF2)))));
}
