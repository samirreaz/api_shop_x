import 'package:get/state_manager.dart';
import 'package:shop_x/services/api_manager.dart';
import '../models/product.dart';

class ProductController extends GetxController {
  var productList = List<Welcome>().obs;

  @override
  void onInit() {
    // TODO: implement onInit
    fetchProduct();
    super.onInit();
  }

  void fetchProduct() async {
    var products = await ApiManager.getProducts();
    if (products != null) {
      productList.value = products;
    }
  }
}
