import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simplestm/provider/provider.dart';
import 'package:simplestm/result.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  late TextEditingController namecontroller;
  late TextEditingController agecontroller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    namecontroller = TextEditingController();
    agecontroller = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    namecontroller.dispose();
    agecontroller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Employee Details"),
        backgroundColor: Colors.purpleAccent,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Enter EmalID:"),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: namecontroller,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30)))),
              ),
              const SizedBox(
                height: 40,
              ),
              const Text("Enter PWD:"),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: agecontroller,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30)))),
              ),
              const SizedBox(
                height: 36,
              ),
              Center(
                child: ElevatedButton(
                    onPressed: () {
                      Provider.of<EmployeeData>(context, listen: false).insert(
                          name: namecontroller.text, age: agecontroller.text);
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => const ResultScreen()));
                    },
                    child:
                        const Text("Submit", style: TextStyle(fontSize: 20))),
              )
            ],
          ),
        ),
      ),
    );
  }
}
