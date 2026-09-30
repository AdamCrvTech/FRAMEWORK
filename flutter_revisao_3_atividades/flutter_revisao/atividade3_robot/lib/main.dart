import 'package:flutter/material.dart';
import 'pages/tela_oficina.dart';
void main()=>runApp(const RobotApp());
class RobotApp extends StatelessWidget{const RobotApp({super.key});@override Widget build(BuildContext context)=>MaterialApp(debugShowCheckedModeBanner:false,title:'Oficina de Robôs',theme:ThemeData(colorSchemeSeed:Colors.deepPurple,useMaterial3:true),home:const TelaOficina());}
