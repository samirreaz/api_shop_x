import 'package:http/http.dart' as http;
import 'package:shop_x/models/product.dart';

class ApiManager {
  static var client = http.Client();

  static Future<List<Welcome>> getProducts() async {
    var url = Uri.parse(
        'https://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline');
    var response = await client.get(url);
    if (response.statusCode == 200) {
      var jsonString = response.body;
      return welcomeFromJson(jsonString);
    } else {
      //show error message
      return null;
    }
  }
}
