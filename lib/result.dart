import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simplestm/provider/provider.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen({super.key});

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  late TextEditingController namecontroller;
  late TextEditingController agecontroller;
  bool invisible = false;
  @override
  void initState() {
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
    return Consumer<EmployeeData>(builder: (context, employee, child) {
      return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Employee Details",
            style: TextStyle(color: Colors.white),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  setState(() {
                    namecontroller.text =
                        Provider.of<EmployeeData>(context, listen: false)
                            .empname!;
                    agecontroller.text = employee.empage!;
                    invisible = true;
                  });
                },
                icon: const Icon(Icons.edit)),
            IconButton(
                onPressed: () {
                  Provider.of<EmployeeData>(context, listen: false).dispose();
                },
                icon: const Icon(Icons.delete))
          ],
          backgroundColor: Colors.black54,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Enter Name:${employee.empname}",
                  style: const TextStyle(fontSize: 20),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Enter Age:${employee.empage}",
                  style: const TextStyle(fontSize: 20),
                ),
                const SizedBox(
                  height: 20,
                ),
                invisible
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                            const Text("Enter Name:"),
                            const SizedBox(
                              height: 20,
                            ),
                            TextField(
                              controller: namecontroller,
                              decoration: const InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(30)))),
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                            const Text("Enter Age:"),
                            const SizedBox(
                              height: 20,
                            ),
                            TextField(
                              controller: agecontroller,
                              decoration: const InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(30)))),
                            ),
                            const SizedBox(
                              height: 36,
                            ),
                            Center(
                              child: ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      invisible = false;
                                    });
                                    Provider.of<EmployeeData>(context,
                                            listen: false)
                                        .insert(
                                            name: namecontroller.text,
                                            age: agecontroller.text);
                                  },
                                  child: const Text("Update",
                                      style: TextStyle(fontSize: 20))),
                            )
                          ])
                    : const SizedBox(),
              ],
            ),
          ),
        ),
      );
    });
  }
}
