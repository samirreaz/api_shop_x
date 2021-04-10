import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:shop_x/controllers/product_controller.dart';
import 'package:get/instance_manager.dart';
import 'package:shop_x/views/product_tile.dart';

class HomeScreen extends StatelessWidget {
  final ProductController productController = Get.put(ProductController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back_ios),
        actions: [Icon(Icons.shopping_cart)],
      ),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                  child: Text(
                'ShopX',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w900,
                ),
              )),
              IconButton(icon: Icon(Icons.view_list_rounded), onPressed: () {}),
              IconButton(icon: Icon(Icons.grid_view), onPressed: () {}),
            ],
          ),
          Expanded(
            child: Obx(
              () => StaggeredGridView.countBuilder(
                itemCount: productController.productList.length,
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 5,
                itemBuilder: (context, index) {
                  return ProductTile(productController.productList[index]);
                },
                staggeredTileBuilder: (index) => StaggeredTile.fit(1),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
