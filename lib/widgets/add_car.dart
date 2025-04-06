import 'package:carapp/controller/carname_controller.dart';
import 'package:flutter/material.dart';

class AddCarPage extends StatefulWidget {
  final CarnameController carnamecontroller;
  const AddCarPage({super.key, required this.carnamecontroller});

  @override
  State<AddCarPage> createState() => _AddCarPageState();
}

class _AddCarPageState extends State<AddCarPage> {
  final idController = TextEditingController();
  final imageController = TextEditingController();
  final nameController = TextEditingController();
  final priceController = TextEditingController();
  final speedController = TextEditingController();
  final yearController = TextEditingController();
  bool isLoading = false;

  @override
  void dispose() {
    idController.dispose();
    imageController.dispose();
    nameController.dispose();
    priceController.dispose();
    speedController.dispose();
    yearController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        children: [
          TextField(
            controller: idController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'id',
            ),
          ),
          TextField(
            controller: imageController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'image',
            ),
          ),
          TextField(
            controller: nameController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'name',
            ),
          ),
          TextField(
            controller: priceController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'price',
            ),
          ),
          TextField(
            controller: speedController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'speed',
            ),
          ),
          TextField(
            controller: yearController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'year',
            ),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text("Bekor qilish"),
        ),
        FilledButton(
          child:
              isLoading
                  ? CircularProgressIndicator(color: Colors.white)
                  : Text('Saqlash'),
          onPressed: () async {
            final ids = idController.text;
            final images = imageController.text;
            final names = nameController.text;
            final prices = priceController.text;
            final speeds = speedController.text;
            final years = yearController.text;

            if (ids.isNotEmpty) {
              setState(() {
                isLoading = true;
              });
            }
            if (images.isNotEmpty) {
              setState(() {
                isLoading = true;
              });
            }
            if (names.isNotEmpty) {
              setState(() {
                isLoading = true;
              });
            }
            if (prices.isNotEmpty) {
              setState(() {
                isLoading = true;
              });
              if (speeds.isNotEmpty) {
                setState(() {
                  isLoading = true;
                });
                if (years.isNotEmpty) {
                  setState(() {
                    isLoading = true;
                  });
                }
                // await widget.carnamecontroller.addTodo(title);
                setState(() {
                  isLoading = false;
                });
                Navigator.pop(context, true);
              }
            }
          },
        ),
      ],
    );
  }
}
