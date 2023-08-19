import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simplestm/page1.dart';
import 'package:simplestm/provider.dart';

void main() {
  runApp(const Employeestm());
}

class Employeestm extends StatefulWidget {
  const Employeestm({super.key});

  @override
  State<Employeestm> createState() => _EmployeestmState();
}

class _EmployeestmState extends State<Employeestm> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: ((context) => EmployeeData())),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Employee Data',
        home: Page1(),
      ),
    );
  }
}
