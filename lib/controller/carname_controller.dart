import 'dart:convert';
import 'package:carapp/models/car_models.dart';
import 'package:http/http.dart';

class CarnameController {
  Future<List<CarModels>> getDates() async {
    Response response = await get(
      Uri.parse(
        'https://carname-b407c-default-rtdb.europe-west1.firebasedatabase.app/car.json',
      ),
    );
    final Map<String, dynamic> data = jsonDecode(response.body);
    return data.values.map((e) => CarModels.fromJson(e)).toList();
  }
}
