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
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('${item.id}'),
                        Image.network(item.image,width: 200,),
                        Text(item.name),
                        Text('${item.price}'),
                        Text('${item.speed}'),
                        Text('${item.year}'),
                      ],
                    ),
                    trailing:Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                         IconButton(onPressed: () {}, icon: Icon(Icons.delete)),
                          IconButton(onPressed: () {}, icon: Icon(Icons.edit)),
                      ],
                    )
                  );
                },
              ),
    );
  }
}
