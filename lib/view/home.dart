import 'package:carapp/controller/carname_controller.dart';
import 'package:carapp/models/car_models.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<CarModels> listdata = [];

  @override
  void initState() {
    CarnameController()
        .getDates()
        .then((value) {
          listdata = value;
          setState(() {});
        })
        .onError((error, StackTrace) {
          print("Error $error");
        });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Car App"),
        actions: [
          IconButton(
            onPressed: () async {
              // final result = await showDialog(
              //   context: context,
              //   builder: (ctx) {
              //     return add;
              //   },
              // );
            },
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body:
          listdata.isEmpty
              ? CircularProgressIndicator()
              : ListView.builder(
                itemCount: listdata.length,
                itemBuilder: (context, index) {
                  CarModels item = listdata[index];
                  return ListTile(
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Image.network(item.image),
                    ),
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("ID:${item.id}"),
                        SizedBox(height: 10),
                        Column(
                          children: [
                            Text('Name: ${item.name}'),
                            Text('Price: ${item.price}'),
                          ],
                        ),
                        SizedBox(width: 30),
                        Column(
                          children: [
                            Text('Speed: ${item.speed}'),
                            Text('Year: ${item.year}'),
                          ],
                        ),
                        SizedBox(height: 40,),
                      ],
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.delete, color: Colors.red),
                        ),
                        IconButton(onPressed: () {},
                         icon: Icon(Icons.edit, color: Colors.orange,)),
                      ],
                    ),
                  );
                },
              ),
    );
  }
}
