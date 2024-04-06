import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

class AddEmployeeScreen extends StatefulWidget {
  const AddEmployeeScreen({super.key});

  @override
  State<AddEmployeeScreen> createState() => _AddEmployeeScreenState();
}

//empid generate
//snakbar
//profile image field

class _AddEmployeeScreenState extends State<AddEmployeeScreen> {
  final _formkey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  List<String> deptEmployee = ["Developer", "Testing", "Designing"];
  List<String> gender = ["Male", "Female", "Other"];

  String _selectedGender = "Male";
  String? realValue;
  DateTime? date;

  bool isEmailValid(String email) {
    // Basic email validation using regex
    // You can implement more complex validation if needed
    return RegExp(r'^[\w-\.]+@[a-zA-Z]+\.[a-zA-Z]{2,}$').hasMatch(email);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[100],
      appBar: AppBar(
        //  automaticallyImplyLeading: false,
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.amber[100],
        elevation: 0,
        title: const Text(
          "New Employee Entry Page",
          style: TextStyle(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          // mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Form(
                key: _formkey,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    // color: Colors.blue,
                    child: Column(
                      // mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter name';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                                hintText: "NAME",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: const BorderSide(
                                      width: 10,
                                      style: BorderStyle.solid,
                                    ))),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            onTap: () async {
                              date = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime(2005),
                                  firstDate: DateTime(1990),
                                  lastDate: DateTime(DateTime.now().year - 18));
                              if (date != null) {
                                setState(() {
                                  //   date.toString().substring(0, 10);
                                  dobController.text =
                                      DateFormat("dd-MM-yyyy").format(date!);
                                });
                              }
                            },
                            child: IgnorePointer(
                              child: TextFormField(
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter DOB';
                                  }
                                  return null;
                                },
                                controller: dobController,
                                decoration: InputDecoration(
                                    suffixIcon:
                                        const Icon(Icons.calendar_month),
                                    hintText: "DOB",
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20),
                                        borderSide: const BorderSide(
                                          width: 10,
                                          style: BorderStyle.solid,
                                        ))),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 60,
                              width: 360,
                              decoration: BoxDecoration(
                                // color: Colors.black54,
                                border: Border.all(color: Colors.black38),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "GENDER",
                                      style: TextStyle(
                                          fontSize: 18, color: Colors.black54),
                                      textAlign: TextAlign.start,
                                    ),
                                    Row(
                                      children: [
                                        ...gender.map((e) {
                                          return Row(
                                            children: [
                                              Radio(
                                                  activeColor:
                                                      Colors.purpleAccent,
                                                  value: e,
                                                  groupValue: _selectedGender,
                                                  onChanged: (value) {
                                                    setState(() {
                                                      _selectedGender = value!;
                                                      print(_selectedGender);
                                                    });
                                                  }),
                                              Text(e),
                                            ],
                                          );
                                        }).toList(),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            )),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter address';
                              }
                              return null;
                            },
                            maxLines: 10,
                            decoration: InputDecoration(
                                hintText: "ADDRESS",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: const BorderSide(
                                      width: 10,
                                      style: BorderStyle.solid,
                                    ))),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter emailId';
                              } else if (!isEmailValid(value)) {
                                return 'Enter a valid Email ID';
                              }
                              return null;
                            },
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                                hintText: "EMAIL ID",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: const BorderSide(
                                      width: 10,
                                      style: BorderStyle.solid,
                                    ))),
                          ),
                        ),
                        Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: DropdownButtonFormField(
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please choose one';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(20))),
                                hint: const Text("DEPT"),
                                value: realValue,
                                items: deptEmployee
                                    .map<DropdownMenuItem<String>>(
                                        (String value) {
                                  return DropdownMenuItem<String>(
                                      value: value, child: Text(value));
                                }).toList(),
                                onChanged: (String? value) {
                                  setState(() {
                                    realValue = value;
                                  });
                                })),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter phone';
                              }
                              return null;
                            },
                            keyboardType: TextInputType.phone,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            decoration: InputDecoration(
                                hintText: "PHONE",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: const BorderSide(
                                      width: 10,
                                      style: BorderStyle.solid,
                                    ))),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          width: 300,
                          child: ElevatedButton(
                            onPressed: () {
                              if (_formkey.currentState!.validate()) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text('Processing Data')),
                                );
                              }
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.greenAccent,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20))),
                            child: const Text(
                              "Submit",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.black),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
