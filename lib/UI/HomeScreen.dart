import 'package:flutter/material.dart';
import 'package:simplestm/UI/AddEmployee.dart';
import 'package:simplestm/api_call/api_call.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List data = [];
  bool loading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  getData() async {
    data = await APICalls().getObjects();
    loading = false;
    setState(() {});
    print(data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        title: const Text(
          "List Of Employee Datas",
          style: TextStyle(
              color: Colors.black, fontSize: 15, fontStyle: FontStyle.normal),
        ),
      ),
      body: loading? Center(
        child: CircularProgressIndicator(),
      ):Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          data.isEmpty
              ? Center(
                  child: Text("No Data"),
                )
              : Expanded(
                  child: ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: Image.network(
                              "https://media.istockphoto.com/id/669412596/photo/pink-rose-flowers-arrangement.jpg?s=1024x1024&w=is&k=20&c=if8UXCumPEe_ZUTUlha8cAwgN4K3cSDeJEigUen88OI="),
                          title: Text(
                            data[index]["name"],
                            style: TextStyle(fontSize: 15),
                          ),
                          subtitle: Text(
                            "Age:21 EmpID:${data[index]["id"]}",
                            style: TextStyle(fontSize: 15),
                          ),
                          trailing: const Text(
                            "",
                            style: TextStyle(fontSize: 15),
                          ),
                        );
                      }),
                )
        ],
      ),
      floatingActionButton: FloatingActionButton(
          elevation: 10,
          onPressed: () async {
            // APICalls api =;

            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AddEmployeeScreen(),
                ));
          },
          backgroundColor: Colors.white,
          child: const Icon(
            Icons.add,
            color: Colors.red,
          )),
    );
  }
}
